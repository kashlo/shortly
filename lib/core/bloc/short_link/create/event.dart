abstract class ShortLinkCreateEvent {
  const ShortLinkCreateEvent();
}

class ShortLinkCreateRequested extends ShortLinkCreateEvent {
  final String link;

  @override
  String toString() => 'ShortLinkCreateRequested';

  const ShortLinkCreateRequested({required this.link});
}
