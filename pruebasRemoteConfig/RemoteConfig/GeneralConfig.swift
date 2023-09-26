//
//  GeneralConfig.swift
//  GSEKTWorkSpace
//
//  Created by Antonio Garcia Espindola on 09/12/22.
//

import Foundation

class ManaganerCofig: ObservableObject {
    
    @Published var config: GeneralConfig = GeneralConfig()
    @Published var optionalUpdate: Bool = false
    
    func loadParameters(){
        
        let currentAmbient = String(describing: "PROD")
        let currentBuild = RemoteConfigKey.build //EktDeviceMobile.getBuildAppEkt()
        let configs = GSEktRCHelper.loadGeneralConfig()
        GSEktRCHelper.listenerLoad(){[weak self] configs in
            if let config = configs.first{$0.build == currentBuild}{
                DispatchQueue.main.async {
                    self?.config = config
                    self?.optionalUpdate = config.actualizacion_opcional
                    
                }
                
            }
        }
        
        //config = configs.first{$0.build == currentBuild}
        
        /*guard let config = configs.first{$0.build == currentBuild} else {
            return
        }*/
        
        guard let config = configs.first(where: { $0.build == currentBuild }) else {
                    return
                }
        self.config = config
        self.optionalUpdate = config.actualizacion_opcional
        /*if let config = configs.first{$0.build == currentBuild}{
            self.config = config
        }*/
    }
}


struct GeneralConfig: Codable {
    var build: String
    var ambiente: String
    var mantenimiento: Mantenimiento
    var credito_ekt: Bool
    var sdk_pagos: Bool
    var actualizacion_opcional: Bool
    var actualizacion: Bool
    var logs: Bool
    var blindaje: Bool
    var push_notification: Bool
    var paypal: Bool
    var enabled_survey: Bool
    var story_delivery: Bool
    var travel: Bool
    var session_close: Bool
    var quick_purchase: Bool
    var discount_first_purchase: Bool
    var cancel_purchase: Bool
    var simplified_register: Bool?
    var admin_sessions: Bool?
    var baz_payment: Bool?
    
    init() {
        self.build = ""
        self.ambiente = ""
        self.mantenimiento = Mantenimiento(enable: false, message: "")
        self.credito_ekt = false
        self.sdk_pagos = false
        self.actualizacion_opcional = false
        self.actualizacion = false
        self.logs = false
        self.blindaje = false
        self.push_notification = false
        self.paypal = false
        self.enabled_survey = false
        self.story_delivery = false
        self.travel = false
        self.session_close = false
        self.quick_purchase = false
        self.discount_first_purchase = false
        self.cancel_purchase = false
        self.simplified_register = false
        self.admin_sessions = false
        self.baz_payment = false
    }
    
   /* func getDataRC() -> GeneralConfig {
        let currentAmbient = String(describing: "PROD")
        let currentBuild = RemoteConfigKey.build //EktDeviceMobile.getBuildAppEkt()
        let configs = GSEktRCHelper.loadGeneralConfig()
        
       
        for config in configs {
            
            //La evaluacion será por build
            if config.ambiente == "na" && config.build == currentBuild {
                
                print("DEBUGER-JIM \(config.credito_ekt)")
                self.ambiente = config.ambiente
                self.build = config.build
                self.mantenimiento = config.mantenimiento
                self.credito_ekt = config.credito_ekt
                self.sdk_pagos = config.sdk_pagos
                self.actualizacion_opcional = config.actualizacion_opcional
                self.actualizacion = config.actualizacion
                self.logs = config.logs
                self.blindaje = config.blindaje
                self.push_notification = config.push_notification
                self.paypal = config.paypal
                self.enabled_survey = config.enabled_survey
                self.story_delivery = config.story_delivery
                self.travel = config.travel
                self.session_close = config.session_close
                self.quick_purchase = config.quick_purchase
                self.discount_first_purchase = config.discount_first_purchase
                self.cancel_purchase = config.cancel_purchase
                self.simplified_register = config.simplified_register
                self.admin_sessions = config.admin_sessions
                self.baz_payment = config.baz_payment
            //La evaluación sera por ambiente
            } else if config.ambiente == currentAmbient {
                
                self.ambiente = config.ambiente
                self.build = config.build
                self.mantenimiento = config.mantenimiento
                self.credito_ekt = config.credito_ekt
                self.sdk_pagos = config.sdk_pagos
                self.actualizacion_opcional = config.actualizacion_opcional
                self.actualizacion = config.actualizacion 
                self.logs = config.logs
                self.blindaje = config.blindaje
                self.push_notification = config.push_notification
                self.paypal = config.paypal
                self.enabled_survey = config.enabled_survey
                self.story_delivery = config.story_delivery
                self.travel = config.travel
                self.session_close = config.session_close
                self.quick_purchase = config.quick_purchase
                self.discount_first_purchase = config.discount_first_purchase
                self.cancel_purchase = config.cancel_purchase
                self.simplified_register = config.simplified_register
                self.admin_sessions = config.admin_sessions
                self.baz_payment = config.baz_payment
                return self
            }
        }
        
        return self
    }*/
    
    //Build 147 > 146
    func actualizacionGlobal() -> Bool {
        
        return (Int(self.build ) ?? 1 > Int(RemoteConfigKey.build) ?? 1) && self.actualizacion
    }
}



class  Mantenimiento: Codable, ObservableObject {
    var enable: Bool
    var message: String
    
    init(enable: Bool, message: String) {
        self.enable = enable
        self.message = message
    }
}

class  SplashParameters: Codable, ObservableObject {
    var backgroundColor: String
    var titulo: String
    var subtitulo: String
    
    init() {
        self.backgroundColor = ""
        self.titulo = ""
        self.subtitulo = ""
    }
    
    func getDataRC() -> SplashParameters {
        let currentAmbient = RemoteConfigKey.build
        let config = GSEktRCHelper.loadSplashConfig()
//        print("SplashParameters vars:  \(config.backgroundColor), \(config.titulo), \(config.subtitulo)")
 
        self.backgroundColor = config.backgroundColor
        self.titulo = config.titulo
        self.subtitulo = config.subtitulo
        
        return self
    }
}
