import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Future<Book> createBook(String title) async {
  final response = await http.post(
      Uri.parse('http://192.168.137.1:8080/api/books/addBook'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'title': title}));
  if (response.statusCode == 200) {
    return Book.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create book');
  }
}

Future<Book> getBook(String id) async {
  final response = await http.get(
      Uri.parse('http://192.168.137.1:8080/api/books/'),
      headers: <String, String>{'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    return Book.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get book');
  }
}

class Book {
  final int id;
  final String title;

  const Book({required this.id, required this.title});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
