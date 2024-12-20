import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/Features/result_screen/presentation/views/result_view.dart';
import 'package:qr_code/core/widgets/custom_button.dart';

class ScanViewBody extends StatefulWidget {
  const ScanViewBody({super.key});
 
  @override
  State<ScanViewBody> createState() => _ScanViewBodyState();
}

class _ScanViewBodyState extends State<ScanViewBody> {
 final box = Hive.box("myBox");
  bool isProcessing = false; 

  @override
  void initState() {
    super.initState();
    if (!box.containsKey('barcodeResults')) {
      box.put('barcodeResults', <String>[]);
    }
  }

  void onDetect(BarcodeCapture barcodeCapture) {
    if (isProcessing) return; 
    setState(() => isProcessing = true); 

    final barcode = barcodeCapture.barcodes.first;
    String barcodeResult = barcode.rawValue ?? "Barcode not found";

    List<String> results = box.get('barcodeResults', defaultValue: <String>[]);
    results.add(barcodeResult);
    box.put('barcodeResults', results);

 
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SvgPicture.asset("assets/Rectangle 5.svg"),
                  ),
                  SizedBox(width: 70.w),
                  Padding(
                    padding: const EdgeInsets.all(29),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushReplacementNamed(ResultView.routeName),
                      child: SvgPicture.asset(
                        "assets/Group 11.svg",
                        height: 43,
                        width: 41,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Text(
                "Scan QR Code",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 19),
              Text(
                'Place qr code inside the frame to scan please\n'
                'avoid shake to get results quickly',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFFB9B9B9),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 55),
              SvgPicture.asset(
                'assets/Group 10.svg',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 10),
              Text(
                'Scanning Code...',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFFB9B9B9),
                ),
              ),
              SizedBox(height: 33),
              SvgPicture.asset('assets/Group 8.svg',height: 17,),
              SizedBox(height: 10),
              CustomButton(
  text: 'Place Camera Code',
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: MobileScanner(
          onDetect: (barcodeCapture) {
            onDetect(barcodeCapture);
            Navigator.of(context).pushReplacementNamed(ResultView.routeName); 
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  },
),

            ],
          ),
        ),
      ),
    );
  }
}

