import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

	final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			title: Text('Componentes temp'),
		),
		body: ListView(
			// children: _crearItems()
			children: _crearItemsCorta()
		),
	);
  }

  // List<Widget> _crearItems() {
	  
	//   List<Widget> lista = new List<Widget>();
	  
	//   for (String opt in opciones) {

	// 	  final tempWidget = ListTile(
	// 		  title: Text(opt),
	// 	  );
	// 	  lista..add(tempWidget)
	// 	  		..add(Divider());
	//   }

	//   return lista;
  // }

  List<Widget> _crearItemsCorta() {
	  return opciones.map((item) {
      return Column( // Envolvemos en una columna para poner tambien el divider
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('subtitulo'),
            leading: Icon(Icons.hot_tub),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
	  }).toList();

  }
}