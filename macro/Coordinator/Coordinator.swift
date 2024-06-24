//
//  Coordinator.swift
//  macro
//
//  Created by Gustavo Munhoz Correa on 24/06/24.
//

import UIKit

/// Protocol that defines the basic characteristics of a Coordinator in an iOS application.
/// A Coordinator is responsible for handling navigation logic, managing child coordinators,
/// and coordinating between various view controllers.
protocol Coordinator: AnyObject {
    
    /// The navigation controller that manages the stack of view controllers.
    var navigationController: UINavigationController { get set }
    
    /// The parent coordinator of this coordinator. It allows for communication back up
    /// the coordinator chain. Optional because the root coordinator won't have a parent.
    var parentCoordinator: Coordinator? { get set }
    
    /// Starts the coordinator's tasks. Typically used to set up the initial view controller
    /// and perform any necessary initial configuration.
    func start()
    
    /// Starts a child coordinator. This method is used when the current coordinator
    /// needs to delegate responsibility to another coordinator.
    /// - Parameter coordinator: The child coordinator to start.
    func start(coordinator: Coordinator)
    
    /// Called when a child coordinator finishes its task. This method can be used
    /// to perform cleanup related to the child coordinator or to reset state before
    /// moving back to the parent's flow.
    /// - Parameter coordinator: The child coordinator that has completed its tasks.
    func didFinish(coordinator: Coordinator)
    
    /// Clears all child coordinators managed by this coordinator. Useful for resetting
    /// or clearing all child coordinators' states during a significant state change.
    func clearAllChildren()
    
    /// Completes the tasks of all child coordinators and potentially removes them from
    /// the management hierarchy of this coordinator. This is often called when a coordinator
    /// is about to finish its own tasks and does not need its children anymore.
    func finishChildren()
}

