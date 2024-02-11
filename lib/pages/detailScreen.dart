// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.recipe,
  });

  final Map<String, dynamic> recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Recipe"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                  child: Image.network(
                    "${recipe['photo_url']}",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "${recipe['title']}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.av_timer_rounded,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${recipe['cook_time']} Minutes",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${recipe['ingredients']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${recipe['instructions']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
