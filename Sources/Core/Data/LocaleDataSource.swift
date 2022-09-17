//
//  File.swift
//  
//
//  Created by Maitri Vira on 20/05/22.
//

import RxSwift

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func lists() -> AnyPublisher<[Response], Error>
    func list(request: id: Int) -> AnyPublisher<Bool, Error>
    func add(entities: Request) -> AnyPublisher<Bool, Error>
    func remove(id: Int) -> AnyPublisher<Bool, Error>
    
}
