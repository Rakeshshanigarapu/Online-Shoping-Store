using OnlineShoppingStore.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingStore.Domain.Concrete
{
   public class FormsIAuthenticationProvider:IAuthentication
    {
       private readonly OnlineShopStoreDBEntities context = new OnlineShopStoreDBEntities();
       public bool Authenticate(string username, string password)
       {
           var result = context.Users.FirstOrDefault(u => u.Username == username && u.Password == password);
           if (result == null)
               return false;
           return true;
                     
       }
       public bool Logout()
       {
           return true;
       } 
    }
}
