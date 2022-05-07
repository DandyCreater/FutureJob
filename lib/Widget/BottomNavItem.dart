import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  // const BottomNavItem({ Key? key }) : super(key: key);

  BottomNavItem({required this.index, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            height: 24,
            width: 24,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
