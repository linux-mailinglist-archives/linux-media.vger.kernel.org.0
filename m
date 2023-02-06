Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6A268BA7F
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 11:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjBFKjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 05:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjBFKip (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 05:38:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6ACDBFA;
        Mon,  6 Feb 2023 02:38:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD23B4DA;
        Mon,  6 Feb 2023 11:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675679805;
        bh=9s/ln2Fbj6UQOSq3Eb3fv0asoO3SHMlB2wOoqR2Nsvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zxy35lIxkK72PXZgb5VthfC4il/NVk24+8GU5DJwVyQhiwHa2asWlrIn14te4207C
         bxA4Lkq0MTl/eP/7spC7dec2eS8IDIiR9RHTNzSJ9jgEsqkoDAf5Lb2Gk0abWsvJb3
         BrUUdN8dOKYmXTT0RIsv+8gqR3m6inJifKhkTSt8=
Date:   Mon, 6 Feb 2023 12:36:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Volodymyr Kharuk <vkh@melexis.com>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Message-ID: <Y+DYPGcl2CW2tRjS@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
 <20220715153243.GA18207@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220715153243.GA18207@vkh-ThinkPad-T490>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

I've just realized your previous e-mail felt through the cracks. Sorry
about that. Please see below for comments.

On Fri, Jul 15, 2022 at 06:32:43PM +0300, Volodymyr Kharuk wrote:
> On Thu, Jul 14, 2022 at 01:06:35PM +0300, Laurent Pinchart wrote:
> > On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
> > > Add device tree binding of the mlx7502x and update MAINTAINERS
> > > 
> > > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > > ---
> > >  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
> > >  MAINTAINERS                                   |   1 +
> > >  2 files changed, 147 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > > new file mode 100644
> > > index 000000000000..4ac91f7a26b6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > > @@ -0,0 +1,146 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Melexis ToF 7502x MIPI CSI-2 Sensor
> > > +
> > > +maintainers:
> > > +  - Volodymyr Kharuk <vkh@melexis.com>
> > > +
> > > +description: |-
> > > +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
> > > +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
> > > +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
> > > +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
> > 
> > I'd move this last line as a description of the compatible property, but
> > I'm also not sure this should be mentioned in the DT bindings, as it's a
> > driver implementation detail. I'm actually not sure we should support it
> > with three different compatible values as proposed, as without this
> > documentation users will have a hard time figuring out what compatible
> > value to pick.
> > 
> > One option would be to support the following three compatible values:
> > 
> > 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> > 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> > 	compatible = "melexis,mlx7502x";
> > 
> > The last one only would trigger autodetection. I'm still not sure how to
> > document that properly in bindings though.
> > 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - melexis,mlx7502x
> > > +          - melexis,mlx75026
> > > +          - melexis,mlx75027
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  assigned-clocks: true
> > > +  assigned-clock-parents: true
> > > +  assigned-clock-rates: true
> > > +
> > > +  clocks:
> > > +    description: Clock frequency 8MHz
> > > +    maxItems: 1
> > > +
> > > +  vdda-supply:
> > > +    description:
> > > +      Definition of the regulator used as analog power supply(2.7V).
> > > +
> > > +  vddif-supply:
> > > +    description:
> > > +      Definition of the regulator used as interface power supply(1.8V).
> > > +
> > > +  vddd-supply:
> > > +    description:
> > > +      Definition of the regulator used as digital power supply(1.2V).
> > > +
> > > +  vdmix-supply:
> > > +    description:
> > > +      Definition of the regulator used as mixed driver power supply(1.2V).
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: Reset Sensor GPIO Control (active low)
> > > +
> > > +  melexis,trig-gpios:
> > > +    maxItems: 1
> > > +    description:
> > > +      Hardware Trigger GPIO Control (active low)
> > > +      When the hardware trigger mode is enabled, this GPIO is used to generate
> > > +      a low level impulse for about 100us. The impulse triggers a new
> > > +      measurement cycle.
> > > +
> > > +  melexis,leden-gpios:
> > > +    maxItems: 1
> > > +    description:
> > > +      Led driver enable GPIO Control (active high)
> > > +      This GPIO notifies the illumination driver when it is safe to use led
> > > +      signals from the sensor.
> > 
> > As far as I understand this isn't an input of the sensor, but a signal
> > that is driven by the driver and controls the separate illuminator. It
> > shouldn't be specified in this binding, as it's not a property of the
> > sensor. You should instead have a DT node for the illumination driver.
>
> Yes, you are right. There are illuminators, which are not ready to accept
> the signal from the sensor, if pin levels are not right. So I need to
> notify illuminator somehow.  Can the illumination driver be as a V4L2
> subdevice? Then I can notify the illuminator via s_stream. In another
> case it can damage the illuminator. What do you think?

It can be a separate subdev, yes. There are flash-related controls in
V4L2, maybe some of them would cover your use cases ? We have a few
flash drivers in upstream that you can look at for inspiration, for
instance drivers/media/i2c/lm3560.c or drivers/media/i2c/adp1653.c.

> > > +  port:
> > > +    description: MIPI CSI-2 transmitter port
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            oneOf:
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> > > +
> > > +          clock-noncontinuous: true
> > > +          link-frequencies: true
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +          - link-frequencies
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - port
> > 
> > Let's make the supplies mandatory too, as the chip can't operate without
> > them.
>
> Ok
>
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        mlx7502x: camera@57 {
> > > +            compatible = "melexis,mlx7502x";
> > > +            reg = <0x57>;
> > > +            clocks = <&mlx7502x_clk>;
> > > +
> > > +            assigned-clocks = <&mlx7502x_clk>;
> > > +            assigned-clock-parents = <&mlx7502x_clk_parent>;
> > > +            assigned-clock-rates = <8000000>;
> > > +
> > > +            vddd-supply = <&mlx_7502x_reg>;
> > > +
> > > +            reset-gpios = <&gpio_exp 6 GPIO_ACTIVE_HIGH>;
> > > +            melexis,trig-gpios = <&gpio_exp 2 GPIO_ACTIVE_HIGH>;
> > > +            melexis,leden-gpios = <&gpio_exp 7 GPIO_ACTIVE_HIGH>;
> > > +
> > > +            port {
> > > +                mlx7502x_out_mipi_csi2: endpoint {
> > > +                    remote-endpoint = <&mipi_csi2_from_mlx7502x>;
> > > +                    data-lanes = <1 2 3 4>;
> > > +                    link-frequencies = /bits/ 64 < 960000000
> > > +                                                   904000000
> > > +                                                   800000000
> > > +                                                   704000000
> > > +                                                   600000000
> > > +                                                   300000000 >;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 1a68d888ee14..b00a726bb3db 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12678,6 +12678,7 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Supported
> > >  W:	http://www.melexis.com
> > > +F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > >  F:	include/uapi/linux/mlx7502x.h
> > >  
> > >  MELFAS MIP4 TOUCHSCREEN DRIVER

-- 
Regards,

Laurent Pinchart
