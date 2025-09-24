import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;
  Future<void> fetchFeaturedBooks() async{
    emit(NewestBooksLoading());
    var result = await newestBooksUseCase.call();
    result.fold(
          (failure) {
        emit(NewestBooksFailure(errorMessage: failure.message));
      },
          (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}