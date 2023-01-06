Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B9E65FD5D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 10:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjAFJPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 04:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjAFJPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 04:15:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB9D63B9;
        Fri,  6 Jan 2023 01:15:12 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 261424AE;
        Fri,  6 Jan 2023 10:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672996510;
        bh=PUb/2+vNbKva7BxdRPQh/qMdMplUQ5TGiRRnHYtoc4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ju1bhcO39w1qM36Do+jYXtomzKp9s5b8tBKJ6hfP05SlXRHO8f/CLI/I+eMS4S8HR
         8SAS7hQl36hWuciAoRYBadAqnHNqY877B/2Qq/RqU8qlmoMuowBeJrA85cmuAq8mQY
         4+qDoxYUicNRJ4lgLW8MDLOiRMKZNuVyTPtv54EU=
Date:   Fri, 6 Jan 2023 10:15:08 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: Add schema for OmniVision OV8858
Message-ID: <20230106091508.asjayi5ic2dz6vrg@uno.localdomain>
References: <20230105172320.133810-1-jacopo@jmondi.org>
 <20230105172320.133810-2-jacopo@jmondi.org>
 <4a3f0fc7-4723-919a-ed8c-59e364d55c6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a3f0fc7-4723-919a-ed8c-59e364d55c6f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof
   thanks for the review

On Fri, Jan 06, 2023 at 09:34:22AM +0100, Krzysztof Kozlowski wrote:
> On 05/01/2023 18:23, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
>
> Subject: drop redundant "schema for".
>

ack

> > Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.
> >
>
> Thank you for your patch. There is something to discuss/improve.
>
> > +properties:
> > +  compatible:
> > +    const: ovti,ov8858
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: XVCLK external clock
> > +
> > +  clock-names:
> > +    const: xvclk
> > +
> > +  dvdd-supply:
> > +    description: Digital Domain Power Supply
> > +
> > +  avdd-supply:
> > +    description: Analog Domain Power Supply
> > +
> > +  dovdd-supply:
> > +    description: I/O Domain Power Supply
> > +
> > +  powerdown-gpios:
> > +    maxItems: 1
>
> No need for maxItems here - it is coming from gpio-consumer-common.
>

ack

> > +    description: PWDNB powerdown GPIO (active low)
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: XSHUTDN reset GPIO (active low)
> > +
> > +  port:
> > +    description: MIPI CSI-2 transmitter port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            minItems: 1
> > +            maxItems: 4
> > +
> > +        required:
> > +          - data-lanes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - assigned-clocks
> > +  - assigned-clock-rates
>
> These should not be required.
>

makes sense

> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pinctrl/rockchip.h>
>
> Drop, not needed.
>

I need it for the definition of RK_PA4 and RK_PB4.

The example fails to compile if I remove it

> > +    #include <dt-bindings/clock/rk3399-cru.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c2 {
>
> i2c
>

Ack

Will resend soon

Thanks
   j

> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov8858: camera@36 {
> > +            compatible = "ovti,ov8858";
> > +            reg = <0x36>;
> > +
> > +            clocks = <&cru SCLK_CIF_OUT>;
> > +            clock-names = "xvclk";
> > +            assigned-clocks = <&cru SCLK_CIF_OUT>;
> > +            assigned-clock-rates = <24000000>;
> > +
> > +            dovdd-supply = <&vcc1v8_dvp>;
> > +
> > +            reset-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
> > +            powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                ucam_out: endpoint {
> > +                    remote-endpoint = <&mipi_in_ucam>;
> > +                    data-lanes = <1 2 3 4>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > --
> > 2.38.1
> >
>
> Best regards,
> Krzysztof
>
