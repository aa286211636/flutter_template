import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

typedef OnConfirm = void Function();
typedef OnCancel = void Function();

class SmartDialogUtils {
  late OnConfirm onConfirm;
  late OnCancel onCancel;

  static void showLoading(String? msg) {
    SmartDialog.showLoading(
        alignment:Alignment.center,
        msg: msg ?? '加载中...',
        animationType: SmartAnimationType.scale);
  }

  
  static void success(String? msg) {
    SmartDialog.showNotify(
        msg: msg ?? '操作成功',
        keepSingle: true,
        alignment: Alignment.center,
        animationType: SmartAnimationType.scale,
        notifyType: NotifyType.success);
  }

 
  static void failure(String? msg) {
    SmartDialog.showNotify(
        keepSingle: true,
        msg: msg ?? '操作失败',
        alignment: Alignment.center,
        animationType: SmartAnimationType.scale,
        notifyType: NotifyType.failure);
  }

  static void error(String? msg) {
    SmartDialog.showNotify(
        msg: msg ?? '出错了',
        alignment: Alignment.center,
        keepSingle: true,
        animationType: SmartAnimationType.scale,
        notifyType: NotifyType.error);
  }

 
  static void warning(String? msg) {
    SmartDialog.showNotify(
        msg: msg ?? '警告',
        maskColor: Colors.white,
        keepSingle: true,
        animationType: SmartAnimationType.scale,
        notifyType: NotifyType.warning);
  }

  
  static void close() {
    SmartDialog.dismiss();
  }

  static void closeLoading() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }
}
