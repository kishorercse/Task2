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
    
    lazy var imageView2: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var model: Model? {
        didSet{
            guard let model = model else { return }
            imageView.image = UIImage(named: model.imageName)
            if let img2 = model.imageName2 {
                imageView2.image = UIImage(named: img2)
            }else {
                imageView2.image = nil
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.addSubview(imageView)
        contentView.addSubview(imageView2)
        
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        
        imageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive  = true
        imageView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView2.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
        imageView2.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

