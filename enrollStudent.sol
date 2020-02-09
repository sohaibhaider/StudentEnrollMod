pragma solidity ^0.5.0;

contract StudentEnrolment{
    
    address  payable private myAddress;
    
    
    enum Gender{Male, Female}
    enum Class{Onsite, Online}
    
    
    struct Student{
        string name;
        uint age;
        address addr;
        bool digree;
        Gender gender;
        Class class;
        uint rollNumber;
    }
    
    mapping(uint => Student)studentData;
    
    function setMyAddress(address payable _myAddress)public{
        myAddress = _myAddress;
    }
    
    function enrollStudent(string memory _name, uint _age, address _address, bool _haveDegree, Gender _gender, Class _class, uint _rollNumber)public payable{
        
        require(msg.value >= 2 ether);
       
        Student memory myStudent = Student(_name, _age, _address, _haveDegree, _gender, _class, _rollNumber);
        
        myAddress.transfer(msg.value);
        
        studentData[_rollNumber] = myStudent;
    }
    
    function getStudentData(uint _rollNumber)public view returns(string memory, uint, address, bool, Gender, Class, uint){
        return(
            studentData[_rollNumber].name,
            studentData[_rollNumber].age,
            studentData[_rollNumber].addr,
            studentData[_rollNumber].digree,
            studentData[_rollNumber].gender,
            studentData[_rollNumber].class,
            studentData[_rollNumber].rollNumber
            );
    }
    
    function balance()public view returns(uint){
        return myAddress.balance;
    }

    function hasDegree(uint _rollNumber)public view returns(bool){
        return studentData[_rollNumber].digree;
    }
    
    function transStruct(uint _rollNumber, uint _rollNumber2)public returns(bool){
        studentData[_rollNumber2] = studentData[_rollNumber];
        return true;
    }
    
}
