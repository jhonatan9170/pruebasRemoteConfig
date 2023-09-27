//
//  ContentView.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var managerConfig: ManaganerCofig
    
    var body: some View {
        
        
        VStack {
            if managerConfig.maintance {
                GSEktBrokenAppView(generalConfig: managerConfig.config)
            } else if managerConfig.forceUpdate {
                GSEKTForceUpdateView(generalConfig: managerConfig.config)
            } else {
                //GSEKTMainNavView()
                
                if managerConfig.optionalUpdate {
                    AlertCustom(style: .info, title: "", message: "Tu App Elektra tiene novedades para ti. Actualízala para no perdértelas. Actualizar mi App.", tap2AppStore: true , systemImage: "iconInfo", showingAlert: $managerConfig.optionalUpdate, textColor: .alertSuccessText, isImage: true)
                   
                }
                Text("Home")
            }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
