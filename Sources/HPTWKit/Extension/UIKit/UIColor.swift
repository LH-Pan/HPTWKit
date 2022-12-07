import UIKit

private enum HPColor: String {
    
    /// White
    case white216 = "#D8D8D8"
    case white242 = "#F2F2F2"
    case white247 = "#F7F7F7"
    
    /// Black
    case black16 = "#101010"
    case black24 = "#181818"
    case black51 = "#333333"
    case lightBlck = "#070707"
    
    /// Red
    case paleRed = "#DC644A"
    case blushRed = "#FD897D"
    case fadedRed = "#DC3549"
    case coralRed = "#F35353"
    case tomatoRed = "#F2342C"
    case pastelRed = "#E85151"
    case brightRed = "#F20129"
    case pinkishRed = "#DD0F3A"
    case coralRedTwo = "#FB574F"
    case pastelRedTwo = "#F35D44"
    case strawberryRed = "#DE3035"
    case veryLightPink = "#FDE1DE"
    
    /// Orange
    case LUOrange = "#F76B1C"
    case dustyOrange = "#F7893A"
    case wheatOrange = "#FACE7F"
    case yellowishOrange = "#F59823"
    
    /// Yellow
    case offYellow = "#F7D73A"
    case paleYellow = "#FEF2CF"
    case orangeyYellow = "#F5A623"
    case lightMustardYellow = "#FAD961"
    
    /// Green
    case kiwiGreen = "#B4EC51"
    case treeGreen = "#429321"
    case appleGreen = "#7ED321"
    
    /// Blue
    case dodgerBlue = "#3E97FF"
    
    /// Grey
    case grey207 = "CFCFCF"
    case darkGrey = "221F1F"
    case brownGrey = "#9B9B9B"
    case brownishGrey = "#666666"
    case brownGreyTwo = "#B3B3B3"
    case veryLightGray = "#CCCCCC"
    
    /// Brown
    case yellowishTan = "#FAF77F"
    case greyishBrown = "#4A4A4A"
}

// 顏色命名基本以 Zeplin 加入顏色後的命名為主，無法辨識的則自行更改命名並同時更改 Zeplin 上的命名，盡量貼近實際顏色為主
// white216 = RGB 均為 216/255.0，若有更動 alpha 值則於數字前方加上 A (例: blackA54)

extension UIColor {
    
    /// White
    static let white216 = HPColor(.white216)
    static let white242 = HPColor(.white242)
    static let white247 = HPColor(.white247)
    static let whiteA26 = white.withAlphaComponent(0.26)
    static let whiteA36 = white.withAlphaComponent(0.36)
    static let whiteA54 = white.withAlphaComponent(0.54)
    static let whiteA60 = white.withAlphaComponent(0.6)
    static let whiteA87 = white.withAlphaComponent(0.87)
    
    /// Black
    static let black16 = HPColor(.black16)
    static let black24 = HPColor(.black24)
    static let black51 = HPColor(.black51)
    static let lightBlack = HPColor(.lightBlck)
    static let blackA12 = black.withAlphaComponent(0.12)
    static let blackA26 = black.withAlphaComponent(0.26)
    static let blackA36 = black.withAlphaComponent(0.36)
    static let blackA54 = black.withAlphaComponent(0.54)
    static let blackA60 = black.withAlphaComponent(0.6)
    static let blackA87 = black.withAlphaComponent(0.87)
    static let shadowBlack = black.withAlphaComponent(0.5)
    
    /// Red
    static let paleRed = HPColor(.paleRed)
    static let blushRed = HPColor(.blushRed)
    static let fadedRed = HPColor(.fadedRed)
    static let coralRed = HPColor(.coralRed)
    static let tomatoRed = HPColor(.tomatoRed)
    static let pastelRed = HPColor(.pastelRed)
    static let pastelRedA50 = HPColor(.pastelRed).withAlphaComponent(0.5)
    static let brightRed = HPColor(.brightRed)
    static let pinkishRed = HPColor(.pinkishRed)
    static let coralRedTwo = HPColor(.coralRedTwo)
    static let pastelRedTwo = HPColor(.pastelRedTwo)
    static let strawberryRed = HPColor(.strawberryRed)
    static let veryLightPink = HPColor(.veryLightPink)
    
    /// Orange
    static let LUOrange = HPColor(.LUOrange)
    static let wheatOrange = HPColor(.wheatOrange)
    static let dustyOrange = HPColor(.dustyOrange)
    static let yellowishOrange = HPColor(.yellowishOrange)
    
    /// Yellow
    static let offYellow = HPColor(.offYellow)
    static let paleYellow = HPColor(.paleYellow)
    static let orangeyYellow = HPColor(.orangeyYellow)
    static let lightMustardYellow = HPColor(.lightMustardYellow)
    static let orangeyYellowA30 = HPColor(.orangeyYellow).withAlphaComponent(0.3)
    
    /// Green
    static let kiwiGreen = HPColor(.kiwiGreen)
    static let treeGreen = HPColor(.treeGreen)
    static let appleGreen = HPColor(.appleGreen)
    
    /// Blue
    static let dodgerBlue = HPColor(.dodgerBlue)
    
    /// Grey
    static let grey207 = HPColor(.grey207)
    static let grayA87 = gray.withAlphaComponent(0.87)
    static let brownGrey = HPColor(.brownGrey)
    static let brownishGrey = HPColor(.brownishGrey)
    static let brownGreyTwo = HPColor(.brownGreyTwo)
    static let veryLightGray = HPColor(.veryLightGray)
    static let darkGreyA26 = HPColor(.darkGrey).withAlphaComponent(0.26)
    
    /// Brown
    static let yellowishTan = HPColor(.yellowishTan)
    static let greyishBrown = HPColor(.greyishBrown)
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    // Hex String -> UIColor
    static func hexStringToUIColor(hex: String) -> UIColor {
        
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            
            return .gray
        }
        
        var rgbValue: UInt64 = 0
        
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((rgbValue & 0x0000FF) >> 0)  / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    private static func HPColor(_ hexString: HPColor) -> UIColor {
        
        return .hexStringToUIColor(hex: hexString.rawValue)
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            
            self.setFill()
            
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

