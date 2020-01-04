Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF911304C7
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 22:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgADVx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 16:53:26 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:33151 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgADVx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Jan 2020 16:53:26 -0500
Received: by mail-il1-f194.google.com with SMTP id v15so39442910iln.0
        for <linux-media@vger.kernel.org>; Sat, 04 Jan 2020 13:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UMQ6SzTkDLHhnu1QumBptfeZocUfO6/rt1OW+mwTDDs=;
        b=AsGSpANJ95bqBAxMhuvjrxKaRO7sv67d1nTqF7FHwNST56RacmbLUOCqyCVUoXhF90
         yDaJiYAVegzIw62UxAp3u/Lhs9ubvtvAfJP1tXF0+EBxX3ic3cZOEX2B4SFyywtb9nSl
         /9evzV0LYWiknUoFw6PUHYDYLfqKtihQDbfMotxwTURmDb2WRYaCUM8dHe4AuOYYEryz
         aFp5E06QRumsREEkqFc6ohy1nBQokLc44e69rtmRaWcDZgiWwMyfrRAIN5DGEKLw48iY
         6tlCBZnpqnopKJfPk7MuZicyaSj8PpC6zs/HaD5iqh6eECYPWXEiij6VZHC/udVtLT+u
         jB6A==
X-Gm-Message-State: APjAAAXQcwso3ofx9ckd3e6BlnPYEjBC9J8iGN6WXZ6twT8fbrfUzQ02
        rrrLhjafdeu/8f+kfbqa2rOYbHc=
X-Google-Smtp-Source: APXvYqyhnhxSjOA/dj0kMTZLR+BFMhSqM68qyXJCxIKX4hZwoXm4SzYXGnSI4gyEr/ilPga64TPPKw==
X-Received: by 2002:a92:ce85:: with SMTP id r5mr83197460ilo.301.1578174805275;
        Sat, 04 Jan 2020 13:53:25 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id l17sm20432795ilc.49.2020.01.04.13.53.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:53:24 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:53:22 -0700
Date:   Sat, 4 Jan 2020 14:53:22 -0700
From:   Rob Herring <robh@kernel.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, peter.griffin@linaro.org,
        ezequiel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
Message-ID: <20200104215322.GA548@bogus>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227122114.23075-2-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 27, 2019 at 03:21:13PM +0300, Andrey Konovalov wrote:
> Add YAML device tree binding for IMX219 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx219.yaml | 134 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> new file mode 100644
> index 000000000000..b58aa49a7c03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +
> +description: |-
> +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> +  with an active array size of 3280H x 2464V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx219
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xclk
> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.8 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.2 volts
> +
> +  xclr-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  camera-clk:
> +    type: object
> +
> +    description: Clock source for imx219

This clock is external to the sensor, so a node for a fixed clock should 
be too.

> +
> +    properties:
> +      clock-frequency: true
> +
> +    required:
> +      - clock-frequency
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            description: |-
> +              Should be <1 2> for two-lane operation, or <1 2 3 4> for
> +              four-lane operation.
> +            oneOf:
> +              - const: [[ 1, 2 ]]
> +              - const: [[ 1, 2, 3, 4 ]]

Not sure if this actually works. If it does, it exposes how we encode 
the DT yaml format which we don't want to do here.

It should be:

oneOf:
  - items:
      - const: 1
      - const: 2
  - items:
      - const: 1
      - const: 2
      - const: 3
      - const: 4

Really, I think you shouldn't need the 2nd case as that should be the 
default.

> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              Presence of this boolean property decides whether the MIPI CSI-2
> +              clock is continuous or non-continuous.
> +
> +        required:
> +          - clock-lanes
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx219: sensor@10 {
> +            compatible = "sony,imx219";
> +            reg = <0x10>;
> +            clocks = <&imx219_clk>;
> +            clock-names = "xclk";
> +            VANA-supply = <&imx219_vana>;   /* 2.8v */
> +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
> +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
> +
> +            imx219_clk: camera-clk {
> +                compatible = "fixed-clock";
> +                #clock-cells = <0>;
> +                clock-frequency = <24000000>;
> +            };
> +
> +            port {
> +                imx219_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ffa3371bc750..f7b6c24ec081 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15350,6 +15350,14 @@ S:	Maintained
>  F:	drivers/media/i2c/imx214.c
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>  
> +SONY IMX219 SENSOR DRIVER
> +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	drivers/media/i2c/imx219.c
> +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +
>  SONY IMX258 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.17.1
> 
