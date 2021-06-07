Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF2E39E8F9
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 23:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhFGVRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 17:17:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35118 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhFGVR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 17:17:29 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9958DB;
        Mon,  7 Jun 2021 23:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623100536;
        bh=Si7z1mSBCxByHmBMiQ1CwHD9Qlf/H7ofE/lgBNr0dZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tiySDq+yN8Vj3Tk7wlIHIeF3huRBycPmuZcB7ks956xgABv0h2pSBkFhUS9kdcwlB
         fSpjcATCFxqJyg+LqjDmr1sevT3CTM6dpmJ8fvIb4IpK7mAZlzKs2vdB+GSOFWC3zv
         D+crqpHbRjmM+mGAqwSDEC8tzypa/ks3lSoIJu5M=
Date:   Tue, 8 Jun 2021 00:15:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     krzysztof.kozlowski@canonical.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v4 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <YL6MaFAt2PaJq+2E@pendragon.ideasonboard.com>
References: <20210607105213.1211722-1-martin.kepplinger@puri.sm>
 <20210607105213.1211722-3-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607105213.1211722-3-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin

Thank you for the patch.

On Mon, Jun 07, 2021 at 12:52:10PM +0200, Martin Kepplinger wrote:
> Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/i2c/hynix,hi846.yaml       | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> new file mode 100644
> index 000000000000..19825392fb1f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -0,0 +1,105 @@
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
> +  is raw Bayer.
> +
> +properties:
> +  compatible:
> +    const: hynix,hi846
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Reference to the mclk clock.
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the RESETB pin. Active low.
> +    maxItems: 1
> +
> +  shutdown-gpios:
> +    description: Reference to the GPIO connected to the XSHUTDOWN pin. Active low.
> +    maxItems: 1
> +
> +  vddi-supply:

I think it's called vddio (seems to be a typo on page 8).

> +    description: Definition of the regulator used for the 1.8V or 2.8V I/O power supply.

You could just say "... for the VDDIO supply". Same below. Up to you.

With the name fixed and the description optionally updated,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please add my tag if you post a new version.

> +
> +  vdda-supply:
> +    description: Definition of the regulator used for the 2.8V analog power supply.
> +
> +  vddd-supply:
> +    description: Definition of the regulator used for the 1.2V core power supply.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
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
> +  - vddi-supply
> +  - vdda-supply
> +  - vddd-supply
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
> +            vddi-supply = <&reg_camera_pwr_en>;
> +            vdda-supply = <&reg_camera_pwr_en>;
> +            vddd-supply = <&reg_camera_pwr_en>;
> +            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
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
