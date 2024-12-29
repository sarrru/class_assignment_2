import 'package:bloc_assignment/bloc/area_of_circle_bloc.dart';
import 'package:bloc_assignment/bloc/simple_interest_bloc.dart';
import 'package:bloc_assignment/bloc/student_bloc.dart';
import 'package:bloc_assignment/view/area_of_circle_view.dart';
import 'package:bloc_assignment/view/simple_interest_view.dart';
import 'package:bloc_assignment/view/student_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Cubit<void> {
  final AreaOfCircleBloc areaOfCircleBloc;
  final SimpleInterestBloc simpleInterestBloc;
  final StudentBloc studentBloc;

  DashboardBloc({
    required this.areaOfCircleBloc,
    required this.simpleInterestBloc,
    required this.studentBloc,
  }) : super(null);

  void openAreaofCircleBlocView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: areaOfCircleBloc,
          child: AreaCircleView(),
        ),
      ),
    );
  }

  void openSimpleInterestBlocView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: simpleInterestBloc,
          child: SimpleInterestView(),
        ),
      ),
    );
  }

  void openStudentView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: studentBloc,
          child: StudentView(),
        ),
      ),
    );
  }
}
