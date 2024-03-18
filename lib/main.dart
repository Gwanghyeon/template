import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_v1/src/service/theme_service.dart';
import 'package:template_v1/util/route/route_path.dart';

import 'util/lang/generated/l10n.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Language settings
          localizationsDelegates: const [
            S.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // theme
          theme: ref.watch(themeServiceProvider).themeData,
          initialRoute: RoutePath.shopping,
          onGenerateRoute: RoutePath.onGenerateRoute,
        );
      },
    );
  }
}
