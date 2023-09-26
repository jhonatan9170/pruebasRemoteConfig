//
//  RemoteConfigKey.swift
//  GSEKTWorkSpace
//
//  Created by Octavio Calzada on 11/08/22.
//

import Foundation

struct RemoteConfigKey {
    
    static let broken_app_ios = "broken_app_ios"
    static let current_build_ios = "current_build_ios"
    static let current_version_ios = "current_version_ios"
    
    static let enable_logger_ios = "enable_logger_ios"
    
    static let login_account_ios = "login_account_ios"
    static let login_crdt_ios = "login_crdt_ios"
    static let crdt_elektra_ios = "crdt_elektra_ios"
    static let crdt_pays_ios = "crdt_pays_ios"
    static let purchase_ios = "purchase_ios"
    
    static let crashesBuildIOS = "crashes_build_ios"
    static let jsonIdentifierIOS = "json_identifier_ios"
    static let logsIdentifierIOS = "logs_identifier_ios"
    
    static let generalConfig = "general_config"
    static let generalConfigTest = "general_config_test"
    static let splashParameters = "splash_parameters"
    
    static let splashBackgroundColor = "splash_bgcolor"
    static let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    
}
