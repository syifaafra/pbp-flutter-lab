import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/widget/drawer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key, 
    required this.myWatch
    });

  // Declare a field that holds the Watch.
  final MyWatchList myWatch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail of MyWatchList'),
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(myWatch.fields.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    const Text('Release Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(myWatch.fields.releaseDate),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Rating: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${myWatch.fields.rating}/5'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Status: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(myWatch.fields.watched ? 'watched' : 'not watched'),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Review: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(myWatch.fields.review),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}