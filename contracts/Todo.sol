// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Todo {
    struct TodoItem {
        string title;
        string description;
        bool isDone;
    }

    TodoItem[] todos;

    event TodoCreated();
    event TodoUpdated(uint256 indexed index);

    function createTodo(string memory _title, string memory _description) external {
        // todos.push(TodoItem(_title, _description, false));

        // todos.push(TodoItem ({
        //     title: _title,
        //     description: _description,
        //     isDone: false
        // }));

        TodoItem memory td;
        td.title = _title;
        td.description = _description;
        

        todos.push(td);

        emit TodoCreated();
    }

    function getTodos() external view returns (TodoItem[] memory todos_) {
        todos_ = todos;
    }


    function getTodo(uint256 _index) external view returns(TodoItem memory) {

        require(_index <= todos.length - 1, "index out of bound");

        return todos[_index];
    }

    function updateStatus(uint256 _index) external {
        require(_index <= todos.length - 1, "index out of bound");

        TodoItem storage td = todos[_index];

        td.isDone = !td.isDone;

        emit TodoUpdated(_index);
    }
}