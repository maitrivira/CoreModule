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
    
    func list(request: Request?) -> Observable<[Response]>
    func add(entities: Response) -> Observable<Bool>
    func get(request id: String) -> Observable<Response>
    func delete(request data: Response) -> Observable<Bool>
    
}
