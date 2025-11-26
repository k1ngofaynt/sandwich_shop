class PricingRepository {
  static const double sixInchPrice = 7.0;
  static const double footlongPrice = 11.0;

  const PricingRepository();

  double calculateTotal({
    required int quantity,
    required bool isFootlong,
  }) {
    if (quantity <= 0) return 0;
    final pricePerSandwich = isFootlong ? footlongPrice : sixInchPrice;
    return quantity * pricePerSandwich;
  }
}
