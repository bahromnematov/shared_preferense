import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchInBrauther(Uri url) async {
    if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
    } else {
      print("Xato");
    }
  }
}
