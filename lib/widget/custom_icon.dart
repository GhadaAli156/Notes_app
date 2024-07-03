import 'package:flutter/material.dart';

class CustomSearchItem extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const CustomSearchItem({super.key,required this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16)
      ),
      child: IconButton(
          onPressed: onPressed,
        icon: Icon(icon,
          size: 28,),),
    );
  }
}
