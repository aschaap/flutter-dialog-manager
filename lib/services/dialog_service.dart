import 'dart:async';

import 'package:dialog_manager/datamodels/alert/alert_request.dart';
import 'package:dialog_manager/datamodels/alert/alert_response.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Function(AlertResponse) _showSnackBarListener;
  Completer<AlertResponse> _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }
  void registerSnackBarListener(Function(AlertResponse) showSnackBarListener) {
    _showSnackBarListener = showSnackBarListener;
  }
  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<AlertResponse> showDialog({
    String title,
    String description,
    String buttonTitle = 'Ok', // default value in case none is passed
    String buttonTitle1,
    String text,
    String text1
  }) {
    _dialogCompleter = Completer<AlertResponse>();
    var request = AlertRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
      buttonTitle1: buttonTitle1,
      text: text,
      text1: text1
    );
    _showDialogListener(request);
    return _dialogCompleter.future;
  }
  
    void showSnackBar(AlertResponse response) {
    
    _showSnackBarListener(response);
  }
  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(AlertResponse response) {
    print('before error');
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
    print('test' + response.text1);
  }
}