import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);
  final currencies = CurrencyModel.getCurrencies();
  test('Deve converter de real para dolar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de real para dolar com virgula', () {
    toText.text = '2,0';
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de dolar para real', () {
    toText.text = '1.0';
    homeController.toCurrency = currencies[1]; //dolar
    homeController.fromCurrency = currencies[0]; //real
    homeController.convert();

    expect(fromText.text, '5.63');
  });
}
