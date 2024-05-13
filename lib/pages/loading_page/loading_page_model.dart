import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_page_widget.dart' show LoadingPageWidget;
import 'package:flutter/material.dart';

class LoadingPageModel extends FlutterFlowModel<LoadingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<QuizesRecord>? loadingPagePreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in LoadingPage widget.
  QuizesRecord? quizDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
