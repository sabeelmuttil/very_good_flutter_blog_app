// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_blog_app/config/route/router.dart';
import 'package:very_good_blog_app/features/authentication/authentication.dart';
import 'package:very_good_blog_app/repository/authentication_repository.dart';
import 'package:very_good_blog_app/repository/user_repository.dart';

class VeryGoodBlogApp extends StatelessWidget {
  const VeryGoodBlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => AuthenticationRepository(),
        ),
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(),
        ),
      ],
      child: const VeryGoodBlogAppView(),
    );
  }
}

class VeryGoodBlogAppView extends StatelessWidget {
  const VeryGoodBlogAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
            userRepository: context.read<UserRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: RouteManager.route.routeInformationParser,
        routerDelegate: RouteManager.route.routerDelegate,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          fontFamily: 'DM Sans',
        ),
      ),
    );
  }
}
