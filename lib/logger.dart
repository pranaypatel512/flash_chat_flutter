import 'package:flutter/foundation.dart';

void log(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}
