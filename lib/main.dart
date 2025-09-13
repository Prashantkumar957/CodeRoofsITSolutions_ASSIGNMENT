import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mixer_screen.dart';
import 'screens/subscription_screen.dart';
import 'constants/colors.dart';
import 'screens/MixerVIPScreen.dart';
void main() {
  runApp(const MixerDatingApp());
}

class MixerDatingApp extends StatelessWidget {
  const MixerDatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Mixer Dating App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: 'SF Pro Display',
      ),
      home:  MixerScreen(),
      routes: {
        '/subscription': (context) => const SubscriptionScreen(),
        '/mixer-vip': (context) =>  MixerVIPScreen(),
      },
    );
  }
}
