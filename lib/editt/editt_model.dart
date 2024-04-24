import '/flutter_flow/flutter_flow_util.dart';
import 'editt_widget.dart' show EdittWidget;
import 'package:flutter/material.dart';

class EdittModel extends FlutterFlowModel<EdittWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
