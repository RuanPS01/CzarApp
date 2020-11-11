import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                'http://appliedwayfinding.com/wp-content/uploads/2015/02/Bournemouth-Finder-map-web670.jpg',
                scale: 1.7,
              ),
            ),
            width: double.infinity,
            height: 603,
          )
        ],
      ),
    );
  }
}
