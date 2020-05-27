Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1E41E474C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 17:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388140AbgE0P1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 11:27:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgE0P1g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 11:27:36 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 370DB208E4;
        Wed, 27 May 2020 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590593255;
        bh=xAFJoL70d9ptR2NlMMkE9/iL0C+dD4a1o8Ji7U0Hb74=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=meKNxFtFPc8ejIUrmHPjvQMpux3lpz4nVSfwAHxcfmqFZ3ffOKRtZjEPFrDdeI51n
         0cpc8RWD9qbwCysQC9ittfZSPQk7aOa49Y69A+/XEqOTxoaUO0uG5DBBrkFbDGaxIM
         MKc9Hgg4/rrqQm3VTvEar4SzP9NNHGMqntCLgOSw=
Received: by mail-ot1-f41.google.com with SMTP id f18so19447289otq.11;
        Wed, 27 May 2020 08:27:35 -0700 (PDT)
X-Gm-Message-State: AOAM531uEG9K8oUYltWeYX+9jB4THQDnBkdAaykstiFJ+C/ZrsB6lhq2
        Iu3GkQeDcZI4J79MinXHE7vAUD1BT17nMwoqwQ==
X-Google-Smtp-Source: ABdhPJwAUmHkMY1nUf8HbXBqDXmvGKeOnwn9QC9NkyEmRMRdlXEbaZqugbcVRvRSQNkjP5kSY2sfkSI9xI4FKt86cmQ=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr5098223ots.192.1590593254440;
 Wed, 27 May 2020 08:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com> <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03>
In-Reply-To: <1590569355.8804.448.camel@mhfsdcap03>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 27 May 2020 09:27:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
Message-ID: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 27, 2020 at 2:51 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Rob,
>
> Thanks for the review. Please see my replies below.
>
> On Tue, 2020-05-26 at 12:28 -0600, Rob Herring wrote:
> > On Sat, May 23, 2020 at 04:41:02PM +0800, Dongchun Zhu wrote:
> > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 +
> > >  2 files changed, 179 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > new file mode 100644
> > > index 0000000..56f31b5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > @@ -0,0 +1,172 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (c) 2020 MediaTek Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +
> > > +description: |-
> > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > +  sensor output is available via CSI-2 serial data output.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov02a10
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: top mux camtg clock
> > > +      - description: divider clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: eclk
> > > +      - const: freq_mux
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the eclk clock in Hertz.
> > > +
>
> Rob, shall we use 'maxItems: 1' to constrain property: clock-frequency?

No, because it is a scalar, not an array.

> Or could we adopt 'clock-frequency: true' directly here?

As-is is fine.

> > > +  dovdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as Digital I/O voltage supply.
> > > +
>
> Shall we add 'maxItems: 1' here?

No, supplies are always singular.


>
> > > +  avdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as Analog voltage supply.
> > > +
>
> Ditto.
>
> > > +  dvdd-supply:
> > > +    description:
> > > +      Definition of the regulator used as Digital core voltage supply.
> > > +
>
> Ditto.
>
> > > +  powerdown-gpios:
> > > +    description:
> > > +      Must be the device tree identifier of the GPIO connected to the
> > > +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> > > +      or Shutdown mode. As the line is active low, it should be
> > > +      marked GPIO_ACTIVE_LOW.
> >
> > Need to define how many GPIOs ('maxItems: 1')
> >
>
> It would be fixed like this in next release.
> powerdown-gpios:
>   maxItems: 1
>   description:
>     Must be the device tree identifier of the GPIO connected to the
>     PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
>     or Shutdown mode. As the line is active low, it should be
>     marked GPIO_ACTIVE_LOW.
>
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      Must be the device tree identifier of the GPIO connected to the
> > > +      RST_PD pin. If specified, it will be asserted during driver probe.
> > > +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.
> >
> > Here too.
> >
>
> Similar as 'powerdown-gpios'.
> Fixed in next release.
>
> > > +
> > > +  rotation:
> > > +    description:
> > > +      Definition of the sensor's placement.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    # Sensor Mounted Upright
> > > +          - 180  # Sensor Mounted Upside Down
> > > +        default: 0
> > > +
> > > +  ovti,mipi-tx-speed:
> > > +    description:
> > > +      Indication of MIPI transmission speed select, which is to control D-PHY
> > > +      timing setting by adjusting MIPI clock voltage to improve the clock
> > > +      driver capability.
> > > +    allOf:
> > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +      - enum:
> > > +          - 0    #  20MHz -  30MHz
> > > +          - 1    #  30MHz -  50MHz
> > > +          - 2    #  50MHz -  75MHz
> > > +          - 3    #  75MHz - 100MHz
> > > +          - 4    # 100MHz - 130MHz
> > > +        default: 3
> > > +
> > > +  # See ../video-interfaces.txt for details
> > > +  port:
> > > +    type: object
> > > +    additionalProperties: false
> >
> > Should have a description of what data the port has.
> >
>
> It would be updated as below in next release.
> port:
>   type: object
>   additionalProperties: false
>   description:
>     Input port node, single endpoint describing the CSI-2 transmitter.

Output?

>
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        properties:
>
> Actually I wonder whether we need to declare 'clock-lanes' here?

Yes, if you are using it.

Rob
