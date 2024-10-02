import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const StudentRecordsModule = buildModule("StudentRecordsModule", (m) => {
    
    const record = m.contract("StudentRecords", [], {
    });
  
    return { record };
  });
  
  export default StudentRecordsModule;
  