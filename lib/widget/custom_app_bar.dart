import 'package:flutter/material.dart';
import 'package:notesapp/widget/custom_icon.dart';

class CustomAppBar extends StatelessWidget{
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  const CustomAppBar({super.key, required this.title,required this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: TextStyle(fontSize: 24),),
        Spacer(flex: 1,),
        CustomSearchItem(
          onPressed: onPressed,
          icon: icon,)
      ],
    );
  }
  
}