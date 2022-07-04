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
    
    func transformResponseToEntity(request: Request?, response: Response) -> Entity
    func transformModelToEntity(request: Request?, response: Response) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
    func transformResponseToDomain(request: Request?, response: Response) -> Domain
    func transformDomainToEntity(domain: Domain) -> Entity
    
}
