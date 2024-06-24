//
//  AppCoordinator.swift
//  macro
//
//  Created by Gustavo Munhoz Correa on 24/06/24.
//

import UIKit

/// The `AppCoordinator` is responsible for handling the initial setup and starting
/// the main navigation flow of the application. This coordinator sets up the root
/// view controller and manages the transition to the primary navigation flow of the app.
final class AppCoordinator: BaseCoordinator {
    
    /// The window where the app's views are displayed. Optional because it may not be
    /// set during initialization and can be injected later.
    private var window: UIWindow?
    
    /// Initializes a new instance of `AppCoordinator`.
    /// - Parameter window: The main window of the application where the navigation will be displayed.
    ///                      Defaults to nil if not provided during initialization.
    init(window: UIWindow? = nil) {
        self.window = window
    }
    
    /// Starts the coordinator's main flow. This method sets the `rootViewController` of the window
    /// to the `navigationController` to start the navigation stack. It then makes the window key and visible,
    /// ensuring that it is ready to handle user input and appear on the screen.
    /// After setting up the window, it creates and starts a `NavigationCoordinator`, which manages
    /// the further navigation within the app.
    override func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let coordinator = NavigationCoordinator()
        coordinator.navigationController = navigationController
        start(coordinator: coordinator)
    }
}
