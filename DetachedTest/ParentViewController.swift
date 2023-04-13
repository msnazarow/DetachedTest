
import Foundation
import UIKit

class ParentViewController: UIViewController {
    weak var delegate: MainViewController?
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        
        let detached = DetachedViewController()
        view.addSubview(detached.view)
        detached.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(detached)
        
        NSLayoutConstraint.activate([
            detached.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            detached.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            detached.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            detached.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        
        detached.didMove(toParent: self )
        
        var button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.addTarget(self, action: #selector(onTapPopAndpush), for: .touchUpInside)
        button.setTitle("Pop&Push", for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
        
        button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button.addTarget(self, action: #selector(onTapPopOnly), for: .touchUpInside)
        button.setTitle("Pop", for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
        
        print("ParentViewController: viewDidLoad")
    }
    
    @objc func onTapPopAndpush() {
        delegate?.popAndpush()
    }
    
    @objc func onTapPopOnly() {
        delegate?.onlyPop()
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ParentViewController: viewWillAppear")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ParentViewController: viewDidAppear")
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ParentViewController: viewDidDissapear")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ParentViewController: viewWillDissapear")
    }
    
    deinit {
        print("ParentViewController: deinit")
    }
}

