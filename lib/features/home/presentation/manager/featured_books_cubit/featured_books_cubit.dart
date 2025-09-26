import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async{
    if(pageNumber == 0){
      emit(FeaturedBooksLoading());
    }
    emit(FeaturedBooksPaginationLoading());
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold(
        (failure) {
          emit(FeaturedBooksFailure(errorMessage: failure.message));
        },
        (books) {
          emit(FeaturedBooksSuccess(books: books));
        },
    );
  }
}