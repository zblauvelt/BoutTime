//
//  Events.swift
//  BoutTime
//
//  Created by Zachary Blauvelt on 8/24/17.
//  Copyright © 2017 ZackBlauvelt. All rights reserved.
//

import Foundation

protocol Event {
    var eventDescription: String { get }
    var eventYear: Int { get }
}

class AmericanEvents: Event {
    var eventDescription: String
    var eventYear: Int
    
    init(eventDescription: String, eventYear: Int) {
        self.eventDescription = eventDescription
        self.eventYear = eventYear
    }
}

var americanEvents: [AmericanEvents] = [
    AmericanEvents(eventDescription: "Christopher Columbus discovers America", eventYear: 1492),
    AmericanEvents(eventDescription: "Giovanni Verrazano discovers New York Bay", eventYear: 1524),
    AmericanEvents(eventDescription: "The Boston Massacre - Four workers shot by British troops in Boston", eventYear: 1770),
    AmericanEvents(eventDescription: "The Boston Tea Party - Massachusetts patriots dressed as Mohawk Indians protest against the British Tea Act by dumping crates of tea into Boston Harbor.", eventYear: 1773),
    AmericanEvents(eventDescription: "Thomas Jefferson presents the United States Declaration of Independence", eventYear: 1776),
    AmericanEvents(eventDescription: "U.S. slave trade with Africa ends", eventYear: 1808),
    AmericanEvents(eventDescription: "Fifth President of the US is James Monroe", eventYear: 1817),
    AmericanEvents(eventDescription: "Gold discovered in California", eventYear: 1848),
    AmericanEvents(eventDescription: "Battle of Gettysburg", eventYear: 1863),
    AmericanEvents(eventDescription: "Ford Motor Company formed", eventYear: 1903),
    AmericanEvents(eventDescription: "WW1 started 28", eventYear: 1914),
    AmericanEvents(eventDescription: "Germany invades Poland; World War II begins", eventYear: 1939),
    AmericanEvents(eventDescription: "The Cold War began between the United States and the Soviet Union", eventYear: 1946),
    AmericanEvents(eventDescription: "Thirty - Fifth President of the US is John Fitzgerald Kennedy", eventYear: 1961),
    AmericanEvents(eventDescription: "Watergate burglary", eventYear: 1972),
    AmericanEvents(eventDescription: "Oklahoma City bombing", eventYear: 1995),
    AmericanEvents(eventDescription: "Hurricane Katrina", eventYear: 2005),
    AmericanEvents(eventDescription: "Los Angeles riots", eventYear: 1992),
    AmericanEvents(eventDescription: "Neil Armstrong walks on the moon", eventYear: 1969),
    AmericanEvents(eventDescription: "Detroit race riot", eventYear: 1965),
    AmericanEvents(eventDescription: "Empire State Building opens", eventYear: 1931),
    AmericanEvents(eventDescription: "First radio broadcast in Pittsburgh, Pennsylvania", eventYear: 1920),
    AmericanEvents(eventDescription: "US enters World War I", eventYear: 1917),
    AmericanEvents(eventDescription: "Japan attack on Pearl Harbor", eventYear: 1941),
    AmericanEvents(eventDescription: "Lincoln assassinated", eventYear: 1865)
    
]




























