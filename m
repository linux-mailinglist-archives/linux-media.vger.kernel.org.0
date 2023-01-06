Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34CE65FCDF
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 09:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbjAFIfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 03:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjAFIfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 03:35:11 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B754166A
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 00:34:27 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so3526097wml.0
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m92kzOal4gXjuPv7PrxQIGfw6UMdQvcts3JmeuS3/l8=;
        b=ftZagesGRox1JSO1lt4TzrSTcQEjtxK6cknjK5abjVM3J7ZGgcA6WJPTuWbS4nz47z
         hV6dioqrVHtmYAr9KMmJ27M6rTRncRek0eY1OMdF0CAuP7+1e3+gIqsGAnGKgsoM6UG7
         LSTUZN6izU5W/M1UC2aDzgQSZNKCnX/Ls6OgJZUW7KwfJWev7OunogaQqU7IEFoByNtX
         cMf5yJ98y89c7SsmTaH2jRulpMxRANzXrpirZnO9mpzCIRJmM4yEFKGCydwuY1RhIVle
         ZnuP/DD4XPitL2jE5CHNBCXnnKLLBSroz/MbJ8ZTAqSltou0sXS9busb9244fTYPJvwV
         DwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m92kzOal4gXjuPv7PrxQIGfw6UMdQvcts3JmeuS3/l8=;
        b=IzKFe1fEQEagg5UWrYi/Z+kubw0Vw8If1NsILCoGIIOX9TV2EACDcTHKXqUXF0eoJL
         RPDVDM2Exk361m9DQUVHXq2xoBA3NkUbvvi90+9HrLN50lkeL5dNh9AStXWyvhzYxTXy
         mfsZLwKHO6/kZqUj9nI2tL368QLO5YG6ItdYl1On++UTQX/d2jPR3uIxHyjss2JnRLDL
         LwqsiPeEu1qjvzj6yl711zpYGGWbgTxa2fQQUqFj2JmYcx0rpIw6n+km4gDr2bIQYIju
         vHERR1FMXVYoeIBjFGJrfRPGAD6xs7FJiAlcQ+NXDfhwkGeRGZlchqakw0bEGwZ/iR+3
         gkFg==
X-Gm-Message-State: AFqh2krP2Ihtp5mSHPH0INicykP66Q9GLRAEq8+wc7zoETVQO7XFgCuX
        e6IQLZwfYxc1YDdSQxPS6b7CPg==
X-Google-Smtp-Source: AMrXdXt5PZtBg7628GLaC6/rPUB/MnEARluyZ0woNWPIGD+t7sy1tJflYie+CubFAfEL6LRhzotzYA==
X-Received: by 2002:a05:600c:4f83:b0:3d3:49db:d95 with SMTP id n3-20020a05600c4f8300b003d349db0d95mr38310610wmq.37.1672994064956;
        Fri, 06 Jan 2023 00:34:24 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm5757889wmq.30.2023.01.06.00.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 00:34:24 -0800 (PST)
Message-ID: <4a3f0fc7-4723-919a-ed8c-59e364d55c6f@linaro.org>
Date:   Fri, 6 Jan 2023 09:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: media: Add schema for OmniVision OV8858
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230105172320.133810-1-jacopo@jmondi.org>
 <20230105172320.133810-2-jacopo@jmondi.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105172320.133810-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/01/2023 18:23, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 

Subject: drop redundant "schema for".

> Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.
> 

Thank you for your patch. There is something to discuss/improve.

> +properties:
> +  compatible:
> +    const: ovti,ov8858
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: XVCLK external clock
> +
> +  clock-names:
> +    const: xvclk
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  powerdown-gpios:
> +    maxItems: 1

No need for maxItems here - it is coming from gpio-consumer-common.

> +    description: PWDNB powerdown GPIO (active low)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: XSHUTDN reset GPIO (active low)
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - assigned-clocks
> +  - assigned-clock-rates

These should not be required.

> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/rockchip.h>

Drop, not needed.

> +    #include <dt-bindings/clock/rk3399-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c2 {

i2c

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov8858: camera@36 {
> +            compatible = "ovti,ov8858";
> +            reg = <0x36>;
> +
> +            clocks = <&cru SCLK_CIF_OUT>;
> +            clock-names = "xvclk";
> +            assigned-clocks = <&cru SCLK_CIF_OUT>;
> +            assigned-clock-rates = <24000000>;
> +
> +            dovdd-supply = <&vcc1v8_dvp>;
> +
> +            reset-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
> +            powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                ucam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_ucam>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +        };
> +    };
> +...
> --
> 2.38.1
> 

Best regards,
Krzysztof

