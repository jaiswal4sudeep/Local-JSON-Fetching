import 'dart:convert';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fatching Data from Local JSON File'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, int index) {
                currentIndex = index + 1;
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        data[currentIndex.toString()]['id'],
                      ),
                    ),
                    title: Text(
                      data[currentIndex.toString()]['firstname'],
                    ),
                    subtitle: Text(
                      data[currentIndex.toString()]['lastname'],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
