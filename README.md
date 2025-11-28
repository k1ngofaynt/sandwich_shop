**Sandwich Shop**

- **Description:** A small Flutter app that demonstrates an order counter and a minimal sandwich-ordering UI. Users can pick sandwich size (six-inch or footlong), select a bread type, add a short order note, and increase/decrease the order quantity with a configurable maximum.

**Key Features**
- Order counter with `+` / `-` controls and built-in max quantity enforcement.
- Sandwich size segmented control (six-inch / footlong).
- Bread type dropdown selection.
- Order note text field.
- Reusable `StyledButton` widget used for consistent button styling.

**Project Layout (high level)**
- `lib/main.dart` — Application entry point and primary UI (includes `OrderScreen`, `OrderItemDisplay`, and `StyledButton`).
- `lib/repositories/` — Application logic for quantity management (`order_repository.dart`).
- `test/` — Unit and widget tests (if present).
- Platform folders: `android/`, `ios/`, `macos/`, `linux/`, `web/`, `windows/`.

**Prerequisites**
- Flutter SDK (stable). Install instructions: https://docs.flutter.dev/get-started/install
- An emulator or a connected device. For iOS simulators you need Xcode (macOS only).

1) Verify Flutter is installed:
```bash
flutter --version
```

2) Clone the repository:

```bash
git clone https://github.com/k1ngofaynt/sandwich_shop.git
cd sandwich_shop
```

3) Get dependencies:

```bash
flutter pub get
```

4) Run the app:

```bash
flutter run
```

Or run on a specific device:

```bash
flutter devices
flutter run -d <device-id>
```

**Usage**
- Launch the app to open the `OrderScreen`.
- Use the segmented control to switch between `Six-inch` and `Footlong`.
- Use the `+` button to increase the order quantity (the button becomes disabled when the configured `maxQuantity` is reached).
- Use the `-` button to decrease quantity (disabled at zero).
- Pick bread from the dropdown.
- Add optional notes in the text field (e.g., "no onions").

**Configuration**
- The `OrderScreen` constructor accepts `maxQuantity` (e.g., `OrderScreen(maxQuantity: 5)`) to limit maximum orders.

**Testing**
- Run all tests with:

```bash
flutter test
```

- Run the analyzer:

```bash
flutter analyze
```

If a test fails, the test output will indicate which test and why. Fix the assertion or test setup as needed.

**Troubleshooting & Notes**
- If a button appears visually disabled, that means its `onPressed` is `null` by design when an action would be invalid (e.g., increment at max quantity).
- If UI changes do not appear, try a hot restart or stop and re-run the app.
- Consider splitting `lib/main.dart` into multiple files (widgets, screens, repositories) for better maintainability if the file grows.

**Suggested improvements**
- Add widget tests for the Add/Remove button behavior and for the `OrderScreen` flows.
- Persist recent orders or notes locally (e.g., using `shared_preferences`).
- Extract `StyledButton`, `OrderItemDisplay`, and other widgets into separate files under `lib/widgets/`.

**Screenshots**
Add images to `docs/screenshots/` and reference them here. Example markdown to add an image:

```markdown
![Order screen](docs/screenshots/order_screen.png)
```

**Contributing**
- If you plan to open-source this project, add a `LICENSE` and `CONTRIBUTING.md`.

If you'd like, I can also:
- Add a basic widget test that asserts the `+` button increments the value and becomes disabled at `maxQuantity`.
- Extract UI widgets into `lib/widgets/` and update imports.

---

_Created/updated by project maintainer tools._
