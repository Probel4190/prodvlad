using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace pract_lab3
{
    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class DataContext : DbContext
    {
        public DataContext() : base("name=conn")
        { }

        public DbSet<Client> Client { get; set; }
        public DbSet<Service> Service { get; set; }
        public DbSet<Order> Order { get; set; }
    }
}