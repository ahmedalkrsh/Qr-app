import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        ElevatedButton(
          
          style: ElevatedButton.styleFrom(
         fixedSize:  Size(300.w, 58.h),
         backgroundColor: Color(0XFFFE7D55),
    
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(8),
      ),
    ),onPressed: onPressed, child: 
         Text(text, style:  TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.w700),)),
       
        
      ]
        
    );
  }
}