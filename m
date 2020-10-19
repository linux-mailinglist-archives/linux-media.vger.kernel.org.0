Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E74E292F91
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 22:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgJSUjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 16:39:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43471 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJSUjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 16:39:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id l85so1452469oih.10;
        Mon, 19 Oct 2020 13:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bah8KtSAvYiOG6FC9H5FXTvGxWIUbhq2aKXbK5RpqAs=;
        b=mrphAlLo3pNRRWy25Z1hYDHeIF4zC5XM9u4m1jSDXtrJ6ezXTPp8c8TbQpJKeYYJ+q
         VEncNZDr4bvfhtwYDYZDHw9QXRrShWvj8ZohdSTBDV3MPKVZrLuZk3PiVoW3fDdC8AZ4
         vXk/ivnsNp2jkHKQbXo7HIeqBDA3LVKcVJ6HIvFj3FT2nZEZTISVwfT+cJrCFpl0g9/D
         K5ZsnX3xWoEHmZ5vGZ75/S2ftvxJjaqB4yhoSKPTZvX5wQGuAs8Cj5lVUq23tb2AXcjt
         1ckMTMrFVtDpkzSZkG9O9FPCK0He7cbfCx5iFh6dX7hP/RHQbEPt9W5AEVvyoXK375SE
         fB0Q==
X-Gm-Message-State: AOAM532977zN+JKu8HnIFPIH1g75Vjy1rjeT8Kq1jzSamYbq1/SMxgHc
        4dxye2i8n7NBH/v13Js0EP8LrVoVNA==
X-Google-Smtp-Source: ABdhPJz9mPjkwAn9EhoT7LPvJerFEbqIh2u6PcP3/YyN+2NgnfiIFi2T/usEj0cNrX32U12p0ylegw==
X-Received: by 2002:aca:c54e:: with SMTP id v75mr840789oif.134.1603139952330;
        Mon, 19 Oct 2020 13:39:12 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t29sm205526otd.51.2020.10.19.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:39:11 -0700 (PDT)
Received: (nullmailer pid 3565701 invoked by uid 1000);
        Mon, 19 Oct 2020 20:39:10 -0000
Date:   Mon, 19 Oct 2020 15:39:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201019203910.GB3550266@bogus>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-2-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014142759.726823-2-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 03:27:57PM +0100, Rui Miguel Silva wrote:
> Convert ov2680 sensor bindings documentation to yaml schema, remove
> the textual bindings document and update MAINTAINERS entry.
> 
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>   
> v1 -> v2:
>   Sakari Ailus - Patch 1/3:
>   https://lore.kernel.org/linux-media/20201013160908.GC13341@paasikivi.fi.intel.com/
>   - omit remote-endpoint
>   - remove not needed clock-lanes and data-lanes
> 
>  .../devicetree/bindings/media/i2c/ov2680.txt  |  46 --------
>  .../devicetree/bindings/media/i2c/ov2680.yaml | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 110 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.txt b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> deleted file mode 100644
> index 11e925ed9dad..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -* Omnivision OV2680 MIPI CSI-2 sensor
> -
> -Required Properties:
> -- compatible: should be "ovti,ov2680".
> -- clocks: reference to the xvclk input clock.
> -- clock-names: should be "xvclk".
> -- DOVDD-supply: Digital I/O voltage supply.
> -- DVDD-supply: Digital core voltage supply.
> -- AVDD-supply: Analog voltage supply.
> -
> -Optional Properties:
> -- reset-gpios: reference to the GPIO connected to the powerdown/reset pin,
> -               if any. This is an active low signal to the OV2680.
> -
> -The device node must contain one 'port' child node for its digital output
> -video port, and this port must have a single endpoint in accordance with
> - the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Endpoint node required properties for CSI-2 connection are:
> -- remote-endpoint: a phandle to the bus receiver's endpoint node.
> -- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
> -- data-lanes: should be set to <1> (one CSI-2 lane supported).
> -
> -Example:
> -
> -&i2c2 {
> -	ov2680: camera-sensor@36 {
> -		compatible = "ovti,ov2680";
> -		reg = <0x36>;
> -		clocks = <&osc>;
> -		clock-names = "xvclk";
> -		reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> -		DOVDD-supply = <&sw2_reg>;
> -		DVDD-supply = <&sw2_reg>;
> -		AVDD-supply = <&reg_peri_3p15v>;
> -
> -		port {
> -			ov2680_to_mipi: endpoint {
> -				remote-endpoint = <&mipi_from_sensor>;
> -				clock-lanes = <0>;
> -				data-lanes = <1>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> new file mode 100644
> index 000000000000..ef2b45b03dcc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov2680.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV2680 CMOS Sensor
> +
> +maintainers:
> +  - Rui Miguel Silva <rmfrfs@gmail.com>
> +
> +description: |-
> +  The OV2680 color sensor is a low voltage, high performance 1/5 inch UXGA (2
> +  megapixel) CMOS image sensor that provides a single-chip UXGA (1600 x 1200)
> +  camera. It provides full-frame, sub-sampled, or windowed 10-bit images in
> +  various formats via the control of the Serial Camera Control Bus (SCCB)
> +  interface.  The OV2680 has an image array capable of operating at up to 30
> +  frames per second (fps) in UXGA resolution.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2680
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Input clock for the sensor.
> +    items:
> +      - const: xvclk
> +
> +  reset-gpios:

How many? (maxItems: 1)

> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +      This corresponds to the hardware pin XSHUTDOWN which is physically
> +      active low.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply.
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A node containing an output port node with an endpoint definition
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +    required:
> +      - endpoint

Just need a description of the data/direction for 'port'. Drop the rest.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false

You can use 'additionalProperties: false' here instead.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov2680: camera-sensor@36 {
> +                compatible = "ovti,ov2680";
> +                reg = <0x36>;
> +                clocks = <&osc>;
> +                clock-names = "xvclk";
> +                reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> +
> +                dovdd-supply = <&sw2_reg>;
> +                dvdd-supply = <&sw2_reg>;
> +                avdd-supply = <&reg_peri_3p15v>;
> +
> +                port {
> +                        ov2680_to_mipi: endpoint {
> +                                remote-endpoint = <&mipi_from_sensor>;
> +                        };
> +                };
> +        };
> +    };
> +...
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2e85e114c9c3..926dcdc4794c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12775,7 +12775,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov2680.txt
> +F:	Documentation/devicetree/bindings/media/i2c/ov2680.yaml
>  F:	drivers/media/i2c/ov2680.c
>  
>  OMNIVISION OV2685 SENSOR DRIVER
> -- 
> 2.28.0
> 
