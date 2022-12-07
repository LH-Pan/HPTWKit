import UIKit

extension UIFont {
    
    
    static func PFSCfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: size)!
    }
    
    static func PFSMfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size)!
    }
    
    static func PFSRfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size)!
    }
    
    static func SLfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "STHeitiTC-Light", size: size)!
    }
    
    static func STMfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "STHeitiTC-Medium", size: size)!
    }
    
    static func PFTRfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangTC-Regular", size: size)!
    }
    
    static func HVBfontBySize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Bold", size: size)!
    }
}
