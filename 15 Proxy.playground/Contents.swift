
// первый вариант. Виртуальный прокси

class User {
    let id = "123"
}

protocol ServerProtocol {
    func grandAccess(user: User)
    func denyAccess(user: User)
}

class ServerSide: ServerProtocol {

    func grandAccess(user: User) {
        print("acces granted to user with id = \(user.id)")
    }
    
    func denyAccess(user: User) {
        print("access denied to user with id = \(user.id)")
    }
    
}

class ServerProxy: ServerProtocol {
    
    lazy private var server: ServerSide = ServerSide()
    
    func grandAccess(user: User) {
        server.grandAccess(user: user)
    }
    
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
    
}

let user = User()
let proxy = ServerProxy()
proxy.grandAccess(user: user)
proxy.denyAccess(user: user)

// =========================================================================================

// второй вариант. Защитный прокси

class User2 {
    let name = "Petr"
    let password = "999912"
}

protocol ServerProtocol2 {
    func grantAccess(user: User2)
}

class ServerSide2: ServerProtocol2 {
    
    func grantAccess(user: User2) {
        print("acces granted to user with name = \(user.name)")
    }
}

class ServeProxy2 : ServerProtocol2 {
    
    private var server: ServerSide2!
    
    func grantAccess(user: User2) {
        guard server != nil else {
            print ("access cant be granted")
            return
        }
        
        server.grantAccess(user: user)
    }
    
    func authenticate(user: User2) { // для проверки пользователя
        guard user.password == "999912" else { return }
        print("user authenticated")
        server = ServerSide2()
    }
    
}

let user2 = User2()
let proxy2 = ServeProxy2()

proxy2.grantAccess(user: user2)
proxy2.authenticate(user: user2)
proxy2.grantAccess(user: user2)
