import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;

  bool _isLoading = false;

  @override
  void initState() {
    // Metodo que se ejecuta cuando se crea el Stateful Widget
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // Metodo que se ejecuta cuando se cierra el Stateful Widget
    super.dispose();
    // Matamos el scroll controller para no tener fugas de memoria ya que cada vez que entramos a este widget
    // se crea un listener del scroll controller.
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/loading_jar.gif'),
            image: NetworkImage('https://i.picsum.photos/id/$imagen/500/300.jpg'),
          );
        },
      ),
      onRefresh: _obtenerPagina1,
    );
  }

  Future<Null> _obtenerPagina1() async {
    final duration = new Duration(seconds: 3);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

  Future<Null> _fetchData() async{
    _isLoading = true;
    setState(() {
      
    });

    final duration = new Duration(seconds: 2);

    return new Timer(
      duration, 
      _respuestaHTTP
    );
  }

  void _respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 50, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.0)
          )
        ],
      );
    } else {
      return Container();
    }
  }
}