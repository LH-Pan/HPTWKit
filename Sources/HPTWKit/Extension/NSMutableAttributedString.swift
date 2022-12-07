import UIKit

extension NSMutableAttributedString {
    
    func setColor(color: UIColor, forText stringValue: String) {
        
        let range: NSRange = mutableString.range(of: stringValue, options: .caseInsensitive)
        
        addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func setFont(font: UIFont, forText stringValue: String) {
        
        let range: NSRange = mutableString.range(of: stringValue, options: .caseInsensitive)
        
        addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}

extension NSMutableAttributedString {
    
    static func convertToOptionalNSAttributedStringKeyDictionary(_ input: [NSAttributedString.Key: Any]?) -> [NSAttributedString.Key: Any]? {
        
        guard let input = input else { return nil }
        
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key.rawValue), value)})
    }
}
