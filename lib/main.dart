import 'package:componentes/src/pages/card_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	  title: 'Componentes App',
	  debugShowCheckedModeBanner: false,
	  // home: HomePage(),
    initialRoute: 'homePage',
    routes: getApplicationRoutes(),
    // onGenerateRoute se ejecuta cuando la ruta a la que se esta accediendo no 
    // se encuentra en nuestro array de routes definido anteriormente.
    onGenerateRoute: (settings) {
      print('route: ${settings.name}');
      return MaterialPageRoute(
        builder: (BuildContext context) => CardPage()
        );
    },
	);
  }
}
