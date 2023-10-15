import UIKit

class ContactListViewController : UIViewController{
    private var contactList : [Contact] = [
        Contact(name: "John Ceena", number: "88005553535", image: UIImage(named: "photo1")),
        Contact(name: "Dorian Gray", number: "330887", image: UIImage(named: "photo2")),
        Contact(name: "Sasha Gray", number: "3", image: UIImage(named: "photo3")),
        Contact(name: "Eva Elfie", number: "1"),
        Contact(name: "Murat Shaikhutdinov", number: "1234", image: UIImage(named: "photo4")),
        Contact(name: "Lisa Ann", number: "2", image: UIImage(named: "photo5")),
        Contact(name: "Mia Khalifa", number: "4"),
        Contact(name: "Artem Batalov", number: "4321", image: UIImage(named: "photo6")),
        Contact(name: "Pavel Baharuev", number: "123", image: UIImage(named: "photo7")),
        Contact(name: "Artem Starikov", number: "321", image: UIImage(named: "photo8"))
    ]
    private var collectionView: UICollectionView!
    
    private func setupCollectionView() {
        // Create a title label
        let titleLabel = UILabel()
        titleLabel.text = " Contacts:"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .left

        // Add the title label to the view
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Title Label Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        // Create a collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: 100)

        // Create the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContactCellView.self, forCellWithReuseIdentifier: "CustomCell")

        // Add the collection view to the view
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Collection View Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
}
extension ContactListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! ContactCellView
        let contact = contactList[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedContact = contactList[indexPath.row]
        let particularContactVC = ContactParticularViewController()
        particularContactVC.contact = selectedContact
        // Present the ParticularContactViewController (e.g., using navigation controller)
        navigationController?.pushViewController(particularContactVC, animated: true)
    }
}
