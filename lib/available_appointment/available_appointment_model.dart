import '/flutter_flow/flutter_flow_util.dart';
import 'available_appointment_widget.dart' show AvailableAppointmentWidget;
import 'package:flutter/material.dart';

class AvailableAppointmentModel
    extends FlutterFlowModel<AvailableAppointmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
