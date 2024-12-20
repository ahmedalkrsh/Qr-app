import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/Features/scan/presentation/views/scan_view.dart';
import 'package:qr_code/core/widgets/custom_button.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('myBox');
    final List<String> items = box.get('barcodeResults', defaultValue: <String>[]);

    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: Scaffold(
          body: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: SvgPicture.asset("assets/Rectangle 5.svg"),
                  ),
                  SizedBox(width: 70.w),
                  Padding(
                    padding: EdgeInsets.all(29.w),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushReplacementNamed(ScanViews.routeName),
                      child: SvgPicture.asset(
                        "assets/arrow_back.svg",
                        height: 43.h,
                        width: 41.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              Text(
                "Scanning Result",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 19.h),
              Text(
                'Proreader will keep your last 10 days history\n'
                'To keep all your scanned history, please\n'
                'purchase our pro package.',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFFB9B9B9),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 75.h),
              items.isNotEmpty
                  ? SizedBox(
                      height: 290.h,
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 62.w),
                            child: Container(
                              height: 65.h,
                              decoration: BoxDecoration(
                                color: Color(0XFFF4F4F4),
                                borderRadius: BorderRadius.circular(11.r),
                              ),
                              child: ListTile(
                                leading: SvgPicture.asset('assets/icon.svg'),
                                title: Text(
                                  items[index],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        "No results found!",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFB9B9B9),
                        ),
                      ),
                    ),
              SizedBox(height: 41.h),
              CustomButton(
                text: 'Send',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
