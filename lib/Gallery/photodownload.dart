import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class DetailScreen extends StatefulWidget {
  final imageUrl;
  DetailScreen(this.imageUrl);
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
      
  downloadImage(url) async {
 
   try {
  // Saved with this method.
  var imageId = await ImageDownloader.downloadImage(url,destination:AndroidDestinationType.directoryDownloads );
  if (imageId == null) {
    return;
  }

  // Below is a method of obtaining saved image information.

} on PlatformException catch (error) {
  print(error);
}
}

  @override
  
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
        child: Column(
          children: [
            GestureDetector(
              child: Center(

                child: Hero(
                  tag: 'imageHero',
                  child: Image.network(
                    widget.imageUrl.toString(),
                    //"https://firebasestorage.googleapis.com/v0/b/home-security-55e98.appspot.com/o/images%2Fimage_2.jpg?alt=media&token=232f3d5d-66ac-4cfd-b58b-916b22495893"
                    
                  ),
                ),
              ),
              
              onTap: () {
                print(widget.imageUrl);
                Navigator.pop(context);
              },

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
              child: Text("Click to download to Files/Downloads",style:TextStyle(fontSize:10),),
            )
          ],
        ),
      ),
      

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff005daa),
        onPressed: ()async{
            downloadImage(widget.imageUrl); 
            
           },
        tooltip: 'Download',
        child: Icon(Icons.file_download),
      ), 
    );
  }
}