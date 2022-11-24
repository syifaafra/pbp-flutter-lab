import 'package:counter_7/model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchList>> fetchWatchList() async {
    var url = Uri.parse(
        'https://tugas-2-pbp-afra.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
    },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<MyWatchList> watchList = [];
    for (var d in data) {
        if (d != null) {
            watchList.add(MyWatchList.fromJson(d));
        }
    }
    return watchList;
}