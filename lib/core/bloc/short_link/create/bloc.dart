import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/short_link.dart';
import '../../../repository/short_link.dart';
import 'event.dart';
import 'state.dart';

class ShortLinkCreateBloc extends Bloc<ShortLinkCreateEvent, ShortLinkCreateState> {

  ShortLinkCreateBloc() : super(ShortLinkCreateInitialState());

  @override
  Stream<ShortLinkCreateState> mapEventToState(ShortLinkCreateEvent event) async* {
    if (event is ShortLinkCreateRequested) {
      yield* _mapShortLinkCreateRequestedToState(event.link);
    }
  }

  Stream<ShortLinkCreateState> _mapShortLinkCreateRequestedToState(String link) async* {
    yield ShortLinkCreateLoadingState();
    try {
      ShortLink shortLink = await ShortLinkRepository.create(link);
      yield ShortLinkCreateSuccessState(shortLink: shortLink);
    } on PlatformException catch (e) {
      yield ShortLinkCreateErrorState(message: e.message);
    } catch (e) {
      print(e);
      yield ShortLinkCreateErrorState();
    }
  }
}
