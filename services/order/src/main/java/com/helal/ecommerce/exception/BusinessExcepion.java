package com.helal.ecommerce.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class BusinessExcepion extends RuntimeException {
    private final String msg;
}
