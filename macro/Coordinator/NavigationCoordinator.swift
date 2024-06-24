//
//  NavigationCoordinator.swift
//  macro
//
//  Created by Gustavo Munhoz Correa on 24/06/24.
//

import UIKit
import Combine

/// `NavigationCoordinator` is a coordinator that manages the navigation flow within a specific part
/// of the application. It extends `BaseCoordinator` by handling the presentation of specific view controllers
/// and managing any associated reactive subscriptions.
class NavigationCoordinator: BaseCoordinator {
    
    /// A set of cancellables to hold any subscriptions created during the navigation process.
    /// This ensures that all subscriptions are retained for the lifetime of the coordinator,
    /// and properly disposed of when no longer needed.
    private var cancellables = Set<AnyCancellable>()
    
    /// Starts the navigation flow by creating and presenting an `UIViewController`. This method
    /// also includes additional configuration that may be necessary for the `UIViewController`.
    /// It pushes the `UIViewController` onto the navigation stack, with animations disabled for
    /// immediate transition.
    override func start() {
        let vc = ViewController()
        
        // Additional configuration can be performed here as needed
        
        navigationController.pushViewController(vc, animated: false)
    }
    
}
