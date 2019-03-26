import Foundation


class networkingClient
    
{
    typealias webResponse = (Data?) -> Void // to make the request parameter cleaner
    
    func getJson(url: String ,mapItTo:[Any], completion: @escaping webResponse) // passing block as parameter to handle the data later when the function is called
    {
         guard let Url = URL(string: url ) else { return }
        //request the desired url through URLSession
        URLSession.shared.dataTask(with: Url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            //Implement JSON decoding and parsing
            completion(data)
        }.resume()
    }
}
