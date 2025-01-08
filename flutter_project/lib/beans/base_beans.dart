class BaseBeans {
  String? msg;
  int? code;
  dynamic data;

  BaseBeans.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['code'] = code;
    data['data'] = this.data;
    return data;
  }

  @override
  String toString() {
    return 'BaseBeans{msg: $msg, code: $code, data: $data}';
  }
}