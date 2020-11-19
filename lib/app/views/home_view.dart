import 'package:conversor_moedas/app/components/currency_row_component.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          right: 30,
          left: 30,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/convert.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 50),
              CurrencyRow(
                selectedItem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },
              ),
              SizedBox(height: 10),
              CurrencyRow(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },
              ),
              SizedBox(height: 50),
              RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  homeController.convert();
                },
                child: Text('CONVERTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
