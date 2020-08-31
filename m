Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5CD25789D
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 13:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgHaLow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 07:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgHaLov (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 07:44:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB28C061573
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 04:44:50 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id n13so5096431edo.10
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=efGDe+zcHIa2VsRuM+m7GHMfouf/LYGtTzaBD57lCYU=;
        b=FaiR145STFKet4ABBn9muz0fH70Iib8OAiaAZFSQWpqeQHq3y/pZH07b/qf/KOfyOJ
         pl/wrRDqemy8wMDarwdpaqk8VWQka1xilVb4+b92LPoLNxq+dZ3ZWxV941MF8RQ+UCRL
         gyMOIAp1gr6MMoN3bCNDLeY1q5brBuXhDv/ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=efGDe+zcHIa2VsRuM+m7GHMfouf/LYGtTzaBD57lCYU=;
        b=s2VFa03mBe4D0q5lXxImE6cnbdOltOa6AeObouZNenfyQW3FSO9RbI1UznrG2mA1S+
         2sxPKWGYOOkH2wVrxFaQblL8mZd0WehJrliRvOT+NSvyMOBherTjIQT0GiUTVkRMFP/b
         ud1oBFsd11F/DOm3RZwHZE3iV9ScnpMJRZQz8o8Eo0vcxvxyDwNixs+OOE70qCWrLDv5
         SvxLjAnRgTAD4owD3l9yf8Lt21aelHZlD1QIQv+RCn2vRkURxrKjoVE8xl5weF5VgjkG
         v3yrOYY2vS9yuEM1bw9EDrcZjA+tGIRItAX2nudQ5GB5u0k5Se4D8JW2LIa9So7NRr/m
         MqYA==
X-Gm-Message-State: AOAM530wGGCroknkmOt4xd3y2PLzP9A1YeItZFnVujBcwjoX0v5edNmd
        rva8V9Uv/olrzpxgcLmouNj4iGyeZCRT8g==
X-Google-Smtp-Source: ABdhPJzVJddXTKA9SNUAljNRaeuMidcmuM7Ra7jXEhAw4NXlFjP7AVqZ53NfFp5yNhXdB/VIcbgHcw==
X-Received: by 2002:a05:6402:305a:: with SMTP id bu26mr877826edb.262.1598874289136;
        Mon, 31 Aug 2020 04:44:49 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id bd13sm7525907edb.38.2020.08.31.04.44.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 04:44:48 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id s13so5071576wmh.4
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 04:44:47 -0700 (PDT)
X-Received: by 2002:a7b:c925:: with SMTP id h5mr1009961wml.28.1598874287354;
 Mon, 31 Aug 2020 04:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200710101850.4604-1-dongchun.zhu@mediatek.com> <20200710101850.4604-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20200710101850.4604-2-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 31 Aug 2020 13:44:27 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
Message-ID: <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
Subject: Re: [PATCH v13 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
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
        <shengnan.wang@mediatek.com>, 1095088256@qq.com,
        matrix.zhu@aliyun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Fri, Jul 10, 2020 at 12:19 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Add YAML device tree binding for OV02A10 CMOS image sensor,
> and the relevant MAINTAINERS entries.
>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..3a916cc
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

Why do we have two clocks here? Looking at the example suggests that
they may be the clocks of the SoC that the integration was done with.
However, the binding must only define the aspects of the particular
device, i.e. this sensor.

I suppose we should only have "eclk" here and it should be described
as "external clock for the sensor".

> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.

nit: maybe Hz?

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
> +  ovti,mipi-tx-speed:
> +    description:
> +      Indication of MIPI transmission speed select, which is to control D-PHY
> +      timing setting by adjusting MIPI clock voltage to improve the clock
> +      driver capability.

The description says that the value adjusts "MIPI clock voltage".
Should the property be renamed to "ovti,mipi-clock-voltage"?

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

I've discussed this on IRC with Sakari. It sounds like this works as
is for us because the driver currently only supports 1 mode, always
running the link at 390 MHz. This won't scale if one intends to add
more modes, because DT can't be expected to be updated when the driver
changes. The two are expected to be separate and backwards compatible.

I think we could model this in DT as an array of <link speed, clock
voltage> pairs. Similarly to the OPP bindings [1]. An example to have
all link speeds up to 390 MHz use the value 4:

ovti,mipi-clock-voltages = <
              /* KHz         clock voltage unit */
                 390000    4
>;

if one wants to select different voltage for different link, they
could do so as well. With the example below, the driver should
configure "3" for link frequencies <= 150 MHz and "4" for > 150 MHz <=
390 MHz. Link frequencies > 390 MHz should be disallowed.

ovti,mipi-clock-voltages = <
              /* KHz         clock voltage unit */
                 150000    3
                 390000    4
>;

What do you think?

[1] https://elixir.bootlin.com/linux/v5.9-rc3/source/Documentation/devicetree/bindings/opp/opp.txt

Best regards,
Tomasz
