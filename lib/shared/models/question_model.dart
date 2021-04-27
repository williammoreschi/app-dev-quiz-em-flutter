import 'dart:convert';

import 'package:dev_quiz/shared/models/answer_model.dart';

class QuestionsMolel {
  final String title;
  final List<AnswerModel> answers;

  QuestionsMolel({
    required this.title,
    required this.answers
  }) : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionsMolel.fromMap(Map<String, dynamic> map) {
    return QuestionsMolel(
      title: map['title'],
      answers: List<AnswerModel>.from(map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionsMolel.fromJson(String source) => QuestionsMolel.fromMap(json.decode(source));
}
