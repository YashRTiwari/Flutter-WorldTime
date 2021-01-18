import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import '../model/WorldDateTimeResponse.dart';

class WorldTime {

  String location;
  String time;
  String flag; // url to asset flag icon
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      WorldDateTimeResponse data = WorldDateTimeResponse.fromJson(jsonDecode(response.body));
      String hourOffset = data.utcOffset.substring(1, 3);
      DateTime dtNow = DateTime.parse(data.datetime);
      dtNow = dtNow.add(Duration(hours: int.parse(hourOffset)));
      isDayTime = dtNow.hour > 6 && dtNow.hour < 20 ? true : false;
      time = DateFormat.jm().format(dtNow);
    } catch (e){
      time = 'Unable to get time';
    }
  }
}