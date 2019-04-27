using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace pract_lab3
{
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        Client GetClient(int id);

        [OperationContract]
        IEnumerable<Client> GetClients();

        [OperationContract]
        int StoreClient(Client client);

        [OperationContract]
        int UpdClient(int id, string fio);

        [OperationContract]
        int DelClient(int id);

        [OperationContract]
        Service GetService(int id);

        [OperationContract]
        IEnumerable<Service> GetServices();

        [OperationContract]
        int StoreService(Service service);

        [OperationContract]
        int UpdService(int id, string name);

        [OperationContract]
        int DelService(int id);

        [OperationContract]
        Order GetOrder(int id);

        [OperationContract]
        IEnumerable<Order> GetOrders();

        [OperationContract]
        int StoreOrder(Order order);

        [OperationContract]
        int UpdOrder(int id, int client_id, int service_id, DateTime date);

        [OperationContract]
        int DelOrder(int id);
    }

}
