import UIKit
class ContactParticularViewController: UIViewController {
    var contact: Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let contactDataView = ContactParticularView()
        if let contact = contact {
            contactDataView.configure(with: contact)
        }
        view.addSubview(contactDataView)
        contactDataView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contactDataView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                contactDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                contactDataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])
    }
}
