import UIKit

public class NavigationController: UINavigationController {
    override public var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    @objc public var availableOrientationMask: UIInterfaceOrientationMask = (UIDevice.current.userInterfaceIdiom == .pad ? .all : .portrait)
    
    override public var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return availableOrientationMask
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("NavigationController: viewDidLoad")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NavigationController: viewWillAppear")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("NavigationController: viewDidAppear")
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("NavigationController: viewDidDissapear")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NavigationController: viewWillDissapear")
    }
    
    deinit {
        print("NavigationController: deinit")
    }
}
