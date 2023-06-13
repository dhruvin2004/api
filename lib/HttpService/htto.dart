import 'dart:convert';

import 'package:api/Global.dart';
import 'package:http/http.dart';

import '../modal/modalclass.dart';

class HttpService {

  static HttpService  httpService= HttpService();


  // Future<List<UserData>> getListData()
  // async{
  //    Response res = await get(Uri.parse("https://reqres.in/api/users?page=2"));
  //    if(res.statusCode == 200)
  //      {
  //        List<UserData> list= [];
  //        UserData userData = UserData.fromJson(jsonDecode(res.body));
  //
  //
  //         if(userData.data!.isNotEmpty)
  //           {
  //             Global.data.addAll(userData.data as Iterable<UserData>);
  //           }
  //         list.addAll(userData.data!);
  //         return list;
  //
  //      }

  //
  //
  // }
 getUserData() async {
    Response response = await get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      UserData userdata = UserData.fromJson(json.decode(response.body));

      Global.list.add(userdata);
      return Global.list;
    } else {
      print(response.statusCode);
      throw "Unable to retrieve posts.";
    }
  }
}