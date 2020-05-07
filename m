Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD701C8CFB
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 15:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGNuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 09:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726074AbgEGNuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 09:50:55 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F9EC05BD43
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 06:50:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d16so5420968edv.8
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TW9WsBOdli761TaDE56+H/z6K3hRAe6UVln2voBA/lw=;
        b=fFeXVj6TfW2eQOHbOgnx+s4LDQqoGobFKi0n8Oo8wV6qnlnJRftFwmiIlkEX+TD9oa
         HAa46eHh6vzXk+dPq6Q99XwTrlHvHYMtmRBQZlSAwNxPiFLVMB2r/UX07DsCVGE+LpfV
         ZDwGApTc4eyCzayupDH150mXfW1NWA2OCSKOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TW9WsBOdli761TaDE56+H/z6K3hRAe6UVln2voBA/lw=;
        b=jTZdBKQdhjAG39KxO3JOIY9X4kMW7rEP7RuOOP8byfcZZNhGS5+m7Op9xU6i5HrOpE
         cj3qQda0spRDbpllCbDbuFaFO6Fy7OI71kniciBewQvfjbXB9x1G+FPnIlyzOKwf9nHF
         pc6uViqSCOCbCiL1QNPl6BO0FVW52dg2MjwF+gcZy+9PaLTFcl/kai9vtmJfhSAANp10
         aVfqF0RwhQkxRI42u8XBGxSqyUbnMN4dZoiLXVuywFA66H7B1p8lQqK3BD47xjy2EDXf
         yKd3h9oUq7G4cC2UjP8fgHiUoKqEur0u72uXAi+fWfBGs9gOcN29MhSSwzGmVHfJ7yJc
         2xvQ==
X-Gm-Message-State: AGi0PuZif/0GQXdivyC6y6bBjI2+7nufXbFc1CXSHtpB1j8p8bqxDp3E
        cahIYf329/aL/02PeRaHlv9x1ef6l/2TtA==
X-Google-Smtp-Source: APiQypKsX7YyUpFmU/XZl7NGLSLwBHMnnJNaawXn92iE59wLVBgzoJ7Oyl0CmHTvI6CV0ERtE8X6Ew==
X-Received: by 2002:aa7:ca48:: with SMTP id j8mr11364273edt.328.1588859453186;
        Thu, 07 May 2020 06:50:53 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id bx16sm609958ejc.83.2020.05.07.06.50.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 06:50:52 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id j5so6496941wrq.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 06:50:51 -0700 (PDT)
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr7348965wrt.415.1588859451032;
 Thu, 07 May 2020 06:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com> <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03> <20200506112136.GV9190@paasikivi.fi.intel.com>
 <1588856325.8804.179.camel@mhfsdcap03>
In-Reply-To: <1588856325.8804.179.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 May 2020 15:50:40 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
Message-ID: <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>, matrix.zhu@aliyun.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari and Dongchun,

On Thu, May 7, 2020 at 3:00 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Sakari,
>
> Thanks for the review.
>
> On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> >
> > On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > > Hi Sakari,
> > >
> > > Thanks for the review.
> > >
> > > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > > >  MAINTAINERS                                        |   7 +
> > > > >  2 files changed, 155 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > new file mode 100644
> > > > > index 0000000..2be4bd2
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > @@ -0,0 +1,148 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > +
> > > > > +description: |-
> > > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > > +  sensor output is available via CSI-2 serial data output.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: ovti,ov02a10
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: top mux camtg clock
> > > > > +      - description: devider clock
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: eclk
> > > > > +      - const: freq_mux
> > > > > +
> > > > > +  clock-frequency:
> > > > > +    description:
> > > > > +      Frequency of the eclk clock in Hertz.
> > > > > +
> > > > > +  dovdd-supply:
> > > > > +    description:
> > > > > +      Definition of the regulator used as interface power supply.
> > > > > +
> > > > > +  avdd-supply:
> > > > > +    description:
> > > > > +      Definition of the regulator used as analog power supply.
> > > > > +
> > > > > +  dvdd-supply:
> > > > > +    description:
> > > > > +      Definition of the regulator used as digital power supply.
> > > > > +
> > > > > +  powerdown-gpios:
> > > > > +    description:
> > > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > > +
> > > > > +  reset-gpios:
> > > > > +    description:
> > > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > > +
> > > > > +  rotation:
> > > > > +    description:
> > > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > > +    allOf:
> > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > +      - enum:
> > > > > +          - 0    # Sensor Mounted Upright
> > > > > +          - 180  # Sensor Mounted Upside Down
> > > > > +
> > > > > +  ovti,mipi-tx-speed:
> > > > > +    description:
> > > > > +      Indication of MIPI transmission speed select.
> > > >
> > > > What exactly does this signify? And how do you come up with the number?
> > > >
> > >
> > > Apologies for not addressing this number clear.
> > >
> > > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > > the default val: 0x03.
> > > The description of this RW register is as below:
> > > Bit[2:0]: MIPI transmission speed select.
> > >
> > > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > > This would be fixed in next release.
> > >
> > > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > > that value if there is no setting for this private property in DT.
> > > The caller in driver would be updated like this in next release.
> > > if (ov02a10->mipi_clock_tx_speed)
> > >     ret = i2c_smbus_write_byte_data(...,...);
> >
> > How did you pick the value in the example? And why do you believe it is
> > specific to a platform, and not e.g. a sensor mode?
> >
>
> We look into P1:0XA1, one register that defines MIPI transmission speed
> select.
> From the datasheet, we can get the possible values that could be set to
> P1:0xA1.
>
> Actually this register is an independent of sensor mode, it is just
> included in sensor mode's register setting table.
>
> In addition, this private DT Property is created to fix the MIPI test
> failure. The register values are adjusted and verified from vendor to
> make sensor signal meet MIPI specification.
>

In theory the value could depend on the mode, because different link
rate could impose different requirements for the physical interface.
In practice, we haven't seen any hardware that would require different
values for different modes.

Best regards,
Tomasz

> > >
> > > > > +    allOf:
> > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > +      - enum: [ 3, 4 ]
> > > > > +
> > > > > +  # See ../video-interfaces.txt for details
> > > > > +  port:
> > > > > +    type: object
> > > > > +    additionalProperties: false
> > > > > +
> > > > > +    properties:
> > > > > +      endpoint:
> > > > > +        type: object
> > > > > +        additionalProperties: false
> > > > > +
> > > > > +        properties:
> > > > > +          remote-endpoint: true
> > > > > +          link-frequencies: true
> > > > > +
> > > > > +    required:
> > > > > +      - endpoint
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - clocks
> > > > > +  - clock-names
> > > > > +  - clock-frequency
> > > > > +  - dovdd-supply
> > > > > +  - avdd-supply
> > > > > +  - dvdd-supply
> > > > > +  - powerdown-gpios
> > > > > +  - reset-gpios
> > > > > +  - port
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/clock/mt8183-clk.h>
> > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > +
> > > > > +    i2c {
> > > > > +        clock-frequency = <400000>;
> > > > > +        #address-cells = <1>;
> > > > > +        #size-cells = <0>;
> > > > > +
> > > > > +        ov02a10: camera-sensor@3d {
> > > > > +            compatible = "ovti,ov02a10";
> > > > > +            reg = <0x3d>;
> > > > > +            pinctrl-names = "default";
> > > > > +            pinctrl-0 = <&clk_24m_cam>;
> > > > > +
> > > > > +            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
> > > > > +                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
> > > > > +            clock-names = "eclk", "freq_mux";
> > > > > +            clock-frequency = <24000000>;
> > > > > +
> > > > > +            rotation = <180>;
> > > > > +            ovti,mipi-tx-speed = <3>;
> > > > > +
> > > > > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > > > > +            avdd-supply = <&mt6358_vcama1_reg>;
> > > > > +            dvdd-supply = <&mt6358_vcn18_reg>;
> > > > > +            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> > > > > +            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> > > > > +
> > > > > +            port {
> > > > > +                wcam_out: endpoint {
> > > > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > > > +                    link-frequencies = /bits/ 64 <390000000>;
> > > > > +                };
> > > > > +            };
> > > > > +        };
> > > > > +    };
> > > > > +
> > > > > +...
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index e64e5db..63a2335 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -12389,6 +12389,13 @@ M:     Harald Welte <laforge@gnumonks.org>
> > > > >  S:     Maintained
> > > > >  F:     drivers/char/pcmcia/cm4040_cs.*
> > > > >
> > > > > +OMNIVISION OV02A10 SENSOR DRIVER
> > > > > +M:     Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > +L:     linux-media@vger.kernel.org
> > > > > +S:     Maintained
> > > > > +T:     git git://linuxtv.org/media_tree.git
> > > > > +F:     Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > +
> > > > >  OMNIVISION OV13858 SENSOR DRIVER
> > > > >  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > >  L:     linux-media@vger.kernel.org
> > > >
> > >
> >
>
