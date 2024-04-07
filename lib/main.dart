import 'package:doctor_booking_app/repository/doctor_repository.dart';
import 'package:doctor_booking_app/screens/home_screen.dart';
import 'package:doctor_booking_app/shared/theme/app_theme.dart';
import 'package:doctor_booking_app/state/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  const doctorRepository = DoctorRepository();
  runApp(const AppScreen(doctorRepository: doctorRepository));
}

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.doctorRepository,
  });

  final DoctorRepository doctorRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: doctorRepository,
        ),
        // Create other instances of repositories to make available to the app
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(doctorRepository: doctorRepository)
              ..add(LoadHomeEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Doctor Booking App',
          debugShowCheckedModeBanner: false,
          theme: const AppTheme().themeData,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
