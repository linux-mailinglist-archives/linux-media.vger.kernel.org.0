Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32951BCF6D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 00:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgD1WG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 18:06:29 -0400
Received: from retiisi.org.uk ([95.216.213.190]:42994 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726256AbgD1WG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 18:06:29 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 96AD3634C8F;
        Wed, 29 Apr 2020 01:05:29 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jTYM5-00028u-1o; Wed, 29 Apr 2020 01:05:29 +0300
Date:   Wed, 29 Apr 2020 01:05:29 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v8 v5 1/3] media: dt-bindings: ov8856: Document YAML
 bindings
Message-ID: <20200428220528.GX934@valkosipuli.retiisi.org.uk>
References: <20200428180718.1609826-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428180718.1609826-1-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thanks for the update. Some small matters below.

On Tue, Apr 28, 2020 at 08:07:16PM +0200, Robert Foss wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds documentation of device tree in YAML schema for the
> OV8856 CMOS image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> - Changes since v7:
>   * Marco: Make 'port' property optional
>   * Maxime & Sakari: Add 'link-frequencies' property to dt binding
>   * robher: Improve description for 'port' property
> 
> - Changes since v6:
>   * Marco: remove qcom specifics from DT example
>    
> - Changes since v5:
>   * Add assigned-clocks and assigned-clock-rates
>   * robher: dt-schema errors
> 
> - Changes since v4:
>   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
>   * Add clock-lanes property to example
>   * robher: Fix syntax error in devicetree example
> 
> - Changes since v3:
>   * robher: Fix syntax error
>   * robher: Removed maxItems
>   * Fixes yaml 'make dt-binding-check' errors
> 
> - Changes since v2:
>   Fixes comments from from Andy, Tomasz, Sakari, Rob.
>   * Convert text documentation to YAML schema.
> 
> - Changes since v1:
>   Fixes comments from Sakari, Tomasz
>   * Add clock-frequency and link-frequencies in DT
> 
>  .../devicetree/bindings/media/i2c/ov8856.yaml | 140 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> new file mode 100644
> index 000000000000..f78d3eae81cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2019 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Ben Kao <ben.kao@intel.com>
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>

I guess Dongchun would be the maintainer for these bindings, not Ben.
Please also cc Ben in the next version.

> +
> +description: |-
> +  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
> +  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
> +  sub-sampled, and windowed 10-bit MIPI images in various formats via the
> +  Serial Camera Control Bus (SCCB) interface. This chip is programmable
> +  through I2C and two-wire SCCB. The sensor output is available via CSI-2
> +  serial data output (up to 4-lane).
> +
> +properties:
> +  compatible:
> +    const: ovti,ov8856
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
> +  clock-frequency:
> +    description:
> +      Frequency of the xvclk clock in Hertz.
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
> +  reset-gpios:
> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +      This corresponds to the hardware pin XSHUTDOWN which is physically
> +      active low.
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
> +        properties:
> +          clock-lanes:

Does the sensor support lane reordering? If not, please omit this.

> +            maxItems: 1
> +
> +          data-lanes:
> +            maxItems: 1

Hmm. The example has four lanes. Do I miss something?

> +
> +          link-frequencies:
> +            maxItems: 1

The number of items in link-frequencies should not be limited to one
either.

> +
> +          remote-endpoint: true
> +
> +        required:
> +          - clock-lanes
> +          - data-lanes
> +          - remote-endpoint
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
> +  - reset-gpios
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
> +        ov8856: camera@10 {
> +            compatible = "ovti,ov8856";
> +            reg = <0x10>;
> +
> +            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&clk_24m_cam>;
> +
> +            clocks = <&cam_osc>;
> +            clock-names = "xvclk";
> +            clock-frequency = <19200000>;
> +
> +            avdd-supply = <&mt6358_vcama2_reg>;
> +            dvdd-supply = <&mt6358_vcamd_reg>;
> +            dovdd-supply = <&mt6358_vcamio_reg>;
> +
> +            port {
> +                wcam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_wcam>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <360000000 180000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> \ No newline at end of file

^

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26f281d9f32a..84b262afd13d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12489,6 +12489,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/ov8856.c
> +F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
>  
>  OMNIVISION OV9640 SENSOR DRIVER
>  M:	Petr Cvek <petrcvekcz@gmail.com>

-- 
Kind regards,

Sakari Ailus
