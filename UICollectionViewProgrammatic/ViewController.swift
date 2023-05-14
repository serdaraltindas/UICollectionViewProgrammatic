//
//  ViewController.swift
//  UICollectionViewProgrammatic
//
//  Created by Serdar Altındaş on 13.05.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
    //let car = ["car1","car2","car3","car4","car5","car6","car7","car8"]
    let car = ["car1","car2","car3","car4","car5","car6","car7","car8"]
    
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
          
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return car.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.catImageView.image = UIImage(named: car[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("car \(indexPath.row) is tapped!")
    }
}

class CustomCell : UICollectionViewCell {
    let catImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(catImageView)
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.clipsToBounds = true
        catImageView.contentMode = .scaleAspectFill
        catImageView.layer.cornerRadius = 20
        catImageView.layer.masksToBounds = true
        catImageView.layer.borderWidth = 5
        catImageView.layer.borderColor = UIColor.systemGray4.cgColor
        
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: topAnchor),
            catImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            catImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

