pragma solidity ^0.4.21;

contract Copyright{
     address public owner; // Copyright owner
     
    function Copyright() public {
        owner = msg.sender;
    } 
    struct copyright_info {//作品版权
        string work_hash;
        address owner_address;
        string start_time;
        string end_time;//
    }//有权使用的人
    
     struct work_info {
        string work_name;//作品名称
        string work_hash;//作品Hash
        address author_address;//作者以太坊地址
        string record_time;//登记时间
    }
    
    work_info [] works;
    copyright_info [] copyrights;
    mapping(string => uint32) work_index;
	
    function register(
	    string _work_name,//作品名称
        string _work_hash,//作品Hash
        address _author_address,
        string _record_time//登记时间
    )public{

        require(msg.sender == owner);
		work_info memory NewWork;
        NewWork.work_name = _work_name;
        NewWork.work_hash = _work_hash;
        NewWork.author_address = _author_address;
        NewWork.record_time = _record_time;
		uint32 len = uint32(works.length);
		work_index[_work_hash] = len;
	    works.push(NewWork);
    }
	
	function purchase(
	   address _buyer_addr,
       string _work_hash,
       string _start_time,
       string _end_time
	   )public {
        require(owner == msg.sender);
		copyright_info memory NewCopyright;
		NewCopyright.work_hash = _work_hash;
		NewCopyright.owner_address = _buyer_addr;
		NewCopyright.start_time = _start_time;
		NewCopyright.end_time = _end_time;
		copyrights.push(NewCopyright);
	}
    
}
