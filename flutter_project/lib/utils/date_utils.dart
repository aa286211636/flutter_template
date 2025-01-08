import 'package:intl/intl.dart';

class DateCutomUtils {
  static String compareTime(String? timeString) {
    // 处理空字符串或无效输入
    if (timeString == null || timeString.isEmpty) {
      return '无效的时间字符串';
    }

    try {
      final now = DateTime.now();
      final inputTime = DateTime.parse(timeString);

      if (now.difference(inputTime).inDays == 0) {
        // 如果是同一天
        final formatter = DateFormat('HH:mm', 'zh_CN');
        final time = formatter.format(inputTime);
        return '今天 $time';
      } else if (now.difference(inputTime).inDays == 1) {
        // 如果是一天前
        final formatter = DateFormat('HH:mm', 'zh_CN');
        final time = formatter.format(inputTime);
        return '昨天 $time';
      } else {
        // 计算本周的开始和结束日期
        final nowStartOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final nowEndOfWeek = nowStartOfWeek.add(Duration(days: 6));

        if (inputTime.isAfter(nowStartOfWeek) &&
            inputTime.isBefore(nowEndOfWeek)) {
          // 如果是本周内
          final formatter = DateFormat('EEEE HH:mm', 'zh_CN');
          final dayOfWeek = formatter.format(inputTime);
          return dayOfWeek;
        } else {
          // 如果不是本周
          final formatter = DateFormat('yyyy-MM-dd HH:mm', 'zh_CN');
          final formattedDate = formatter.format(inputTime);
          return formattedDate;
        }
      }
    } catch (e) {
      // 处理解析错误
      return '无效的时间格式';
    }
  }
}
