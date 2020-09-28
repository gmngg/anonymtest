//
//  Injectable.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import Foundation

protocol Injectable {
    associatedtype Container
    init(container: Container)
}
