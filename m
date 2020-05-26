Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622FB1E2A0B
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 20:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgEZS2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 14:28:51 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33067 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgEZS2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 14:28:51 -0400
Received: by mail-il1-f193.google.com with SMTP id y17so19299358ilg.0;
        Tue, 26 May 2020 11:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8G/Js8g5idRPMRWdzi17/octVu1NTNo+9WkwNwKfGQg=;
        b=csvQtWK47tarPSlrvVuz0dG02pX24dxY3qWfll9wq2UKuj18ib1JKQAzLuQLlijU6Z
         1P0HJy7OuDYkR/ZnOcNePTMZSJMibxzNIXOiySUsXmBAPaqBr1Q66bs8eHg8ilnVyNCv
         ciXVfmG/w5kWe1hh+xoFfQ6lFm7UbMNwpa916GEwzpYwFIOvNkI+YBlJsvpl/c1jzWwV
         Fuy5/e9tTzxDPg5Z9SGzOLDGJZrQGmua2WLEGDIpefJYWVweuntsARIQ1fMTn90M7XFN
         +qX5A6NpunVWbzKmCe+Pm03ziLQzsCOs6nPOsz+DvBrMbcXpUCw5lExOTJDOX2YDDBpC
         RAHA==
X-Gm-Message-State: AOAM531WFRBOhiGHyazFlmIhXLC+gm/EkXy3PyDObGi+jNHyCa74s9Cg
        RPXqMKfKKbeTZnZMN3tNtA==
X-Google-Smtp-Source: ABdhPJzdDSCsKm+b69so9ArYKwXlWLBU/YAO20Z2v1p7Om5xOYhZPKKMyvSOleIImXZeOuuZ5F/yTg==
X-Received: by 2002:a92:9899:: with SMTP id a25mr2343958ill.151.1590517729468;
        Tue, 26 May 2020 11:28:49 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o70sm351829ilb.86.2020.05.26.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 11:28:48 -0700 (PDT)
Received: (nullmailer pid 129592 invoked by uid 1000);
        Tue, 26 May 2020 18:28:47 -0000
Date:   Tue, 26 May 2020 12:28:47 -0600
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
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200526182847.GA92449@bogus>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523084103.31276-2-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 23, 2020 at 04:41:02PM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..56f31b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,172 @@
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
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: top mux camtg clock
> +      - description: divider clock
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
> +      Definition of the regulator used as Digital I/O voltage supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as Analog voltage supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as Digital core voltage supply.
> +
> +  powerdown-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> +      or Shutdown mode. As the line is active low, it should be
> +      marked GPIO_ACTIVE_LOW.

Need to define how many GPIOs ('maxItems: 1')

> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.

Here too.

> +
> +  rotation:
> +    description:
> +      Definition of the sensor's placement.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    # Sensor Mounted Upright
> +          - 180  # Sensor Mounted Upside Down
> +        default: 0
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
> +          - 4    # 100MHz - 130MHz
> +        default: 3
> +
> +  # See ../video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false

Should have a description of what data the port has.

> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            maxItems: 1
> +
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint
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
> +            ovti,mipi-tx-speed = <4>;
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
> +                    data-lanes = <1>;
> +                    link-frequencies = /bits/ 64 <390000000>;
> +                    remote-endpoint = <&mipi_in_wcam>;
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
