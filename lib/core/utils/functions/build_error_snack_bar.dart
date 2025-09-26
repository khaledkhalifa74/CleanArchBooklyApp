import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      errorMessage,
      style: Styles.textStyle16.copyWith(
          color: Colors.black
      ),
    ),
    duration: const Duration(seconds: 3),
  );
}
