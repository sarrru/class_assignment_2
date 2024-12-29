import 'package:bloc_assignment/service%20locator/service_locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // Ensure dependencies are registered
  runApp(const App());
}
