import UIKit


class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
    
}

protocol Command {
    func execute()
    var isComplete: Bool { get set }
}

class Deposite: Command {
    
    // MARK: - Properties
    
    // нижний слэш просто стиль для private свойств
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    // MARK: Functions
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
    
    // MARK: - Init
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
}

class Withdraw: Command {
    
    // MARK: - Properties
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    // MARK: Functions
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Not enough money")
        }
        
    }
    
    // MARK: - Init
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
}

// создаем менеджер транзакций
class TransactionManager {
    
    // создаем синглтон
    static let shared = TransactionManager()
    private init() {}
    // помещаем транзакции в массив команд
    // Deposite
    // Withdraw
    private var _transactions: [Command] = [] // ключевой момент паттерна
    
    // массив команд в ожидании
    var pendingTransactions: [Command] {
        get {
            return self._transactions.filter{ $0.isComplete == false }
        }
    }
    
    // можем добавлять в любом месте новые команды для транзакций
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    
    // выполняем операции
    func processingTransactions() {
        // перебираем каждый элемент с помощью замыкания
        _transactions.filter { $0.isComplete == false }.forEach{ $0.execute() }
    }
    
}

let account = Account(accountName: "Alex", balance: 5000)
let transactionManager = TransactionManager.shared
transactionManager.addTransactions(command: Deposite(account: account, amount: 200))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 100))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
account.balance
