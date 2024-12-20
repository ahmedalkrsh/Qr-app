import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qr_code/Features/login/presentation/views/login_view.dart';
import 'core/helper_function/on_generate_route.dart';

void main() async { 
   WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   final box = await Hive.openBox('myBox');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoute.onGenerateRoute,
      initialRoute: LoginView.routeName
    )
    );
  }
}