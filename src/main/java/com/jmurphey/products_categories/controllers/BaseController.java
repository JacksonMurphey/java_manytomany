package com.jmurphey.products_categories.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.jmurphey.products_categories.models.Category;
import com.jmurphey.products_categories.models.Product;
import com.jmurphey.products_categories.services.ConnectService;

@Controller
@RequestMapping("/")
public class BaseController {
	
	@Autowired
	ConnectService service;
	
	
// --- Get Mapping ---
	
	@GetMapping("")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/products/new")
	public String startProduct(@ModelAttribute("product")Product product,  Model model) {
		model.addAttribute("products", service.findProducts());
		return "product.jsp";
	}
	
	@GetMapping("/categories/new") 
	public String startCategory(@ModelAttribute("category")Category category, Model model) {
		model.addAttribute("categories", service.findCategories());
		return "category.jsp";
	}
	
	@GetMapping("/products/{id}")
	public String viewProduct(@PathVariable("id")Long id, Model model) {
		Product product = service.getOneProduct(id);
		model.addAttribute("product", product);
		model.addAttribute("notACat" , service.getCategoriesNotInProduct(product));
		return "showProduct.jsp";
	}
	
	@GetMapping("/categories/{id}")
	public String viewCategory(@PathVariable("id")Long id, Model model) {
		Category category = service.getOneCategory(id);
		model.addAttribute("category", category);
		model.addAttribute("notAProd", service.getProductsNotInCategory(category));
		return "showCategory.jsp";
	}
	
	
	
// --- Quick jump to :: Search for  --- 
	
	@GetMapping("/jumptoproduct")
	public String jumpToProduct(@RequestParam("product")Product product) {
		return String.format("redirect:/products/%s", product.getId());
	}
	
	@GetMapping("/jumptocategory")
	public String jumpToCategory(@RequestParam("category")Category category) {
		return String.format("redirect:/categories/%s", category.getId());
	}
	
	@GetMapping("/search/products")
	public String showArtist(@RequestParam("name") String name, Model model, @ModelAttribute("product") Product product) {
		
		model.addAttribute("name", name);
		model.addAttribute("products", this.service.searchForProduct(name));
		return "searchProduct.jsp";
		
	}
	
	@GetMapping("/search/categories")
	public String showArtist(@RequestParam("name") String name, Model model, @ModelAttribute("category") Category category) {
		
		model.addAttribute("name", name);
		model.addAttribute("categories", this.service.searchForCategories(name));
		return "searchCategory.jsp";
		
	}
	
	
	
// --- POST Mapping ---
	
	@PostMapping("/products/new")
	public String createProduct(@Valid @ModelAttribute("product")Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "product.jsp";
		} else {
			service.createProduct(product);
			return String.format("redirect:/products/%s", product.getId());
		}
	}
	
	@PostMapping("/categories/new")
	public String createCategory(@Valid @ModelAttribute("category")Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "category.jsp";
		} else {
			service.createCategory(category);
			return String.format("redirect:/categories/%s", category.getId());
		}
	}
	
	
	@PostMapping("/products/add/{id}")
	public String addCategorytoProduct(@RequestParam("categories")Long id, @PathVariable("id")Long productId ) {
		Product product = service.getOneProduct(productId);
		Category category = service.getOneCategory(id);
		this.service.addCategory(product, category);
		return String.format("redirect:/products/%s", productId);
	}
	
	
	@PostMapping("/categories/add/{id}")
	public String addProductToCategory(@RequestParam("products")Long id, @PathVariable("id")Long categoryId) {
		Category category = service.getOneCategory(categoryId);
		Product product = service.getOneProduct(id);
		this.service.addProduct(product, category);
		return String.format("redirect:/categories/%s", categoryId);
	}
	
	
	
}
