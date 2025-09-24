import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess){
          return const FeaturedBooksListView();
        }else if(state is FeaturedBooksFailure){
          return Text(state.errorMessage);
        }else{
          const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}