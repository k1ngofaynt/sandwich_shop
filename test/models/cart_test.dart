import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart model tests', () {
    test('Empty cart has 0 total items', () {
      final cart = Cart();
      expect(cart.totalItems, equals(0));
    });

    test('Empty cart has \$0.00 total price', () {
      final cart = Cart();
      expect(cart.calculateTotalPrice(), equals(0.0));
    });

    test('Cart correctly counts total items after adding sandwiches', () {
      final cart = Cart();
      final sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      
      cart.add(sandwich1, quantity: 3);
      expect(cart.totalItems, equals(3));
      
      final sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      
      cart.add(sandwich2, quantity: 2);
      expect(cart.totalItems, equals(5));
    });

    test('Cart calculates correct price for footlong sandwiches', () {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.white,
      );
      
      cart.add(sandwich, quantity: 2);
      expect(cart.calculateTotalPrice(), equals(22.0)); // 2 * $11
    });

    test('Cart calculates correct price for six-inch sandwiches', () {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      
      cart.add(sandwich, quantity: 3);
      expect(cart.calculateTotalPrice(), equals(21.0)); // 3 * $7
    });

    test('Cart calculates correct price for mixed sandwich sizes', () {
      final cart = Cart();
      
      final footlong = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(footlong, quantity: 1);
      
      final sixInch = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      cart.add(sixInch, quantity: 2);
      
      expect(cart.totalItems, equals(3));
      expect(cart.calculateTotalPrice(), equals(25.0)); // $11 + (2 * $7)
    });

    test('Cart accumulates quantities when adding same sandwich', () {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      
      cart.add(sandwich, quantity: 2);
      cart.add(sandwich, quantity: 3);
      
      expect(cart.totalItems, equals(5));
      expect(cart.calculateTotalPrice(), equals(55.0)); // 5 * $11
    });
  });
}
