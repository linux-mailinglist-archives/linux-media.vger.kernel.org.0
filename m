Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DC63D6B6B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 03:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhG0A1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 20:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhG0A1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 20:27:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC46C061757;
        Mon, 26 Jul 2021 18:08:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EFD8EE;
        Tue, 27 Jul 2021 03:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627348087;
        bh=5Lly4Cu2+2FiLgIA04EEEdGsFnMktcIC4M6zAWMrIU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rF7yoPygIYI/BWdroD9vJ9M2KuTa+lQxAX2umF9VFY7m+V1JRJHi/ggAbqWHumx6d
         f6/VkT2quoeS7LsRgRB06sRYTWpM9ItybC8fYaeztBSX/gvm7ouvPySPwAqLKiB6GK
         aN28/KJQ/KmHl4PxRy/f1oy9DRggw3Ewr6298Drc=
Date:   Tue, 27 Jul 2021 04:08:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC v3] dt-binding: media: document ON Semi AR0521 sensor
 bindings
Message-ID: <YP9ccgd7WNpHuLgG@pendragon.ideasonboard.com>
References: <m37dhkdrat.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m37dhkdrat.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

(CC'ing Sakari Ailus)

Thank you for the patch.

On Wed, Jul 21, 2021 at 10:06:34AM +0200, Krzysztof Hałasa wrote:
> This file documents DT bindings for the AR0521 camera sensor driver.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> ---
> Changes from v2:
> - changed "xclk" to "extclk"
> - power regulator names etc.
> - video output port properties
> - cosmetics
> - UTF-8 experiments :-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> new file mode 100644
> index 000000000000..785bae61bb5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0521.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AR0521 MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Krzysztof Hałasa <khalasa@piap.pl>
> +
> +description: |-
> +  The AR0521 is a raw CMOS image sensor with MIPI CSI-2 and
> +  I2C-compatible control interface.
> +
> +properties:
> +  compatible:
> +    const: onnn,ar0521
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: extclk
> +
> +  vaa-supply:
> +    description:
> +      Definition of the regulator used as analog (2.7 V) voltage supply.
> +
> +  vdd-supply:
> +    description:
> +      Definition of the regulator used as digital core (1.2 V) voltage supply.
> +
> +  vdd_io-supply:
> +    description:
> +      Definition of the regulator used as digital I/O (1.8 V) voltage supply.
> +
> +  reset-gpios:
> +    description: reset GPIO, usually active low
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      Video output port.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +
> +        properties:
> +          data-lanes:
> +            anyOf:
> +              - items:
> +                  - const: 1
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4

As the sensor also supports an HiSPi output, I would add the bus-type
property:

          data-lanes:
	    const: 4

Sakari, what do you think ? This way we won't have to rely on an
implicit default when (and if) the kernel gets support for HiSPi.

With or without this change, and with Rob's comments addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you for not giving up :-)

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - vaa-supply
> +  - vdd-supply
> +  - vdd_io-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ar0521: camera-sensor@36 {
> +                    compatible = "onnn,ar0521";
> +                    reg = <0x36>;
> +                    pinctrl-names = "default";
> +                    pinctrl-0 = <&pinctrl_mipi_camera>;
> +                    clocks = <&clks IMX6QDL_CLK_CKO>;
> +                    clock-names = "extclk";
> +                    reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +                    vaa-supply = <&reg_2p7v>;
> +                    vdd-supply = <&reg_1p2v>;
> +                    vdd_io-supply = <&reg_1p8v>;
> +
> +                    port {
> +                           mipi_camera_to_mipi_csi2: endpoint {
> +                                    remote-endpoint = <&mipi_csi2_in>;
> +                                    data-lanes = <1 2 3 4>;
> +                            };
> +                    };
> +            };
> +    };
> 

-- 
Regards,

Laurent Pinchart
