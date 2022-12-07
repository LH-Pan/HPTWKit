import UIKit

extension UIAlertController {
    
    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        
        if let backgroundView = view.subviews.first,
           let groupView = backgroundView.subviews.first,
           let contentView = groupView.subviews.first {

            contentView.backgroundColor = color
        }
    }
    
    //Set title font and title color
    func setTitle(font: UIFont? = nil, color: UIColor?, alignment: NSTextAlignment? = nil) {
        
        guard let title = title else { return }
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if let titleAlignment = alignment {
            
            let titleParagraphStyle = NSMutableParagraphStyle()
            
            titleParagraphStyle.alignment = titleAlignment
            
            attributes.updateValue(titleParagraphStyle, forKey: .paragraphStyle)
        }
        
        if let titleFont = font {
            
            attributes.updateValue(titleFont, forKey: .font)
        }
        
        if let titleColor = color {
            
            attributes.updateValue(titleColor, forKey: .foregroundColor)
        }
        
        let attributeString = NSMutableAttributedString(string: title, attributes: attributes)
        
        setValue(attributeString, forKey: "attributedTitle")
    }
    
    //Set message font and message color
    func setMessage(font: UIFont? = nil, color: UIColor?, alignment: NSTextAlignment? = nil) {
        
        guard let message = message else { return }
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if let messageAlignment = alignment {
            
            let messageParagraphStyle = NSMutableParagraphStyle()
            
            messageParagraphStyle.alignment = messageAlignment
            
            attributes.updateValue(messageParagraphStyle, forKey: .paragraphStyle)
        }
        
        if let messageFont = font {
            
            attributes.updateValue(messageFont, forKey: .font)
        }
        
        if let messageColorColor = color {
            
            attributes.updateValue(messageColorColor, forKey: .foregroundColor)
        }
        
        let attributeString = NSMutableAttributedString(string: message, attributes: attributes)
        
        setValue(attributeString, forKey: "attributedMessage")
    }
    
    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        
        view.tintColor = color
    }
}
