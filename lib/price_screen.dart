import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  DropdownButton getCurrenciesMethodforAndroid(){
    
  List<DropdownMenuItem> getcurrency=[];
    for (String currency in currenciesList) {
      var newCurr=DropdownMenuItem(
                  child: Text(currency),
                  value: currency,
                  );
                  getcurrency.add(newCurr);
    }
 return DropdownButton(
              value: selectedCurrency,
              items:getcurrency,
               onChanged:(value){
                    setState(() {
                    selectedCurrency=value;
                    });
                   });
  }


  CupertinoPicker getCurrenciesMethodforIOS(){
    List<Text> getcurrency=[];
    for (String element in currenciesList) {
      getcurrency.add(Text(element));
    }
    
   return CupertinoPicker(itemExtent: 30, onSelectedItemChanged: (value){
              setState(() {
              selectedCurrency=currenciesList[value];
              });
              
            }, children: getcurrency);
  }

  String? selectedCurrency='USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:getCurrenciesMethodforAndroid()
          ),
        ],
      ),
    );
  }
}
