import UIKit
import SnapKit

open class HPCustomSelectionSheetView: UIView {
    
    // MARK: - Private Constant/Variable Declare
    private let titleLabel: UILabel = UILabel()
    private let separatorView: UIView = UIView()
    
    private let selectionCellViewModels: [SelectionCellViewModel]
    
    private lazy var selectionCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.minimumInteritemSpacing = 10
        
        return UICollectionView(frame: frame, collectionViewLayout: layout)
    }()
    
    // MARK: - Closure Declare
    var cellTappedClosure: ((Int) -> Void)?
    
    // MARK: - Initialize Method
    init(frame: CGRect, cellViewModels: [SelectionCellViewModel]) {
        self.selectionCellViewModels = cellViewModels
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required public init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    private func setupSubviews() {
        
        addSubview(titleLabel)
        addSubview(separatorView)
        addSubview(selectionCollectionView)
        
        setupConstraints()
        
        setupAttributes()
    }
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            
            make.top.left.right.equalToSuperview()
            
            make.height.equalTo(getTitleLabelHeight())
        }
        
        separatorView.snp.makeConstraints { make in
            
            make.top.equalTo(titleLabel.snp.bottom)
            
            make.left.right.equalToSuperview()
            
            make.height.equalTo(1)
        }
        
        selectionCollectionView.snp.makeConstraints { make in
            
            make.top.equalTo(separatorView.snp.bottom)
            
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupAttributes() {
        
        setupLabel()
        
        setupView()
        
        setupCollectionView()
    }
    
    private func setupLabel() {
        
        titleLabel.font = .PFSMfontBySize(16 * HPViewConfig.screenWidthRatio)
        
        titleLabel.textAlignment = .center
        
        titleLabel.textColor = .black.withAlphaComponent(0.87)
    }
    
    private func setupView() {
        
        layer.cornerRadius = 5
        
        layer.masksToBounds = true
        
        clipsToBounds = true
        
        setupSizeOfView()
        
        backgroundColor = .white
        
        separatorView.backgroundColor = .white.withAlphaComponent(0.8)
    }
    
    private func setupCollectionView() {
        
        selectionCollectionView.dataSource = self
        
        selectionCollectionView.delegate = self
        
        selectionCollectionView.register(HPSelectionSheetCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HPSelectionSheetCollectionViewCell.id)
        
        selectionCollectionView.backgroundColor = .white
    }
    
    private func setupSizeOfView() {
        
        let width = UIScreen.width - 20
        
        let height = getTitleLabelHeight() + getSeparatorViewHeight() + getCollectionViewHeight()
        
        frame.size = CGSize(width: width, height: height)
    }
    
    private func getTitleLabelHeight() -> CGFloat {
        
        return 55 * HPViewConfig.screenWidthRatio
    }
    
    private func getSeparatorViewHeight() -> CGFloat {
        
        return 1
    }
    
    private func getCollectionViewHeight() -> CGFloat {
        
        let cellViewModelCount = selectionCellViewModels.count
        
        let selectionHeights: CGFloat = 56 * HPViewConfig.screenWidthRatio * CGFloat(cellViewModelCount)
        
        let insetSpacings: CGFloat = 10 * HPViewConfig.screenWidthRatio * 2
        
        let interItemSpacings: CGFloat = 10 * HPViewConfig.screenWidthRatio * CGFloat(cellViewModelCount - 1)
        
        let collectionViewHeight: CGFloat =  selectionHeights + insetSpacings + interItemSpacings
        
        return collectionViewHeight
    }
    
    // MARK: - Public Methgod
    func setupTitleText(_ text: String) {
        
        titleLabel.text = text
    }
}

// MARK: - 實作 UICollectionViewDataSource, UICollectionViewDelegate
extension HPCustomSelectionSheetView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return selectionCellViewModels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HPSelectionSheetCollectionViewCell.id, for: indexPath)
        
        guard let sheetCell = cell as? HPSelectionSheetCollectionViewCell else { return UICollectionViewCell() }
        
        let cellVM = selectionCellViewModels[indexPath.item]
        
        sheetCell.cellViewModel = cellVM
        
        return sheetCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        cellTappedClosure?(indexPath.item)
    }
}

// MARK: -  實作 UICollectionViewDelegateFlowLayout
extension HPCustomSelectionSheetView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 340 * HPViewConfig.screenWidthRatio, height: 56 * HPViewConfig.screenWidthRatio)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: HPViewConfig.collectionViewTopInset, left: 0, bottom: HPViewConfig.collectionViewBottomInset, right: 0)
    }
}

struct SelectionCellViewModel {
    
    let title: String
    
    var isSelected: Bool = false
}
