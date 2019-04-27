using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace pract_lab3
{
    public class Service1 : IService1
    {
        private DataContext db = new DataContext();
        public Client GetClient(int id)
        {
           return db.Client.Find(id);           
        }
        public IEnumerable<Client> GetClients()
        {         
            return db.Client.ToList();          
        }

        public int StoreClient(Client client)
        {
            db.Client.Add(client);                    
            return db.SaveChanges();
        }

        public int UpdClient(int id, string fio)
        {
            var UpddClient = db.Client.Find(id);
            UpddClient.fio = fio;
            return db.SaveChanges();
        }

        public int DelClient(int id)
        {
           db.Client.Remove(db.Client.Find(id));
           return db.SaveChanges(); 
        }

        public Service GetService(int id)
        {
            return db.Service.Find(id);
        }
        public IEnumerable<Service> GetServices()
        {
            return db.Service.ToList();
        }

        public int StoreService(Service service)
        {
            db.Service.Add(service);
            return db.SaveChanges();
        }

        public int UpdService(int id, string name)
        {
            var UpddService = db.Service.Find(id);
            UpddService.name = name;
            return db.SaveChanges();
        }

        public int DelService(int id)
        {
            db.Service.Remove(db.Service.Find(id));
            return db.SaveChanges();
        }

        public Order GetOrder(int id)
        {
            return db.Order.Find(id);
        }
        public IEnumerable<Order> GetOrders()
        {
            return db.Order.ToList();
        }

        public int StoreOrder(Order order)
        {
            db.Order.Add(order);
            return db.SaveChanges();
        }

        public int UpdOrder(int id, int client_id, int service_id, DateTime date)
        {
            var UpddOrder = db.Order.Find(id);
            UpddOrder.client_id = client_id;
            UpddOrder.service_id = service_id;
            UpddOrder.date = date;
            return db.SaveChanges();
        }

        public int DelOrder(int id)
        {
            db.Order.Remove(db.Order.Find(id));
            return db.SaveChanges();
        }
    }
}
