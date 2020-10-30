
import Foundation

class User{
    
    var SIN:String
    var name:String
    var phoneNumber:Int
    var email:String
    var address:String
    var password:String
    var balance:Double
    var accountType:String
    
    init(SIN: String, name: String, phoneNumber: Int, email: String, address: String, password: String, balance: Double ,accountType:String) {
        self.SIN = SIN
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.address = address
        self.password = password
        self.balance = balance
        self.accountType=accountType
    }
    
    func getDetails(){
        print("\n----------------\nSIN : \(self.SIN)\nName : \(self.name)\nPhoneNumber : \(self.phoneNumber)\nEmail : \(self.email)\nAddress : \(self.address)\nAccountType : \(self.accountType)\nBalance : \(self.balance)\n---------------")
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
    
    func editUserDetails(users:[User] , username:String)  {
        var edtloop=true
        while edtloop {
        
        print("\nPlease select an option :\n1. Edit Phonenumber\n2. Edit Email\n3. Edit Password\n4. Exit")
        var edtChoice = Int(readLine()!)!
            switch edtChoice {
            case 1:
                for user in users {
                    if(user.SIN==username)
                    {
                        print("Please enter the new Phonenumber")
                        var newPhone=Int(readLine()!)!
                        user.phoneNumber=newPhone
                        print("Phone number updated")
                    }
                }
                break
            case 2:
                for user in users {
                if(user.SIN==username)
                {
                    print("Please enter the new Email")
                    var newEmail=readLine()!
                    user.email=newEmail
                    print("Email updated")
                }
            }
                break
            case 3:
                for user in users {
                    if(user.SIN==username)
                    {
                        print("Please enter the new Password")
                        var newPass=readLine()!
                        user.password=newPass
                        print("Password updated")
                    }
                }
                break
            case 4:
                edtloop=false
                break
                
            default:
                print("Please choose a valid option")
            }
        }
    }
}
