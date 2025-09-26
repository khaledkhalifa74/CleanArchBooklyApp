import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() => _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit,FeaturedBooksState>(
      listener: (context, state) {
        if(state is FeaturedBooksSuccess){
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if(state is FeaturedBooksSuccess || state is FeaturedBooksPaginationLoading){
          return FeaturedBooksListView(
            books: books,
          );
        }else if(state is FeaturedBooksFailure){
          return Text(state.errorMessage);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}