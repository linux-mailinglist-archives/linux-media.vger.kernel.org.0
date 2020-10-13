Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D77728D211
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 18:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389028AbgJMQTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 12:19:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:24874 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgJMQTq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 12:19:46 -0400
IronPort-SDR: b1mfJwRLJgLCejXMFPoIHe2a7zxYSUMO9gsZNoGAqVOB/XikkGzFSOBIcTF6Wd04gWntWP+VIg
 MXaLzIYwbZjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="153770166"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="153770166"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 09:19:45 -0700
IronPort-SDR: T8CrZoL7o9D/gVxeRdZ1w+UB9VXZEPeyTugyDTUgyUio4vkkogw9VjeNzSt23mVkk3v+HfkVb3
 YLFk4KOX3RHg==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="318350702"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 09:19:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 12D87205E8; Tue, 13 Oct 2020 19:19:39 +0300 (EEST)
Date:   Tue, 13 Oct 2020 19:19:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201013161938.GE13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013130503.2412-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> relevant MAINTAINERS entries.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..fb98964
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,162 @@
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
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      External clock for the sensor.
> +    items:
> +      - const: eclk
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hz.
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
> +      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
> +      or shutdown mode. As the line needs to be high for the powerdown mode
> +      to be active, it should be marked GPIO_ACTIVE_HIGH.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line needs to be low for the reset to be active, it should be
> +      marked GPIO_ACTIVE_LOW.
> +    maxItems: 1
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
> +  ovti,mipi-clock-voltage:
> +    description:
> +      An array of 2-tuples items, and each item consists of link frequency and
> +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> +      dependent upon link speed, indicating MIPI transmission speed select that
> +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> +      the clock driver capability.
> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    minItems: 2
> +    default: [390000, 4]

Why do you have the link frequency here as well?

In principle this does belong to the endpoint as link frequencies are
specific to that, but I don't mind; there's just a single port anyway.

> +
> +  # See ../video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Output port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          link-frequencies: true
> +          remote-endpoint: true
> +
> +        required:
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
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov02a10: camera-sensor@3d {
> +            compatible = "ovti,ov02a10";
> +            reg = <0x3d>;
> +
> +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
> +
> +            clocks = <&ov02a10_clk>;
> +            clock-names = "eclk";
> +            clock-frequency = <24000000>;
> +
> +            rotation = <180>;
> +            ovti,mipi-clock-voltage = <390000 4>;
> +
> +            dovdd-supply = <&ov02a10_dovdd>;
> +            avdd-supply = <&ov02a10_avdd>;
> +            dvdd-supply = <&ov02a10_dvdd>;
> +
> +            port {
> +                wcam_out: endpoint {
> +                    link-frequencies = /bits/ 64 <390000000>;
> +                    remote-endpoint = <&mipi_in_wcam>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb6..48aa7a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12718,6 +12718,13 @@ M:	Harald Welte <laforge@gnumonks.org>
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

-- 
Sakari Ailus
