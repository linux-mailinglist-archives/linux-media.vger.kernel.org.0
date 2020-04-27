Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E54B1BA794
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 17:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgD0PNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 11:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728236AbgD0PNy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 11:13:54 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C78C03C1A7
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 08:13:53 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id i27so26717170ota.7
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyOOuDBdhDHCyrtMWupVwHA7jGZfK6Hra8xOfCJhk28=;
        b=cVBs97ebH2wPdx+Zc1P9Bai9A1CcFRrGPxxCFhYEmXu29eCFYh2ixJV0w1Q9gR859h
         6M3fMQrDGCtv7zhp6nyOzsMB6bTpYVUtUrtVYBq20H9FL1pEfQ+L7S47FflJO9aF1bhe
         uWyyIYcDjZLwNFGia2v8KqgzIS4JjE0d3NgkFZh5w9iwT+TK80fUpRO3CdqLUk8KD444
         gvc7eRQ+gARdNBANSJXlbtPyCV/FIFGdPOixWe07ihJlFUH3kHu9nTcPYHEm1+JKFOS8
         AI6gWEeuMvsgH+tU33TPTmW7AJk/K6HJvNyZrOgmuQZ10V3ru1nhyTLbNXcsmj4LHImp
         noXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyOOuDBdhDHCyrtMWupVwHA7jGZfK6Hra8xOfCJhk28=;
        b=gPqtuKLlYIWr0yI1h4JLH86KAB2lL4P5/qXCpd4q82sAkhlfw0NYS0ufk6cSg6zOiA
         vmR6HPqJ8sXu80E943jC4VzSbn1iHNhu2FjgAOj7TkCN/fQsAOjmm6UkiZq1CL22yA6X
         FYhNq4TWWKyTxUaWeTHyUeHilDYBvWmdxfJCghYfA/bCq9bnrRsQ7tQafeD7FlC/wcvI
         UE27hZ+TRBs/rI287GfhBfgmLsR9mLzq2NtbxECfrKi6Dt0V6eJUgScyflLTkcryT5B0
         xTbHKSz1q1t/mu8vdPWnL5diExB9jXpv/JZc6ifKFHcuOR+R4BnH+h03OGqXkO16IdWm
         UwaQ==
X-Gm-Message-State: AGi0PuZPQsJvUKp7EHQ+nFDi//EyZaNYUshuz178YM8jQeoMRzL44UB7
        2CFw6Edn6ucMzZHMhb/MyWINkaVzJd8iUjiekDw3Ig==
X-Google-Smtp-Source: APiQypJT8+obI+JM5Kf9FL9d3dn4801RIOxgtgQe+uH23FuQU10gMaRw40e/70Zbe4CMStqd+6go7h7Ai1urT28IZqo=
X-Received: by 2002:aca:843:: with SMTP id 64mr17065470oii.56.1588000433147;
 Mon, 27 Apr 2020 08:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200408110816.2712841-1-robert.foss@linaro.org>
 <20200408110816.2712841-2-robert.foss@linaro.org> <20200415160729.GA4438@bogus>
 <20200415162110.bmorj4u4hkqohqjx@pengutronix.de>
In-Reply-To: <20200415162110.bmorj4u4hkqohqjx@pengutronix.de>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 27 Apr 2020 17:13:42 +0200
Message-ID: <CAG3jFysg34=HJ7xefuAKw4Uq6W0POm5TsJmzQku6WwkhH_j=-w@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
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

On Wed, 15 Apr 2020 at 18:21, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> On 20-04-15 11:07, Rob Herring wrote:
> > On Wed, Apr 08, 2020 at 01:08:14PM +0200, Robert Foss wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > >
> > > This patch adds documentation of device tree in YAML schema for the
> > > OV8856 CMOS image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > >
> > > - Changes since v6:
> > >   * Marco: remove qcom specifics from DT example
> > >
> > > - Changes since v5:
> > >   * Add assigned-clocks and assigned-clock-rates
> > >   * robher: dt-schema errors
> > >
> > > - Changes since v4:
> > >   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
> > >   * Add clock-lanes property to example
> > >   * robher: Fix syntax error in devicetree example
> > >
> > > - Changes since v3:
> > >   * robher: Fix syntax error
> > >   * robher: Removed maxItems
> > >   * Fixes yaml 'make dt-binding-check' errors
> > >
> > > - Changes since v2:
> > >   Fixes comments from from Andy, Tomasz, Sakari, Rob.
> > >   * Convert text documentation to YAML schema.
> > >
> > > - Changes since v1:
> > >   Fixes comments from Sakari, Tomasz
> > >   * Add clock-frequency and link-frequencies in DT
> > >
> > >  .../devicetree/bindings/media/i2c/ov8856.yaml | 143 ++++++++++++++++++
> > >  MAINTAINERS                                   |   1 +
> > >  2 files changed, 144 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > new file mode 100644
> > > index 000000000000..96bef5403d7e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > @@ -0,0 +1,143 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (c) 2019 MediaTek Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Ben Kao <ben.kao@intel.com>
> > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +
> > > +description: |-
> > > +  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
> > > +  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
> > > +  sub-sampled, and windowed 10-bit MIPI images in various formats via the
> > > +  Serial Camera Control Bus (SCCB) interface. This chip is programmable
> > > +  through I2C and two-wire SCCB. The sensor output is available via CSI-2
> > > +  serial data output (up to 4-lane).
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov8856
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +    items:
> > > +      - const: xvclk
> > > +
> > > +  assigned-clocks:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +
> > > +  assigned-clock-rates:
> > > +    description:
> > > +      Frequency of the xvclk clock in Hertz.
> >
> > These 2 should have a 'maxItems: 1'
>
> Don't know why those properties are needed here.. IMHO this shouldn't be
> part of the binding or at least it should be optional and not required.
> All we need is the clocks and the clock-names property.

Thanks Marco, I'll make it optional for the next revision.

>
> > > +  dovdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as interface power supply.
> > > +
> > > +  avdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as analog power supply.
> > > +
> > > +  dvdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as digital power supply.
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > +      This corresponds to the hardware pin XSHUTDOWN which is physically
> > > +      active low.
> > > +
> > > +  port:
> > > +    type: object
> > > +    additionalProperties: false
> > > +    description:
> > > +      A node containing input and output port nodes with endpoint definitions
> >
> > Only an output, right?
> >
> > > +      as documented in
> > > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +
> > > +        properties:
> > > +          clock-lanes:
> > > +            maxItems: 1
> > > +
> > > +          data-lanes:
> > > +            maxItems: 1
> > > +
> > > +          remote-endpoint: true
> > > +
> > > +        required:
> > > +          - clock-lanes
> > > +          - data-lanes
> > > +          - remote-endpoint
> > > +
> > > +    required:
> > > +      - endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - assigned-clocks
> > > +  - assigned-clock-rates
> > > +  - dovdd-supply
> > > +  - avdd-supply
> > > +  - dvdd-supply
> > > +  - reset-gpios
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        ov8856: camera@10 {
> > > +            compatible = "ovti,ov8856";
> > > +            reg = <0x10>;
> > > +
> > > +            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
> > > +            pinctrl-names = "default";
> > > +            pinctrl-0 = <&clk_24m_cam>;
> > > +
> > > +            clocks = <&cam_osc>;
> > > +            clock-names = "xvclk";
> > > +            assigned-clocks = <&cam_osc>;
> > > +            assigned-clock-rates = <19200000>;
> > > +
> > > +            avdd-supply = <&mt6358_vcama2_reg>;
> > > +            dvdd-supply = <&mt6358_vcamd_reg>;
> > > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > > +
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    clock-lanes = <0>;
> > > +                    data-lanes = <1 2 3 4>;
> > > +                    link-frequencies = /bits/ 64 <360000000 180000000>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > \ No newline at end of file
> >
> > ^^^
> >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 534a8dc4f84a..3f35c6e9700a 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12465,6 +12465,7 @@ L:  linux-media@vger.kernel.org
> > >  T: git git://linuxtv.org/media_tree.git
> > >  S: Maintained
> > >  F: drivers/media/i2c/ov8856.c
> > > +F: Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > >
> > >  OMNIVISION OV9650 SENSOR DRIVER
> > >  M: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > --
> > > 2.25.1
> > >
> >
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
