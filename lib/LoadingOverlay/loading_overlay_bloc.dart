import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loading_overlay_event.dart';
part 'loading_overlay_state.dart';

class LoadingOverlayBloc extends Bloc<LoadingOverlayEvent, LoadingOverlayState> {
  LoadingOverlayBloc() : super(LoadingOverlayInitial()) {
    on<RemoveOverlay>((event, emit) {
      emit(LoadingOverlayState(isActive: !(state.isActive)));
    });
  }
}
