Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045C867B8C9
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 18:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbjAYRpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 12:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbjAYRpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 12:45:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E468B77C;
        Wed, 25 Jan 2023 09:45:51 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76C726E0;
        Wed, 25 Jan 2023 18:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674668749;
        bh=frB5+tegA0PVzPvOYnArVeUL1dQTTm+M3KDDRp5jALA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJO6ZT1tGmtYpKFs2ZS27MOYZyCC8IVG1WNHz7X1/c7K6mR4+jlve81kN0T1QRT2W
         C2aRma5EUNFI0ybCquJQnUoGN/tyxljzeRWOmI3/RcA8xv7mCEg386FbeZWuTk5VVW
         Mix9u1talQhhZ96pj0TdqaKZKQmKXEMexoogQU/s=
Date:   Wed, 25 Jan 2023 18:45:46 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/8] media: dt-bindings: Add OV5670
Message-ID: <20230125174546.esaoqgwckrtcjxnv@uno.localdomain>
References: <20230125173707.127687-1-jacopo.mondi@ideasonboard.com>
 <20230125173707.127687-2-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230125173707.127687-2-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Forgot to cc dt bindings people, sorry about that

On Wed, Jan 25, 2023 at 06:37:00PM +0100, Jacopo Mondi wrote:
> Add the bindings documentation for Omnivision OV5670 image sensor.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../bindings/media/i2c/ovti,ov5670.yaml       | 92 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> new file mode 100644
> index 000000000000..fa264255b5eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV5670 5 Megapixels raw image sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +description: |-
> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> +  controlled through an I2C compatible control bus.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5670
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: System clock. From 6 to 27 MHz.
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog circuit power. Typically 2.8V.
> +
> +  dvdd-supply:
> +    description: Digital circuit power. Typically 1.2V.
> +
> +  dovdd-supply:
> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> +
> +  port:
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
> +            maxItems: 2
> +            items:
> +              enum: [1, 2]
> +
> +          clock-noncontinuous: true
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
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov5670: sensor@36 {
> +            compatible = "ovti,ov5670";
> +            reg = <0x36>;
> +
> +            clocks = <&sensor_xclk>;
> +
> +            port {
> +                ov5670_ep: endpoint {
> +                    remote-endpoint = <&csi_ep>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61eb221415b..38d8d1d5d536 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15468,6 +15468,7 @@ M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>  F:	drivers/media/i2c/ov5670.c
>
>  OMNIVISION OV5675 SENSOR DRIVER
> --
> 2.39.0
>
