import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../provider/photo_provider.dart';

class photoscreen extends StatefulWidget {
  const photoscreen({Key? key}) : super(key: key);

  @override
  State<photoscreen> createState() => _photoscreenState();
}

class _photoscreenState extends State<photoscreen> {
  photoProvider? photoProviderTrue;
  photoProvider?photoProviderFalse;

  @override
  Widget build(BuildContext context) {
    photoProviderFalse =
        Provider.of<photoProvider>(context, listen: false);
    photoProviderTrue =
        Provider.of<photoProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Staggered",
            style: TextStyle(color: Colors.white),
          ),

        ),
        body: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 5,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(
                4.5 / 7,
                crossAxisRatio: 0.9,
                // alignment: AlignmentDirectional.center,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: photoProviderFalse!.images.length,
                (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(width: 50, color: Colors.white),
                    left: BorderSide(width: 5, color: Colors.white),
                    right: BorderSide(width: 5, color: Colors.white),
                    top: BorderSide(width: 5, color: Colors.white),
                  ),
                ),
                child: Image.asset(
                  "${photoProviderFalse!.images[index]}",
                  fit: BoxFit.cover,

                ),
              );
            },
          ),
        ),
      ),
    );
  }
}