package com.helal.ecommerce.order;

import java.math.BigDecimal;

public record OrderResponse(
        Integer id,
        String reference,
        BigDecimal amount,
        PaymentMathod paymentMathod,
        String customerId
) {
}
