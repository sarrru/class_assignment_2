import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'simple_interest_event.dart';

class SimpleInterestBloc extends Bloc<SimpleInterestEvent, double> {
  SimpleInterestBloc() : super(0) {
    on<CalculateSimpleInterest>((event, emit) {
      // Calculate Simple Interest
      final SI = (event.principal * event.rate * event.time) / 100;
      emit(SI);
    });
  }
}
