import 'package:flutter/material.dart';

class defultBody extends StatelessWidget {
  const defultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'There is no weather yet ',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            ' searching Now',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
