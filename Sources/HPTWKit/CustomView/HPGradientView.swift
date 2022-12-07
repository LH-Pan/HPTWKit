import UIKit

open class HPGradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        backgroundColor = .clear
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        backgroundColor = .clear
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    public func setColors(_ colors: [CGColor],
                   locations: [NSNumber] = [0.0, 1.0],
                   startPoint: CGPoint? = nil,
                   endPoint: CGPoint? = nil) {
        
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint ?? CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = endPoint ?? CGPoint(x: 0.5, y: 1.0)
        gradientLayer.name = "gradient"
        
        setLayerHidden(false)
    }
    
    public func setLayerHidden(_ hidden: Bool) {
        
        gradientLayer.isHidden = hidden
    }
}

open class HPGradientButton: UIButton {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    public func setColors(_ colors: [CGColor],
                          locations: [NSNumber] = [0.0, 1.0],
                          startPoint: CGPoint? = nil,
                          endPoint: CGPoint? = nil) {
        
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint ?? CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = endPoint ?? CGPoint(x: 0.5, y: 1.0)
        gradientLayer.name = "gradient"
        
        setLayerHidden(false)
    }
    
    public func setLayerHidden(_ hidden: Bool) {
        
        gradientLayer.isHidden = hidden
    }
}

open class HPGradientLabel: UILabel {
    
    private let gradientLayer = CAGradientLayer()
    
    private let upperLabel = UILabel(frame: .zero)
    
    open override var text: String? {
        
        didSet {
            
            upperLabel.text = text
        }
    }
    
    open override var textAlignment: NSTextAlignment {
        
        didSet {
            
            upperLabel.textAlignment = textAlignment
        }
    }
    
    open override var font: UIFont! {
        
        didSet {
            
            upperLabel.font = font
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = .clear
        upperLabel.textColor = .white
        addSubview(upperLabel)
        upperLabel.frame = bounds
        upperLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        textColor = .clear
        upperLabel.textColor = .white
        addSubview(upperLabel)
        upperLabel.frame = bounds
        upperLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
   open override func layoutSubviews() {
        super.layoutSubviews()
       
        gradientLayer.frame = bounds
    }
    
    public func setUpperTextColor(_ color: UIColor) {
        
        upperLabel.textColor = color
    }
    
    public func setLabelHidden(_ isHidden: Bool) {
        
        self.isHidden = isHidden
        upperLabel.isHidden = isHidden
    }
    
    public func setColors(_ colors: [CGColor],
                          locations: [NSNumber] = [0.0, 1.0],
                          startPoint: CGPoint? = nil,
                          endPoint: CGPoint? = nil) {
        
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint ?? CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = endPoint ?? CGPoint(x: 0.5, y: 1.0)
        gradientLayer.name = "gradient"
        
        setLayerHidden(false)
    }
    
    public func setLayerHidden(_ hidden: Bool) {
        
        gradientLayer.isHidden = hidden
    }
}
