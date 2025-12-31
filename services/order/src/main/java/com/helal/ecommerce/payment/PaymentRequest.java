package com.helal.ecommerce.payment;

import com.helal.ecommerce.customer.CustomerResponse;

import java.math.BigDecimal;

public record PaymentRequest(
        BigDecimal amount,
        com.helal.ecommerce.order.@jakarta.validation.constraints.NotNull(message = "Payment method should be precised") PaymentMathod paymentMethod,
        Integer orderId,
        String orderReference,
        CustomerResponse customer
) {
}
