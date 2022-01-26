class HomeController {
  String calcularAbastecimento(
    precoAlcool,
    precoGasolina,
    consumoAlcool,
    consumoGasolina,
  ) {
    String _textoResultado;

    if (consumoAlcool == null ||
        consumoGasolina == null ||
        precoAlcool == null ||
        precoGasolina == null) {
      _textoResultado =
          "Número incorreto! Utilize apenas números separados com ponto (.)";
    } else if ((consumoAlcool / consumoGasolina * precoGasolina) >=
        precoAlcool) {
      _textoResultado = "Abasteça com Álcool";
    } else {
      _textoResultado = "Abasteça com Gasolina";
    }

    return _textoResultado;
  }

  /*void _calcularAbastecimento() {
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
  }*/
}
