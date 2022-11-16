import UIKit

public class TranslucentBackgroundView: UIView {
    
    // MARK: - Private Variable Declare
    private var color: UIColor? = .black {
        
        didSet {
            
            setup()
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
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    // MARK: - Private Method
    private func setup() {
        
        backgroundColor = color?.withAlphaComponent(colorAlphaComponent)
    }
    
    // MARK: - Public Method
    public func setupColor(color: UIColor?) {
        
        self.color = color
    }
    
    public func setupAlphaComponent(alphaComponent: CGFloat) {
        
        self.colorAlphaComponent = alphaComponent
    }
}
