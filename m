Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4779E24A06D
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgHSNsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:48:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58328 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgHSNrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:47:40 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD22529E;
        Wed, 19 Aug 2020 15:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597844848;
        bh=qPDwphTXyFXbPbkN7vE8BKFucRpOytrUX371l7umWAk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vna714sS+6Dd60PsDIL7WCzaNki7Jhj/tklM9k3oMXXNXReJF5Gb7lR/Ucql9rLZ1
         3q8SMXcjSCuG6msP5/C09iJONbhhxKbLfvRvzXWBMpVO/nrBTVywcL9f3uxQnTUN23
         ZQlinPHF6qfRRgg6MCKqRCc6Vezm94OrCGhGdSSA=
Date:   Wed, 19 Aug 2020 16:47:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200819134711.GI6049@pendragon.ideasonboard.com>
References: <20200818121821.37776-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818121821.37776-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 18, 2020 at 02:18:21PM +0200, Jacopo Mondi wrote:
> Convert the imx274 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt  | 33 ---------
>  .../devicetree/bindings/media/i2c/imx274.yaml | 69 +++++++++++++++++++

Could you rename the file to sony,imx274.yaml ? Don't forget to change
the $id.

>  MAINTAINERS                                   |  2 +-
>  3 files changed, 70 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> deleted file mode 100644
> index 80f2e89568e1..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> -
> -The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> -an active array size of 3864H x 2202V. It is programmable through I2C
> -interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> -Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> -at 1440 Mbps.
> -
> -
> -Required Properties:
> -- compatible: value should be "sony,imx274" for imx274 sensor
> -- reg: I2C bus address of the device
> -
> -Optional Properties:
> -- reset-gpios: Sensor reset GPIO
> -
> -The imx274 device node should contain one 'port' child node with
> -an 'endpoint' subnode. For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -	sensor@1a {
> -		compatible = "sony,imx274";
> -		reg = <0x1a>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		reset-gpios = <&gpio_sensor 0 0>;
> -		port {
> -			sensor_out: endpoint {
> -				remote-endpoint = <&csiss_in>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.yaml b/Documentation/devicetree/bindings/media/i2c/imx274.yaml
> new file mode 100644
> index 000000000000..71d67466cbd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx274.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx274.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor

s/Mp/MP/

> +
> +maintainers:
> +  - Leon Luo <leonl@leopardimaging.com>
> +
> +description: -|
> +  The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with

s/imx274/IMX274/

> +  an active array size of 3864H x 2202V. It is programmable through I2C
> +  interface. The I2C address is fixed to 0x1a as per sensor data sheet.

I'd drop the last sentence, and add a const: 0x1a to the reg property.

> +  Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> +  at 1440 Mbps.
> +
> +properties:
> +  compatible:
> +    const: sony,imx274
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: |
> +      The device node must contain one 'port' child node for its digital output
> +      video port, in accordance with the video interface bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          remote-endpoint:
> +            description: A phandle to the bus receiver's endpoint node.
> +

We probably want to add clocks and regulators, as well as data-lanes,
but that's out of scope for the conversion.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx274: camera-sensor@1a {
> +            compatible = "sony,imx274";
> +            reg = <0x1a>;
> +            reset-gpios = <&gpio_sensor 0 0>;
> +
> +            port {
> +                sensor_out: endpoint {
> +                    remote-endpoint = <&csiss_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 18bc4427e6b0..6c8e98238a7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15941,7 +15941,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
> +F:	Documentation/devicetree/bindings/media/i2c/imx274.yaml
>  F:	drivers/media/i2c/imx274.c
> 
>  SONY IMX290 SENSOR DRIVER

-- 
Regards,

Laurent Pinchart
