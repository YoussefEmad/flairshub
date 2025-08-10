import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 3,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
);
