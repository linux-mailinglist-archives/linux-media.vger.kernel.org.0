Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69C0617D7B
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 14:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiKCNGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 09:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiKCNFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 09:05:25 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D4DD60
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 06:05:07 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id s20so1027597qkg.5
        for <linux-media@vger.kernel.org>; Thu, 03 Nov 2022 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tL7AwfEBawTS+joLBkklvfoShDprpUx2/6j95Zbc8aA=;
        b=HnM4RYT7W3UJ8p26skbBWk0h0ULoWqMqWPTxa7s6KvXlWtzVtn5eMbn5ecwVDZEO8E
         73VYMQMsZSIf1tRTKGTvDMsQIbHkVFIHXA+g3TQfT+YpmG689c8lzb3HQq+iSiAw2ZLU
         hKXzH6ypb+WofX6cu6swXdZNQj6p3MmOjCI4zWslr/r7KYQ8VIpf9lHz7Lqbpqgz6d+j
         PSiXqwajYhapUCCW3HAznl4I/U05A6lc+VEXtX1pPZHq/jHCjLV8K83kXBvyA7mjkdQJ
         Xo/LqgU1hEglCsSAQKualA7z004wVa1lQM46/zEImGQ5uiui7Jmw7gaPZ4Sm0dRhkVtt
         mgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tL7AwfEBawTS+joLBkklvfoShDprpUx2/6j95Zbc8aA=;
        b=ysyzOHf8raESrJvWkabop2PJf+aQcNx90EwjUlPHvinYcJ+d5WyijGW3lwnFJ5Yz1F
         hel+wuz02VeBV8T6FKFerL2p8z8BaJ70ivd0sFzKvFISjXkfCsB0xOk2+Or8i6eC7m8A
         xgjxtUarGD+8pkpPezmribtX26qCuTZM3DRtVOpf3nMOn9CEIclWWczFf7HJ4zI7WyIm
         KEokN0LoY0GNPa9MT0ILElimPA98rXCfT+Rj+ZYCSICm+79E2uV3oIuiND/YHTjfRycI
         bUUmO8iF8npfa/p/FmSGBp3vdomK/q0XkcBdvC1IFcYsvRnidVEUS1qBLGoEgpby5C9R
         8KxA==
X-Gm-Message-State: ACrzQf3cd4nn+EmyE1zFak4pQp7i6MipQZqWCT1ZD/F6rSSxkYjtFMMs
        e7WVjRSn/sOvgKA4kV3DeQS4Ya87uLeRwA==
X-Google-Smtp-Source: AMsMyM5ZGsWmQM1YtOhYFTGB5v1V62Jt/nJDBwPcUsBnJdR4+gELIOCqHVcdrLhkBDWPPaakwcxv0g==
X-Received: by 2002:a05:620a:4694:b0:6ee:b286:281a with SMTP id bq20-20020a05620a469400b006eeb286281amr21859211qkb.455.1667480706973;
        Thu, 03 Nov 2022 06:05:06 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id az40-20020a05620a172800b006ce7cd81359sm691741qkb.110.2022.11.03.06.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:05:06 -0700 (PDT)
Message-ID: <4556aebd-1296-bb08-2cd7-3d92571ed71b@linaro.org>
Date:   Thu, 3 Nov 2022 09:05:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Content-Language: en-US
To:     lee <lee@arducam.com>, linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
References: <20221103110424.00007a48@arducam.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103110424.00007a48@arducam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2022 23:04, lee wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <lee@arducam.com>

Your From does not match fully SoB.

> ---
>  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   9 ++
>  2 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> new file mode 100644
> index 000000000000..9b6cda96f613
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx519.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Lee Jackson <lee@arducam.com>
> +
> +description: |-
> +  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image sensor
> +  with an active array size of 4656H x 3496V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx519
> +
> +  reg:
> +    description: I2C device address

Skip description.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:

Use lower case names.

> +    description:
> +      Digital I/O voltage supply, 1.05 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies and INCK are applied.
> +
> +port:
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
> +            description: |-
> +              The driver only supports two-lane operation.

Please describe the hardware, not driver.

> +            items:
> +              - const: 1
> +              - const: 2
> +
> +          clock-noncontinuous: true
> +          link-frequencies: true

I think these are coming from video-interfaces, so no need for them.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {

i2c

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

> +        imx519: sensor@1a {
> +            compatible = "sony,imx519";
> +            reg = <0x1a>;
> +            clocks = <&imx519_clk>;
> +            VANA-supply = <&imx519_vana>;   /* 2.8v */
> +            VDIG-supply = <&imx519_vdig>;   /* 1.05v */
> +            VDDL-supply = <&imx519_vddl>;   /* 1.8v */
> +
> +            port {
> +                imx519_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <493500000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e04d944005ba..5a617ab8c9b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19236,6 +19236,15 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
>  F:	drivers/media/i2c/imx412.c
>  
> +SONY IMX519 SENSOR DRIVER
> +M:	Arducam Kernel Maintenance <info@arducam.com>
> +M:	Lee Jackson <lee@arducam.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> +F:	drivers/media/i2c/imx519.c

The file does not exist, so path is not correct (yet). Add it in 2/2.


Best regards,
Krzysztof

