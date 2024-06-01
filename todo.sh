#!/bin/bash

# File to store tasks
TODO_FILE="todo_tasks.txt"

# Function to create a new task
create_task() {
    echo "Enter title:"
    read title
    echo "Enter description (optional):"
    read description
    echo "Enter location (optional):"
    read location
    echo "Enter due date (YYYY-MM-DD):"
    read due_date
    echo "Enter due time (HH:MM):"
    read due_time
    echo "Task ID: $RANDOM | Title: $title | Description: $description | Location: $location | Due Date: $due_date $due_time | Completed: no" >> $TODO_FILE
    echo "Task created successfully."
}

# Function to update a task
update_task() {
    echo "Enter task ID to update:"
    read id
    grep -v "Task ID: $id |" $TODO_FILE > temp.txt
    mv temp.txt $TODO_FILE
    create_task
}

# Function to delete a task
delete_task() {
    echo "Enter task ID to delete:"
    read id
    grep -v "Task ID: $id |" $TODO_FILE > temp.txt
    mv temp.txt $TODO_FILE
    echo "Task deleted successfully."
}

# Function to show task details
show_task() {
    echo "Enter task ID to show:"
    read id
    grep "Task ID: $id |" $TODO_FILE
}

# Function to list tasks
list_tasks() {
    echo "Tasks for today:"
    current_date=$(date +%Y-%m-%d)
    grep "$current_date" $TODO_FILE | while read -r line ; do
        if [[ $line == *"Completed: no"* ]]; then
            echo "Uncompleted: $line"
        else
            echo "Completed: $line"
        fi
    done
}

# Function to search task by title
search_task() {
    echo "Enter title to search:"
    read title
    grep "Title: $title" $TODO_FILE
}

# Main script logic
if [ $# -eq 0 ]; then
    list_tasks
else
    case "$1" in
        create)
            create_task
            ;;
        update)
            update_task
            ;;
        delete)
            delete_task
            ;;
        show)
            show_task
            ;;
        list)
            list_tasks
            ;;
        search)
            search_task
            ;;
        *)
            echo "Invalid command. Use create, update, delete, show, list, or search."
            ;;
    esac
fi
