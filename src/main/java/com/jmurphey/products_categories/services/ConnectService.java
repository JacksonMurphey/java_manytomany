package com.jmurphey.products_categories.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmurphey.products_categories.models.Category;
import com.jmurphey.products_categories.models.Product;
import com.jmurphey.products_categories.repositories.CategoryRepo;
import com.jmurphey.products_categories.repositories.ProductRepo;

@Service
public class ConnectService {
	
	@Autowired
	private ProductRepo productRepo;
	
	@Autowired
	private CategoryRepo categoryRepo;
	
	
	
	// Create Object Methods 
	public Product createProduct(Product product) {
		return productRepo.save(product);
	}
	
	public Category createCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	
	
	// Find All Methods
	public List<Product> findProducts(){
		return productRepo.findAll();
	}
	
	public List<Category> findCategories(){
		return categoryRepo.findAll();
	}
	
	
	
	// Find One Methods 
	public Product getOneProduct(Long id) {
		return this.productRepo.findById(id).orElse(null);
	}
	
	public Category getOneCategory(Long id) {
		return this.categoryRepo.findById(id).orElse(null);
	}
	
	
	
	// Find All Methods: Relationship Lists
	public List<Category> getCategoriesOfProduct(Product product){
		return categoryRepo.findAllByProducts(product);
	}
	
	public List<Product> getProductsOfCategory(Category category){
		return productRepo.findAllByCategories(category);
	}
	
	
	
	// Find Object Not containing Methods: Relationship Lists
	public List<Category> getCategoriesNotInProduct(Product product){
		return categoryRepo.findByProductsNotContains(product);
	}
	
	public List<Product> getProductsNotInCategory(Category category){
		return productRepo.findByCategoriesNotContains(category);
	}
	
	
	
	// Add to the Relationship
	public void addProduct(Product product, Category category) {
		
		List<Product> productsList = category.getProducts();
		productsList.add(product);
		this.categoryRepo.save(category);
		
	}
	
	public void addCategory(Product product, Category category) {
		
		List<Category> categoriesList = product.getCategories();
		categoriesList.add(category);
		productRepo.save(product);
		
	}
	
	
	
	// Search For Product/Category
	public List<Product> searchForProduct(String search){
		return productRepo.findByNameContaining(search);
	}
	
	public List<Category> searchForCategories(String search){
		return categoryRepo.findByNameContaining(search);
	}
	
	
}
