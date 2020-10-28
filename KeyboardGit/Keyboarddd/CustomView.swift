//
//  CustomView.swift
//  Keyboarddd
//
//  Created by Federica Benacquista on 28/10/2020.
//

import Foundation
import UIKit

class lettersKeyboard: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
let keyView: UICollectionView  = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let cv = UICollectionView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 200), collectionViewLayout: layout)
    cv.setCollectionViewLayout(layout, animated: true)
    cv.isScrollEnabled = false
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.register(KeyboardKeys.self, forCellWithReuseIdentifier: "collectionCellId")
    cv.backgroundColor = .clear
    return cv
}()
    
 let letters = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
 override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    private func commonInit(){
//If you find some errors it's because this is way different in my code. This is just a regulare  collection view anyway
        
    
    keyView.delegate = self
    keyView.dataSource = self
        addSubview(keyView)
        
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = keyView.dequeueReusableCell(withReuseIdentifier: "collectionCellId", for: indexPath) as! KeyboardKeys
        cell.label.text = letters[indexPath.row]
        
        return cell
    }
    ///I guess something is wrong here
    func setColorScheme(_ colorScheme: ColorScheme) {
      let colorScheme = CColors(colorScheme: colorScheme)
     
      for view in subviews {
        if let cell = view as? KeyboardKeys {
            cell.tintColor = colorScheme.buttonTextColor
            cell.defaultColor = colorScheme.keysDefaultColor
            cell.highlighColor = colorScheme.keysHighlightColor
      }
      }
    }
    
}


class KeyboardKeys: UICollectionViewCell {
    
    var defaultColor = UIColor.white
    var highlighColor = UIColor.lightGray.withAlphaComponent(0.6)
    
    let label: UILabel = {
        let iv = UILabel()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode =  .scaleAspectFit
        iv.font = UIFont.systemFont(ofSize: 20)
        iv.clipsToBounds = true
        iv.numberOfLines = 1
        iv.textAlignment = .center
        
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            backgroundColor = isHighlighted ? highlighColor : defaultColor
    }
}

