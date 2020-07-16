Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DBC22264B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 16:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgGPO5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 10:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPO5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 10:57:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E48C061755
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 07:57:43 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w6so6869833ejq.6
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zoyi2GCkdDv+77woGYnxvApUPNJmPUhcG6vBpnxKyAc=;
        b=UudRQwL2T8B7XOQ/OcU5sSni/mpkiuMw4FlalMG4v8UJna9J8+yKNfGuutNY8tlQHk
         6mRi/zCaHBroMTPWQzmL97I2O1ZTub4ftpdlAYxEAGFRGvIfDXHJpPhQHjJtBjRBMvq6
         CbA8cLQsvXw6lopRqQZbVLaWHcOo2lY08M+mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zoyi2GCkdDv+77woGYnxvApUPNJmPUhcG6vBpnxKyAc=;
        b=i+kfDiVCrjRAV+hRZEtCLVbKoUPPWQGVcAzoH6o/j9hNmapINYnaxsWK6M4jJOPZuz
         /RDCnTSu4Hik/6t6EYZ61Z5ITQ5B7Eo9w2lRBCDRvFi+I8NBT8CuDZu7ztuyC8KEx50k
         81LCAhfgvNxre4KSuK5WQL9j6YwuypUbBgegBQpu45DOxrA/f92KSVEO6XZ7+qm9XJ4u
         bPyW4FhNTnJbVHOpn8vrDJ7ve6zMzqulbYotW3HAn4Oe00KWwPKG46W4WtUY57fWmScm
         Cg98ncL5gjXU4VYMYry14cpykilK/vBjINR/R1dyN993oO57YBH78V1KFmVgTBjegUxp
         JW9Q==
X-Gm-Message-State: AOAM533w4+SFCOUBgpLxlza11cVxQu0czhWQuXX4HqF2+CMXRoBVOIyP
        +T1A6XvdVQGsQHKtpMAVl+Hzh2KiW9I=
X-Google-Smtp-Source: ABdhPJwCJovknxUz3qDo3UrP5Ljahko24k2597CT/bHdJNM/emb0eVpykK1SDWxG/mGmnZsHiJXUHg==
X-Received: by 2002:a17:906:76d7:: with SMTP id q23mr4216875ejn.95.1594911462130;
        Thu, 16 Jul 2020 07:57:42 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id q7sm5304351ejo.22.2020.07.16.07.57.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 07:57:41 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id f18so11891630wml.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 07:57:40 -0700 (PDT)
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr4486554wmm.183.1594911460118;
 Thu, 16 Jul 2020 07:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200505070451.GS9190@paasikivi.fi.intel.com> <1588688238.8804.150.camel@mhfsdcap03>
 <20200506112136.GV9190@paasikivi.fi.intel.com> <1588856325.8804.179.camel@mhfsdcap03>
 <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
 <20200507141147.GF9190@paasikivi.fi.intel.com> <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
 <1588920685.8804.230.camel@mhfsdcap03> <20200510223552.GA11272@paasikivi.fi.intel.com>
 <1589197265.8804.262.camel@mhfsdcap03> <20200715140110.GD16711@paasikivi.fi.intel.com>
In-Reply-To: <20200715140110.GD16711@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 16 Jul 2020 16:57:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A9L73et30Fr_91sqfQGue7Qo05yCchU_S6bh5H4sBiMQ@mail.gmail.com>
Message-ID: <CAAFQd5A9L73et30Fr_91sqfQGue7Qo05yCchU_S6bh5H4sBiMQ@mail.gmail.com>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Wed, Jul 15, 2020 at 4:01 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> hi Dongchun,
>
> On Mon, May 11, 2020 at 07:41:05PM +0800, Dongchun Zhu wrote:
> > Hi Sakari,
> >
> > On Mon, 2020-05-11 at 01:35 +0300, Sakari Ailus wrote:
> > > Hi Dongchun,
> > >
> > > On Fri, May 08, 2020 at 02:51:25PM +0800, Dongchun Zhu wrote:
> > > > Hi Sakari, Tomasz,
> > > >
> > > > On Thu, 2020-05-07 at 16:25 +0200, Tomasz Figa wrote:
> > > > > On Thu, May 7, 2020 at 4:12 PM Sakari Ailus
> > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > >
> > > > > > Hi Tomasz, Dongchun,
> > > > > >
> > > > > > On Thu, May 07, 2020 at 03:50:40PM +0200, Tomasz Figa wrote:
> > > > > > > Hi Sakari and Dongchun,
> > > > > > >
> > > > > > > On Thu, May 7, 2020 at 3:00 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > > > > > >
> > > > > > > > Hi Sakari,
> > > > > > > >
> > > > > > > > Thanks for the review.
> > > > > > > >
> > > > > > > > On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> > > > > > > > > Hi Dongchun,
> > > > > > > > >
> > > > > > > > > On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > > > > > > > > > Hi Sakari,
> > > > > > > > > >
> > > > > > > > > > Thanks for the review.
> > > > > > > > > >
> > > > > > > > > > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > > > > > > > > > Hi Dongchun,
> > > > > > > > > > >
> > > > > > > > > > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > > > > > > > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > > > > > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > > > > > > >  2 files changed, 155 insertions(+)
> > > > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > index 0000000..2be4bd2
> > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > > @@ -0,0 +1,148 @@
> > > > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > > > > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > > > > > > > > > +%YAML 1.2
> > > > > > > > > > > > +---
> > > > > > > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > > > +
> > > > > > > > > > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > > > > > > > > > +
> > > > > > > > > > > > +maintainers:
> > > > > > > > > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > > > +
> > > > > > > > > > > > +description: |-
> > > > > > > > > > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > > > > > > > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > > > > > > > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > > > > > > > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > > > > > > > > > +  sensor output is available via CSI-2 serial data output.
> > > > > > > > > > > > +
> > > > > > > > > > > > +properties:
> > > > > > > > > > > > +  compatible:
> > > > > > > > > > > > +    const: ovti,ov02a10
> > > > > > > > > > > > +
> > > > > > > > > > > > +  reg:
> > > > > > > > > > > > +    maxItems: 1
> > > > > > > > > > > > +
> > > > > > > > > > > > +  clocks:
> > > > > > > > > > > > +    items:
> > > > > > > > > > > > +      - description: top mux camtg clock
> > > > > > > > > > > > +      - description: devider clock
> > > > > > > > > > > > +
> > > > > > > > > > > > +  clock-names:
> > > > > > > > > > > > +    items:
> > > > > > > > > > > > +      - const: eclk
> > > > > > > > > > > > +      - const: freq_mux
> > > > > > > > > > > > +
> > > > > > > > > > > > +  clock-frequency:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      Frequency of the eclk clock in Hertz.
> > > > > > > > > > > > +
> > > > > > > > > > > > +  dovdd-supply:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      Definition of the regulator used as interface power supply.
> > > > > > > > > > > > +
> > > > > > > > > > > > +  avdd-supply:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      Definition of the regulator used as analog power supply.
> > > > > > > > > > > > +
> > > > > > > > > > > > +  dvdd-supply:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      Definition of the regulator used as digital power supply.
> > > > > > > > > > > > +
> > > > > > > > > > > > +  powerdown-gpios:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > > > > > > > > > +
> > > > > > > > > > > > +  reset-gpios:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > > > > > > > > > +
> > > > > > > > > > > > +  rotation:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > > > > > > > > > +    allOf:
> > > > > > > > > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > > > > > > > > +      - enum:
> > > > > > > > > > > > +          - 0    # Sensor Mounted Upright
> > > > > > > > > > > > +          - 180  # Sensor Mounted Upside Down
> > > > > > > > > > > > +
> > > > > > > > > > > > +  ovti,mipi-tx-speed:
> > > > > > > > > > > > +    description:
> > > > > > > > > > > > +      Indication of MIPI transmission speed select.
> > > > > > > > > > >
> > > > > > > > > > > What exactly does this signify? And how do you come up with the number?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Apologies for not addressing this number clear.
> > > > > > > > > >
> > > > > > > > > > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > > > > > > > > > the default val: 0x03.
> > > > > > > > > > The description of this RW register is as below:
> > > > > > > > > > Bit[2:0]: MIPI transmission speed select.
> > > > > > > > > >
> > > > > > > > > > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > > > > > > > > > This would be fixed in next release.
> > > > > > > > > >
> > > > > > > > > > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > > > > > > > > > that value if there is no setting for this private property in DT.
> > > > > > > > > > The caller in driver would be updated like this in next release.
> > > > > > > > > > if (ov02a10->mipi_clock_tx_speed)
> > > > > > > > > >     ret = i2c_smbus_write_byte_data(...,...);
> > > > > > > > >
> > > > > > > > > How did you pick the value in the example? And why do you believe it is
> > > > > > > > > specific to a platform, and not e.g. a sensor mode?
> > > > > > > > >
> > > > > > > >
> > > > > > > > We look into P1:0XA1, one register that defines MIPI transmission speed
> > > > > > > > select.
> > > > > > > > From the datasheet, we can get the possible values that could be set to
> > > > > > > > P1:0xA1.
> > > > > > > >
> > > > > > > > Actually this register is an independent of sensor mode, it is just
> > > > > > > > included in sensor mode's register setting table.
> > > > > > > >
> > > > > > > > In addition, this private DT Property is created to fix the MIPI test
> > > > > > > > failure. The register values are adjusted and verified from vendor to
> > > > > > > > make sensor signal meet MIPI specification.
> > > > > > > >
> > > > > > >
> > > > > > > In theory the value could depend on the mode, because different link
> > > > > > > rate could impose different requirements for the physical interface.
> > > > > > > In practice, we haven't seen any hardware that would require different
> > > > > > > values for different modes.
> > > > > >
> > > > > > The mode (possibly in conjunction with other information available to the
> > > > > > driver via V4L2 fwnode interface) precisely defines the parameters of the
> > > > > > CSI-2 bus --- apart from the possible exception of the bus timing related
> > > > > > parameters but this is not supported by the name of the parameter.
> > > > > >
> > > > > > Therefore I don't see how this parameter, which supposedly is used to
> > > > > > determine the CSI-2 transmissions speed, could be board specific and thus
> > > > > > belong to DT.
> > > > >
> > > > > According to the very imprecise information I have access to, it is
> > > > > not about the CSI-2 bus itself, but rather some internal parameter of
> > > > > the sensor's CSI interface. Unfortunately there isn't much information
> > > > > on what this value exactly controls...
> > > > >
> > > > > Best regards,
> > > > > Tomasz
> > > >
> > > > Just got some feedback from OV vendor about this parameter.
> > > >
> > > > P1:0xA1 is the register to control D-PHY timing setting based on bclk.
> > > > It is to adjust the MIPI clock voltage to improve the clock drive
> > > > capability, and has no affect on the transmission speed of MIPI data.
> > > >
> > > > From vendor's perspective, P1:0xA1 depends upon the length of FPC of
> > > > camera module that used on the board. Considering the physical
> > > > connections for MIPI signals to user-facing camera are very different
> > > > between our 2 projects, it can be very difficult to find universal SI
> > > > parameters for both projects.
> > >
> > > Are you using different values for this parameter on these two projects?
> > >
> >
> > Yes. We're actually assigning two different values to this property.
> > One is 0x03, the other is 0x04.
> >
> > > >
> > > > Thus here we create one new DT property to separate these tuning in
> > > > driver, to be more like project-specific.
> > > >
> > > > More details about the register is as below.
> > > > P1:0xA1 val: 0x03 default
> > > > Case: 0  20MHz-30MHz
> > > >       1  30MHz-50MHz
> > > >       2  50MHz-75MHz
> > > >       3  75MHz-100MHz   (default, old DB setting use)
> > > >       4  100MHz-130MHz  (suggested, new DB setting use)
> > > >       5  Manual
> > > > So the value in the example should be [ 0, 1, 2, 3, 4, 5 ].
> > > >
> > > > Additionally, P1:0xA1 is recommended to be set as 0x04 in the newest DB
> > > > setting. We would adjust the register in next release.
> > >
> > > Thank you for digging into the issue.
> > >
> > > Based on the above description, the parameter would depend on both the link
> > > frequency and possibly also on wire length. I guess there's no harm from
> > > using too strong drive, apart from perhaps power consumption? As in
> > > principle this could be different for different sensor modes. Albeit I
> > > don't remember seeing a sensor where such a parameter would have been
> > > needed to be modified.
> > >
> >
> > This may be related to something about sensor fine tuning.
> > As OV vendor pointed out, the sensor chip provides such one property
> > that user could adjust based on their specific project.
> > Also, case 4 (0x04) setting is confirmed to have a little more power
> > consumption than case 3 (0x03).
>
> Apologies for bringing back an old topic --- the driver supports just a
> single mode, using a specific data rate.
>
> If another mode is added later on, will it continue to use the same value
> for this? Based on the documentation, it seems that this is primarily
> defined by the frequency of the bus, not by board design. Therefore putting
> this to DT (and thus ignoring the frequency) appears wrong.

I don't think this is exactly implied by the frequency of the bus. The
values there are recommended for given frequency ranges, but there are
real cases where depending on the board different values are needed.

Best regards,
Tomasz
