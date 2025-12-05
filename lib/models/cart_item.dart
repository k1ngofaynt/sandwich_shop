class CartItem {
  final String id; // Unique identifier for this cart item
  final String sandwichName;
  final double price;
  int quantity;
  
  static const int maxQuantity = 5;
  static const int minQuantity = 1;

  CartItem({
    required this.id,
    required this.sandwichName,
    required this.price,
    this.quantity = 1,
  }) {
    // Validate quantity on creation
    if (quantity < minQuantity) {
      quantity = minQuantity;
    } else if (quantity > maxQuantity) {
      quantity = maxQuantity;
    }
  }

  // Calculate subtotal for this item
  double get subtotal => price * quantity;

  // Check if quantity can be increased
  bool get canIncrease => quantity < maxQuantity;

  // Check if quantity can be decreased (without removing)
  bool get canDecrease => quantity > minQuantity;

  // Create a copy with updated quantity
  CartItem copyWith({
    String? id,
    String? sandwichName,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      sandwichName: sandwichName ?? this.sandwichName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'CartItem{id: $id, sandwich: $sandwichName, price: \$${price.toStringAsFixed(2)}, quantity: $quantity, subtotal: \$${subtotal.toStringAsFixed(2)}}';
  }
}
