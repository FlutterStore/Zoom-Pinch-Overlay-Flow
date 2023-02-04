// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List img = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
  ];
  
  Widget listRow(int profile, int image, int likes, String name, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&w=1600'),
              ),
              const SizedBox(width: 8),
              Text(name)
            ]
          ),
        ),
        ZoomOverlay(
          modalBarrierColor: Colors.black12, // optional
          minScale: 0.5, // optional
          maxScale: 3.0, // optional
          twoTouchOnly: true,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.fastOutSlowIn,
          child: Image.asset(
            "assets/images/2.png",fit: BoxFit.cover,
          )
          // CachedNetworkImage(
          //   imageUrl: 'https://images.pexels.com/photos/$img'
          // )
        ),
        Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 16),
                      FaIcon(
                        FontAwesomeIcons.comment,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 16),
                      FaIcon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.black54,
                      ),
                    ]
                  ),
                  const FaIcon(
                    FontAwesomeIcons.bookmark,
                    color: Colors.black54,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text('$likes likes'),
              ),
            //   RichText(
            //     text: TextSpan(
            //     text: name,
            //     style: const TextStyle(
            //       color: Colors.black87,
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold
            //     ),
            //     children: <TextSpan>[
            //       TextSpan(
            //         text: ' $text',
            //         style: const TextStyle(
            //           color: Colors.black87,
            //           fontSize: 14,
            //           fontWeight: FontWeight.normal
            //         ),
            //       )
            //     ]
            //   )
            // )
          ]),
        ),
        const SizedBox(height: 10)
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zoom Pinch Overlay",style: TextStyle(fontSize: 15),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: false,
      //   title: Text(
      //     'Instagram',
      //     style: GoogleFonts.cookie(
      //       fontStyle: FontStyle.italic,
      //       color: Colors.black87,
      //       fontSize: 38
      //     )
      //   ),
      //   systemOverlayStyle: SystemUiOverlayStyle.dark
      // ),
      body: ListView(
        children: <Widget>[
          listRow(
            1027, 
            1062, 
            36, 
            'mary.porter',
            'Lucy doesnt want to get out of bed today, its far too cold for the little darling.'
          ),
          // listRow(
          //   324, 
          //   557, 
          //   65,
          //   'paul.bishop',
          //   'Looks like its going to be a rough crossing.'),
          // listRow(
          //   453,
          //   585, 
          //   29, 
          //   'mel_fortwright',
          //   'The stands are packed, this is going to be a good game !'),
          // listRow(
          //   64, 
          //   653, 
          //   18, 
          //   'robDavidJuiceMan', 
          //   'My office for day.'
          // ),
        ],
      )
    );
  }
}