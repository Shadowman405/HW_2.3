struct UserAccount {
    let accountName: String
    let userPassword: String
    let person: Person
    
    static func getUserData() -> UserAccount {
        UserAccount (accountName: "User", userPassword: "123456", person: Person.getPersonData())
    }
}

struct Person {
    let userName: String
    let userLastName: String
    let info: String
    let photo: String
    
    static func getPersonData() -> Person {
        Person(userName: "Van", userLastName: "Darkholm", info: "I'm hired for people to fulfill their fantasies, their deep dark fantasies. I was gonna be a movie star, you know, modeling and acting. After a hundred and two additions and small parts I decided y'know I had enough, Then I got in to Escort world. The client requests contain a lot of fetishes, so I just decided to go y'know... full Master, and change my entire house into a dungeon, uh... Dungeon Master. Now with a full dungeon in my house and It's going really well. ", photo: "GachiStrong")
    }
}
