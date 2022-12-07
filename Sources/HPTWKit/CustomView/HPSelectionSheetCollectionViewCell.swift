import UIKit
import SnapKit


class HPSelectionSheetCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private Constant/Variable Declare
    private let containerView: HPGradientView = HPGradientView()
    
    private let titleLabel: UILabel = UILabel()
    
    // MARK: - Public Constant/Variable Declare
    var cellViewModel: SelectionCellViewModel? {
        
        didSet {
            
            guard let cellVM = cellViewModel else { return }
            
            titleLabel.text = cellVM.title
            
            if cellVM.isSelected {
                
                containerView.setColors([UIColor.pastelRedTwo.cgColor, UIColor.pinkishRed.cgColor])
                
                titleLabel.textColor = .white
            }
        }
    }
    
    // MARK: - Initialize Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    private func setupSubviews() {
        
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        setupConstraints()
        
        setupAttributes()
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            
            make.left.right.equalToSuperview().inset(10)
            
            make.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
        
            make.center.equalToSuperview()
        }
    }
    
    private func setupAttributes() {
        
        setupView()
        
        setupLabel()
    }
    
    private func setupView() {
        
        containerView.layer.cornerRadius = 3.3
        
        containerView.layer.masksToBounds = true
        
        containerView.clipsToBounds = true
    }
    
    private func setupLabel() {
        
        titleLabel.textAlignment = .center
        
        titleLabel.font = .PFSRfontBySize(16 * HPViewConfig.screenWidthRatio)
    }
    
    // MARK: - Public Method
    func setupWithColorMode(isDarkMode: Bool) {
        
        titleLabel.textColor = .black.withAlphaComponent(0.87)
        
        containerView.setColors(isDarkMode ?
                                [UIColor.white.withAlphaComponent(0.05).cgColor, UIColor.white.withAlphaComponent(0.05).cgColor] :
                                [UIColor.black.withAlphaComponent(0.05).cgColor, UIColor.black.withAlphaComponent(0.05).cgColor])
    }
}
