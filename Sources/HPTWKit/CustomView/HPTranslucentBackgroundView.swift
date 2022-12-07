import UIKit

open class HPTranslucentBackgroundView: UIView {
    
    // MARK: - Private Variable Declare
    open override var backgroundColor: UIColor? {
        
        didSet {
            
            self.backgroundColor = backgroundColor
        }
    }
    
    private var colorAlphaComponent: CGFloat = 0.6 {
        
        didSet {
            
            setup()
        }
    }
    
    // MARK: - Initialize Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = .black
    }
    
    // MARK: - Private Method
    private func setup() {
        
        backgroundColor = backgroundColor?.withAlphaComponent(colorAlphaComponent)
    }
    
    // MARK: - Public Method
    public func setupColor(color: UIColor?) {
        
        self.backgroundColor = color
    }
    
    public func setupAlphaComponent(alphaComponent: CGFloat) {
        
        self.colorAlphaComponent = alphaComponent
    }
}
