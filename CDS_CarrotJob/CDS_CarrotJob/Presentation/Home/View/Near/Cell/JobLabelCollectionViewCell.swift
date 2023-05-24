//
//  JobLabelCollectionViewCell.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class JobLabelCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = Color.white
                backgroundColor = Color.mainColor1
            } else {
                titleLabel.textColor = Color.gray1
                backgroundColor = Color.gray1
            }
        }
    }
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobLabelCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        contentView.backgroundColor = Color.white
        self.layer.cornerRadius = 15
        self.layer.borderColor = Color.gray6.cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
        titleLabel.do {
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray1
            $0.textAlignment = .center
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(20)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: JobLabelModel) {
        titleLabel.text = model.title
    }
}
