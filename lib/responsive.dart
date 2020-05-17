import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expandedexample.dart';

typedef ItemSelectedCallback(int value);

class MasterDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MasterDetailPageState();
}

class MasterDetailPageState extends State<MasterDetailPage> {
  var value = 0;

  @override
  Widget build(BuildContext context) => _buildLayoutWithMediaQuery();

  Widget _buildLayout(var isLargeScreen) {
    if (!isLargeScreen) {
      return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: Scaffold(
          appBar: AppBar(title: Text("Week 3 Assignment"),),
            drawer: Drawer(
              child: ListWidget(15, (value) {
                this.value = value;
            },
            )),
            body: ExpandedExample()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text("Week 3 Assignment"),),
        body: Row(
          children: <Widget>[
            Expanded(
              child: ListWidget(15, (value) {
                this.value = value;
                  setState(() {});
              }),
            ),
            Expanded(child: ExpandedExample())
          ],
        ),
      );
    }
  }

  Widget _buildLayoutWithMediaQuery() =>
      _buildLayout(MediaQuery.of(context).size.width > 600);

  Widget _buildLayoutWithLayoutBuilder() => LayoutBuilder(
      builder: (context, constraints) =>
          _buildLayout(constraints.maxWidth > 600));

  Widget _buildLayoutWithOrientationBuilder() => OrientationBuilder(
        builder: (context, orientation) =>
            _buildLayout(orientation == Orientation.landscape),
      );
}

class ListWidget extends StatelessWidget {
  final int count;
  final ItemSelectedCallback onItemSelected;

  ListWidget(this.count, this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: InkWell(
                onTap: () {
                  onItemSelected(position);
                  },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        position.toString(),
                        style: TextStyle(fontSize: 22.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class DetailWidget extends StatelessWidget {
  final int number;

  DetailWidget(this.number);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
