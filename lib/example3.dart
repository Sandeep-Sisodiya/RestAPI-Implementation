import 'dart:convert';

import 'package:api_tutorials/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> UserList = [];

  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        UserList.add(UserModel.fromJson(i));
      }
      return UserList;
    } else {
      return UserList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Course')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {

                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                  return ListView.builder(
                    itemCount: UserList.length,
                    itemBuilder: (context, index) {
                      return Card(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReUsableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                            ReUsableRow(title: 'UserName', value: snapshot.data![index].username.toString()),
                            ReUsableRow(title: 'Email', value: snapshot.data![index].email.toString()),
                            ReUsableRow(title: 'Address',
                                value: snapshot.data![index].address!.city.toString()+
                                    snapshot.data![index].address!.geo!.lat.toString()
                            ),

                          ],
                        ),
                      ));
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  String title , value;
  ReUsableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)

        ],
      ),
    );
  }
}
