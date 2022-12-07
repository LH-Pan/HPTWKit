import UIKit

extension UILabel {
    
    func changeLabelHeightByFontSize() {
        let label:UILabel = UILabel(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        self.frame = label.frame
    }
    
    func setupPartialAtrributedString(_ string: String, attributePartText: String, color: UIColor, font: UIFont) {
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: string)
        
        attributedString.setColor(color: color, forText: attributePartText)
        
        attributedString.setFont(font: font, forText: attributePartText)
        
        self.attributedText = attributedString
    }
    
    func setupPartialAtrributedString(_ string: String, attributePartTexts: [String], color: UIColor, font: UIFont) {
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: string)
        
        for attributePartText in attributePartTexts {
            
            attributedString.setColor(color: color, forText: attributePartText)
            
            attributedString.setFont(font: font, forText: attributePartText)
        }
        
        self.attributedText = attributedString
    }
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

            guard let labelText = self.text else { return }

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.lineHeightMultiple = lineHeightMultiple

            let attributedString: NSMutableAttributedString
        
            if let labelattributedText = self.attributedText {
                attributedString = NSMutableAttributedString(attributedString: labelattributedText)
            } else {
                attributedString = NSMutableAttributedString(string: labelText)
            }

            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

            self.attributedText = attributedString
        }
}
