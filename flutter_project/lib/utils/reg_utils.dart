class RegUtils {
  // 判断是否是邮箱
  static bool isEmail(String input) {
    const String emailRegex =
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
    final RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(input);
  }

  // 判断是否是手机号
  static bool isPhoneNumber(String input) {
    const String phoneRegex = r'^1[3-9]\d{9}$';
    final RegExp regExp = RegExp(phoneRegex);
    return regExp.hasMatch(input);
  }

}
