import 'package:api/HttpService/htto.dart';
import 'package:api/modal/modalclass.dart';
import 'package:flutter/material.dart';

import '../Global.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: httpService.getUserData(),
        builder: (context,snapshot)
        {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: Global.list[0].data!.length,
                itemBuilder: (context,index){

                  return
                       ListTile(
                         leading: Text("${Global.list[index].data![index].id}"),
                       );

            });
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
