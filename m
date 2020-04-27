Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5EA91BA77E
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 17:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgD0PMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 11:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727115AbgD0PMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 11:12:24 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F55C03C1A8
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 08:12:22 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m13so26681292otf.6
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIp8ZTFNXRaS7/OUF2y+xPzA9YTnd5ToCoVg08aWYRA=;
        b=vlpJmso9TwRmefWhO2kzikOVfVrXkp8kpayvCO1uoHw7cBzuqj8nbxQJ1Tgxrhz9U+
         oSrC1vWy96TUuj/s+7wJ2Uo4N5HTxPSMuGl3+LA3Rt2TxWD8SqQiV1rJFFyWE4fLyr5V
         5dsLuTNZU5ZfSlSCFBwnHk0vPUtqcPpqAyjAL/MhFni8VOzzWDacLGeZR6yIPteJmyj8
         WekLqd/ewUNmdHNVsjCmC68N2xe3w0K2UCa/vlPatf1phBgjE1KAnE4IRjgnsAq/Qm6G
         xTZP8ZYoeza355Xnxi2c2JunJyRZDuDwNb83jkKzou4i6c7X9E1BrpMg1Lgzc/dycMPe
         yW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIp8ZTFNXRaS7/OUF2y+xPzA9YTnd5ToCoVg08aWYRA=;
        b=k1gXBbHVPFkH8BtOfClIP39PNHWQuJRN8iDP8hNFgOjuptgoDBnrB2W3mLY+z2Dk8E
         /68kN1LBdlGGYKjt5m3hiACYx3ea/6Ik90VdZ5llg4FbjyiWSFVVTZeq0KxnTz8ID4rA
         yYRekQSI3UdkmBNDZGSulIDskjf9w8wziPNT75ZU8SH6uABLuecz7yt/+ujbbIDsczec
         noHjUJiHXqWptITO9opjXM2jfc/XsoqSGkSQvQHU22MBLaypAUO7F1iWh37E9KczDQ+W
         RiB4E+T31qJAAkGhMfklO+bz0f4Zs6uc0aBqDMO+HGIaSA7m9diyrv848WA8gwfX3ZsX
         vxNQ==
X-Gm-Message-State: AGi0PuY4FBORrhIDXdvEi7IaDpCe76d6Ly0GXfdGeaAXodwTpTLE2M/0
        /cs8rtspkNERvsxrfiAdvOlWC8rR3pytCU+V1KlVSQ==
X-Google-Smtp-Source: APiQypIROFjpPfAr6klYkWqkYs40LPhaeY4S7P6AVL9pR2VKJxm7dlVIY8qtp8D3WUMrIAVNAFfqvkn7KBPpf7BKXTA=
X-Received: by 2002:a05:6830:1d7:: with SMTP id r23mr18535317ota.68.1588000340557;
 Mon, 27 Apr 2020 08:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200408110816.2712841-1-robert.foss@linaro.org>
 <20200408110816.2712841-2-robert.foss@linaro.org> <20200415160729.GA4438@bogus>
In-Reply-To: <20200415160729.GA4438@bogus>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 27 Apr 2020 17:12:09 +0200
Message-ID: <CAG3jFysLE3Mh7Gm+XPj2q9w2x7aVvmWTriWY5sVyQbJzUDA_hQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 Apr 2020 at 18:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 08, 2020 at 01:08:14PM +0200, Robert Foss wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > This patch adds documentation of device tree in YAML schema for the
> > OV8856 CMOS image sensor.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > - Changes since v6:
> >   * Marco: remove qcom specifics from DT example
> >
> > - Changes since v5:
> >   * Add assigned-clocks and assigned-clock-rates
> >   * robher: dt-schema errors
> >
> > - Changes since v4:
> >   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
> >   * Add clock-lanes property to example
> >   * robher: Fix syntax error in devicetree example
> >
> > - Changes since v3:
> >   * robher: Fix syntax error
> >   * robher: Removed maxItems
> >   * Fixes yaml 'make dt-binding-check' errors
> >
> > - Changes since v2:
> >   Fixes comments from from Andy, Tomasz, Sakari, Rob.
> >   * Convert text documentation to YAML schema.
> >
> > - Changes since v1:
> >   Fixes comments from Sakari, Tomasz
> >   * Add clock-frequency and link-frequencies in DT
> >
> >  .../devicetree/bindings/media/i2c/ov8856.yaml | 143 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 144 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > new file mode 100644
> > index 000000000000..96bef5403d7e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > @@ -0,0 +1,143 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2019 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Ben Kao <ben.kao@intel.com>
> > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +
> > +description: |-
> > +  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
> > +  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
> > +  sub-sampled, and windowed 10-bit MIPI images in various formats via the
> > +  Serial Camera Control Bus (SCCB) interface. This chip is programmable
> > +  through I2C and two-wire SCCB. The sensor output is available via CSI-2
> > +  serial data output (up to 4-lane).
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov8856
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Input clock for the sensor.
> > +    items:
> > +      - const: xvclk
> > +
> > +  assigned-clocks:
> > +    description:
> > +      Input clock for the sensor.
> > +
> > +  assigned-clock-rates:
> > +    description:
> > +      Frequency of the xvclk clock in Hertz.
>
> These 2 should have a 'maxItems: 1'

Thanks for finding this, I'll send a new revision without assigned-clocks soon.

>
> > +
> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +
> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> > +
> > +  reset-gpios:
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor reset.
> > +      This corresponds to the hardware pin XSHUTDOWN which is physically
> > +      active low.
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +    description:
> > +      A node containing input and output port nodes with endpoint definitions
>
> Only an output, right?

Good find, fixing in next version.

>
> > +      as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          clock-lanes:
> > +            maxItems: 1
> > +
> > +          data-lanes:
> > +            maxItems: 1
> > +
> > +          remote-endpoint: true
> > +
> > +        required:
> > +          - clock-lanes
> > +          - data-lanes
> > +          - remote-endpoint
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - assigned-clocks
> > +  - assigned-clock-rates
> > +  - dovdd-supply
> > +  - avdd-supply
> > +  - dvdd-supply
> > +  - reset-gpios
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov8856: camera@10 {
> > +            compatible = "ovti,ov8856";
> > +            reg = <0x10>;
> > +
> > +            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&clk_24m_cam>;
> > +
> > +            clocks = <&cam_osc>;
> > +            clock-names = "xvclk";
> > +            assigned-clocks = <&cam_osc>;
> > +            assigned-clock-rates = <19200000>;
> > +
> > +            avdd-supply = <&mt6358_vcama2_reg>;
> > +            dvdd-supply = <&mt6358_vcamd_reg>;
> > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > +
> > +            port {
> > +                wcam_out: endpoint {
> > +                    remote-endpoint = <&mipi_in_wcam>;
> > +                    clock-lanes = <0>;
> > +                    data-lanes = <1 2 3 4>;
> > +                    link-frequencies = /bits/ 64 <360000000 180000000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > \ No newline at end of file
>
> ^^^
>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 534a8dc4f84a..3f35c6e9700a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12465,6 +12465,7 @@ L:    linux-media@vger.kernel.org
> >  T:   git git://linuxtv.org/media_tree.git
> >  S:   Maintained
> >  F:   drivers/media/i2c/ov8856.c
> > +F:   Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> >
> >  OMNIVISION OV9650 SENSOR DRIVER
> >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> > --
> > 2.25.1
> >
