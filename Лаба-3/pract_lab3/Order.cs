using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Web;

namespace pract_lab3
{
    public class Order : DbContext
    {
        public Order() : base("name=conn")
        { }
        public int id { get; set; }
        public int client_id { get; set; }
        public int service_id { get; set; }
        public DateTime date { get; set; }
    }
}