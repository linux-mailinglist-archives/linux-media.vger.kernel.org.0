Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE6A5EEF31
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 09:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiI2HhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiI2HhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 03:37:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D8813941F
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 00:37:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s6so975870lfo.7
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=C6HAcFRlUdRVNTmd1+LZDEckWRqIi/Jw90W8yfGFuaM=;
        b=qrePgKY/Y+Vm7/UZSq1RNCj98EF+ZGGgs4eAocWnvNy3OL+hbXXhm7/hlNBWZtmh+w
         HHpePbG503tmykGObV5MPrA42fKiouTwqXxUHeY6180cJ+hwMma60u7Mr31ZuIXyZjGk
         CB9Ko/qcwaZ/9bEzlE5LXclzRuAQ6M7MmVNiSzr1s1P7jPgaWG/x39v200VI0dx3K5Uh
         QgCNllL/mAQ2nJttbLYW4lxDr/Ce783BOmFE/L4c+jovVnoqxtcBGniMStFJUiG3+JhX
         b3+WuUBiZHWhsY0POKuA/irYlQuOJ0S2R9kBBDhWDQIDWbm887eHhwRtrapD53VfNVdN
         mzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=C6HAcFRlUdRVNTmd1+LZDEckWRqIi/Jw90W8yfGFuaM=;
        b=iJ9LSMg+zzggORLP0JVZU0SWEsBj0Ty+uvOTH29RUxXqGFYXeUrOQtQ6HG1sRkiyBs
         2UaPiiIdBQSUWws1Du4+VCUq1dIEqxSLYyRxhdm7n4jUjbM5V1hJ+zqQaa2pjlKaO89l
         H73PDHYHCFOSLvkReoQSNI5ZZtIozTlMseGhf1ru0nRQyR2ztK5vuSDAZrDMald7n6Ji
         F8GkZ4beo+LlbIgwojFINh1pWJHVbg+aEKg+q7VdOHmPVXW+GQOpI5wi1b9Jvbpj0CKL
         ltcPzYSgxttCtiiehJ3UIywX1GfdPCWzXMLHtbKod7uN05l7vjfRTZM+Ve1ulH/CnfSG
         9jfw==
X-Gm-Message-State: ACrzQf0ycBFlgqMhlyNh103LBHl3B5V7oShhe5Q8MpD8wAYBZ3XNXPJ2
        SZh4ISklzgLd87UgyEcfE5D2QQ==
X-Google-Smtp-Source: AMsMyM6auO7zd9V9y6sVWvoa5lOsJCgLzgjIBXw3FHxLXWyMNv86MEkFtRVwKPJbJmzPknh6BFI9cQ==
X-Received: by 2002:a05:6512:511:b0:4a1:d9f3:ea10 with SMTP id o17-20020a056512051100b004a1d9f3ea10mr863530lfb.555.1664437025680;
        Thu, 29 Sep 2022 00:37:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b004979e1ff641sm704286lfq.115.2022.09.29.00.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 00:37:05 -0700 (PDT)
Message-ID: <65ef5f40-f8bd-045c-a9d7-6a74ceacc8e2@linaro.org>
Date:   Thu, 29 Sep 2022 09:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20220927184657.291714-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927184657.291714-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/09/2022 20:46, Marek Vasut wrote:
> Convert the text STMIPID02 DT bindings to YAML DT format to permit
> validation of DTs using this I2C CSI-2 to CPI bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Thank you for your patch. There is something to discuss/improve.

> +properties:
> +  compatible:
> +    const: st,st-mipid02
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Reference to the xclk input clock.

This usually goes to "clocks", but on the other hand it does not bring
any value (xclk is obvious from clock-names), so I propose to skip
entire description.

> +    items:
> +      - const: xclk
> +
> +  VDDE-supply:
> +    description:
> +      Sensor digital IO supply. Must be 1.8 volts.
> +
> +  VDDIN-supply:
> +    description:
> +      Sensor internal regulator supply. Must be 1.8 volts.
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the xsdn pin, if any.
> +      This is an active low signal to the mipid02.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 first input port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Single-lane operation shall be <1> or <2> .
> +                  Dual-lane operation shall be <1 2> or <2 1> .
> +                minItems: 1
> +                maxItems: 2

Blank line

> +              lane-polarity:

The property is "lane-polarities"

> +                description:
> +                  Any lane can be inverted or not.
> +                minItems: 1
> +                maxItems: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 second input port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  Single-lane operation shall be <1> or <2> .
> +                maxItems: 1

Blank line

> +              lane-polarity:

lane-polarities

> +                description:
> +                  Any lane can be inverted or not.
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Output port
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-width:
> +                enum: [6, 7, 8, 10, 12]

Blank line

> +              hsync-active: true
> +              vsync-active: true

You do not need these two - they come from video-interfaces.yaml


> +
> +            required:
> +              - bus-width
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +
> +    required:
> +      - port@2
> +

Best regards,
Krzysztof

