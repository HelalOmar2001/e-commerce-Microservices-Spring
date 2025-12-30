package com.helal.ecommerce.order;

import com.helal.ecommerce.customer.CustomerClient;
import com.helal.ecommerce.exception.BusinessExcepion;
import com.helal.ecommerce.orderline.OrderLineRequest;
import com.helal.ecommerce.orderline.OrderLineService;
import com.helal.ecommerce.product.ProductClient;
import com.helal.ecommerce.product.PurchaseRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final CustomerClient customerClient;
    private final ProductClient productClient;
    private final OrderRepository repository;
    private final OrderMapper mapper;
    private final OrderLineService orderLineService;

    public Integer createOrder( OrderRequest request) {
        // check the customer (openfeign)
        var customer = this.customerClient.findCustomerById(request.customerId())
                .orElseThrow(() -> new BusinessExcepion("Cannot create order :: No customer exists with the provided ID"));

        // purchase the product from product microservice
        this.productClient.purchaseProducts(request.products());

        // persist order
        var order = this.repository.save(mapper.toOrder(request));

        // persist order lines
        for (PurchaseRequest purchaseRequest : request.products()){
            orderLineService.saveOrderLine(
                    new OrderLineRequest(
                            null,
                            order.getId(),
                            purchaseRequest.productId(),
                            purchaseRequest.quantity()
                    )
            );
        }

        // TODO start payment process

        //send the order confirmation t- notification microservice (kafka)
        return null;
    }
}
