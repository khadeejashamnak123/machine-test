import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test_app/Model/feedback_model.dart';
import 'package:machine_test_app/Model/subject_details_mode.dart';

List<SubjectDetailsModel> subjectDetailsList = [];
List<FeedBackModel> dataList = [];

 getSubjectDetails() async {
  final response = await http.get(Uri.parse(
      'http://api.mapyourvehicle.com/WeatherForecast/SubjectDetails'));
  print(response.body);

  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);

    subjectDetailsList = jsonList.map((json) {
      return SubjectDetailsModel.fromJson(json);
    }).toList();

    return subjectDetailsList;
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

Future<http.Response> createUser(String name, String job) {
  return http.post(
    Uri.parse('https://reqres.in/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'name': name, 'job': job}),
  );
}

int questionId = 0;
int statusId = 0;

getFeedBackData() {
  dataList.clear();
  dataList = [
    FeedBackModel("POOR", false, 0),
    FeedBackModel("BELOW NORMAL", false, 1),
    FeedBackModel("NORMAL", false, 2),
    FeedBackModel("GOOD", false, 3),
    FeedBackModel("EXCELLENT", false, 4),
  ];
}

void saveFeedback(BuildContext context) async {
  for (var i in dataList) {
    if (i.isSelected) {
      statusId = i.index;
    }
  }

  String apiUrl =
      'http://api.mapyourvehicle.com/WeatherForecast/FeedBackQuestions'; // Replace with your API endpoint URL
  Map<String, dynamic> data = {
    "questionId": 1,
    "statusId": statusId,
  };

  // Convert the data to JSON format
  String jsonData = json.encode(data);

  // Set the headers for the request
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'accept': '*/*',
  };

  // Perform the POST request
  var response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: jsonData,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse.containsKey("statusId")) {
      int responseData = jsonResponse["statusId"];
      print("Response Data: $responseData");
    } else {
      print("Error: 'data' key not found in the response");
    }
  } else {
    print("Failed to fetch data. Status code: ${response.statusCode}");
  }
}
