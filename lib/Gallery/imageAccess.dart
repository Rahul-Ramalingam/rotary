import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:progress_dialog/progress_dialog.dart';


class ImageDetail extends StatefulWidget {
  final imageURL;
  ImageDetail(this.imageURL);
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

Widget imageWidget(image, context) {
  return   /*Image.network(mediaHost.toString() + image);*/
  PhotoView(imageProvider: NetworkImage(image));
  
  /*Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Image.network(
          mediaHost.toString() + image,
          fit: BoxFit.cover,
        )),
      ],
    ),
  );*/


}

class _ImageDetailState extends State<ImageDetail> {
var _progress = 0;
  ProgressDialog pr;
  @override
  void initState() {
    super.initState();
     pr = new ProgressDialog(context);
    pr.style(
        message: "Downloading",

        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Theme.of(context).primaryColor, fontSize: 13.0, ),
        messageTextStyle: TextStyle(
            color:Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
     ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
  
      setState(() {
        _progress= progress;
        if(_progress == 100 ){
          pr.update(progress: _progress +0.0,message:"Still Downloading");
          pr.hide();
          showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          title: new Text('Success'),
                          content: new Text("Downloaded Successfully"),
                          actions: <Widget>[
                            new FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Text(
                                'ok',
                                style: TextStyle(color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        ),
                      );

        }
          
      
       
      });
     
    });
 
  }

  

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
    var _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.file_download),
              color: Colors.white,
              onPressed: () async {
                
               
              
                downloadImage(widget.imageURL);
                setState(() {
                 pr.show();
                  
               });

               if(_progress ==100){
                 setState(() {
                    pr.hide();
             print('hhh');
                 });
        }

              })

              
        ],
      ),
      body: Stack(fit: StackFit.expand, children: [
        Container(
          decoration: BoxDecoration(color: Colors.black),
        ),
        PageView.builder(
            itemCount: widget.imageURL.length,
            onPageChanged: (val) {
              setState(() {
                _currentIndex = val;
              });
            },
            itemBuilder: (ctx, index) {
              return imageWidget(widget.imageURL, context);
            }),
      ]),
    );
  }
}