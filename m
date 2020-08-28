Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25D62562D7
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 00:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgH1WMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 18:12:32 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42504 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgH1WMa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 18:12:30 -0400
Received: by mail-il1-f195.google.com with SMTP id t13so1947771ile.9;
        Fri, 28 Aug 2020 15:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ylfadHnLOduJZ1gh5dpe1oTQmQeW7cK8OrYf257y/Lo=;
        b=gK3I2/As7AwRBgY/6nDcs0FLgoug5gOtnSBcB/B6Ct8hTkruUjc+nkn90hQBdXXahc
         Hok/YdVZ0zHksMlwUn1AilgBSqZa+GtL+zZeV2gJmYivGVao7Cqzt77fLm1Dxn0FWgBi
         optzYhdv1gRbi/cXO/M6WcB1hFxqw1U7aml/d9jvcRxgNkUgp1/8xZ6ZVFOeiaoOgyF8
         /lhBSfuJZ93jz3h+a5S6A0ThsdbmKQH16uj8/P4JaIS0UQo17nsumceysfgxLkleot2+
         CUVrgk0QqY92eumJRtFxSCIx+2YT1kYhFE17bhqVAWMrf/BzQT1Tp2esM1m7wS769CiC
         t63g==
X-Gm-Message-State: AOAM532srpOQHUXF88iI9GGjBCOvgNYpzUHzYE25DGM2mrZhYH8eo/i3
        FCZSGG1o+zFR2EipOHfEwA==
X-Google-Smtp-Source: ABdhPJylZhPuFboE5Oo5gyHVK/VcF58Pw3gdNNBcLyFGBCCeLOf4Eg+F1AEuKsY0XlOnFoGfl3mbNw==
X-Received: by 2002:a05:6e02:f4e:: with SMTP id y14mr813503ilj.255.1598652748397;
        Fri, 28 Aug 2020 15:12:28 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e23sm250977iot.28.2020.08.28.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 15:12:27 -0700 (PDT)
Received: (nullmailer pid 3496081 invoked by uid 1000);
        Fri, 28 Aug 2020 22:12:25 -0000
Date:   Fri, 28 Aug 2020 16:12:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Leon Luo <leonl@leopardimaging.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200828221225.GA3491712@bogus>
References: <20200824105850.28002-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824105850.28002-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 12:58:50PM +0200, Jacopo Mondi wrote:
> Convert the imx274 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt  | 38 -----------
>  .../bindings/media/i2c/sony,imx274.yaml       | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 69 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> deleted file mode 100644
> index 0727079d2410..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
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
> -- clocks: Reference to the input clock.
> -- clock-names: Should be "inck".
> -- VANA-supply: Sensor 2.8v analog supply.
> -- VDIG-supply: Sensor 1.8v digital core supply.
> -- VDDL-supply: Sensor digital IO 1.2v supply.
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
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> new file mode 100644
> index 000000000000..7ae47a614d2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 8.51MP CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Leon Luo <leonl@leopardimaging.com>
> +
> +description: -|
> +  The Sony IMX274 is a 1/2.5-inch CMOS active pixel digital image sensor with an
> +  active array size of 3864H x 2202V. It is programmable through I2C interface.
> +  Image data is sent through MIPI CSI-2, which is configured as 4 lanes at 1440
> +  Mbps.
> +
> +properties:
> +  compatible:
> +    const: sony,imx274
> +
> +  reg:
> +    const: 0x1a
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

As discussed, drop 'endpoint'.

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - port

additionalProperties: false

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
> index 9503ea17aa28..dc7b1ea8e7b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16125,7 +16125,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>  F:	drivers/media/i2c/imx274.c
> 
>  SONY IMX290 SENSOR DRIVER
> --
> 2.27.0
> 
