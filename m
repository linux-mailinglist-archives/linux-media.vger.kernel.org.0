Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D359E257E31
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 18:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgHaQGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 12:06:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:65335 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727919AbgHaQGx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 12:06:53 -0400
IronPort-SDR: FPJk1Gr1IQHRxjxedpw4aP25988Y+OmLBxXSah+k+TzMaK1IxEP9KkxCybCyfr7bTF8EbLwpId
 GnDW/sZe48pA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="154530118"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="154530118"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 09:06:52 -0700
IronPort-SDR: 6IY/dpiUSpNNHBjPIMDLOmwwukXVMpmBy7EzW0XaqtS2k+a3zJRGno81ukPA0izBmZihiiYX18
 UT99p1pspPGQ==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="314398396"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 09:06:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 98A0B20623; Mon, 31 Aug 2020 19:06:44 +0300 (EEST)
Date:   Mon, 31 Aug 2020 19:06:44 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>, 1095088256@qq.com,
        matrix.zhu@aliyun.com
Subject: Re: [PATCH v13 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200831160644.GL31019@paasikivi.fi.intel.com>
References: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
 <20200710101850.4604-2-dongchun.zhu@mediatek.com>
 <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BB3c9nvruY0jcVbRZtbUyiFj0v8=D6KA7EPtN4rz=+wA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

Thanks for dressing this into words.

On Mon, Aug 31, 2020 at 01:44:27PM +0200, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Fri, Jul 10, 2020 at 12:19 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Add YAML device tree binding for OV02A10 CMOS image sensor,
> > and the relevant MAINTAINERS entries.
> >
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 179 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > new file mode 100644
> > index 0000000..3a916cc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +
> > +description: |-
> > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > +  sensor output is available via CSI-2 serial data output.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov02a10
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: top mux camtg clock
> > +      - description: divider clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: eclk
> > +      - const: freq_mux
> 
> Why do we have two clocks here? Looking at the example suggests that
> they may be the clocks of the SoC that the integration was done with.
> However, the binding must only define the aspects of the particular
> device, i.e. this sensor.
> 
> I suppose we should only have "eclk" here and it should be described
> as "external clock for the sensor".
> 
> > +
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the eclk clock in Hertz.
> 
> nit: maybe Hz?
> 
> > +
> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as Digital I/O voltage supply.
> > +
> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as Analog voltage supply.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as Digital core voltage supply.
> > +
> > +  powerdown-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GPIO connected to the
> > +      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
> > +      or shutdown mode. As the line needs to be high for the powerdown mode
> > +      to be active, it should be marked GPIO_ACTIVE_HIGH.
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description:
> > +      Must be the device tree identifier of the GPIO connected to the
> > +      RST_PD pin. If specified, it will be asserted during driver probe.
> > +      As the line needs to be low for the reset to be active, it should be
> > +      marked GPIO_ACTIVE_LOW.
> > +    maxItems: 1
> > +
> > +  rotation:
> > +    description:
> > +      Definition of the sensor's placement.
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    # Sensor Mounted Upright
> > +          - 180  # Sensor Mounted Upside Down
> > +        default: 0
> > +
> > +  ovti,mipi-tx-speed:
> > +    description:
> > +      Indication of MIPI transmission speed select, which is to control D-PHY
> > +      timing setting by adjusting MIPI clock voltage to improve the clock
> > +      driver capability.
> 
> The description says that the value adjusts "MIPI clock voltage".
> Should the property be renamed to "ovti,mipi-clock-voltage"?
> 
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > +      - enum:
> > +          - 0    #  20MHz -  30MHz
> > +          - 1    #  30MHz -  50MHz
> > +          - 2    #  50MHz -  75MHz
> > +          - 3    #  75MHz - 100MHz
> > +          - 4    # 100MHz - 130MHz
> > +        default: 3
> > +
> 
> I've discussed this on IRC with Sakari. It sounds like this works as
> is for us because the driver currently only supports 1 mode, always
> running the link at 390 MHz. This won't scale if one intends to add
> more modes, because DT can't be expected to be updated when the driver
> changes. The two are expected to be separate and backwards compatible.
> 
> I think we could model this in DT as an array of <link speed, clock
> voltage> pairs. Similarly to the OPP bindings [1]. An example to have
> all link speeds up to 390 MHz use the value 4:
> 
> ovti,mipi-clock-voltages = <
>               /* KHz         clock voltage unit */
>                  390000    4
> >;
> 
> if one wants to select different voltage for different link, they
> could do so as well. With the example below, the driver should
> configure "3" for link frequencies <= 150 MHz and "4" for > 150 MHz <=
> 390 MHz. Link frequencies > 390 MHz should be disallowed.
> 
> ovti,mipi-clock-voltages = <
>               /* KHz         clock voltage unit */
>                  150000    3
>                  390000    4
> >;
> 
> What do you think?

One more note on my proposal: use the index of the link frequency to access
the ovti,mipi-clock-voltages array. That should be more simple for the
driver, as the driver is expected to use only link frequencies listed in DT
bindings anyway.

-- 
Kind regards,

Sakari Ailus
