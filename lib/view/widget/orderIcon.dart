import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/coffe.dart';

class orderIcon extends StatelessWidget {
  
  coffee coff;
  
  orderIcon(this.coff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(backgroundImage: AssetImage(coff.image),backgroundColor: Colors.white,),
        ),
      ],
    );
  }
}