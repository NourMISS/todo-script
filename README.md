# TODO Script

## Description

This project is a simple TODO script written in Linux shell script. It allows users to create, update, delete, show, list, and search tasks.

## Design Choices

- **Data Storage**: Tasks are stored in a plain text file (`todo_tasks.txt`) with each task on a new line. This makes it easy to read and manipulate tasks with basic shell commands.
- **Task Attributes**: Each task has a unique identifier, title, description, location, due date and time, and a completion marker. The unique identifier is generated using `$RANDOM`.
- **Code Organization**: The script is organized into functions for each operation (create, update, delete, etc.) to keep the code modular and readable.

## How to Run

1. Make the script executable:
   ```sh
   chmod +x todo.sh
   ```

2. Run the script with the desired command:
   ```sh
   ./todo.sh [command]
   ```

## Commands

- `create`: Create a new task.
  - Prompts the user to enter the title, description (optional), location (optional), due date, and due time.
  - Generates a unique ID and stores the task in `todo_tasks.txt`.

- `update`: Update an existing task.
  - Prompts the user to enter the task ID to update.
  - Deletes the old task and creates a new one with updated details.

- `delete`: Delete a task.
  - Prompts the user to enter the task ID to delete.
  - Removes the task from `todo_tasks.txt`.

- `show`: Show details of a task.
  - Prompts the user to enter the task ID to show.
  - Displays the task details.

- `list`: List tasks for the current day.
  - Displays tasks due on the current day, separated into completed and uncompleted sections.

- `search`: Search for a task by title.
  - Prompts the user to enter the title to search for.
  - Displays tasks that match the title.

## Example Usage

```sh
./todo.sh create
./todo.sh update
./todo.sh delete
./todo.sh show
./todo.sh list
./todo.sh search
```

## Error Handling

- The script checks for valid inputs where necessary.
- Error messages are redirected to standard error for clarity.
