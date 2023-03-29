import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_view/screen/provider/photo_provider.dart';
import 'package:staggered_view/screen/view/photo_screen.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => photoProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => photoscreen(),
      },
    ),
  ));
}