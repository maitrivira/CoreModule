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
    
    func lists() -> Observable<[Response]>
    func list(request: id: Int) -> Observable<Bool>
    func add(entities: Request) -> Observable<Bool>
    func remove(id: Int) -> Observable<Bool>
    
}
