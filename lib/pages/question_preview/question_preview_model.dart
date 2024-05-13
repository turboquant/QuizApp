import '/flutter_flow/flutter_flow_util.dart';
import 'question_preview_widget.dart' show QuestionPreviewWidget;
import 'package:flutter/material.dart';

class QuestionPreviewModel extends FlutterFlowModel<QuestionPreviewWidget> {
  ///  Local state fields for this page.

  int currentQuestion = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
