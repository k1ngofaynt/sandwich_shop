import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    const repo = PricingRepository();

    test('returns 0 for zero quantity', () {
      expect(repo.calculateTotal(quantity: 0, isFootlong: true), 0);
      expect(repo.calculateTotal(quantity: 0, isFootlong: false), 0);
    });

    test('calculates total for six-inch sandwiches', () {
      // 2 * £7 = £14
      expect(repo.calculateTotal(quantity: 2, isFootlong: false), 14.0);
    });

    test('calculates total for footlong sandwiches', () {
      // 3 * £11 = £33
      expect(repo.calculateTotal(quantity: 3, isFootlong: true), 33.0);
    });
  });
}
