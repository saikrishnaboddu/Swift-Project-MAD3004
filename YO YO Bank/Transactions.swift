
import Foundation

class Transaction{

    var tranxId:String
    var tranxType:String
    var tranxDate:Date
    var tranxAmount:Double
    var userName:String
    
    internal init(tranxId: String, tranxType: String, tranxDate: Date, tranxAmount: Double,userName:String) {
        self.tranxId = tranxId
        self.tranxType = tranxType
        self.tranxDate = tranxDate
        self.tranxAmount = tranxAmount
        self.userName=userName
    }
    
    func getTranxDetails() {
        print("\n---------------\n Transaction ID : \(self.tranxId)\n Transaction Type : \(self.tranxType)\n Transaction Date : \(self.tranxDate)\n Transaction Amount : \(self.tranxAmount)\n------------------ ")
    }
    func depositMoney(users:[User],userName:String) -> Transaction
    {
        for user in users {
            if(user.SIN==userName){
                print("Please enter the amount to deposit :")
                var depositAmt=Double(readLine()!)!
                user.balance += depositAmt
                print("Transaction Successful , Balance : \(user.balance)")
                return Transaction(tranxId: UUID().uuidString, tranxType: "Deposit", tranxDate: Date(), tranxAmount: depositAmt, userName: userName)
                break
            }
        }
        return Transaction(tranxId: "", tranxType: "", tranxDate: Date(), tranxAmount: 0.0, userName: "")
    }
    
    func withdrawMoney(users:[User],userName:String) ->Transaction {
        for user in users {
            if(user.SIN==userName){
                print("Please enter the amount to withdraw :")
                var withdrawAmt=Double(readLine()!)!
                if(withdrawAmt <= user.balance){
                user.balance -= withdrawAmt
                print("Transaction Successful , Balance : \(user.balance)")
                    return Transaction(tranxId: UUID().uuidString, tranxType: "WithDraw", tranxDate: Date(), tranxAmount: withdrawAmt, userName: userName)
                break
                }
                else{
                    print("Insufficient funds")
                }
            }
        }
        return Transaction(tranxId: "", tranxType: "", tranxDate: Date(), tranxAmount: 0.0, userName: "")
    }
    
    func utilityBill(users:[User],userName:String) ->Transaction {
        for user in users {
            if(user.SIN==userName){
                print("Please enter the name of utility")
                var utilName=readLine()!
                print("Please enter the bill amount :")
                var utilAmt=Double(readLine()!)!
                if(utilAmt <= user.balance){
                user.balance -= utilAmt
                print("Transaction Successful , Balance : \(user.balance)")
                    return Transaction(tranxId: UUID().uuidString, tranxType: "Utility/\(utilName)", tranxDate: Date(), tranxAmount: utilAmt, userName: userName)
                break
                }
                else{
                    print("Insufficient funds")
                }
            }
    }
        return Transaction(tranxId: "", tranxType: "", tranxDate: Date(), tranxAmount: 0.0, userName: "")
    }


func transferMoney(users:[User],userName:String) ->[Transaction]{
    print("Please enter the receipient's account number(SIN) : ")
    var receiver=readLine()!
    var receiverFound=false
    for user in users{
        if(user.SIN==receiver){
            receiverFound=true
        }
    }
    if(!receiverFound){
        print("Receiver not found")
    }
    for user in users{
        
        if(user.SIN==userName && receiverFound){
            
            print("Please enter the amount to transfer :")
            var trnsAmt=Double(readLine()!)!
            if(trnsAmt <= user.balance){
            user.balance -= trnsAmt
                for user1 in users{
                    if(user1.SIN==receiver){
                        user1.balance += trnsAmt
                    }
                }
            print("Transaction Successful , Balance : \(user.balance)")
                return [Transaction(tranxId: UUID().uuidString, tranxType: "Transfered to \(receiver)", tranxDate: Date(), tranxAmount: trnsAmt, userName: userName),Transaction(tranxId: UUID().uuidString, tranxType: "Received from \(userName)", tranxDate: Date(), tranxAmount: trnsAmt, userName: receiver)]
            }
            
            else{
                print("Receiver not found")
            }
        }
    }
            

    return [Transaction(tranxId: "", tranxType: "", tranxDate: Date(), tranxAmount: 0.0, userName: "")]
}
    
    
    
func displayTranx(tranx:[Transaction],userName:String)  {
        for trx in tranx {
            if(trx.userName==userName)
            {
                trx.getTranxDetails()
            }
        }
    }
}


