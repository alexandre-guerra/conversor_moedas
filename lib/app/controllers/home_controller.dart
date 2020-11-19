import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    double value = double.tryParse(toText.text.replaceAll(',', '.')) ?? 1.0;
    double convertedValue = 0.0;

    switch (fromCurrency.name) {
      case 'Real':
        convertedValue = value * toCurrency.real;
        break;
      case 'Dolar':
        convertedValue = value * toCurrency.dolar;
        break;
      case 'Euro':
        convertedValue = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        convertedValue = value * toCurrency.bitcoin;
        break;
    }

    fromText.text = convertedValue.toStringAsFixed(2);
  }
}
