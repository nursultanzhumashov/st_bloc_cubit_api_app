import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_api_app/app/cubit/post_fetch_cubit.dart';
import 'package:st_api_app/app/repo/api_repo.dart';
import 'package:st_api_app/app/screens/home_screen.dart';
import 'package:st_api_app/app/data/api_service.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);
  final ApiService apiService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PostFetchCubit>(
            create: (context) => PostFetchCubit(
              apiRepo: ApiRepo(
                apiService: apiService,
              ),
            )..fetchPostApi(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Color(0xffE9DAC1),
          ),
          home: const HomeScreen(),
        ));
  }
}
