import 'network.dart';

class OnlineRates {
  
  String apiKey='095AEA86-879E-48EB-B48F-0792BF872A3B';
  String url='https://rest.coinapi.io/v1/exchangerate/BTC/';


  Future<dynamic> getRate(String? currencyName) async{

    NetworkHelper getstatics= NetworkHelper(url: '$url$currencyName?apikey=$apiKey');
    var rates=await getstatics.getData();
    return rates;
  }
}