Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D9263A0A0
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 05:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiK1EiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Nov 2022 23:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiK1EiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Nov 2022 23:38:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CB56369
        for <linux-media@vger.kernel.org>; Sun, 27 Nov 2022 20:38:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B55E55A;
        Mon, 28 Nov 2022 05:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669610294;
        bh=/9EhkXHaTwEx9QKlo0TvQWXPT8M+2w7YCCQbdD3HdRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hEuyGlMxj/76WTdOTNUG4EmEQUrvM1vpjIiKz8jXoMss/UMNoEcz6Lp+nhnX/qbfu
         ST3JZQ9BoNi4p35rXiFJmPHQDYqZbI7QJyoKkhVGXvEhwFFeRw/cF+gYQfiKLvy4+O
         +Adg1ULS+BbNMB/Btz1i3jQ1BRzJCK0V2meKsHok=
Date:   Mon, 28 Nov 2022 06:37:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v1 1/5] DT bindings for imx492
Message-ID: <Y4Q7JiJlhUL96yBW@pendragon.ideasonboard.com>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <20221125153120.541298-2-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125153120.541298-2-petko.manolov@konsulko.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

Thank you for the patch.

The subject line should start with the proper prefix. Look at the git
log in the directory to see what is customary. Furthermore,
s/imx492/Sony IMX492/.

On Fri, Nov 25, 2022 at 05:31:16PM +0200, Petko Manolov wrote:
> Here goes the DT bindings file.

This is also a peculiar commit message :-)

> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  .../bindings/media/i2c/sony,imx492.yaml       | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> new file mode 100644
> index 000000000000..f4feef17c677
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx492.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony imx492 Sensor

s/imx492/IMX492/. Same below. When referring to the hardware, it's
customary to use uppercase.

> +
> +maintainers:
> +  - Petko Manolov <petko.manolov@konsulko.com>
> +
> +description:
> +
> +  imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
> +  monochrome square pixel array and approximately 47.08 M effective pixels.
> +  12-bit digital output makes it possible to output the signals with high
> +  definition for moving pictures. It is programmable through I2C interface. The
> +  I2C client address can be either 0x10 or 0x1a depending on SLASEL pin. Image
> +  data is sent through MIPI CSI-2.
> +
> +properties:
> +  compatible:
> +    const: sony,imx492

Missing blank line.

> +  reg:
> +    description: I2C address

You can drop the description.

> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

This shouldn't be needed.

> +
> +  clocks:
> +    description: Clock frequency 6MHz, 12MHz, 18MHz and 24MHz

If you know the name of the clock pin, I would include it here.

> +    maxItems: 1
> +
> +  dovdd-supply:
> +    description: Interface power supply.

I would list the voltage. Same below.

> +
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the XCLR pin, if any.
> +    maxItems: 1
> +
> +  port:
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes: true
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@10 {
> +            compatible = "sony,imx492";
> +            reg = <0x10>;
> +            clocks = <&imx492_clk>;
> +
> +            assigned-clocks = <&imx492_clk>;
> +            assigned-clock-parents = <&imx492_clk_parent>;
> +            assigned-clock-rates = <24000000>;

You can drop this from the example, it doesn't showcase the DT bindings
for the IMX492.

> +
> +            port {
> +                imx492: endpoint {

s/imx492/imx492_out/

> +                    remote-endpoint = <&cam>;

s/cam/cam_in/

> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <600000000>;
> +                };
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
