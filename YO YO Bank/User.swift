
import Foundation

class User{
    
    var SIN:String
    var name:String
    var phoneNumber:Int
    var email:String
    var address:String
    var password:String
    var balance:Double
    
    init(SIN: String, name: String, phoneNumber: Int, email: String, address: String, password: String, balance: Double) {
        self.SIN = SIN
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.address = address
        self.password = password
        self.balance = balance
    }
    
    func getDetails(){
        print("\n----------------\nSIN : \(self.SIN)\nName : \(self.name)\nPhoneNumber : \(self.phoneNumber)\nEmail : \(self.email)\nAddress : \(self.address)\nBalance: \(self.balance)\n---------------")
    }
    
    func userLogin(users:[User],userName:String,password:String) -> Bool{
       
        var userValid=false
        for user in users{
            if(user.SIN == userName && user.password == password)
            {
                userValid=true
                print("\nWelcome \(user.name) : ")
                break
                
            }
        }
        return userValid
    }
}
