import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/foundation.dart';
import 'package:dialog_manager/locator.dart';

class HomeViewModel extends ChangeNotifier {
  DialogService _dialogService = locator<DialogService>();

  Future doThings() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog(
        title: 'Login?',
        description: 'Press button to log in.',
        buttonTitle: 'Confirm');
    if (dialogResult.confirmed) {
      print('User has confirmed login');
      var dialogResult1 = await _dialogService.showDialog(
          title: 'Want to stay logged in?',
          description: 'You confirmed the previous dialog',
          buttonTitle: 'Yes',
          buttonTitle1: 'No');
      if (dialogResult1.confirmed != null && dialogResult1.confirmed) {
        print('User has confirmed (i.e., "yes")');
      } else if (dialogResult1.button1 != null && dialogResult1.button1) {
        print('User has pressed button1 (i.e., "no")');
      } else {
        print('user closed the dialog (i.e., "x")');
      }
    } else {
      print('User cancelled the login dialog');
    }
  }
}
