import UIKit

class ContactParticularView: UIScrollView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0 // Allow multiline text
        return label
    }()
    
    private var areLabelsVisible: Bool = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        backgroundColor = .white
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(phoneLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let maxWidthConstraint = imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        let maxHeightConstraint = imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        NSLayoutConstraint.activate([maxWidthConstraint, maxHeightConstraint])
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0), // Updated
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0), // Updated
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            phoneLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        configureGestureRecognizers()
        
        minimumZoomScale = 1
        maximumZoomScale = 1.5
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
    }
    
    private func configureGestureRecognizers() {
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapRecognizer)
    }

    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if zoomScale == 1 {
            setZoomScale(1.3, animated: true)
            areLabelsVisible = false
            updateLabelVisibility()
        } else {
            setZoomScale(1, animated: true)
            areLabelsVisible = true
            updateLabelVisibility()
        }
    }
    private func updateLabelVisibility() {
        if zoomScale != 1{
            nameLabel.alpha = 0
            phoneLabel.alpha = 0
        }
        else{
            nameLabel.alpha = 1
            phoneLabel.alpha = 1
        }
    }
    override func setZoomScale(_ scale: CGFloat, animated: Bool) {
        super.setZoomScale(scale, animated: animated)
        areLabelsVisible = (scale == 1)
        updateLabelVisibility()
    }
    func configure(with contact: Contact) {
        imageView.image = contact.image
        nameLabel.text = contact.name
        phoneLabel.text = contact.number
    }
}

extension ContactParticularView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateLabelVisibility()
    }
}

