package com.helal.ecommerce.order;

import org.springframework.stereotype.Service;

@Service
public class OrderMapper {
    public Order toOrder(OrderRequest request) {
        return Order.builder()
                .id(request.id())
                .reference(request.reference())
                .totalAmount(request.amount())
                .paymentMathod(request.paymentMathod())
                .build();
    }
}
