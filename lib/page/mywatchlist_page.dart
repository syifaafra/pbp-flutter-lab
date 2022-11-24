import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/fetch_mywatchlist.dart';
import 'package:counter_7/page/mywatchlist_detail_page.dart';

class MyWatchListPage extends StatefulWidget {
    const MyWatchListPage({Key? key}) : super(key: key);

    @override
    _MyWatchListPageState createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watch List'),
            ),
            drawer: MyDrawer(),
            body: FutureBuilder(
                future: fetchWatchList(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                    if (!snapshot.hasData) {
                        return Column(
                        children: const [
                            Text(
                            "Tidak ada watch list :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index)=> Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 2.0,
                                  color: (snapshot.data![index].fields.watched ? Colors.blue : Colors.red),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            child: 
                              ListTile(
                                title: Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                trailing: Checkbox(
                                  value: snapshot.data![index].fields.watched,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      snapshot.data![index].fields.watched = value!;
                                    });
                                  },
                                ),
                                onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(myWatch: snapshot.data![index]),
                                    ),
                                    );
                                },
                            ),
                            )
                        );
                    }
                    }
                }
            )
        );
    }
}