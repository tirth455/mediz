import 'package:flutter/material.dart';

import 'Doctor.dart';
import 'Patient.dart';

class PovSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('Pov Selector'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your POV:',
              style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Doctor()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.mOAO0IvDImx--rhG95t-LQHaHa&pid=Api&P=0&h=180"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Doctor'),
                    SizedBox(height: 20),

                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Patient()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.JoCM8-dGr_VB9NLKaFROZAHaHw&pid=Api&P=0&h=180"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Patient'),
                    SizedBox(height: 20),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

