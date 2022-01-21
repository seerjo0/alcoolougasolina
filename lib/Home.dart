import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido! Digite números maiores que 0 e utilizando ponto (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Abasteça com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Abasteça com Álcool";
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
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset("assets/abre.jpg")),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
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
                Padding(
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
                        onPressed: _calcular)),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
