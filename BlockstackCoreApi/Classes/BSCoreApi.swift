
public typealias BSApiCompletionHandler<T> = (_ object: T?, _ error: Error?) -> Void

public class BSCoreApi
{
    
}

//MARK: Administrative API
extension BSCoreApi
{
    public static func ping(page : Int = 0, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        var request = URLRequest(url: URL(string: BSEndpoint.pingPath())!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Names
extension BSCoreApi{
    
    public static func allNames(page : Int = 0, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSURLHelpers.buildURL(with: BSEndpoint.namesPath(), queryParams: ["page": String(page)])!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
    
    public static func nameInfo(for name: String, _ handler : @escaping BSApiCompletionHandler<Data> )
    {
        let url =  BSEndpoint.namesPath(name: name)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
    
    public static func nameHistory(for name: String, _ handler : @escaping BSApiCompletionHandler<Data> )
    {
        let url =  BSEndpoint.nameHistoryPath(name: name)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
    
    public static func zoneFile(for name: String, with zoneFileHash : String, _ handler : @escaping BSApiCompletionHandler<Data> )
    {
        let url =  BSEndpoint.nameZonefilePath(name: name, zoneFileHash: zoneFileHash)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Addresses
extension BSCoreApi
{
    public static func namesOwned(on blockchain: String, for address : String, _ handler : @escaping BSApiCompletionHandler<Data> )
    {
        let url =  BSEndpoint.namesOwnedPath(blockChain: blockchain, address: address)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Namespaces
extension BSCoreApi
{
    public static func allNamespaces( _ handler : @escaping BSApiCompletionHandler<Data> )
    {
        let url =  BSEndpoint.namespacesPath()
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
    
    public static func namespaceNames(namespace : String, page : Int = 0, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSURLHelpers.buildURL(with: BSEndpoint.namespaceNamesPath(namespace: namespace), queryParams: ["page": String(page)])!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Prices
extension BSCoreApi
{
    //get namespace price
    public static func namespacePrice(namespace : String, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSEndpoint.namespacePricePath(namespace: namespace)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
    
    //get name price
    public static func namePrice(name : String, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSEndpoint.namePricePath(name: name)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Blockchains
extension BSCoreApi
{
    public static func consensusHash(blockchain : String, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSEndpoint.consensusPath(blockchain: blockchain)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
    
    public static func pendingTransactions(blockchain : String, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSEndpoint.pendingTransactionPath(blockchain: blockchain)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Users
extension BSCoreApi
{
    public static func userProfile(username : String, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSEndpoint.userPath(user: username)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}

//MARK: Search
extension BSCoreApi
{
    public static func search(query : String, _ handler : @escaping BSApiCompletionHandler<Data>)
    {
        let url =  BSURLHelpers.buildURL(with: BSEndpoint.searchPath(), queryParams: ["query": query])!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                handler(data, error)
            }
        }).resume()
    }
}
