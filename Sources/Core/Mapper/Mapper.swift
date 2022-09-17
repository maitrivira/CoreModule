//
//  File.swift
//  
//
//  Created by Maitri Vira on 20/05/22.
//

import Foundation

public protocol Mapper {
    
    associatedtype Request
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(response: Response) -> Entity
    func transformModelToEntity(response: Request) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
    func transformResponseToDomain(response: Response) -> Domain
    func transformDomainToEntity(domain: Domain) -> Entity
    
}
