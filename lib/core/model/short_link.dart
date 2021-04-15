class ShortLink {
   final String code;
   final String link;
   final String shortLink;

  ShortLink({
    required this.code,
    required this.link,
    required this.shortLink
  });

  factory ShortLink.fromJson(Map<String, dynamic> json) {
    return ShortLink(
      code: json['code'],
      link: json['original_link'],
      shortLink: json['short_link']
    );
  }

  static String errorCodeToMessage(int code) {
    switch (code) {
      case 2:
        return 'Invalid URL';
      case 3:
        return 'Rate limit reached. Wait a second and try again';
      case 4:
        return 'IP-Address has been blocked';
      case 10:
        return 'Trying to shorten a disallowed Link';
      default:
        return 'Something went wrong';
    }
  }
}