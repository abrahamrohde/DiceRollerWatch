//
//  InterfaceController.swift
//  DiceRoller WatchKit Extension
//
//  Created by Michael Litman on 9/25/15.
//  Copyright © 2015 awesomefat. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController
{

    let alert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in })
        
    @IBAction func d4ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%4 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    @IBAction func d6ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%6 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    @IBAction func d8ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%8 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    @IBAction func d10ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%10 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    @IBAction func d12ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%12 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    @IBAction func d20ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%20 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    @IBAction func d100ButtonClicked()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%100 + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
