import 'package:meta/meta.dart';

@immutable
abstract class AreaOfCircleEvent {}

class CalculateAreaEvent extends AreaOfCircleEvent {
  final double radius;

  CalculateAreaEvent(this.radius);
}
