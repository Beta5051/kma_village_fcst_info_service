import 'package:xml/xml.dart';
import 'data_category.dart';

class VillageFcstData {
  const VillageFcstData({
    required this.category,
    required this.fcstDateTime,
    required this.fcstValue,
  });

  final VillageFcstDataCategory category;
  final DateTime fcstDateTime;
  final num fcstValue;

  factory VillageFcstData.fromXmlElement(XmlElement element) => VillageFcstData(
        category:
            element.getElement('category')!.innerText.toVillageFcstDataCategory,
        fcstDateTime: DateTime.parse(
            '${element.getElement('fcstDate')!.innerText} ${element.getElement('fcstTime')!.innerText}'),
        fcstValue:
            num.tryParse(element.getElement('fcstValue')!.innerText) ?? 0,
      );

  @override
  String toString() =>
      'VillageFcstData(category: $category, fcstDateTime: $fcstDateTime, fcstValue: $fcstValue)';
}
