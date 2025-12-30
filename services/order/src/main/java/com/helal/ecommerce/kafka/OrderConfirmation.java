package com.helal.ecommerce.kafka;

import com.helal.ecommerce.customer.CustomerResponse;
import com.helal.ecommerce.order.PaymentMathod;
import com.helal.ecommerce.product.PurchaseResponse;

import java.math.BigDecimal;
import java.util.List;

public record OrderConfirmation(
        String orderReference,
        BigDecimal totalAmount,
        PaymentMathod paymentMathod,
        CustomerResponse customer,
        List<PurchaseResponse> products
) {
}
