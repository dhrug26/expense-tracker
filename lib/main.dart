import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';
// import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

/*
ThemeData.dark().copyWith( // dark() no longer takes any arguments
  useMaterial3: true,
  colorScheme: kColorScheme,
  cardTheme:
*/
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) => runApp(
  //           MaterialApp(
  //             darkTheme: ThemeData.dark().copyWith(
  //                 colorScheme: kColorScheme,
  //                 cardTheme: const CardTheme().copyWith(
  //                   color: kDarkColorScheme.secondaryContainer,
  //                   margin:
  //                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  //                 )),
  //             theme: ThemeData().copyWith(
  //               colorScheme: kColorScheme,
  //               appBarTheme: const AppBarTheme().copyWith(
  //                   backgroundColor: kColorScheme.onPrimaryContainer,
  //                   foregroundColor: kColorScheme.primaryContainer),
  //               cardTheme: const CardTheme().copyWith(
  //                 color: kColorScheme.secondaryContainer,
  //                 margin:
  //                     const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  //               ),
  //               elevatedButtonTheme: ElevatedButtonThemeData(
  //                 style: ElevatedButton.styleFrom(
  //                     backgroundColor: kColorScheme.primaryContainer),
  //               ),
  //               textTheme: ThemeData().textTheme.copyWith(
  //                     titleLarge: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: kColorScheme.onSecondaryContainer,
  //                         fontSize: 16),
  //                   ),
  //             ),
  //             themeMode: ThemeMode.system,
  //             home: const Expenses(),
  //           ),
  //         ));
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          )),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
