Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D435EFFEC
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 00:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiI2WMS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 18:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiI2WMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 18:12:16 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0259312B5C6;
        Thu, 29 Sep 2022 15:12:16 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id q10so3018269oib.5;
        Thu, 29 Sep 2022 15:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ASMxoiv4FbPhHDa+iA0oK+10NqOkogTcjb7gHSphYjg=;
        b=Ip7gEATiRDICiswoa+PVU7OoozcBC02mZJ7Z040fpbYFstOCVx/Bw9+hoIXAg+VLFL
         75e1MZVF1yrkZRYocoJ/3L2Eofc7mj/+QMtJpNelLJ2hVxfzMs0XwjZA9kg1HWqAYHI/
         WoyQivdaPevq08OP2CpbvHr3owaUIuGSReUa97Bp3H4SwLl/NqPmxQiWnAMScgLM9abW
         eGVy1x59qmZOynw6fg6iVS3iMzoD8lFOANmwlT/q/9zcCRhqHo+LOVZns5jr9vZCu4te
         r/Kqj4P/ED3MtntHHedUpYBMVDTLu32q9b0c+11QB/5BUCw6Tz+99okMGO9/q9RwSBrh
         TxEQ==
X-Gm-Message-State: ACrzQf2SqMddUO0w0JvV/jqz++6IQlmmr6nmZ12h5+FN91z6IHb74IzS
        oIYDu28YvJU909P5f3DSjo8w3qH4yw==
X-Google-Smtp-Source: AMsMyM7VroV5624kGgEqjT2S4mOcsL/Nf1Rll39OcXzrr1TOGmG1ujykkTDq/oLQk9AkZc2eShTBVg==
X-Received: by 2002:aca:130a:0:b0:34f:97d7:81e5 with SMTP id e10-20020aca130a000000b0034f97d781e5mr2589663oii.7.1664489535267;
        Thu, 29 Sep 2022 15:12:15 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o1-20020a056808124100b00350c5d946casm134843oiv.4.2022.09.29.15.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 15:12:14 -0700 (PDT)
Received: (nullmailer pid 2859839 invoked by uid 1000);
        Thu, 29 Sep 2022 22:12:14 -0000
Date:   Thu, 29 Sep 2022 17:12:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lee Jackson <info@arducam.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: media: i2c: Add IMX519 CMOS
 sensor binding
Message-ID: <20220929221214.GA2846349-robh@kernel.org>
References: <20220927114442.000026f7@arducam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927114442.000026f7@arducam.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 27, 2022 at 11:44:42AM +0800, Lee Jackson wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.

I don't see any signs of patch 2/2...

> Signed-off-by: Lee Jackson <info@arducam.com>
> ---
>  .../devicetree/bindings/media/i2c/imx519.yaml | 113 ++++++++++++++++++

sony,imx519.yaml

>  MAINTAINERS                                   |   8 ++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx519.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx519.yaml b/Documentation/devicetree/bindings/media/i2c/imx519.yaml
> new file mode 100644
> index 000000000000..717230a21764
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx519.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx519.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Lee Jackson <info@arducam.com>
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
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:
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
> +  # See ../video-interfaces.txt for more details

What does that file say?

> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object

Please look at any other camera sensor schema for how this should look.

> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation.
> +              For two-lane operation the property must be set to <1 2>.
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.
> +
> +          link-frequencies:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies.
> +
> +        required:
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

i2c {

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
> index a58f1fc6dd47..a2de51d71677 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19007,6 +19007,14 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
>  F:	drivers/media/i2c/imx412.c
>  
> +SONY IMX519 SENSOR DRIVER
> +M:	Arducam Kernel Maintenance <info@arducam.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/imx519.yaml
> +F:	drivers/media/i2c/imx519.c
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> -- 
> 2.25.1
> 
> 
