//
//  RepositoryListCell.swift
//  GitHubRepository
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit
import SnapKit

final class RepositoryListCell: UITableViewCell {
    
    var repository: Repository?
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let starImageView = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [nameLabel, descriptionLabel,
            starImageView, starLabel, languageLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
        configLayotut()
        updateLabel()
    }
}

private extension RepositoryListCell {
    func configLayotut() {
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(18)
        }
        
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalTo(nameLabel)
        }
        
        starImageView.image = UIImage(systemName: "star")
        starImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(descriptionLabel)
            $0.width.height.equalTo(20)
            $0.bottom.equalToSuperview()
        }
        
        starLabel.font = .systemFont(ofSize: 16)
        starLabel.textColor = .gray
        starLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImageView)
            $0.leading.equalTo(starImageView.snp.trailing).offset(5)
        }
        
        languageLabel.font = .systemFont(ofSize: 16)
        languageLabel.textColor = .gray
        languageLabel.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starLabel.snp.trailing).offset(12)
        }
    }
    
    func updateLabel() {
        guard let repository = repository else { return }
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
        starLabel.text = "\(repository.stargazersCount)"
        languageLabel.text = repository.language
    }
}
