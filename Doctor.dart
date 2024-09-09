import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade500,
      appBar: AppBar(
        title: Text('Doctor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Banner(

              message: 'Notice: Doctor function is not working. Please visit our website.',
              location: BannerLocation.topStart,
              color: Colors.red,
              child: Text(''),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}