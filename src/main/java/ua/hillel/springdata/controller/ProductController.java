package ua.hillel.springdata.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ua.hillel.springdata.model.dto.ProductDTO;
import ua.hillel.springdata.model.entity.Product;
import ua.hillel.springdata.service.ProductService;

import java.util.List;

@RestController
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping(params = { "num", "count" })
    public @ResponseBody
    ResponseEntity<List<ProductDTO>> getForPage(@RequestParam("num") int num,
                                                @RequestParam("count") int count,
                                                @RequestParam(name = "categoryId", required = false) Long categoryId) {
        List<ProductDTO> products;
        if (categoryId == null) {
             products = productService.getAllProductsForPage(num, count);
        } else {
            products = productService.getProductsByCategoryForPage(categoryId, num, count);
        }
        return ResponseEntity.ok(products);
    }
}
