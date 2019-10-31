Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71297EB4D8
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 17:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbfJaQir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 12:38:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727593AbfJaQiq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 12:38:46 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 345E0208C0;
        Thu, 31 Oct 2019 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572539925;
        bh=YU229KBhy8a1ftHimn6c/jCBFwGzLDMNIxYvFPF7Tt4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y3rDPmS4VFm6m+S7Oifp3EFP4nTyHcnOpbws+84bnlDwMLGLe5ujstn2B81em3uj9
         al5gcwP0L8/AMmGwwl8wFz/drnsqZq4OfW8v+iSPiyYYu9FlWmGNl9CwvpMKIQgQJ/
         x94S7hi0Ll5yPpyppWUsC7jhZONDuLXG1nO6FzyE=
Received: by mail-qk1-f180.google.com with SMTP id y81so7645670qkb.7;
        Thu, 31 Oct 2019 09:38:45 -0700 (PDT)
X-Gm-Message-State: APjAAAWY77IofhNtPcm3txAw9xR3Nr43djBGckykMzqYmzSaNHSkba9h
        lW3G/IZJwY/5EKB/22NYptImSMnwI6MKVzvDYQ==
X-Google-Smtp-Source: APXvYqzdMO6CZSHTsOVDftdeHphCx6evujWZ5b8s9DgkPeYuOFhNdlZfZF3YHNGIendCmjmLB2S9WjfyLMItB6rd2ZU=
X-Received: by 2002:a37:f703:: with SMTP id q3mr6227212qkj.254.1572539924243;
 Thu, 31 Oct 2019 09:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191031090213.27727-1-dongchun.zhu@mediatek.com> <20191031090213.27727-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20191031090213.27727-2-dongchun.zhu@mediatek.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 31 Oct 2019 11:38:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+4epXNTNYnC4WZ8LoeYegjOifrjezhDDhfa3o3Y2pWNg@mail.gmail.com>
Message-ID: <CAL_Jsq+4epXNTNYnC4WZ8LoeYegjOifrjezhDDhfa3o3Y2pWNg@mail.gmail.com>
Subject: Re: [V3, 1/2] media: dt-bindings: ov8856: Document YAML bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        bingbu.cao@intel.com, srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 31, 2019 at 4:02 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> This patch adds documentation of device tree in YAML schema for the
> OV8856 CMOS image sensor.
>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov8856.yaml      | 126 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

Need to test this with 'make dt-binding-check':

warning: no schema found in file:
Documentation/devicetree/bindings/media/i2c/ov8856.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/i2c/ov8856.yaml:
ignoring, error parsing file
Documentation/devicetree/bindings/media/i2c/ov8856.yaml:  while
scanning a simple key
  in "<unicode string>", line 81, column 5
could not find expected ':'
  in "<unicode string>", line 84, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target
'Documentation/devicetree/bindings/media/i2c/ov8856.example.dts'
failed

>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> new file mode 100644
> index 0000000..a161812
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -0,0 +1,126 @@
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
> +    maxItems: 1

Drop maxItems, it's always a single phandle.

> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +    maxItems: 1
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as digital power supply.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      The phandle and specifier for the GPIO that controls sensor reset.
> +    maxItems: 1
> +
> +  # See ../video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +      type: object
> +
> +      properties:
> +        remote-endpoint: true
> +        data-lanes: true
> +        link-frequencies: true
> +
> +      required:
> +        - remote-endpoint
> +        - data-lanes
> +        - link-frequencies
> +
> +    required

Missing ':' is the cause of the error above.

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
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    ov8856: camera-sensor@10 {
> +        compatible = "ovti,ov8856";
> +        reg = <0x10>;
> +        reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&clk_24m_cam>;
> +
> +        clocks = <&cru SCLK_TESTCLKOUT1>;
> +        clock-names = "xvclk";
> +        clock-frequency = <19200000>;
> +
> +        avdd-supply = <&mt6358_vcama2_reg>;
> +        dvdd-supply = <&mt6358_vcamd_reg>;
> +        dovdd-supply = <&mt6358_vcamio_reg>;
> +
> +        port {
> +            wcam_out: endpoint {
> +                remote-endpoint = <&mipi_in_wcam>;
> +                data-lanes = <1 2 3 4>;
> +                link-frequencies = /bits/ 64 <360000000 180000000>;
> +            };
> +        };
> +    };
> +
> +...
> \ No newline at end of file
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 296de2b..4cbae26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12037,6 +12037,7 @@ L:      linux-media@vger.kernel.org
>  T:     git git://linuxtv.org/media_tree.git
>  S:     Maintained
>  F:     drivers/media/i2c/ov8856.c
> +F:     Documentation/devicetree/bindings/media/i2c/ov8856.yaml
>
>  OMNIVISION OV9650 SENSOR DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> --
> 2.9.2
>
