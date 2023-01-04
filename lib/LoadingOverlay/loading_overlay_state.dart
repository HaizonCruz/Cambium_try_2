part of 'loading_overlay_bloc.dart';

class LoadingOverlayState {
  bool isActive;
  LoadingOverlayState({required this.isActive});
}

class LoadingOverlayInitial extends LoadingOverlayState {
  LoadingOverlayInitial() : super(isActive: false);
}
