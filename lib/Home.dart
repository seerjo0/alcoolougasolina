import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  TextEditingController _controllerCalc = TextEditingController();
  TextEditingController _controllerCgas = TextEditingController();

  String _textoResultado = "";

  void _calcularAbastecimento() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    double? consumoAlcool = double.tryParse(_controllerCalc.text);
    double? consumoGasolina = double.tryParse(_controllerCgas.text);

    if (precoAlcool == null ||
        precoGasolina == null ||
        consumoGasolina == null ||
        consumoAlcool == null) {
      setState(() {
        _textoResultado =
            "Número inválido! Digite números maiores que zero (0) e utilizando ponto (.)";
      });
    } else {
      if ((consumoAlcool / consumoGasolina * precoGasolina) >= precoAlcool) {
        setState(() {
          _textoResultado = "Abasteça com Álcool";
        });
      } else {
        setState(() {
          _textoResultado = "Abasteça com Gasolina";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Álcool ou Gasolina"),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 10),
                    child: Image.asset("assets/abre.png")),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Km/Litro com Álcool (ex: 9.2)"),
                  style: TextStyle(fontSize: 22, color: Colors.green),
                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _controllerCalc,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Km/Litro com Gasolina (ex: 12.3)"),
                  style: TextStyle(fontSize: 22, color: Colors.lightBlue),
                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _controllerCgas,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Álcool (ex: 1.59)"),
                  style: TextStyle(fontSize: 22, color: Colors.green),
                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina (ex: 3.15)"),
                  style: TextStyle(fontSize: 22, color: Colors.lightBlue),
                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _controllerGasolina,
                ),
                /*Padding(
                    padding: EdgeInsets.all(15),
                    child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.lightBlue,
                        onPressed: _calcularAbastecimento)),*/
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                FloatingActionButton(
                  tooltip: "Calcular",
                  onPressed: _calcularAbastecimento,
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(Icons.calculate),
                ),
                Padding(
                  padding: EdgeInsets.all(35),
                  child: BottomAppBar(
                    child: Text(
                      "Desenvolvido por Sérgio Steiner.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
