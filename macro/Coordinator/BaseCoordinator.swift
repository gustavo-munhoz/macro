//
//  BaseCoordinator.swift
//  macro
//
//  Created by Gustavo Munhoz Correa on 24/06/24.
//

import UIKit

class BaseCoordinator: Coordinator {
    
    /// A list of child coordinators managed by this coordinator. This is useful for retaining
    /// a reference to child coordinators to prevent them from being deallocated prematurely.
    var children: [Coordinator] = []

    /// Optional reference to a parent coordinator. It helps in maintaining a hierarchical
    /// structure of coordinators where each coordinator may inform its parent about completion.
    var parent: Coordinator?

    var navigationController = UINavigationController()
    
    var parentCoordinator: (any Coordinator)?
    
    func start() {
        fatalError("start() is not implemented.")
    }
    
    func start(coordinator: any Coordinator) {
        children.append(coordinator)
    }
    
    func didFinish(coordinator: any Coordinator) {
        if let index = children.firstIndex(where: { $0 === coordinator }) {
            children.remove(at: index)
        }
    }
    
    func clearAllChildren() {
        children.removeAll()
    }
    
    func finishChildren() {
        children.forEach {
            $0.clearAllChildren()
            didFinish(coordinator: $0)
        }
    }
}
