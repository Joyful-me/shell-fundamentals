#!/bin/bash

TODO_FILE=~/todo.txt
touch "$TODO_FILE"

while true; do
    echo ""
    echo "====== TO-DO LIST ======"
    echo "1. View all tasks"
    echo "2. Add a new task"
    echo "3. Delete a task"
    echo "4. Exit"
    echo "========================"
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1)
            nl "$TODO_FILE"
            ;;
        2)
            read -p "Enter a new task: " task
            echo "$task" >> "$TODO_FILE"
            echo "Task added!"
            ;;
        3)
            nl "$TODO_FILE"
            read -p "Which task number to delete? " num
            sed -i "${num}d" "$TODO_FILE"
            echo "Task deleted!"
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Wrong choice. Try again."
            ;;
    esac
done
