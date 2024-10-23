# Sample Code Overview

This project contains three `UIViewController` examples, each using `UITableView` to demonstrate key features like row selection, cell reuse, animations, and custom cell behavior. These examples provide clear, practical ways to handle common table view tasks in iOS development.

### [Slides🔗](https://www.canva.com/design/DAGUW914yZk/X7DDZDB03EWecw8keKe_OA/edit)

---

## 1. ViewController: Simple checklist

**Main Features**:
- When a user selects a row, a checkmark appears next to it.

**Methods to Handle Row Selection**:
1. **Directly Changing the Checkmark**:  
   - Updates the checkmark in `didSelectRowAt`, but may cause issues when cells are reused.

2. **Using a `Set` to Track Selected Rows**:  
   - Tracks which rows are selected by storing their indexes in a `Set`. This helps maintain the correct state when cells are reused. The table reloads specific rows to ensure proper selection state.

3. **Manual Cell Management**:  
   - Retrieves the cell in `didSelectRowAt` and updates its checkmark while keeping track of selected rows in a `Set`.

**Custom Cell**:
- The project includes a basic custom cell (`ThreeTableViewCell`), which can be further customized as needed.

---

## 2. SecondPageVC: Efficient Cell Reuse and Selection

**Main Features**:
- Selected rows are tracked in a `Set` that stores selected row indexes. The table updates with an animation when a row is selected or deselected.

**Cell Reuse**:
- This controller efficiently reuses cells by using the `prepareForReuse()` method in `SecondTableViewCell` to reset the checkmark or other properties when a cell is reused.
- This prevents incorrect states (like checkmarks remaining visible) when cells are reused for different rows.

This approach ensures smooth row selection and efficient performance, especially with larger datasets.

---

## 3. ThirdPageVC: Animations and Interactive Cells

**Main Features**:
- Depending on the row, each cell displays either an image or some text.

**Cell Animation**:
- When a cell is about to appear, it fades in and slides up slightly for a smooth visual effect (`willDisplay`).

**Cell Reuse**:
- The `CustomTableViewCell` overrides the `prepareForReuse()` method to ensure the cell's content is cleared and reset before being reused.

**Interactive Selection**:
- When a cell is tapped, its background color changes, and its content (like text) updates.
- Cells feature a scaling animation when pressed and held, adding interactive feedback.

**Custom Cell Behavior**:
- `CustomTableViewCell` also demonstrates how to handle lifecycle methods such as `awakeFromNib` (for initial setup) and `layoutSubviews` (for layout adjustments).
