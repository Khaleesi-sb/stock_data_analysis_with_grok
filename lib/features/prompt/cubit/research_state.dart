part of 'research_cubit.dart';

@immutable
sealed class ResearchState {}

final class ResearchInitial extends ResearchState {}

final class ResearchLoading extends ResearchState {}

final class ResearchSuccess extends ResearchState {
  final String result;
  ResearchSuccess({required this.result});
}

final class ResearchError extends ResearchState {
  final String error;
  ResearchError(this.error);
}
