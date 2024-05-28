import 'package:flutter/material.dart';



class MyAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListViewEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replace Views Example'),
      ),
      body: isListViewEnabled ? ListViewWidget() : PlaceholderWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isListViewEnabled = !isListViewEnabled;
          });
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'View is Disabled',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
