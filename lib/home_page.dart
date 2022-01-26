import 'package:alcoolougasolina/home_controller.dart';
import 'package:alcoolougasolina/widgets/my_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  final TextEditingController _controllerCalc = TextEditingController();
  final TextEditingController _controllerCgas = TextEditingController();

  final HomeController _homeController = HomeController();

  String _textoResultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                child: Image.asset("assets/abre.png")),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            MyTextField(
              myLabel: "Km/Litro com Álcool (ex: 9.2)",
              color: Colors.green,
              onSubmitted: (String texto) {
                if (kDebugMode) {
                  print("valor digitado:" + texto);
                }
              },
              controller: _controllerCalc,
            ),
            MyTextField(
              myLabel: "Km/Litro com Gasolina (ex: 12.3)",
              color: Colors.lightBlue,
              onSubmitted: (String texto) {
                if (kDebugMode) {
                  print("valor digitado:" + texto);
                }
              },
              controller: _controllerCgas,
            ),
            MyTextField(
              myLabel: "Preço Álcool (ex: 5.779)",
              color: Colors.green,
              onSubmitted: (String texto) {
                if (kDebugMode) {
                  print("valor digitado:" + texto);
                }
              },
              controller: _controllerAlcool,
            ),
            MyTextField(
              myLabel: "Preço Gasolina (ex: 6.579)",
              color: Colors.green,
              onSubmitted: (String texto) {
                if (kDebugMode) {
                  print("valor digitado:" + texto);
                }
              },
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            FloatingActionButton(
              tooltip: 'Calcular',
              onPressed: () {
                double? precoAlcool = double.tryParse(_controllerAlcool.text);
                double? precoGasolina = double.tryParse(
                  _controllerGasolina.text,
                );
                double? consumoAlcool = double.tryParse(_controllerCalc.text);
                double? consumoGasolina = double.tryParse(_controllerCgas.text);

                setState(() {
                  _textoResultado = _homeController.calcularAbastecimento(
                    precoAlcool,
                    precoGasolina,
                    consumoAlcool,
                    consumoGasolina,
                  );
                });
              },
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.calculate),
            ),
            const Padding(
              padding: EdgeInsets.all(35),
              child: BottomAppBar(
                child: Text(
                  "Desenvolvido por Sérgio Steiner.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
