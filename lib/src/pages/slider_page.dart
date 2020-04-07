import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Sliders'),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),
            //  Row(
            //    mainAxisAlignment: MainAxisAlignment.center,
            //    children: <Widget>[
            //     Text('Enable slider', style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),),
            //     _crearCheckBox(),
            //    ],
            //  ),
            _crearCheckBoxListTile(),
            _crearSwitch(),
             Expanded(
              child: _crearImagen()
            ),
           ],
         ),
       ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor:  Colors.indigoAccent,
      label: 'Dimension de la imagen',
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (!_bloquearCheck) ? null : (value) {
        setState(() {
          _valorSlider = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage('assets/loading_jar.gif'),
      image: NetworkImage('https://www.xtrafondos.com/wallpapers/batman-minimalist-3133.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    return Checkbox(
      value: _bloquearCheck, 
      onChanged: (checked) {
        setState(() {
          _bloquearCheck = checked;
        });
      }
    );
  }

  Widget _crearCheckBoxListTile() {
    return CheckboxListTile(
      title: Text('Enable slider'),
      value: _bloquearCheck, 
      onChanged: (checked) {
        setState(() {
          _bloquearCheck = checked;
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Enable slider'),
      value: _bloquearCheck, 
      onChanged: (checked) {
        setState(() {
          _bloquearCheck = checked;
        });
      }
    );
  }
}