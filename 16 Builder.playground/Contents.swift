import UIKit

protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

class Theme: ThemeProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

protocol ThemeBuilderProtocol {
    func setBackgroundColor(color: UIColor)
    func setText(color: UIColor)
    func createTheme() -> ThemeProtocol?
}

class ThemeBuilder: ThemeBuilderProtocol {
    
    private var backgroundColor: UIColor?
    private var textColor: UIColor?
    
    func setBackgroundColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    func setText(color: UIColor) {
        self.textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = backgroundColor, let textColor = textColor else { return nil}
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
    
}

let builder = ThemeBuilder()
builder.setText(color: .white)
builder.setBackgroundColor(color: .green)
let theme = builder.createTheme()
