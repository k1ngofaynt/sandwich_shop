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
}