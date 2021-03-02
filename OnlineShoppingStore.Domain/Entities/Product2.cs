using OnlineShoppingStore.Domain.Concrete;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingStore.Domain.Entities
{
     [MetadataType(typeof(ProductMD))]
   public partial class Product2
    {
         public class ProductMD
         {
             public int Id { get; set; }
             [Required(ErrorMessage="Please enter name")]
             public string Name { get; set; }
             public string Description { get; set; }
             public decimal Price { get; set; }
             public Nullable<int> CategoryId { get; set; }

             public virtual Category Category { get; set; }
         }
    }
}
