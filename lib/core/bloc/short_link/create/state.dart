import '../../../model/short_link.dart';

abstract class ShortLinkCreateState {}

class ShortLinkCreateInitialState extends ShortLinkCreateState {
  @override
  String toString() => 'ShortLinkCreateInitialState';
}

class ShortLinkCreateLoadingState extends ShortLinkCreateState {
  @override
  String toString() => 'ShortLinkCreateLoadingState';
}

class ShortLinkCreateSuccessState extends ShortLinkCreateState {
  final ShortLink shortLink;

  ShortLinkCreateSuccessState({required this.shortLink});

  @override
  String toString() => 'ShortLinkCreateSuccessState';
}

class ShortLinkCreateErrorState extends ShortLinkCreateState {
  final String? message;

  ShortLinkCreateErrorState({this.message});

  @override
  String toString() => 'ShortLinkCreateErrorState';
}
