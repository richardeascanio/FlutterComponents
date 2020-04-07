import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          // Para agregarle margin end al avatar tenemos que envolverlo en un Container
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stan-lee-arrives-at-the-premiere-of-disney-and-marvels-news-photo-950989390-1542056333.jpg'),
              radius: 23.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://s.france24.com/media/display/cb8f406c-1f48-11e9-8238-005056bff430/w:1240/p:16x9/stan_lee.webp'),
          placeholder: AssetImage('assets/loading_jar.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}