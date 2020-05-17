import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context , constraints) {
     return Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 0, //means there is no Expanded
              child: Container(
                width: constraints.maxWidth * 0.75,
                //height: constraints.maxHeight * 0.75,
                child: FittedBox(
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10/*, child: Container(color: Colors.blueGrey,),*/),

            Expanded(
              flex: 0, //means there is no Expanded
              child: Container(
                width: constraints.maxWidth * 0.25,
                height: 50,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Venture Dive" , style: TextStyle(color: Colors.white),),
                  ),),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    shape: BoxShape.rectangle,
                    color: Colors.blue
                ),
              ),
            ),
          ],
        ),
     );
    },
  );
}
