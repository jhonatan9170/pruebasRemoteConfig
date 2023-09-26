//
//  GSEktRCTools.swift
//  GSEKTWorkSpace

import Foundation
import UIKit

final class GSEktRCHelper {
    
    static func openAppStoreEkt() {
        if let url = URL(string: "https://apps.apple.com/mx/app/elektra/id1610220567") {
            UIApplication.shared.open(url)
        }
    }
    
    static func loadGeneralConfig() -> [GeneralConfig] {
        var configs = [GeneralConfig]()
//#if DEBUG || QA
        //let data = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.generalConfigTest)
//#elseif STAGING
      //  let data = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.generalConfigTest)
//#else
  let data = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.generalConfigTest)
//#endif

        let jsonData = Data(data.utf8)
        let decoder = JSONDecoder()
        
        if let configuraciones = try? decoder.decode(GeneralConfigs.self, from: jsonData) {
            configs = configuraciones.params
        } else {
        }
        
        return configs
    }
    
    static func listenerLoad(completion: @escaping ([GeneralConfig]) -> Void) {
        RemoteConfigManager.listener(){
          
            let decoder = JSONDecoder()
            let data = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.generalConfigTest)
            let jsonData = Data(data.utf8)
            
            if let configuraciones = try? decoder.decode(GeneralConfigs.self, from: jsonData) {
                
                completion(configuraciones.params)
            }
        }
    }
    
    static func loadSplashConfig() -> SplashParameters {
        var configs = SplashParameters()
        let data = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.splashParameters)
        //let data = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.generalConfigTest)
        let jsonData = Data(data.utf8)
        let decoder = JSONDecoder()
        
        if let configuraciones = try? decoder.decode(SplashParameters.self, from: jsonData) {
            configs = configuraciones
        } else {
        }
        
        return configs
    }
    
    
    
    static func validateUpdateVersionApp() -> Bool {
        var validate = false
        let icurrentVersion = RemoteConfigManager.rcValueInteger(forKey: RemoteConfigKey.current_build_ios)
        let buildApp = Int(RemoteConfigKey.build) ?? 0
        
        if buildApp < icurrentVersion {
            validate = true
        }
        return validate
    }
    
    static func validateUpgradeVersionApp() -> Bool {
        var validate = false
        let currentBuild = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.crashesBuildIOS)
        let buildApp = RemoteConfigKey.build
        
        let jsonData = Data(currentBuild.utf8)
        let decoder = JSONDecoder()
        var current: [currentBuildios] = []
        do {
            current = try decoder.decode([currentBuildios].self, from: jsonData)
        } catch {
        }
        for valores in current {
            let compile = valores.build as String
            if compile.contains(buildApp) {
                validate = true
            }
        }
        
        return validate
    }
    
    /*static func validateLogIdenfierUser() -> Bool {
        var validate = false
        let currentLogs = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.logsIdentifierIOS)
        let idclient = UsrDefaults.getIdClient()
        let secureIdCte = EktSecureAlgorithm.getSHA256ByStr(idclient)
        
        let jsonData = Data(currentLogs.utf8)
        let decoder = JSONDecoder()
        var current: [currentLog] = []
        do {
            current = try decoder.decode([currentLog].self, from: jsonData)
        } catch {
        }
        
        for valores in current {
            let compile = valores.sha as String
            if compile.contains(secureIdCte) {
                validate = true
            }
        }
        
        return validate
    }*/
    
    static func validateRemoteConfigCredtEkt() -> (Bool, String) {
        var hiddenCredt = false
        var messg = ""
        let credtEkt = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.crdt_elektra_ios)
        
        let jsonData = Data(credtEkt.utf8)
        let decoder = JSONDecoder()
        var current: [crdtPurchase] = []
        do {
            current = try decoder.decode([crdtPurchase].self, from: jsonData)
        } catch {
        }
        for valores in current {
            let compile = valores.crdt_elektra
            if compile {
                hiddenCredt = true
                messg = valores.message
            }
        }
        return (hiddenCredt, messg)
    }
    
    static func validateRemoteConfigCredtPays() -> (Bool, String) {
        var hiddenCredt = false
        var messg = ""
        let credtEkt = RemoteConfigManager.rcValueString(forKey: RemoteConfigKey.crdt_pays_ios, exprationDuration: 1)
        
        let jsonData = Data(credtEkt.utf8)
        let decoder = JSONDecoder()
        var current: [paysPurchase] = []
        do {
            current = try decoder.decode([paysPurchase].self, from: jsonData)
        } catch {
        }
        for valores in current {
            let compile = valores.crdt_pays
            if compile {
                hiddenCredt = true
                messg = valores.message
            }
        }
        return (hiddenCredt, messg)
    }
    
    
    
}


// MARK: - objects
struct currentBuildios: Codable {
    let build: String
    let message: String
}

struct currentLog: Codable {
    let sha: String
    let message: String
}

struct crdtPurchase: Codable {
    let crdt_elektra: Bool
    let message: String
}

struct paysPurchase: Codable {
    let crdt_pays: Bool
    let message: String
}

//Estructura para genralConfig
//struct generalConfig: Codable {
//    let params: [Param]
//}
//
//struct Param: Codable {
//    let build, ambiente, mantenimiento, creditoEkt: String
//    let sdkPagos, actualizacionOpcional, actualizacion, logs: String
//
//    enum CodingKeys: String, CodingKey {
//        case build, ambiente, mantenimiento
//        case creditoEkt
//        case sdkPagos
//        case actualizacionOpcional
//        case actualizacion, logs
//    }
//}



struct GeneralConfigs: Codable {
    var params: [GeneralConfig]
}

/*
struct GeneralConfig: Codable {
    var build: String
    var ambiente: String
    var mantenimiento: String
    var credito_ekt: String
    var sdk_pagos: String
    var actualizacion_opcional: String
    var actualizacion: String
    var logs: String
    
    init(build: String, ambiente: String, mantenimiento: String, credito_ekt: String, sdk_pagos: String, actualizacion_opcional: String, actualizacion: String, logs: String) {
        self.build = build
        self.ambiente = ambiente
        self.mantenimiento = mantenimiento
        self.credito_ekt = credito_ekt
        self.sdk_pagos = sdk_pagos
        self.actualizacion_opcional = actualizacion_opcional
        self.actualizacion = actualizacion
        self.logs = logs
    }
}
*/

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
