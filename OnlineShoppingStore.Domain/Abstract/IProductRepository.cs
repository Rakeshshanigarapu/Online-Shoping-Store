﻿using OnlineShoppingStore.Domain.Concrete;
using OnlineShoppingStore.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShoppingStore.Domain.Abstract
{
   public interface IProductRepository
    {
       IEnumerable<Product> Products { get; }
       IEnumerable<Category> Categories { get; }

       void SaveProduct(Product product);

       Product DeleteProduct(int productId);
    }
}
