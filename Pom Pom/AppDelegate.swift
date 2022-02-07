//
//  Pom_PomApp.swift
//  Pom Pom
//
//  Created by s b on 07.02.2022.
//

import SwiftUI

private let nc = NotificationCenter.default


@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem!
    
    private func createNotification (_ notificationName: String) {
        var notification = NSUserNotification()
        notification.title = notificationName
        //notification.informativeText = "The body of this Swift notification"
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }
    
    private func changeStatusBarButton(_ icon:String) {
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: icon, accessibilityDescription: "1")
        }
    }
    
    @objc func start() {
        self.createNotification("25 min to go!")
        _ = Timer.scheduledTimer(withTimeInterval: 1500.0, repeats: true) { timer in
            self.createNotification("Time to break!")
            self.changeStatusBarButton("brain")
        }
        _ = Timer.scheduledTimer(withTimeInterval: 300.0, repeats: true) { timer in
            self.createNotification("Time to break!")
            self.changeStatusBarButton("figure.walk")
        }
        self.changeStatusBarButton("alarm")
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        changeStatusBarButton("alarm")
        
        let menu = NSMenu()
        let startMenuItem = NSMenuItem(title: "Start", action: #selector(start) , keyEquivalent: "1")
        menu.addItem(startMenuItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
        
    }
}
