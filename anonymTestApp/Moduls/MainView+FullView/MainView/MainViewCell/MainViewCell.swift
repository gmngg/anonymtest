//
//  MainViewCell.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 28.09.2020.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    static let reuseId = "mainCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var textInPost: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    private lazy var tagsPhoto: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        
        
        return label
    }()
    
    private lazy var countLikesPhoto: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 8)
        
        return label
    }()
    
    private lazy var countCommentsPhoto: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 8)
        
        return label
    }()
    
    private lazy var imagePost: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    func createImage(url: String) -> UIImage? {
        let imageError = UIImage(named: "ErrorImage")
        guard let url = URL(string: url) else {
            return imageError
        }
        guard let data = try? Data(contentsOf: url) else {
            return imageError
        }
        let image = UIImage(data: data)
        return image
    }
    
    func configure(photoItem: String, photoText: String, photoTags: [String], countLikes: Int, countComment: Int) {
        textInPost.text = String(photoText.prefix(100))
        countLikesPhoto.text = "Likes: \(countLikes)"
        tagsPhoto.text = "Tags: \(photoTags)"
        countCommentsPhoto.text = "Comment: \(countComment)"
        imagePost.image = createImage(url: photoItem)
        setupView()
    }
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(imagePost)
        stackView.addArrangedSubview(textInPost)
        stackView.addArrangedSubview(tagsPhoto)
        stackView.addArrangedSubview(countLikesPhoto)
        stackView.addArrangedSubview(countCommentsPhoto)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: 300),
            stackView.bottomAnchor.constraint(equalTo: countCommentsPhoto.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
        ])
    }
}
