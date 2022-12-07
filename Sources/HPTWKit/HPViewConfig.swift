//
//  File.swift
//  
//
//  Created by HenryPan on 2022/11/22.
//

import UIKit

public class HPViewConfig {
    
    static var collectionViewTopInset: CGFloat {
        
        return ceil(10 * screenWidthRatio)
    }
    
    static var collectionViewRightInset: CGFloat {
        
        return ceil(10 * screenWidthRatio)
    }
    
    static var collectionViewLeftInset: CGFloat {
        
        return ceil(10 * screenWidthRatio)
    }
    
    static var collectionViewBottomInset: CGFloat {
        
        return ceil(10 * screenWidthRatio)
    }
    
    static var collectionViewEdgeInset: UIEdgeInsets {
        
        return UIEdgeInsets.init(top: collectionViewTopInset,
                                 left: collectionViewLeftInset,
                                 bottom: collectionViewBottomInset,
                                 right: collectionViewRightInset)
    }
    
    static let screenWidthRatio: CGFloat = UIScreen.width / CGFloat(360)
    
    static let screenHeightRatio: CGFloat = UIScreen.height / CGFloat(640)
}
