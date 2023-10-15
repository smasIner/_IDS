import UIKit

class ContactCellView: UICollectionViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // Directly specify the colors
        let borderColor = UIColor(red: 0.5, green: 0.48, blue: 1, alpha: 1).cgColor
        let backgroundColor = UIColor.white.cgColor  // Convert to CGColor
        layer.borderColor = borderColor
        layer.backgroundColor = backgroundColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        layer.cornerRadius = 10
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        setupLayout()
    }

    
    private func setupLayout() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with contact: Contact) {
        nameLabel.text = contact.name
        avatarImageView.image = contact.image
    }
}

