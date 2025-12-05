# Cart Item Modification Feature Requirements

## 1. Feature Overview

### Purpose
Enable users to manage items in their shopping cart by modifying quantities, removing individual items, or clearing the entire cart. This feature improves user experience by giving customers full control over their order before checkout.

### Scope
This feature applies to the Cart Screen of the sandwich shop app and includes three main capabilities:
- Adjusting item quantities (increase/decrease)
- Removing individual items
- Clearing all cart items at once

---

## 2. User Stories

### US-1: Adjust Item Quantity
**As a** customer  
**I want to** increase or decrease the quantity of items in my cart  
**So that** I can order the exact number of sandwiches I need without going back to the order screen

### US-2: Remove Single Item
**As a** customer  
**I want to** remove a specific item from my cart  
**So that** I can take out items I no longer want without affecting other items

### US-3: Clear Entire Cart
**As a** customer  
**I want to** clear all items from my cart at once  
**So that** I can quickly start over if I change my mind about my entire order

### US-4: View Updated Total
**As a** customer  
**I want to** see the total price update immediately after modifying my cart  
**So that** I know exactly how much I will pay

### US-5: Prevent Invalid Quantities
**As a** customer  
**I want to** be prevented from exceeding quantity limits  
**So that** I don't accidentally order more than allowed

---

## 3. Acceptance Criteria

### AC-1: Increase Item Quantity
- **Given** an item is in the cart with quantity less than maximum (5)
- **When** the user taps the "+" button
- **Then** the quantity increases by 1
- **And** the item's subtotal updates correctly
- **And** the cart total price updates immediately
- **And** the button is disabled when maximum quantity (5) is reached

### AC-2: Decrease Item Quantity
- **Given** an item is in the cart with quantity greater than 1
- **When** the user taps the "-" button
- **Then** the quantity decreases by 1
- **And** the item's subtotal updates correctly
- **And** the cart total price updates immediately

### AC-3: Remove Item via Quantity Zero
- **Given** an item is in the cart with quantity of 1
- **When** the user taps the "-" button
- **Then** the item is completely removed from the cart
- **And** the cart total price updates immediately
- **And** if cart is empty, an empty state message is displayed

### AC-4: Remove Item Directly
- **Given** an item is in the cart (any quantity)
- **When** the user taps the "Remove" or delete icon
- **Then** a confirmation dialog appears (optional)
- **And** if confirmed (or no dialog), the item is removed immediately
- **And** the cart total price updates immediately
- **And** if cart is empty, an empty state message is displayed

### AC-5: Clear Entire Cart
- **Given** the cart contains one or more items
- **When** the user taps the "Clear Cart" button
- **Then** a confirmation dialog appears with message "Are you sure you want to clear your cart?"
- **And** dialog has "Cancel" and "Clear" options
- **When** user selects "Clear"
- **Then** all items are removed from cart
- **And** total price resets to $0.00
- **And** empty cart state is displayed

### AC-6: Empty Cart State
- **Given** the cart has no items
- **Then** a message is displayed (e.g., "Your cart is empty")
- **And** the total price shows $0.00
- **And** quantity adjustment buttons are not visible
- **And** "Clear Cart" button is either hidden or disabled

### AC-7: Price Calculation Accuracy
- **Given** any cart modification action
- **When** the cart state changes
- **Then** the total price reflects the sum of all item subtotals
- **And** each item subtotal equals (item price × quantity)
- **And** prices are formatted correctly with currency symbol and two decimal places

### AC-8: UI Responsiveness
- **Given** any cart modification action
- **When** the action is performed
- **Then** the UI updates immediately without lag
- **And** animations are smooth (if implemented)
- **And** no duplicate items appear due to state issues

### AC-9: Quantity Limits
- **Given** an item in the cart
- **Then** the quantity cannot exceed 5 (maxQuantity)
- **And** the quantity cannot be less than 0
- **And** the "+" button is disabled at maximum quantity
- **And** the "-" button is enabled when quantity > 1

### AC-10: Persistence (if applicable)
- **Given** the user modifies their cart
- **When** the user navigates away and returns to cart screen
- **Then** the cart retains all modifications
- **And** the total price remains accurate

---

## 4. Technical Requirements

### TR-1: State Management
- Cart state must be managed using StatefulWidget, Provider, Riverpod, Bloc, or similar
- State updates must trigger UI rebuilds automatically

### TR-2: Data Model
- Each cart item should contain: sandwich details, quantity, individual price
- Cart should calculate and store total price

### TR-3: UI Components
- Quantity controls: "+" and "-" buttons (IconButton or similar)
- Remove button: delete/close icon (IconButton)
- Clear cart button: TextButton or ElevatedButton in AppBar or bottom of screen
- Confirmation dialogs: AlertDialog widget

### TR-4: Validation
- Enforce maximum quantity constraint (5)
- Prevent negative quantities
- Handle edge cases (empty cart, single item, etc.)

---

## 5. Out of Scope

The following are explicitly NOT included in this feature:
- Checkout/payment functionality
- Order history
- Item customization (toppings, size variations)
- Save cart for later
- Multi-device cart synchronization
- Undo/redo functionality

---

## 6. Success Metrics

- Users can successfully modify cart items without errors
- Cart total always reflects accurate calculations
- Zero crash reports related to cart modifications
- Positive user feedback on cart management ease of use