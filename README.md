This project contains three UIViewController examples, each using UITableView to demonstrate key features like row selection, cell reuse, animations, and custom cell behavior. These examples provide clear, practical ways to handle common table view tasks in iOS development.

Slides: https://www.canva.com/design/DAGUW914yZk/X7DDZDB03EWecw8keKe_OA/edit

1. ViewController: Managing Row Selection with Checkmarks
Main Features:
This controller displays a table with 50 rows.
When a user selects a row, a checkmark appears next to it.
It demonstrates three methods to handle row selection:
Directly Changing the Checkmark: Updates the checkmark in didSelectRowAt, but can lead to issues when cells are reused.
Using a Set to Track Selected Rows: Keeps track of which rows are selected by storing their indexes in a Set. This helps maintain the correct state even when cells are reused. The table automatically reloads specific rows to reflect the correct selection state.
Manual Cell Management: Retrieves the cell in didSelectRowAt and updates its checkmark while keeping track of the selected rows in a Set.
Custom Cell: The project includes a basic custom cell (ThreeTableViewCell), which can be customized to fit your needs.

2. SecondPageVC: Efficient Cell Reuse and Selection
Main Features:
Displays a table with 50 rows, allowing users to select rows just like the first view controller.
Selected rows are tracked using a Set to store selected row indexes. When a row is selected or deselected, the table updates with an animation.
Cell Reuse:
This controller focuses on reusing cells efficiently. It uses the prepareForReuse() method in SecondTableViewCell to reset the checkmark or other cell properties when a cell is reused.
This prevents cells from keeping the wrong state (like showing a checkmark) when they are reused for different rows.
This method ensures smooth selection behavior and efficient performance, especially with larger data sets.

3. ThirdPageVC: Animations and Interactive Cells
Main Features:
Displays a table with 50 rows. Depending on the row, each cell displays either an image or some text.
Cell Animation: When a cell is about to appear on screen, it fades in and slides up slightly to create a nice visual effect (willDisplay).
Cell Reuse:
The CustomTableViewCell has its prepareForReuse() method overridden to ensure the cell’s content is cleared and reset before being reused.
Interactive Selection:
When a cell is tapped, its background color changes to indicate it’s selected, and its content (like text) updates.
Cells also have a cool scaling animation when pressed and held, making the app feel more interactive and responsive.
Custom Cell Behavior: The CustomTableViewCell also demonstrates how to handle common lifecycle methods like awakeFromNib (when the cell is first loaded) and layoutSubviews (when the cell’s layout changes).
