pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

const products = pm.response.json();
let defectiveProducts = [];

products.forEach((product, index) => {
    let errors = [];

    if (!product.title || product.title.trim() === "") {
        errors.push("Missing or empty title");
    }

    if (typeof product.price !== 'number' || product.price < 0) {
        errors.push("Invalid price");
    }

    if (!product.rating || typeof product.rating.rate !== 'number' || product.rating.rate > 5) {
        errors.push("Invalid rating.rate");
    }

    if (errors.length > 0) {
        defectiveProducts.push({
            index: index,
            id: product.id,
            title: product.title,
            errors: errors
        });
    }
});

console.log("Defective Products:", defectiveProducts);
pm.environment.set("defectiveProducts", JSON.stringify(defectiveProducts));
