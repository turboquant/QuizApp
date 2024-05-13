import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

List<int> pieChartArray(
  int value,
  int total,
) {
  return [value, total - value];
}

int addition(
  int val1,
  int val2,
) {
  return val1 + val2;
}

List<String> getQuestionOptions(QuestionStruct question) {
  return question.options;
}

int getNoOfCorrectAnswers(List<QuestionStruct> questions) {
  int correctAnswers = 0;
  for (var question in questions) {
    if (question.answer == question.userAnswer) {
      correctAnswers++;
    }
  }
  return correctAnswers;
}

int getPercentage(
  int value,
  int total,
) {
  return ((value / total) * 100).toInt();
}
