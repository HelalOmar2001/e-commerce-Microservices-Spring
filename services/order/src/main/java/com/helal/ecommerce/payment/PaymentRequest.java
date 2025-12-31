package com.helal.ecommerce.payment;

import com.helal.ecommerce.customer.CustomerResponse;
import com.helal.ecommerce.order.PaymentMethod;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;

public record PaymentRequest(
        BigDecimal amount,
        @NotNull(message = "Payment method should be precised") PaymentMethod paymentMethod,
        Integer orderId,
        String orderReference,
        CustomerResponse customer
) {
}
