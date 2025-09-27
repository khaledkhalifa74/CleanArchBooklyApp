import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class NewestBooksState{}

class NewestBooksInitial extends NewestBooksState{}
class NewestBooksLoading extends NewestBooksState{}
class NewestBooksSuccess extends NewestBooksState{
  final List<BookEntity> books;

  NewestBooksSuccess({required this.books});
}
class NewestBooksFailure extends NewestBooksState{
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}