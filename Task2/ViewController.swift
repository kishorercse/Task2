//
//  ViewController.swift
//  Task2
//
//  Created by kishore-pt5557 on 06/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var previousSelected: IndexPath?
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    var arr: [Model] = []
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        return sv
    }()

    lazy var titleBlock = UIView()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Image Viewer"
        l.textAlignment = .center
        return l
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    lazy var imageBlock = UIView()
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil)
        
        stackView.addSubview(titleBlock)
        stackView.addSubview(collectionView)
        stackView.addSubview(imageBlock)
        
        
        titleBlock.anchor(top: stackView.topAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: stackView.trailingAnchor, centerX: nil, centerY: nil)
        titleBlock.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
        
        collectionView.anchor(top: titleBlock.bottomAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: stackView.trailingAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
        collectionView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.15).isActive = true
        
        imageBlock.anchor(top: collectionView.bottomAnchor, leading: stackView.leadingAnchor, bottom: stackView.bottomAnchor, trailing: stackView.trailingAnchor, centerX: nil, centerY: nil)
        imageBlock.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.75).isActive = true
        
        
        titleBlock.addSubview(titleLabel)
        titleLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: titleBlock.centerXAnchor, centerY: titleBlock.centerYAnchor)
        titleLabel.widthAnchor.constraint(equalTo: titleBlock.widthAnchor, multiplier: 0.5).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: titleBlock.heightAnchor, multiplier: 0.5).isActive = true
        
        
        imageBlock.addSubview(imageView)
        imageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: imageBlock.centerXAnchor, centerY: imageBlock.centerYAnchor)
        imageView.widthAnchor.constraint(equalTo: imageBlock.widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageBlock.heightAnchor, multiplier: 0.5).isActive = true
        
        let imageNames = ["camera","google","notes","safari","music","settings","studio","xcode"]
        
        for i in 0..<imageNames.count {
            let model = Model(imageName: imageNames[i])
            arr.append(model)
        }
        
        
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.model = arr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if previousSelected == indexPath {
            imageView.image = nil
            arr[indexPath.row].imageName2 = nil
            if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell {
                cell.model = arr[indexPath.row]
                print(cell.isSelected)
                cell.isSelected = false
            }
            previousSelected = nil
        }
        else {
            imageView.image = UIImage(named: arr[indexPath.row].imageName)
            arr[indexPath.row].imageName2 = "check"
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            cell.model = arr[indexPath.row]
            previousSelected = indexPath
            print(cell.isSelected)
        }
                
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        imageView.image = nil
        arr[indexPath.row].imageName2 = nil
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomCell {
            cell.model = arr[indexPath.row]
            print(cell.isSelected)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}

extension UIView {
    
//    func fillSuperview() {
//        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, centerX: nil, centerY: nil)
//    }
//
//    func anchorSize(to view: UIView) {
//        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}
