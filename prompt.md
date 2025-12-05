# Feature Request: Cart Item Modification

## Context
I have a Flutter sandwich shop app with two screens:
1. **Order Screen**: Users select sandwiches and add them to cart
2. **Cart Screen**: Users view cart items and total price

## Required Features

### 1. Change Item Quantity
**Description**: Allow users to increase or decrease the quantity of items already in their cart.

**User Actions & Expected Behavior**:
- User taps a "+" button next to an item → quantity increases by 1
- User taps a "-" button next to an item → quantity decreases by 1
- If quantity reaches 0 via the "-" button → item should be removed from cart
- The total price should update automatically when quantity changes
- There should be a maximum quantity limit per item (respect the maxQuantity constraint from OrderScreen)

### 2. Remove Item from Cart
**Description**: Allow users to completely remove an item from their cart regardless of quantity.

**User Actions & Expected Behavior**:
- User taps a "Remove" or delete icon button next to an item → item is immediately removed from cart
- Show a confirmation dialog before removing (optional but recommended)
- The total price should update automatically when item is removed
- If cart becomes empty → display an appropriate empty state message

### 3. Clear Entire Cart
**Description**: Allow users to remove all items from their cart at once.

**User Actions & Expected Behavior**:
- User taps a "Clear Cart" button (in app bar or at bottom of cart) → all items are removed
- Show a confirmation dialog: "Are you sure you want to clear your cart?"
- If confirmed → cart is emptied and total price resets to $0
- Display empty cart state after clearing

## Technical Requirements
- Use StatefulWidget or state management solution for cart state
- Ensure UI updates reactively when cart changes
- Follow Flutter/Material Design best practices
- Add appropriate animations for better UX (optional)

## Current Constraints
- Maximum quantity per item is 5 (as defined in `maxQuantity: 5` in main.dart)

Please implement these features with clean, maintainable code.