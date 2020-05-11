Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D38E1CE29E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 20:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731137AbgEKS1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 14:27:25 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41244 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731028AbgEKS1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 14:27:24 -0400
Received: by mail-oi1-f196.google.com with SMTP id 19so15950496oiy.8;
        Mon, 11 May 2020 11:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qXhlH20xl+SARUCA4rhfAEYWxQyu62FZrWp9XsKvGVg=;
        b=e4Rb9XxCdT0obAPmNTHn4umD2mfoY40cCYe5oX+Fogf8bJvKveLkBdsLEc+0kAXCEe
         HJR9wJyMHxHdqQhWciX1gpwtltlFoNZqXEQMOSgwWvXRMGACbYzcM7At2snPM6n+EHDw
         av5d8dsHEKQ8nA12lSPTwi8IH18Z7HjKxEuQVRNzcv6HaQD6tblLa9WoZpu5kxe6Oxo2
         G4g6wBioHcMVxfZ8kEgf5BJOisdFLsnF+NpQyA+VZM6ItqZrtQFLtn1Oxcky6+6bxMBn
         Z7/0miPLXNOyZi2jUrAFQlm9AxjPzC7XtAK4iJJ3L47urLCfnusrxoC4yPtE1tiBRzGL
         tzzg==
X-Gm-Message-State: AGi0PuYgCEXFzDnyS9Y3uIVNeiKJ1VM4kXZ2ISVbnQATHz0YTS/ZHDxW
        Yf11jH48flKFMPWtcKHSQA==
X-Google-Smtp-Source: APiQypKs3Fghjq4SPEnasGGKQrJQnDjXMHnsE2wETrSBrc6VCtFD/eACI9dYBaqhcmfSSj7fJPaitA==
X-Received: by 2002:a05:6808:30b:: with SMTP id i11mr19891919oie.124.1589221642433;
        Mon, 11 May 2020 11:27:22 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r67sm4754220oie.19.2020.05.11.11.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:27:21 -0700 (PDT)
Received: (nullmailer pid 9052 invoked by uid 1000);
        Mon, 11 May 2020 16:02:07 -0000
Date:   Mon, 11 May 2020 11:02:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        mark.rutland@arm.com, sakari.ailus@linux.intel.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200511160207.GA32476@bogus>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509080627.23222-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 184 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..5468d1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> +  image sensor, which is the latest production derived from Omnivision's CMOS
> +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> +  sensor output is available via CSI-2 serial data output.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov02a10
> +
> +  reg:
> +    description: I2C device address

Drop this. Nothing specific to this device.

> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: top mux camtg clock
> +      - description: devider clock

typo

> +
> +  clock-names:
> +    items:
> +      - const: eclk
> +      - const: freq_mux
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.
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
> +  powerdown-gpios:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  rotation:
> +    description:
> +      Definition of the sensor's placement, valid values are 0 and 180.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    # Sensor Mounted Upright (default)
> +          - 180  # Sensor Mounted Upside Down
> +
> +  ovti,mipi-tx-speed:
> +    description:
> +      Indication of MIPI transmission speed select, which is to control D-PHY
> +      timing setting by adjusting MIPI clock voltage to improve the clock
> +      driver capability.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    #  20MHz -  30MHz
> +          - 1    #  30MHz -  50MHz
> +          - 2    #  50MHz -  75MHz
> +          - 3    #  75MHz - 100MHz
> +          - 4    # 100MHz - 130MHz (suggested)
> +          - 5    # Manual
> +
> +  # See ../video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A node containing an output port node with an endpoint definition
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt

No need for repeating a generic description of a common property.

> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The driver only supports 1-lane operation.

What the driver supports is not relevant.

> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.

Assume this has a common definition, so just need:

clock-noncontinuous: true

> +
> +          link-frequencies:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies. 39000000 Hz is supported by
> +              the driver.

This too is a common property.

Though 39000000 looks like a constraint. However, what the driver 
supports is not relevant.

> +
> +        required:
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - powerdown-gpios
> +  - reset-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov02a10: camera-sensor@3d {
> +            compatible = "ovti,ov02a10";
> +            reg = <0x3d>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&clk_24m_cam>;
> +
> +            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
> +                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
> +            clock-names = "eclk", "freq_mux";
> +            clock-frequency = <24000000>;
> +
> +            rotation = <180>;
> +            ovti,mipi-tx-speed = <3>;
> +
> +            dovdd-supply = <&mt6358_vcamio_reg>;
> +            avdd-supply = <&mt6358_vcama1_reg>;
> +            dvdd-supply = <&mt6358_vcn18_reg>;
> +
> +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                wcam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_wcam>;
> +                    data-lanes = <1>;

This doesn't match the schema which says this should be 4 entries.

> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <390000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64e5db..63a2335 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12389,6 +12389,13 @@ M:	Harald Welte <laforge@gnumonks.org>
>  S:	Maintained
>  F:	drivers/char/pcmcia/cm4040_cs.*
>  
> +OMNIVISION OV02A10 SENSOR DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> +
>  OMNIVISION OV13858 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.9.2
