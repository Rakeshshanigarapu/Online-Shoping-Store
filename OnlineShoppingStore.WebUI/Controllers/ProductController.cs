using OnlineShoppingStore.Domain.Abstract;
using OnlineShoppingStore.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShoppingStore.WebUI.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductRepository repository;
        public int PageSize = 5;
        public ProductController(IProductRepository repo)
        {
            repository = repo;
        }
        public ViewResult List(string category, int page=1)
        {
            int? _categoryId =null;
            var res=(from x in repository.Categories where x.Name == category select x.Id).FirstOrDefault();

            if (res != 0)
                _categoryId = res; 

            ProductsListViewModel model = new ProductsListViewModel
            {
                Products = repository.Products
                .Where(p => _categoryId == null || p.CategoryId == _categoryId)
                     .OrderBy(p => p.Id)
                     .Skip((page - 1) * PageSize)
                     .Take(PageSize),
                PagingInfo = new PagingInfo
                {
                    CurrentPage = page,
                    ItemsPerPage = PageSize,
                    TotalItems =_categoryId==null?
                                repository.Products.Count():
                                repository.Products.Where(p=>p.CategoryId==_categoryId).Count()
                },
                CurrentCategory=category
            };
            
            return View(model);
        }
    }
}