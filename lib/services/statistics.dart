import 'network.dart';

class OnlineRates {
  
  String apiKey='1AAABBDA-EA69-4A6A-BEF8-0143ED0B2ADE';
  String url='https://rest.coinapi.io/v1/exchangerate';


  Future<dynamic> getRate(String? currencyName) async{
    var datas=[];
    NetworkHelper getBTCstatics= NetworkHelper(url: '$url/BTC/$currencyName?apikey=$apiKey');
    var btcRate=await getBTCstatics.getData();
    datas.add(btcRate);

    NetworkHelper getETHstatics= NetworkHelper(url: '$url/ETH/$currencyName?apikey=$apiKey');
    var ethRate=await getETHstatics.getData();
    datas.add(ethRate);

    NetworkHelper getstatics= NetworkHelper(url: '$url/LTC/$currencyName?apikey=$apiKey');
    var ltcRate=await getstatics.getData();
    datas.add(ltcRate);
    print(datas);
    return datas;
  }
}