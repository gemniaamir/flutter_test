import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proctor/service/app_service.dart';
import 'package:proctor/service/injection_container.dart';
import 'package:proctor/utils/theme.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Interview Prep'),
        centerTitle: true,
        backgroundColor: ThemeStyle.appBarColor,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: FutureBuilder(
          future: getNumberTrivia(http.Client()),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    snapshot.data.toString(),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Error Occurred',
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.showSnackbar(GetSnackBar(
          title: locator<AppService>().execute(),
          message: 'Today Date:',
          duration: const Duration(seconds: 1),
        ));
      }),
    );
  }
}

Future<String> getNumberTrivia(http.Client http) async {
  Uri numberAPIURL = Uri.parse('http://numbersapi.com/random/trivia?json');
  final response = await http.get(numberAPIURL);
  if (response.statusCode == 200) {
    final Map triviaJSON = jsonDecode(response.body);
    return triviaJSON['text'];
  } else {
    return 'Failed to fetch number trivia';
  }
}
