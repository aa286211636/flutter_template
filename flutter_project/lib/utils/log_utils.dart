import 'package:flutter/foundation.dart';

// 添加日志级别枚举
enum Level {
  debug,
  info,
  warning,
  error,
  alien,
}

/// 日志工具类
class LoggerUtil {
  // 私有构造函数，防止实例化
  LoggerUtil._();
  static const String _resetColor = '\x1B[0m';
  static const String _redColor = '\x1B[31m';
  static const String _greenColor = '\x1B[32m';
  static const String _yellowColor = '\x1B[33m';
  static const String _cyanColor = '\x1B[36m';

  /// 打印日志的方法
  static void log(String message, {Level level = Level.info}) {
    if (!kDebugMode) return;

    try {
      final now = DateTime.now();
      final timeString =
          '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

      String logMessage;
      switch (level) {
        case Level.debug:
          logMessage = '$_cyanColor[DEBUG][$timeString] $message$_resetColor';
          break;
        case Level.info:
          logMessage = '$_greenColor[INFO][$timeString] $message$_resetColor';
          break;
        case Level.warning:
          logMessage =
              '$_yellowColor[WARNING][$timeString] $message$_resetColor';
          break;
        case Level.error:
          logMessage = '$_redColor[ERROR][$timeString] $message$_resetColor';
          break;
        case Level.alien:
          logMessage = '$_redColor[ALIEN][$timeString] $message$_resetColor';
          break;
      }
      debugPrint(logMessage);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
