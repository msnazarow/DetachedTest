import UIKit

class MainViewController: UIViewController {
    
    var vc: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        button.backgroundColor = .red
        view.addSubview(button)
        
        print("MainViewController: viewWillAppear")
    }

    @objc func buttonDidTapped() {
        let hvc = ParentViewController()
        hvc.delegate = self
        vc = NavigationController(rootViewController: hvc)
        self.present(vc, animated: true)
    }
    
    func popAndpush() {
        onlyPop()
        
        vc.pushViewController(AnotherViewController(), animated: true)
    }
    
    func onlyPop() {
        vc.popToRootViewController(animated: false)
        vc.topViewController?.view.removeFromSuperview()
        vc.viewControllers.first?.beginAppearanceTransition(false, animated: true)
        vc.viewControllers.first?.willMove(toParent: nil)
        vc.viewControllers.first?.didMove(toParent: nil)
        vc.viewControllers.first?.endAppearanceTransition()
        vc.viewControllers.first?.removeFromParent()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MainViewController: viewWillAppear")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("MainViewController: viewDidAppear")
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("MainViewController: viewDidDissapear")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MainViewController: viewWillDissapear")
    }
    
    deinit {
        print("MainViewController: deinit")
    }
}

