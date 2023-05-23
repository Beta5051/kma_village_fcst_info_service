import 'package:xml/xml.dart';
import 'data_category.dart';

class UltraSrtFcstData {
  const UltraSrtFcstData({
    required this.category,
    required this.fcstDateTime,
    required this.fcstValue,
  });

  final UltraSrtFcstDataCategory category;
  final DateTime fcstDateTime;
  final num fcstValue;

  factory UltraSrtFcstData.fromXmlElement(XmlElement element) =>
      UltraSrtFcstData(
        category: element
            .getElement('category')!
            .innerText
            .toUltraShortFcstDataCategory,
        fcstDateTime: DateTime.parse(
            '${element.getElement('fcstDate')!.innerText} ${element.getElement('fcstTime')!.innerText}'),
        fcstValue:
            num.tryParse(element.getElement('fcstValue')!.innerText) ?? 0,
      );

  @override
  String toString() =>
      'UltraSrtFcstData(category: $category, fcstDateTime: $fcstDateTime, fcstValue: $fcstValue)';
}
