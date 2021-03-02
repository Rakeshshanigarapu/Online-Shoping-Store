using OnlineShoppingStore.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingStore.Domain.Concrete
{
   public class EfProductRepository:IProductRepository
   {
       private readonly OnlineShopStoreDBEntities context = new OnlineShopStoreDBEntities();
       public IEnumerable<Product> Products
       {
           get { return context.Products; }
       }
       public IEnumerable<Category> Categories
       {
           get { return context.Categories; }
       }


       public void SaveProduct(Product product)
       {
           if (product.Id == 0)
           {
               context.Products.Add(product);
           }
           else
           {
               Product dbEntity = context.Products.Find(product.Id);
               if (dbEntity != null)
               {
                   dbEntity.Name = product.Name;
                   dbEntity.Description = product.Description;
                   dbEntity.Price = product.Price;
                   dbEntity.CategoryId = product.CategoryId;
               }
           }
           context.SaveChanges();
       }


       public Product DeleteProduct(int productId)
       {
           Product dbEntry = context.Products.Find(productId);
           if (dbEntry != null)
           {
               context.Products.Remove(dbEntry);
               context.SaveChanges();
           }
           return dbEntry;
       }
   }
}
