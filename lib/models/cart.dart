import 'sandwich.dart';

class Cart {
  final Map<Sandwich, int> _items = {};

  // Matches _addToCart in OrderScreen
  void add(Sandwich sandwich, {int quantity = 1}) {
    if (quantity <= 0) return;
    _items.update(
      sandwich,
      (existing) => existing + quantity,
      ifAbsent: () => quantity,
    );
  }

  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  int get totalItems {
    return _items.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double calculateTotalPrice() {
    double total = 0.0;
    _items.forEach((sandwich, quantity) {
      final pricePerSandwich = sandwich.isFootlong ? 11.0 : 7.0;
      total += pricePerSandwich * quantity;
    });
    return total;
  }
}