import UIKit

//Structure to map Users
//i.e attributes associated with Users
struct User: Codable {
    let name: String
    let email: String
    let username: String
    let id: Int
    
    //Address is of type struct Address
    let address: Address
}

//Structure to map Addresses
struct Address: Codable {
    let street: String
    let city: String
}

//Set the URL for the JSON feed
let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

//URLSession is a built in class to GET the data
URLSession.shared.dataTask(with: url) { data, _, _ in
    
    //Unwrap data
    if let data = data {
        
        //Call and decode the Users struct
        let users = try? JSONDecoder().decode([User].self, from: data)
        
        //Print out the entire feed
        print(users)
        
        //Print out he first users name
        print(users![0].name)
        
        //Print out the 6th users email
        print(users![5].email)
        
        //Print out the 8th users id
        print(users![7].id)
        
        //Print the street of the 2nd user
        print(users![1].address.street)
        
    }
    
}.resume()
