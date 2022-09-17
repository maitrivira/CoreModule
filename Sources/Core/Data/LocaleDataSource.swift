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
    
    func lists(request: String?) -> Observable<[Response]>
    func add(entities: Request) -> Observable<Bool>
    func get(request id: String) -> Observable<Response>
    func delete(request data: Request) -> Observable<Bool>
    
}
