// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract StudentRecords{
    address owner;
    struct StudentRecord{
        string name;
        string email;
        string dob;
        string state;
        string country;
        string lga;
    }

    modifier IsOwner{
        owner = msg.sender;
        _;
    }

    mapping(string => StudentRecord) Student;

    StudentRecord[] studentrecords;

    function createStudent(string memory _name, string memory _email, string memory _dob, string memory _country, string memory _lga, string memory _state)  external {
        StudentRecord memory student;
        student.name =_name;
        student.email =_email;
        student.dob =_dob;
        student.lga =_lga;
        student.country = _country;
        student.state =_state;

        studentrecords.push(student);
    }

    

}