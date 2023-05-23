import 'package:xml/xml.dart';
import 'data_category.dart';

class UltraSrtNcstData {
  const UltraSrtNcstData({
    required this.category,
    required this.obsrValue,
  });

  final UltraSrtNcstDataCategory category;
  final num obsrValue;

  factory UltraSrtNcstData.fromXmlElement(XmlElement element) =>
      UltraSrtNcstData(
        category: element
            .getElement('category')!
            .innerText
            .toUltraShortNcstDataCategory,
        obsrValue: num.parse(element.getElement('obsrValue')!.innerText),
      );

  @override
  String toString() =>
      'UltraSrtNcstData(category: $category, obsrValue: $obsrValue)';
}
