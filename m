Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B42725225E
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 23:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHYVDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 17:03:55 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37300 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYVDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 17:03:54 -0400
Received: by mail-io1-f68.google.com with SMTP id b16so221899ioj.4;
        Tue, 25 Aug 2020 14:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jh2GXsTZ2wzVNeyEzB59BARJbAF0JSu9/0nbo19/Bik=;
        b=F1GRhgXxMQS03DQMUPbjcaEy1rg/acvC2Dx5ga44ZlC1Bq9BfZO7l9XHI9FoB4bbhO
         uwskaTJSZmcusGcRtCrPT7iMDyyFkDL+idZeQ7CWbgM17Lh0hSugZGXx4YfHs9ed/paV
         gxo2C7Fr1NBVtxUlfgq/gPnjN/qIYcnZTDz95SQaMkVnAj0zlRV4qPHWELAsCOc6TcEs
         ebzi6oNUh8dDKTwTKDk3rwYmTUTT6grNQIAtJArE4rzFwIBwwBf6OnHaoHSxioEQzY+U
         wex5wHZhMQ8GFpwMrvFcMVR63oPgvIw6AH4mZRWgJnJRI35f8FIMq3fALh0M+585c0QJ
         IT7w==
X-Gm-Message-State: AOAM530/OHig66BECZsioMNcsuusWCdF5ChM8tt1w5UrZD/2SqpMhxVF
        p1VESujmZGIn6EMmVh21WfVFnVpjvD2X
X-Google-Smtp-Source: ABdhPJwNGCmwozc9uw8Zr3art1UvL1Q+xHxPeYIh1s+d4H8TRSZx7rObRNS8wBgcnNzPDHOMwzGe1g==
X-Received: by 2002:a05:6638:218a:: with SMTP id s10mr2630591jaj.117.1598389432967;
        Tue, 25 Aug 2020 14:03:52 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id t88sm124261ild.8.2020.08.25.14.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:03:52 -0700 (PDT)
Received: (nullmailer pid 1325788 invoked by uid 1000);
        Tue, 25 Aug 2020 21:03:49 -0000
Date:   Tue, 25 Aug 2020 15:03:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: ov772x: Convert to json-schema
Message-ID: <20200825210349.GA1312827@bogus>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818122012.37956-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 18, 2020 at 02:20:10PM +0200, Jacopo Mondi wrote:
> Convert the ov772x binding document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov772x.txt  | 40 ---------
>  .../devicetree/bindings/media/i2c/ov772x.yaml | 84 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> deleted file mode 100644
> index 0b3ede5b8e6a..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -* Omnivision OV7720/OV7725 CMOS sensor
> -
> -The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
> -such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
> -support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
> -
> -Required Properties:
> -- compatible: shall be one of
> -	"ovti,ov7720"
> -	"ovti,ov7725"
> -- clocks: reference to the xclk input clock.
> -
> -Optional Properties:
> -- reset-gpios: reference to the GPIO connected to the RSTB pin which is
> -  active low, if any.
> -- powerdown-gpios: reference to the GPIO connected to the PWDN pin which is
> -  active high, if any.
> -
> -The device node shall contain one 'port' child node with one child 'endpoint'
> -subnode for its digital output video port, in accordance with the video
> -interface bindings defined in Documentation/devicetree/bindings/media/
> -video-interfaces.txt.
> -
> -Example:
> -
> -&i2c0 {
> -	ov772x: camera@21 {
> -		compatible = "ovti,ov7725";
> -		reg = <0x21>;
> -		reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> -		powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> -		clocks = <&xclk>;
> -
> -		port {
> -			ov772x_0: endpoint {
> -				remote-endpoint = <&vcap1_in0>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> new file mode 100644
> index 000000000000..2b84fefeb4aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov772x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:  Omnivision OV7720/OV7725 CMOS sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +
> +description: -|
> +  The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
> +  such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
> +  support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,ov7720
> +      - ovti,ov7725
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: -|

You can drop '-|' as there's not any formatting to preserve here.

> +      Reference to the GPIO connected to the RSTB pin which is active low.
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: -|
> +      Reference to the GPIO connected to the PWDN pin which is active high.
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
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - reset-gpios
> +  - powerdown-gpios

port not required?

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ov772x: camera@21 {
> +            compatible = "ovti,ov7725";
> +            reg = <0x21>;
> +            reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> +            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> +            clocks = <&xclk>;
> +
> +            port {
> +                ov772x_0: endpoint {
> +                    remote-endpoint = <&vcap1_in0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1a6173d3b64..d0a20214eaaf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12666,7 +12666,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov772x.txt
> +F:	Documentation/devicetree/bindings/media/i2c/ov772x.yaml
>  F:	drivers/media/i2c/ov772x.c
>  F:	include/media/i2c/ov772x.h
>  
> -- 
> 2.27.0
> 
