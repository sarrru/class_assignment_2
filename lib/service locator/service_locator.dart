// Importing the necessary Bloc classes and the GetIt package for dependency injection
import 'package:bloc_assignment/bloc/area_of_circle_bloc.dart';
import 'package:bloc_assignment/bloc/dashboard_bloc.dart';
import 'package:bloc_assignment/bloc/simple_interest_bloc.dart';
import 'package:bloc_assignment/bloc/student_bloc.dart';
import 'package:get_it/get_it.dart';

// Creating a single instance of GetIt for service locator functionality
final serviceLocator = GetIt.instance;

// Function to initialize and register dependencies with the service locator
Future<void> initDependencies() async {
  // Registering the AreaOfCircleBloc as a lazy singleton
  // This ensures it is created only when accessed for the first time
  serviceLocator.registerLazySingleton(() => AreaOfCircleBloc());

  // Registering the SimpleInterestBloc as a lazy singleton
  serviceLocator.registerLazySingleton(() => SimpleInterestBloc());

  // Registering the StudentBloc as a lazy singleton
  serviceLocator.registerLazySingleton(() => StudentBloc());

  // Registering the DashboardBloc as a lazy singleton
  // It depends on AreaOfCircleBloc, SimpleInterestBloc, and StudentBloc
  serviceLocator.registerLazySingleton(() => DashboardBloc(
        areaOfCircleBloc:
            serviceLocator(), // Fetching AreaOfCircleBloc instance
        simpleInterestBloc:
            serviceLocator(), // Fetching SimpleInterestBloc instance
        studentBloc: serviceLocator(), // Fetching StudentBloc instance
      ));
}
