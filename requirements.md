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

---

# User Profile Screen Feature Requirements

## 1. Feature Overview

### Purpose
Provide users with a dedicated profile screen where they can view and edit their personal information. This screen will serve as the foundation for future user authentication and personalization features.

### Scope
This feature adds a new Profile Screen to the sandwich shop app with the following capabilities:
- Display user profile information (name, email, phone)
- Allow users to edit their profile details
- Provide a clean, user-friendly interface
- Link to the profile screen from the order screen
- Note: No actual authentication or data persistence is required at this stage

---

## 2. User Stories

### US-1: View Profile
**As a** customer  
**I want to** view my profile information  
**So that** I can see my saved details at any time

### US-2: Edit Profile
**As a** customer  
**I want to** edit my profile information  
**So that** I can keep my details up to date

### US-3: Access Profile
**As a** customer  
**I want to** navigate to my profile from the order screen  
**So that** I can easily access my account details while ordering

### US-4: Save Changes
**As a** customer  
**I want to** save my profile changes  
**So that** my updated information is reflected in the app

---

## 3. Acceptance Criteria

### AC-1: Display Profile Information
- **Given** the user opens the profile screen
- **Then** the screen displays fields for: Full Name, Email, Phone Number
- **And** each field shows placeholder or default values
- **And** the screen has a clear title "My Profile" or similar

### AC-2: Edit Profile Fields
- **Given** the user is on the profile screen
- **When** the user taps on any field
- **Then** the field becomes editable with a cursor
- **And** the user can enter/modify text
- **And** appropriate keyboard types are shown (email keyboard for email, numeric for phone)

### AC-3: Save Profile Changes
- **Given** the user has edited profile fields
- **When** the user taps a "Save" button
- **Then** a success message is displayed (e.g., SnackBar)
- **And** the updated information is shown in the fields
- **And** the form is no longer in edit mode

### AC-4: Cancel Editing
- **Given** the user has started editing
- **When** the user taps "Cancel" or back button
- **Then** changes are discarded
- **And** original values are restored

### AC-5: Navigation from Order Screen
- **Given** the user is on the order screen
- **When** the user taps the "Profile" link/button at the bottom
- **Then** the app navigates to the profile screen
- **And** the back button returns to the order screen

### AC-6: Form Validation
- **Given** the user enters information
- **Then** email field should validate for basic email format
- **And** phone field should accept only numbers
- **And** name field should not be empty
- **And** validation errors are displayed clearly

### AC-7: UI Layout
- **Given** the profile screen is displayed
- **Then** it includes the app logo in the AppBar
- **And** fields are properly aligned and spaced
- **And** buttons are clearly visible and accessible
- **And** the design is consistent with other screens

---

## 4. Technical Requirements

### TR-1: State Management
- Use StatefulWidget to manage form state
- Track editing mode (view vs edit)
- Handle text field controllers properly

### TR-2: UI Components
- AppBar with logo and title
- TextFormField for each profile field
- Save button (ElevatedButton or StyledButton)
- Cancel button (optional)
- SnackBar for feedback messages

### TR-3: Navigation
- Add profile screen route/navigation
- Add navigation link in OrderScreen footer
- Ensure proper back navigation

### TR-4: Data Model (Optional)
- Create a User model class with name, email, phone fields
- Initialize with default/placeholder data

### TR-5: Validation
- Email validation (basic regex)
- Phone number validation (numeric only)
- Name validation (not empty)
- Display validation errors inline or via SnackBar

---

## 5. Widget Tests Requirements

### Test Cases to Implement:
1. Profile screen renders correctly with all fields
2. Logo appears in AppBar
3. All text fields are present and editable
4. Save button is present and functional
5. Navigation to profile screen works
6. Form validation works for email format
7. Form validation works for empty name
8. SnackBar appears on successful save
9. Edit mode can be toggled
10. Cancel functionality restores original values

---

## 6. Out of Scope

The following are explicitly NOT included in this feature:
- Actual user authentication (login/signup)
- Backend integration
- Data persistence (local storage or database)
- Password fields
- Profile picture upload
- Email verification
- Password reset functionality
- Multi-user support
- Session management

---

## 7. Success Metrics

- Users can successfully navigate to profile screen
- Profile information can be edited and saved
- Form validation prevents invalid data entry
- All widget tests pass
- No runtime errors when using profile screen
- Consistent UI/UX with rest of the app

---

# Navigation Drawer Feature Requirements

## 1. Feature Overview

### Purpose
Provide a consistent, accessible navigation system across all screens using a Drawer widget that slides in from the left edge. This improves app navigation by centralizing all major routes in one easily accessible menu, replacing scattered navigation buttons.

### Scope
This feature adds a navigation drawer to all screens in the sandwich shop app with:
- Drawer widget accessible from AppBar hamburger icon
- Navigation links to Order, Cart, Profile, and About screens
- Responsive design that adapts to screen width
- Reusable drawer component to reduce code duplication
- Consistent styling and user experience across all screens

---

## 2. User Stories

### US-1: Access Navigation Menu
**As a** customer  
**I want to** open a navigation drawer from any screen  
**So that** I can quickly navigate to different parts of the app

### US-2: Navigate Between Screens
**As a** customer  
**I want to** tap on menu items in the drawer  
**So that** I can go to Order, Cart, Profile, or About screens

### US-3: Visual Feedback for Current Screen
**As a** customer  
**I want to** see which screen I'm currently on in the drawer  
**So that** I know where I am in the app

### US-4: Close Drawer Easily
**As a** customer  
**I want to** close the drawer by tapping outside it or using the back button  
**So that** I can return to my current screen quickly

### US-5: Responsive Navigation
**As a** customer on different devices  
**I want to** see navigation that adapts to my screen size  
**So that** the app works well on both phones and tablets

---

## 3. Acceptance Criteria

### AC-1: Drawer Accessibility
- **Given** the user is on any screen (Order, Cart, Profile, Checkout, About)
- **When** the user taps the hamburger icon in the AppBar
- **Then** the navigation drawer slides in from the left
- **And** the drawer displays all navigation options

### AC-2: Navigation Items
- **Given** the drawer is open
- **Then** it displays the following items:
  - App logo/header at the top
  - "Order" navigation item with sandwich icon
  - "Cart" navigation item with cart icon (shows item count badge)
  - "My Profile" navigation item with person icon
  - "About" navigation item with info icon
- **And** each item has clear, readable text and appropriate icons

### AC-3: Navigation Functionality
- **Given** the drawer is open
- **When** the user taps any navigation item
- **Then** the app navigates to the corresponding screen
- **And** the drawer automatically closes
- **And** if already on that screen, drawer just closes without re-navigation

### AC-4: Current Screen Indication
- **Given** the drawer is open
- **Then** the navigation item for the current screen is highlighted
- **And** uses a different background color or text style
- **So that** the user knows their current location

### AC-5: Drawer Closure
- **Given** the drawer is open
- **When** the user taps outside the drawer area
- **Then** the drawer closes smoothly
- **When** the user presses the device back button
- **Then** the drawer closes (doesn't navigate back)

### AC-6: Cart Badge
- **Given** the drawer is open and cart has items
- **Then** a badge showing the item count appears on the Cart menu item
- **And** the badge updates when cart contents change

### AC-7: Responsive Design
- **Given** the app is viewed on a large screen (tablet, width > 600px)
- **Then** the drawer may display permanently or adapt its behavior
- **And** navigation options remain accessible and well-formatted
- **Given** the app is viewed on a small screen (phone, width ≤ 600px)
- **Then** the drawer is hidden by default and accessible via hamburger icon

### AC-8: Code Reusability
- **Given** multiple screens need the drawer
- **Then** the drawer implementation is in a single reusable widget
- **And** each screen imports and uses this shared drawer component
- **And** no drawer code is duplicated across screens

### AC-9: Consistent Styling
- **Given** the drawer is displayed
- **Then** it uses the app's consistent color scheme and typography
- **And** matches the overall app design (logo, fonts, colors)
- **And** has smooth animations for opening/closing

---

## 4. Technical Requirements

### TR-1: Drawer Widget Implementation
- Create a reusable `AppDrawer` widget in `lib/widgets/app_drawer.dart`
- Use Flutter's `Drawer` widget
- Integrate with `Scaffold` in all screens
- Use `DrawerHeader` for logo/branding

### TR-2: Navigation
- Use `Navigator.pushReplacement()` to avoid stacking screens
- Handle current route detection to highlight active screen
- Properly manage navigation stack

### TR-3: Responsive Design
- Use `MediaQuery` to detect screen width
- Implement breakpoint at 600px
- Consider `NavigationRail` or persistent drawer for large screens
- Maintain drawer behavior for small screens

### TR-4: State Management
- Pass Cart object to drawer for displaying item count badge
- Update badge when cart changes
- Handle navigation with proper context

### TR-5: UI Components
- `Drawer` widget as container
- `DrawerHeader` with logo and app name
- `ListTile` for each navigation item
- Icons: `Icons.restaurant_menu`, `Icons.shopping_cart`, `Icons.person`, `Icons.info`
- Badge widget for cart count (using `Badge` or custom implementation)

### TR-6: Code Organization
- Extract drawer to `lib/widgets/app_drawer.dart`
- Update all screens to import and use `AppDrawer`
- Remove redundant navigation buttons from screens
- Keep code DRY (Don't Repeat Yourself)

---

## 5. Widget Tests Requirements

### Test Cases to Implement:
1. Drawer opens when hamburger icon is tapped
2. Drawer contains all required navigation items
3. Drawer displays app logo in header
4. Each navigation item has correct icon and label
5. Tapping navigation item navigates to correct screen
6. Drawer closes after navigation
7. Current screen is highlighted in drawer
8. Cart badge displays correct item count
9. Cart badge updates when cart changes
10. Cart badge is hidden when cart is empty
11. Drawer can be closed by tapping outside
12. All screens have drawer accessible
13. Responsive behavior works for different screen sizes

---

## 6. Implementation Notes

### Drawer Widget Explanation
A `Drawer` is a panel that slides in from the edge of a `Scaffold` to show navigation options. It integrates with the `AppBar` through:

1. **Automatic Integration**: When a `Drawer` is added to a `Scaffold`, Flutter automatically adds a hamburger menu icon to the `AppBar`
2. **Gesture Support**: Users can swipe from the left edge to open the drawer
3. **Navigation Pattern**: Common pattern for apps with multiple screens

### Example Structure:
```dart
Scaffold(
  appBar: AppBar(title: Text('Title')),
  drawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(child: ...),
        ListTile(onTap: () => Navigator.push(...)),
        // More items
      ],
    ),
  ),
  body: ...,
)
```

### Reducing Redundancy
- Create single `AppDrawer` widget
- Import in each screen
- Pass necessary parameters (current route, cart)
- Maintains consistency and reduces maintenance

### Responsive Design Approach
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      // Use NavigationRail or permanent drawer
    } else {
      // Use standard drawer
    }
  },
)
```

---

## 7. Out of Scope

The following are explicitly NOT included in this feature:
- Bottom navigation bar
- Tab-based navigation
- Gesture-based navigation (swipe to go back)
- Animation customization beyond defaults
- Drawer customization settings
- Multi-level drawer menus
- Drawer state persistence across app restarts

---

## 8. Success Metrics

- Drawer is accessible from all screens
- All navigation works correctly without errors
- Code duplication is eliminated with reusable drawer
- Cart badge accurately reflects cart state
- Responsive design adapts to screen sizes appropriately
- All widget tests pass (13+ new tests)
- Navigation is intuitive and consistent
- No navigation stack issues or memory leaks