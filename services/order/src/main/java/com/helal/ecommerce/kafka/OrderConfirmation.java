package com.helal.ecommerce.kafka;

import com.helal.ecommerce.customer.CustomerResponse;
import com.helal.ecommerce.order.PaymentMethod;
import com.helal.ecommerce.product.PurchaseResponse;

import java.math.BigDecimal;
import java.util.List;

public record OrderConfirmation(
        String orderReference,
        BigDecimal totalAmount,
        PaymentMethod paymentMethod,
        CustomerResponse customer,
        List<PurchaseResponse> products
) {
}
