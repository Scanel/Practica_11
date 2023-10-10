import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPage extends StatefulWidget {
  @override
  _SharedPageState createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  int _edad = 0;
  String _nombre = '';

  _grabarDatos() async {
    SharedPreferences prefbs = await SharedPreferences.getInstance();
    prefbs.setInt('edad', 22);
    prefbs.setString('nombre', 'César Fierro');
  }

  _leerDatos() async {
    SharedPreferences prefbs = await SharedPreferences.getInstance();
    _edad = prefbs.getInt('edad')!;
    _nombre = prefbs.getString('nombre')!;
  }

  @override
  void initState() {
    _grabarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 11'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre $_nombre'),
            SizedBox(height: 15),
            Text('Edad: $_edad')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _leerDatos();
          });
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
