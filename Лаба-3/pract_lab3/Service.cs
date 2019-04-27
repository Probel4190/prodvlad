using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Web;

namespace pract_lab3
{
    [Table("service")]
    public class Service : DbContext
    {
        public Service() : base("name=conn")
        { }
        public int id { get; set; }
        public string name { get; set; }
        public int price { get; set; }
    }
}