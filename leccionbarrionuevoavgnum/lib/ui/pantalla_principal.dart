import 'package:flutter/material.dart';
import '../logica/calculo_promedio.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final CalculoPromedio _calculo = CalculoPromedio();

  int _num1 = 0;
  int _num2 = 0;
  int _num3 = 0;
  double _promedio = 0;
  String _mensaje = '';

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  void _calcularPromedio() {
    if (_num1Controller.text.isEmpty ||
        _num2Controller.text.isEmpty ||
        _num3Controller.text.isEmpty) {
      setState(() {
        _mensaje = 'Por favor ingresa todos los campos.';
      });
      return;
    }

    _num1 = int.tryParse(_num1Controller.text) ?? 0;
    _num2 = int.tryParse(_num2Controller.text) ?? 0;
    _num3 = int.tryParse(_num3Controller.text) ?? 0;

    setState(() {
      _promedio = _calculo.calcularPromedio(_num1, _num2, _num3);
      _mensaje = ''; // Limpiar mensaje al calcular correctamente
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Promedio'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Ingrese los números:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                prefixIcon: const Icon(Icons.looks_one, color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                prefixIcon: const Icon(Icons.looks_two, color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num3Controller,
              decoration: InputDecoration(
                labelText: 'Número 3',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                prefixIcon: const Icon(Icons.looks_3, color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calcularPromedio,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Calcular Promedio'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Promedio: ${_promedio.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            if (_mensaje.isNotEmpty)
              Center(
                child: Text(
                  _mensaje,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
