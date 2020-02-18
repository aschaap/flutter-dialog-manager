import 'package:flutter/widgets.dart';

class AlertRequest {
  final String title;
  final String description;
  final String buttonTitle;
  String buttonTitle1;
  Widget content;

  AlertRequest ({
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
    this.buttonTitle1,
    this.content,
  });
}