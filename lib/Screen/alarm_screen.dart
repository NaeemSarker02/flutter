// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Utils/data.dart';


class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          color:  Color.fromARGB(255, 49, 49, 182),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map((alarm) {
                return Container(
                  //color: Color.fromARGB(255, 30, 30, 145),
                  
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 20, 20, 112),Color.fromARGB(255, 23, 16, 124)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(24))
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.label,
                            color: Colors.white,
                            size: 24,
                            ),
                        SizedBox(width: 8,),
                        Text(
                          'Alarm-1',
                          style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                        ),
                        ],
                        ),
                        
                        Switch(
                        onChanged: (bool value) {},
                        value: true,
                        activeColor: Colors.white,
                        )
                        ],
                      ),
                      Text(
                          'Alarm-2',
                          style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir'),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    ));
  }
}
