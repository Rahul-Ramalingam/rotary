import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rotary/Gallery/photodownload.dart';


Map<int,Uint8List> imageData ={};
List<int> requestedIndexes = [];

class Gallery extends StatelessWidget {
  Widget makeImagesGrid(){
    return GridView.builder(
      
      itemCount: 1000,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),
      //padding: EdgeInsets,
      itemBuilder: (context,index){
        return ImageGridItem(index+1);
      });
    }
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xff005daa),
        shadowColor: Colors.black38,
          automaticallyImplyLeading: false,
          title: new Center(
            child: new Text("Gallery", textAlign: TextAlign.left),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue[100],Colors.lightBlue[50]]),
        ),
          child: makeImagesGrid(),
        ),
      );
    }
  }

class ImageGridItem extends StatefulWidget {

  int _index;

  ImageGridItem(int index){
    this._index = index;
  }  
  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {

  Uint8List imageFile;
  StorageReference photosReference = FirebaseStorage.instance.ref().child("images");
  
  getImage(){
    if( !requestedIndexes.contains(widget._index)){
    int maxsize = 16*1024*1024;
    photosReference.child("image_${widget._index}.jpeg").getData(maxsize).then((data){
      this.setState(() {
        imageFile = data;
      });
      imageData.putIfAbsent(widget._index, (){
        return data;
      });
    }).catchError((error){
    
    });
    requestedIndexes.add(widget._index);
  }
  }

  Widget decideGridTileWidget(){
    if (imageFile == null) {
      return Center(child: Text(""),);
    }else{
      return Image.memory(imageFile,fit: BoxFit.cover,);
    }
  }

  @override
  void initState(){
    super.initState();
    if (!imageData.containsKey(widget._index)){
    getImage();
    }else{
      this.setState(() {
        imageFile = imageData[widget._index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(child: decideGridTileWidget(),onTap: () async{
              print("tapped");
              var url=await photosReference.child("image_${widget._index}.jpeg").getDownloadURL();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(url);}));
    },);
  }
}