import 'package:flutter/material.dart';

import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	  title: 'Componentes App',
	  debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en'), // English
      const Locale('es', 'ES'), // Spanish Espana
    ],
	  // home: HomePage(),
    initialRoute: 'homePage',
    routes: getApplicationRoutes(),
    // onGenerateRoute se ejecuta cuando la ruta a la que se esta accediendo no 
    // se encuentra en nuestro array de routes definido anteriormente.
    onGenerateRoute: (settings) {
      return MaterialPageRoute(
        builder: (BuildContext context) => CardPage()
        );
    },
	);
  }
}
