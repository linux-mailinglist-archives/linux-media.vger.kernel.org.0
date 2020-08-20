Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806D524C2E3
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 18:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbgHTQEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 12:04:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbgHTQEi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 12:04:38 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96C1A23D;
        Thu, 20 Aug 2020 18:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597939474;
        bh=F1VgKHw+BMI5X9Ve96ajPLFVLW5J8X9PUB53EKuKqxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n4kbYVtXeaUIUnJ4ZuVoUMubMqYwPBWTZS2o0RjbzX6Pw5el5VtQgE0MuhIqr8FR4
         khFv4Lg1vNyN9qKRvxQFY+84adNrDwClsyCqsFBCLRFwFMs9xnt7Er4q31UqZH7qz9
         rjj0eD/pciCIswASHbUoaAZkP0OGx7Esxhx0Ca6Y=
Date:   Thu, 20 Aug 2020 19:04:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: mt9v111: Convert to json-schema
Message-ID: <20200820160416.GW6593@pendragon.ideasonboard.com>
References: <20200817160129.256085-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817160129.256085-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Aug 17, 2020 at 06:01:29PM +0200, Jacopo Mondi wrote:
> Convert the mt9v111 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/aptina,mt9v111.txt     | 46 ----------
>  .../bindings/media/i2c/aptina,mt9v111.yaml    | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 84 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
> deleted file mode 100644
> index bd896e9f67d1..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -* Aptina MT9V111 CMOS sensor
> -----------------------------
> -
> -The Aptina MT9V111 is a 1/4-Inch VGA-format digital image sensor with a core
> -based on Aptina MT9V011 sensor and an integrated Image Flow Processor (IFP).
> -
> -The sensor has an active pixel array of 640x480 pixels and can output a number
> -of image resolution and formats controllable through a simple two-wires
> -interface.
> -
> -Required properties:
> ---------------------
> -
> -- compatible: shall be "aptina,mt9v111".
> -- clocks: reference to the system clock input provider.
> -
> -Optional properties:
> ---------------------
> -
> -- enable-gpios: output enable signal, pin name "OE#". Active low.
> -- standby-gpios: low power state control signal, pin name "STANDBY".
> -  Active high.
> -- reset-gpios: chip reset signal, pin name "RESET#". Active low.
> -
> -The device node must contain one 'port' child node with one 'endpoint' child
> -sub-node for its digital output video port, in accordance with the video
> -interface bindings defined in:
> -Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> ---------
> -
> -        &i2c1 {
> -                camera@48 {
> -                        compatible = "aptina,mt9v111";
> -                        reg = <0x48>;
> -
> -                        clocks = <&camera_clk>;
> -
> -                        port {
> -                                mt9v111_out: endpoint {
> -                                        remote-endpoint = <&ceu_in>;
> -                                };
> -                        };
> -                };
> -        };
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> new file mode 100644
> index 000000000000..54cc136aa239
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/aptina,mt9v111.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aptina MT9V111 CMOS sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +
> +description: -|
> +  The Aptina MT9V111 is a 1/4-Inch VGA-format digital image sensor with a core
> +  based on Aptina MT9V011 sensor and an integrated Image Flow Processor (IFP).
> +
> +  The sensor has an active pixel array of 640x480 pixels and can output a number
> +  of image resolution and formats controllable through a simple two-wires

s/resolution/resolutions/

> +  interface.
> +
> +properties:
> +  compatible:
> +    const: aptina,mt9v111
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: Enable signal, pin name "OE#". Active low.
> +    maxItems: 1
> +
> +  standby-gpios:
> +    description: Low power state control signal, pin name "STANBY". Active high.

s/STANBY/STANDBY/

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Chip reset signal, pin name "RESET#". Active low.
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: |
> +      The device node must contain one 'port' child node for its digital output
> +      video port, in accordance with the video interface bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.

Just "Output video port. See ../video-interfaces.txt." should be enough.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          remote-endpoint:
> +            description: A phandle to the bus receiver's endpoint node.
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@48 {
> +            compatible = "aptina,mt9v111";
> +            reg = <0x48>;
> +            clocks = <&camera_clk>;
> +
> +            port {
> +                mt9v111_out: endpoint {
> +                    remote-endpoint = <&ceu_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5392f00cec46..18bc4427e6b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11688,7 +11688,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
> +F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
>  F:	drivers/media/i2c/mt9v111.c
> 
>  MULTIFUNCTION DEVICES (MFD)

-- 
Regards,

Laurent Pinchart
