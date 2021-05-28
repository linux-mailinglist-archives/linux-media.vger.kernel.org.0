Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66EA393ED4
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 10:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhE1IhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 04:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbhE1IhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 04:37:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240D4C061574;
        Fri, 28 May 2021 01:35:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C43248C7;
        Fri, 28 May 2021 10:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622190942;
        bh=Cp8gfVSdtQFiVNKvUDCsmV+oJcjACVkQBPPK7pfh+t0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TLombm4SwKO4Vvlashgtv/U/9mYUjdBUyfah4SKfnnLVBbLuL+ZgZACrQ46kqgP3d
         pO0mBqzchIYCikxwmU4t7W2JBddIxDIMiEsqEZPVRYC6AQclgNeMwgiHiDQ1Aia5wi
         w+55Zn5IkeKzEFPM1TcAvNf5yYaMwxvX4nOsYsXo=
Date:   Fri, 28 May 2021 11:35:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     mchehab@kernel.org, devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <YLCrVzzvKoJOZAK3@pendragon.ideasonboard.com>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
 <20210528081336.3858700-3-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210528081336.3858700-3-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Fri, May 28, 2021 at 10:13:33AM +0200, Martin Kepplinger wrote:
> Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/i2c/hynix,hi846.yaml       | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> new file mode 100644
> index 000000000000..2991108e23e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> +
> +description: |-
> +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is 10bit Bayer.
> +
> +properties:
> +  compatible:
> +    const: hynix,hi846
> +
> +  reg:
> +    description: I2C device address.

You can drop the description, it's implicit that reg is the I2C address
for I2C devices.

> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference to the mclk clock.
> +    maxItems: 1

You could also write this

  clocks:
    items:
      - description: Reference to the mclk clock.

The maxItems will then be implicit. This is the preferred form when
multiple clocks are used, and given that clocks it meant to contain a
list of clocks, even if it has a single entry, placing the description
in a list of items may be a bit better semantically speaking.

> +
> +  clock-names:
> +    const: mclk

Similarly,

  clock-names:
    items:
      - const: mclk

Rob, is standardizing this pattern a good idea, or do you prefer the
shorter form

  clock-names:
    const: mclk

> +
> +  rst-gpios:

We try to standardize GPIO names, so let's use reset-gpios.

> +    description: Reference to the GPIO connected to the reset pin. Active low.
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Definition of the regulator used as 1.8V digital power supply.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - rst-gpios
> +  - vdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hi846: camera@20 {
> +            compatible = "hynix,hi846";
> +            reg = <0x20>;
> +            clocks = <&clk>;
> +            clock-names = "mclk";
> +            vdd-supply = <&reg_camera_pwr_en>; /* 1.8v */
> +            rst-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera_out: endpoint {
> +                    remote-endpoint = <&csi1_ep1>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
