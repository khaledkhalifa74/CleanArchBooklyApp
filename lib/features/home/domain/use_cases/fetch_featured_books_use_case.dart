import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either< Failure,List<BookEntity>>> fetchFeaturedBooks(){
    // check permission
    return homeRepo.fetchFeaturedBooks();
  }
}