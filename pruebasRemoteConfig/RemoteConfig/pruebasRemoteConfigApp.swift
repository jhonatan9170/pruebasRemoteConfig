//
//  pruebasRemoteConfigApp.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 20/09/23.
//

import SwiftUI
import UIKit
import Firebase
@main
struct pruebasRemoteConfigApp: App {
        @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
        
        @StateObject var managerConfig = ManaganerCofig()
       
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .task {
                        managerConfig.loadParameters()
                        managerConfig.setListener()
                    }
                    .environmentObject(managerConfig)
            }
        }
    }

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //registerNotificationCategories()
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenhx = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("CAEO - application - didRegisterForRemoteNotificationsWithDeviceToken - deviceTokenhx \(deviceTokenhx ?? "")")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    
    // Le dice a la aplicación que llegó una notificación remota que indica que hay datos que buscar.
    // Tells the app that a remote notification arrived that indicates there is data to be fetched.
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        DeepLinkHandler.boolOpenUrlOnSplashScreen = true
//        DeepLinkHandler.splashUrl = url
//        DeepLinkHandler.taggeoDeepLinks(url: url)
        return true
    }
    
    // MARK: Push Notificati
    
    private func registerNotificationCategories() {
        let openBoardAction = UNNotificationAction(identifier: UNNotificationDefaultActionIdentifier, title: "Open Board", options: UNNotificationActionOptions.foreground)
        let contentAddedCategory = UNNotificationCategory(identifier: "content_added_notification", actions: [openBoardAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([contentAddedCategory])
    }
    
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    // Pregunta al delegado cómo manejar una notificación que llegó mientras la aplicación se ejecutaba en primer plano.
    // Asks the delegate how to handle a notification that arrived while the app was running in the foreground.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if let prueba = notification.request.content.attachments.first {
            if prueba.url.startAccessingSecurityScopedResource() {
                let imageDate = try? Data.init(contentsOf: prueba.url)
                if let img = imageDate {
                    print("CAEO")
                }
            }
        }
        
        let userInfo = notification.request.content.userInfo
        
        completionHandler([[.banner, .badge, .sound]])
    }
    
    // Captura el evento cuando se pulsa la notificación push.
    // Pide al delegado que procese la respuesta del usuario a una notificación entregada.
    // Asks the delegate to process the user's response to a delivered notification.
    
    // Pide al delegado que muestre la configuración de notificaciones en la aplicación.
    // Asks the delegate to display the in-app notification settings.
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        // Esto por si se quiere obligar al usuario a ir a la configuración para que administre los permisos de notificaciones.
    }
}
