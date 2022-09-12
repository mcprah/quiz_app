// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

TestQuestion testFromJson(String str) => TestQuestion.fromJson(json.decode(str));

String testToJson(TestQuestion data) => json.encode(data.toJson());

class TestQuestion {
    TestQuestion({
        this.question,
        this.options,
        this.answer,
    });

    final String? question;
    final List<Option>? options;
    final String? answer;

    factory TestQuestion.fromJson(Map<String, dynamic> json) => TestQuestion(
        question: json["question"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "options": List<dynamic>.from(options!.map((x) => x.toJson())),
        "answer": answer,
    };
}

class Option {
   Option({
        this.id,
        this.value,
    });

    final String? id;
    final String? value;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}
