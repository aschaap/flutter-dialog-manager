import 'package:dialog_manager/datamodels/alert/alert_request.dart';
import 'package:dialog_manager/datamodels/alert/alert_response.dart';
import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  TextEditingController textController = TextEditingController();
  TextEditingController textController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showNButtonDialog);
    _dialogService.registerSnackBarListener(_showSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showSnackBar(AlertResponse response) {
    print(response.text);
    SnackBar snackBar = SnackBar(content: Text(response.text));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _showNButtonDialog(AlertRequest request) {
    Alert(
            context: context,
            title: request.title,
            desc: request.description,
            content: (request.text != null && request.text1 != null)
                ? Column(
                    children: <Widget>[
                      TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: request.text,
                        ),
                      ),
                      TextField(
                        controller: textController1,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: request.text1,
                        ),
                      ),
                    ],
                  )
                : null,
            closeFunction: () =>
                _dialogService.dialogComplete(AlertResponse(confirmed: false)),
            buttons: (request.buttonTitle1 != null)
                ? [
                    DialogButton(
                      child: Text(request.buttonTitle),
                      onPressed: () {
                        _dialogService.dialogComplete(AlertResponse(
                            confirmed: true,
                            text: textController.text.toString(),
                            text1: textController1.text.toString()));
                        Navigator.of(context).pop();
                      },
                    ),
                    DialogButton(
                      child: Text(request.buttonTitle1),
                      onPressed: () {
                        _dialogService
                            .dialogComplete(AlertResponse(button1: true));
                        Navigator.of(context).pop();
                      },
                    )
                  ]
                : [
                    DialogButton(
                      child: Text(request.buttonTitle),
                      onPressed: () {
                        _dialogService.dialogComplete(AlertResponse(
                            confirmed: true,
                            text: textController.text.toString(),
                            text1: textController1.text.toString()));
                        Navigator.of(context).pop();
                      },
                    )
                  ])
        .show();
  }
}
