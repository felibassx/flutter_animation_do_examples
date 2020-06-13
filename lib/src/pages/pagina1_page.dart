import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          child: Text('Animated Do'),
          delay: Duration(milliseconds: 500),
        ),
        actions: <Widget>[
          IconButton(  
            icon: FaIcon( 
              FontAwesomeIcons.twitter,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage()));
            }
          ),
          SlideInLeft(
              from: 10,
              child: IconButton(
              icon: Icon( 
                Icons.navigate_next,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Pagina1Page()));
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionPage()));
        },
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40),
            ),

            FadeInDown(
              delay: Duration(milliseconds: 300),
              child: Text('Título', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)
            ),

            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text('Este es un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),

            ),

            FadeInLeft(
              delay: Duration(milliseconds: 1200),
                child: Container(
                width: 240,
                height: 2,
                color: Colors.blue,
              ),
            )

          ],
        ),
     ),
   );
  }
}