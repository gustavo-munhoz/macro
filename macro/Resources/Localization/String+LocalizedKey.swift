//
//  String+LocalizedKey.swift
//  macro
//
//  Created by Gustavo Munhoz Correa on 24/06/24.
//

import Foundation

/// Extension of the Swift `String` class to support localization.
extension String {
    
    /// `LocalizedKey` is an enumeration within the `String` extension that represents
    /// keys for localized strings. Each case of the enum holds the key for a string
    /// that corresponds to an entry in the app's localizable strings files.
    enum LocalizedKey: String {
        case appName = "ProjectumMacrum"
    }
    
    /// Retrieves a localized string using the specified key from the app's localization files.
    /// This method simplifies the process of fetching localized content, ensuring that the
    /// correct string is displayed according to the current localization settings of the device.
    /// - Parameter key: The key for which to retrieve the localized string.
    /// - Returns: A localized `String` corresponding to the given key.
    static func localized(for key: LocalizedKey) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
    
}
