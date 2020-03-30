import 'package:flutter/material.dart'; 

class plantAppBarController extends StatelessWidget { 
  const plantAppBarController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.filter_list,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Plants',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Avenir',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.people,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
