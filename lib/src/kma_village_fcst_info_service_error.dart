import 'package:xml/xml.dart';

class KmaVillageFcstInfoServiceError implements Exception {
  const KmaVillageFcstInfoServiceError({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  static KmaVillageFcstInfoServiceError? getError(XmlDocument document) {
    final headers = document.findAllElements('cmmMsgHeader');

    final isOpenDataPortal = headers.isNotEmpty;

    final header = isOpenDataPortal
        ? headers.first
        : document.findAllElements('header').first;

    final code = int.parse(header
        .getElement(isOpenDataPortal ? 'returnReasonCode' : 'resultCode')!
        .innerText);

    if (code == 0) return null;

    final message = header
        .getElement(isOpenDataPortal ? 'returnAuthMsg' : 'resultMsg')!
        .innerText;

    return KmaVillageFcstInfoServiceError(code: code, message: message);
  }

  @override
  String toString() =>
      'KmaVillageFcstInfoServiceError(code: $code, message: $message)';
}
