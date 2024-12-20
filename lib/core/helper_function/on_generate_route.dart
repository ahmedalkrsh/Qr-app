import 'package:flutter/material.dart';
import 'package:qr_code/Features/login/presentation/views/login_view.dart';
import 'package:qr_code/Features/result_screen/presentation/views/result_view.dart';
import 'package:qr_code/Features/scan/presentation/views/scan_view.dart';

class OnGenerateRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
         case ScanViews.routeName:
        return MaterialPageRoute(builder: (_) => const ScanViews());
        case ResultView.routeName:
        return MaterialPageRoute(builder: (_) => const ResultView());
      default:
        return MaterialPageRoute(builder: (_) => Container());
        
    }}
}
