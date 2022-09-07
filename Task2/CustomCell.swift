//
//  CustomCell.swift
//  Task2
//
//  Created by kishore-pt5557 on 06/09/22.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var checkImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "check"))
        return iv
    }()
    
    var model: Model? {
        didSet{
            guard let model = model else { return }
            imageView.image = UIImage(named: model.imageName)
            checkImage.removeFromSuperview()
            if model.isSelected == true {
                contentView.addSubview(checkImage)
                checkImage.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, centerX: nil, centerY: nil)
                checkImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
                checkImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25).isActive = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

