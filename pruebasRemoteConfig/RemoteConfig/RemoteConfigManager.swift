//
//  RemoteConfigManager.swift
//  GSEKTWorkSpace
//

import Foundation
import Firebase

class RemoteConfigManager {
    
    static func rcValueString(forKey key: String, exprationDuration: TimeInterval = 43200.0) -> String {
        RemoteConfigManager.configureRC(exprationDuration: exprationDuration)
        return RemoteConfig.remoteConfig().configValue(forKey: key).stringValue!
    }
    
    static func rcValueBool(forKey key: String, exprationDuration: TimeInterval = 43200.0) -> Bool {
        RemoteConfigManager.configureRC(exprationDuration: exprationDuration)
        return RemoteConfig.remoteConfig().configValue(forKey: key).boolValue
    }
    
    static func rcValueInteger(forKey key: String, exprationDuration: TimeInterval = 43200.0) -> Int {
        RemoteConfigManager.configureRC(exprationDuration: exprationDuration)
        return RemoteConfig.remoteConfig().configValue(forKey: key).numberValue.intValue
    }
    
    private func RCsetupRemoteConfigDefaults() {
        RemoteConfig.remoteConfig().setDefaults(fromPlist: "RemoteConfigDefault")
    }
    
    private func RcfetchRemoteConfig(exprationDuration: TimeInterval) {
        
        var expirationDuration = 0.0
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: exprationDuration) { [weak self] status, err in
            if let error = err {
                return
            }
            if status == .success {
                RemoteConfig.remoteConfig().activate()
            }
        }
    }
    
    private static func configureRC(exprationDuration: TimeInterval) {
        let rcmanager = RemoteConfigManager()
        rcmanager.RCsetupRemoteConfigDefaults()
#if STAGING || DEBUG
        //rcmanager.RcfetchRemoteConfig(exprationDuration: 10800) //TODO: - verificar valor...
        rcmanager.RcfetchRemoteConfig(exprationDuration: 0.0)
#else
        //rcmanager.RcfetchRemoteConfig(exprationDuration: exprationDuration)
        rcmanager.RcfetchRemoteConfig(exprationDuration: 0.0)
#endif
    }
    
    static func listener(completion: @escaping() -> Void) {
        RemoteConfig.remoteConfig().addOnConfigUpdateListener { configUpdate, error in
          guard let configUpdate, error == nil else {
            print("Error listening for config updates: \(error)")
              return
          }
            RemoteConfig.remoteConfig().activate { changed, error in
            guard error == nil else { return }
               completion()
          }
        }
    }
}
