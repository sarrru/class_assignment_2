part of 'simple_interest_bloc.dart';

@immutable
sealed class SimpleInterestEvent {}

// Event to calculate simple interest
class CalculateSimpleInterest extends SimpleInterestEvent {
  final double principal;
  final double rate;
  final double time;

  CalculateSimpleInterest({
    required this.principal,
    required this.rate,
    required this.time,
  });
}
