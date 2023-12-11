// import 'package:Curvedbottimnavbar/homepage.dart';
// ignore_for_file: prefer_const_constructors

import 'package:first_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return MaterialApp(
//         home: Scaffold(
//       backgroundColor: const Color.fromARGB(255, 139, 0, 167),
//       // ignore: prefer_const_constructors
//       body: SafeArea(
//           // ignore: prefer_const_constructors
//           child: Container(
//         color: const Color.fromARGB(255, 139, 7, 255),
//         width: double.infinity,
//         child: Column(
//           // verticalDirection: VerticalDirection.up,
//           // verticalDirection: VerticalDirection.down,
//           // mainAxisAlignment: MainAxisAlignment.start,
//           // mainAxisAlignment: MainAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.center,
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween
//           // crossAxisAlignment: CrossAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           // ignore: prefer_const_literals_to_create_immutables
//           children: [
//             CircleAvatar(
//               radius: 50.0,
//               backgroundImage: AssetImage('images/idea.png'),
//             ),
//             Text(
//               'Ahmed kh',
//               style: TextStyle(
//                 fontSize: 38.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.phone,
//                     color: Colors.red,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       )),
//     ));
//   }
// }