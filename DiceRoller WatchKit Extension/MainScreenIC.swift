//
//  MainScreenIC.swift
//  DiceRoller
//
//  Created by Michael Litman on 10/7/15.
//  Copyright © 2015 awesomefat. All rights reserved.
//

import WatchKit
import Foundation


class MainScreenIC: WKInterfaceController
{

    @IBOutlet var theTable: WKInterfaceTable!
    
        
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        let prefs = NSUserDefaults.standardUserDefaults()
        let theDiceStrings = prefs.valueForKey("theDiceStrings");
        
        if(theDiceStrings != nil)
        {
            let vals = theDiceStrings as! NSArray
            for s in vals
            {
                DiceRollerCore.theRolls.append(Roll(rollString: s as! String))
            }
            self.generateTable()
        }
    }

    func generateTable()
    {
        self.theTable.setNumberOfRows(DiceRollerCore.theRolls.count, withRowType: "cell")
        
        for(var i = 0; i < DiceRollerCore.theRolls.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! rollRow
            currRow.qtyLabel.setText("\(DiceRollerCore.theRolls[i].qty)")
            currRow.sidesLabel.setText("D\(DiceRollerCore.theRolls[i].numSides)")
            currRow.nameLabel.setText("Name: \(DiceRollerCore.theRolls[i].name)")
        }

    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        <#code#>
    }
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if(DiceRollerCore.hasDice)
        {
            //we need to add the new Roll to our array of Rolls
            DiceRollerCore.theRolls.append(Roll(qty: DiceRollerCore.numDice, numSides: DiceRollerCore.numSides, name: DiceRollerCore.currName))
            DiceRollerCore.resetValues()
            
            var theDiceStrings = [String]()
            for(var i = 0; i < DiceRollerCore.theRolls.count; i++)
            {
                theDiceStrings.append(DiceRollerCore.theRolls[i].toString())
            }
            
            let prefs = NSUserDefaults.standardUserDefaults()
            prefs.setObject(theDiceStrings, forKey: "theDiceStrings");
            
            //we need to rebuild our table
            self.generateTable()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
