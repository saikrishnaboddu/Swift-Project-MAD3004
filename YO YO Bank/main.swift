
import Foundation

var userArray=[User]()
var userObj=User(SIN: "", name: "", phoneNumber: 0, email: "", address: "", password: "", balance: 0.0)
var tranxArray=[Transaction]()
var tranxObj=Transaction(tranxId: "", tranxType: "", tranxDate: Date(), tranxAmount: 0.0, userName: "")

var loggedInUser=""
userArray.append(User(SIN: "9989", name: "John Wick", phoneNumber: 9999999, email: "John@wick.com", address: "Continental", password: "9989", balance: 100000))
userArray.append(User(SIN: "766920", name: "Walter White", phoneNumber: 88888, email: "Walter@white.com", address: "ABQ", password: "766920", balance: 50000))
userArray.append(User(SIN: "8801", name: "Jesse PinkMan", phoneNumber: 777777, email: "Pinkman@jesse.com", address: "Alaska", password: "8801", balance: 700000))
userArray.append(User(SIN: "89028", name: "Gus Fring", phoneNumber: 66666, email: "Fring@gus.com", address: "Hermanos", password: "89028", balance: 10))

print("-------Welcome to YO YO Bank--------")

func ShowMenu(){
print("\nPlease select an option:\n1. Admin Login\n2. User Login\n3. Exit")
    let choice=Int(readLine()!)!
switch choice {
case 1:
    AdminLogin()
    break
case 2:
    print("\nPlease enter your username(SIN) :")
    let userName=readLine()!
    print("Please enter your password :")
    let userPass=readLine()!
    loggedInUser=userName
    let validUser=userObj.userLogin(users:userArray, userName: userName, password: userPass)
    if(validUser)
    {
        userLoginSuccessful()
    }
    else{
        print("Invalid Creds")
        ShowMenu()
    }
    break
case 3:
    exit(0)
    break
default:
    print("Please select a valid option")
}
}
ShowMenu()
func AdminLogin(){
    var adminBool=true
    print("Please enter UserName : ")
    let adminUserName=readLine()!
    print("Please enter password :")
    let adminPass=readLine()!
    if(adminUserName=="admin" && adminPass=="admin")
    {
        print("\nWelcome Admin")
    while adminBool {
        
    print("\nPlease select an option\n1. Create a user\n2. Delete a user\n3. Show all Users\n4. Logout ")
        let adminChoice=Int(readLine()!)!
    switch adminChoice {
    case 1:
        AdminNewUser()
        break
    case 2:
        AdminDeleteUser()
        break
    case 3:
        for user in userArray{
            user.getDetails()
        }
    case 4:
        adminBool=false
        ShowMenu()
        break
    default:
        print("Please selectr a valid option")
    }
    }
    }
    else
    {
        print("Invalid Creds")
        ShowMenu()
    }
}

func AdminNewUser()
{
    
    print("\nPlease enter the SIN of the User : ")
    let sin=readLine()!
    print("Please enter User's Name :")
    let name=readLine()!
    print("Please enter User's Phone Number :")
    let phNo=Int(readLine()!)!
    print("Please enter User's Email :")
    let email=readLine()!
    print("Please enter User's Address :")
    let addr = readLine()!
    print("Please enter a password for the User")
    let pass=readLine()!
    print("Please enter inital balance for the User")
    let initialBal=Double(readLine()!)!
    
    userArray.append(User(SIN: sin, name: name, phoneNumber: phNo, email: email, address: addr, password: pass, balance: initialBal))
    
    print("\nUser : \(name) successfully added")
}

func AdminDeleteUser(){
    print("\nPlease enter the SIN of the User you wish to delete")
    let sinToDelete=readLine()!
    var userFound=false
    for i in 0..<userArray.count{
        if(userArray[i].SIN==sinToDelete){
            userFound=true
            userArray.remove(at: i)
            print("User successfully Deleted")
            break
        }
    }
    if(!userFound){
        print("User not found")
    }
    
}

func userLoginSuccessful(){
    var userLoop=true
    while userLoop {
    print("\nPlease select an option :\n1. Deposit Money\n2. Withdraw Money\n3. Transfer Money\n4. Pay Utility\n5. Display Balance\n6. Display Transactions\n7. Logout")
        let userChoice=Int(readLine()!)!
    switch userChoice {
    case 1:
        var tranx=tranxObj.depositMoney(users:userArray,userName: loggedInUser)
        if(tranx.userName != ""){
            tranxArray.append(tranx)
        }
        break
    case 2:
        var tranx=tranxObj.withdrawMoney(users:userArray,userName: loggedInUser)
        if(tranx.userName != ""){
            tranxArray.append(tranx)
        }
        break
    case 3:
        var tranx=tranxObj.transferMoney(users: userArray, userName: loggedInUser)
        if(tranx[0].userName != ""){
            tranxArray.append(tranx.first!)
            tranxArray.append(tranx.last!)
        }
        break
    case 4:
        var tranx=tranxObj.utilityBill(users: userArray, userName: loggedInUser)
        if(tranx.userName != ""){
            tranxArray.append(tranx)
        }
        break
    case 5:
        for user in userArray {
            if(user.SIN==loggedInUser){
                print("Account Balance : \(user.balance)")
            }
        }
        break
    case 6:
        tranxObj.displayTranx(tranx: tranxArray, userName: loggedInUser)
    case 7:
        userLoop=false
        ShowMenu()
        break
    default:
        print("Please elect a valid option")
    }
    }
}
