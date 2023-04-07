package ua.hillel.springdata.service;

import ua.hillel.springdata.model.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getAllCategories();
    Category findCategoryByName(String name);
}
