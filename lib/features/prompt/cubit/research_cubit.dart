import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../repos/reserach_repo.dart';

part 'research_state.dart';

class ResearchCubit extends Cubit<ResearchState> {
  // final StockResearchRepository repo;

  ResearchCubit()
      : super(ResearchInitial());

  Future<void> analyze(
      String symbol,
      ) async {
    emit(ResearchLoading());

    try {
      final StockResearchRepository repo = StockResearchRepository();
      final result =
      await repo.research(symbol);

      emit(
        ResearchSuccess(result: result),
      );
    } catch (e) {
      emit(
        ResearchError(
          e.toString(),
        ),
      );
    }
  }
}
