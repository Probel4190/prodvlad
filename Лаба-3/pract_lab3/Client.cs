using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace pract_lab3
{
    [Table("client")]
    public class Client : DbContext
    {
        public Client() : base("name=conn")
        { }
        public int id { get; set; }
        public string fio { get; set; }
        public int age { get; set; }
    }
}