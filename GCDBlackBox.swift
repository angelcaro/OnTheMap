//
//  GCDBlackBox.swift
//  OnTheMap
//
//  Created by Angel Caro on 5/11/16.
//  Copyright © 2016 AngelCaro. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(updates: () -> Void) {
    dispatch_async(dispatch_get_main_queue()) {
        updates()
    }
}