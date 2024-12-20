import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/Features/login/presentation/views/widgets/custom_text_field.dart';
import 'package:qr_code/Features/scan/presentation/views/scan_view.dart';
import 'package:qr_code/core/widgets/custom_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 445.w,
              height: 284.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: SvgPicture.asset("assets/Ellipse 48.svg"),
                  ),
                  Positioned(
                    left: 207.w,
                    child: Opacity(
                      opacity: 0.3,
                      child: SvgPicture.asset("assets/Ellipse 47.svg"),
                    ),
                  ),
                  Positioned(
                    top: 126.h,
                    left: 150.w,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 24.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 104.h),
            CustomTextField(
              hintText: "Enter your Phone",
              obscureText: false,
              textInputType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number is required';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                icon: Icon(Icons.visibility, color: Color(0XFF8B90A0)),
                onPressed: () {},
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            SizedBox(height: 5.h),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0XFF757575),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 43.h),
            CustomButton(
              text: 'Login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushReplacementNamed(ScanViews.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
