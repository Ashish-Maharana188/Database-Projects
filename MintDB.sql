-- Identify products with low sales activity and evaluate candidates for discontinuation

WITH ProductSales AS (
    SELECT
        products.productCode,
        products.productName,
        products.productLine,
        products.quantityInStock,
        COALESCE(SUM(orderdetails.quantityOrdered), 0) AS totalQuantityOrdered,
        COALESCE(SUM(orderdetails.quantityOrdered * orderdetails.priceEach), 0) AS totalSales
    FROM
        products
    LEFT JOIN
        orderdetails ON products.productCode = orderdetails.productCode
    GROUP BY
        products.productCode, products.productName, products.productLine, products.quantityInStock
)
SELECT
    ProductSales.productCode,
    ProductSales.productName,
    ProductSales.productLine,
    ProductSales.quantityInStock,
    ProductSales.totalQuantityOrdered,
    ProductSales.totalSales,
	warehouses.warehousename,
	warehouses.warehousecode
FROM
    ProductSales, warehouses
WHERE
    ProductSales.totalQuantityOrdered = 0 OR (ProductSales.totalQuantityOrdered > 0 AND ProductSales.totalSales < 0);

-- Analyze the profitability of each product and prioritize those with higher margins

SELECT
    products.productCode,
    products.productName,
    products.productLine,
    products.quantityInStock,
    COALESCE(SUM(orderdetails.quantityOrdered), 0) AS totalQuantityOrdered,
    COALESCE(SUM(orderdetails.quantityOrdered * orderdetails.priceEach), 0) AS totalSales,
    COALESCE(SUM(orderdetails.quantityOrdered * (orderdetails.priceEach - products.buyPrice)), 0) AS totalProfit
FROM
    products
LEFT JOIN
    orderdetails ON products.productCode = orderdetails.productCode
GROUP BY
    products.productCode, products.productName, products.productLine, products.quantityInStock
HAVING
    COALESCE(SUM(orderdetails.quantityOrdered), 0) > 0
ORDER BY
    totalProfit DESC;


