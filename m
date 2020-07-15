Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EAF220E9C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732007AbgGOOBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:01:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:50178 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgGOOBS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:01:18 -0400
IronPort-SDR: f8mIuQ3zlJsunFyVvSTYx1HNuRVAGFFOKN6JdPAb17X3j/Uxcyi5N+2zZjqhRb7z+mGvp4NhlK
 GA5HqIqoOV4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="234003443"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; 
   d="scan'208";a="234003443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2020 07:01:17 -0700
IronPort-SDR: XTvig8Hd6pw0Bo7G119IyDJj+QXn1cnffd/pxIxXx+gbid/YfxmBBFzvlQpZmz86ETvvZgj+Z/
 NhRyipSUFpYg==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; 
   d="scan'208";a="390787625"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2020 07:01:12 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E01242091F; Wed, 15 Jul 2020 17:01:10 +0300 (EEST)
Date:   Wed, 15 Jul 2020 17:01:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200715140110.GD16711@paasikivi.fi.intel.com>
References: <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03>
 <20200506112136.GV9190@paasikivi.fi.intel.com>
 <1588856325.8804.179.camel@mhfsdcap03>
 <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
 <20200507141147.GF9190@paasikivi.fi.intel.com>
 <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
 <1588920685.8804.230.camel@mhfsdcap03>
 <20200510223552.GA11272@paasikivi.fi.intel.com>
 <1589197265.8804.262.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589197265.8804.262.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi Dongchun,

On Mon, May 11, 2020 at 07:41:05PM +0800, Dongchun Zhu wrote:
> Hi Sakari,
> 
> On Mon, 2020-05-11 at 01:35 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > On Fri, May 08, 2020 at 02:51:25PM +0800, Dongchun Zhu wrote:
> > > Hi Sakari, Tomasz,
> > > 
> > > On Thu, 2020-05-07 at 16:25 +0200, Tomasz Figa wrote:
> > > > On Thu, May 7, 2020 at 4:12 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Tomasz, Dongchun,
> > > > >
> > > > > On Thu, May 07, 2020 at 03:50:40PM +0200, Tomasz Figa wrote:
> > > > > > Hi Sakari and Dongchun,
> > > > > >
> > > > > > On Thu, May 7, 2020 at 3:00 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > > > > >
> > > > > > > Hi Sakari,
> > > > > > >
> > > > > > > Thanks for the review.
> > > > > > >
> > > > > > > On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> > > > > > > > Hi Dongchun,
> > > > > > > >
> > > > > > > > On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > > > > > > > > Hi Sakari,
> > > > > > > > >
> > > > > > > > > Thanks for the review.
> > > > > > > > >
> > > > > > > > > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > > > > > > > > Hi Dongchun,
> > > > > > > > > >
> > > > > > > > > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > > > > > > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > > > > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > > > > > >  2 files changed, 155 insertions(+)
> > > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > new file mode 100644
> > > > > > > > > > > index 0000000..2be4bd2
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > > > > > @@ -0,0 +1,148 @@
> > > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > > > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > > > > > > > > +%YAML 1.2
> > > > > > > > > > > +---
> > > > > > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > > +
> > > > > > > > > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > > > > > > > > +
> > > > > > > > > > > +maintainers:
> > > > > > > > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > > +
> > > > > > > > > > > +description: |-
> > > > > > > > > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > > > > > > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > > > > > > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > > > > > > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > > > > > > > > +  sensor output is available via CSI-2 serial data output.
> > > > > > > > > > > +
> > > > > > > > > > > +properties:
> > > > > > > > > > > +  compatible:
> > > > > > > > > > > +    const: ovti,ov02a10
> > > > > > > > > > > +
> > > > > > > > > > > +  reg:
> > > > > > > > > > > +    maxItems: 1
> > > > > > > > > > > +
> > > > > > > > > > > +  clocks:
> > > > > > > > > > > +    items:
> > > > > > > > > > > +      - description: top mux camtg clock
> > > > > > > > > > > +      - description: devider clock
> > > > > > > > > > > +
> > > > > > > > > > > +  clock-names:
> > > > > > > > > > > +    items:
> > > > > > > > > > > +      - const: eclk
> > > > > > > > > > > +      - const: freq_mux
> > > > > > > > > > > +
> > > > > > > > > > > +  clock-frequency:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      Frequency of the eclk clock in Hertz.
> > > > > > > > > > > +
> > > > > > > > > > > +  dovdd-supply:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      Definition of the regulator used as interface power supply.
> > > > > > > > > > > +
> > > > > > > > > > > +  avdd-supply:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      Definition of the regulator used as analog power supply.
> > > > > > > > > > > +
> > > > > > > > > > > +  dvdd-supply:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      Definition of the regulator used as digital power supply.
> > > > > > > > > > > +
> > > > > > > > > > > +  powerdown-gpios:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > > > > > > > > +
> > > > > > > > > > > +  reset-gpios:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > > > > > > > > +
> > > > > > > > > > > +  rotation:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > > > > > > > > +    allOf:
> > > > > > > > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > > > > > > > +      - enum:
> > > > > > > > > > > +          - 0    # Sensor Mounted Upright
> > > > > > > > > > > +          - 180  # Sensor Mounted Upside Down
> > > > > > > > > > > +
> > > > > > > > > > > +  ovti,mipi-tx-speed:
> > > > > > > > > > > +    description:
> > > > > > > > > > > +      Indication of MIPI transmission speed select.
> > > > > > > > > >
> > > > > > > > > > What exactly does this signify? And how do you come up with the number?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Apologies for not addressing this number clear.
> > > > > > > > >
> > > > > > > > > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > > > > > > > > the default val: 0x03.
> > > > > > > > > The description of this RW register is as below:
> > > > > > > > > Bit[2:0]: MIPI transmission speed select.
> > > > > > > > >
> > > > > > > > > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > > > > > > > > This would be fixed in next release.
> > > > > > > > >
> > > > > > > > > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > > > > > > > > that value if there is no setting for this private property in DT.
> > > > > > > > > The caller in driver would be updated like this in next release.
> > > > > > > > > if (ov02a10->mipi_clock_tx_speed)
> > > > > > > > >     ret = i2c_smbus_write_byte_data(...,...);
> > > > > > > >
> > > > > > > > How did you pick the value in the example? And why do you believe it is
> > > > > > > > specific to a platform, and not e.g. a sensor mode?
> > > > > > > >
> > > > > > >
> > > > > > > We look into P1:0XA1, one register that defines MIPI transmission speed
> > > > > > > select.
> > > > > > > From the datasheet, we can get the possible values that could be set to
> > > > > > > P1:0xA1.
> > > > > > >
> > > > > > > Actually this register is an independent of sensor mode, it is just
> > > > > > > included in sensor mode's register setting table.
> > > > > > >
> > > > > > > In addition, this private DT Property is created to fix the MIPI test
> > > > > > > failure. The register values are adjusted and verified from vendor to
> > > > > > > make sensor signal meet MIPI specification.
> > > > > > >
> > > > > >
> > > > > > In theory the value could depend on the mode, because different link
> > > > > > rate could impose different requirements for the physical interface.
> > > > > > In practice, we haven't seen any hardware that would require different
> > > > > > values for different modes.
> > > > >
> > > > > The mode (possibly in conjunction with other information available to the
> > > > > driver via V4L2 fwnode interface) precisely defines the parameters of the
> > > > > CSI-2 bus --- apart from the possible exception of the bus timing related
> > > > > parameters but this is not supported by the name of the parameter.
> > > > >
> > > > > Therefore I don't see how this parameter, which supposedly is used to
> > > > > determine the CSI-2 transmissions speed, could be board specific and thus
> > > > > belong to DT.
> > > > 
> > > > According to the very imprecise information I have access to, it is
> > > > not about the CSI-2 bus itself, but rather some internal parameter of
> > > > the sensor's CSI interface. Unfortunately there isn't much information
> > > > on what this value exactly controls...
> > > > 
> > > > Best regards,
> > > > Tomasz
> > > 
> > > Just got some feedback from OV vendor about this parameter.
> > > 
> > > P1:0xA1 is the register to control D-PHY timing setting based on bclk.
> > > It is to adjust the MIPI clock voltage to improve the clock drive
> > > capability, and has no affect on the transmission speed of MIPI data.
> > > 
> > > From vendor's perspective, P1:0xA1 depends upon the length of FPC of
> > > camera module that used on the board. Considering the physical
> > > connections for MIPI signals to user-facing camera are very different
> > > between our 2 projects, it can be very difficult to find universal SI
> > > parameters for both projects.
> > 
> > Are you using different values for this parameter on these two projects?
> > 
> 
> Yes. We're actually assigning two different values to this property.
> One is 0x03, the other is 0x04.
> 
> > > 
> > > Thus here we create one new DT property to separate these tuning in
> > > driver, to be more like project-specific.
> > > 
> > > More details about the register is as below.
> > > P1:0xA1 val: 0x03 default
> > > Case: 0  20MHz-30MHz
> > >       1  30MHz-50MHz
> > >       2  50MHz-75MHz
> > >       3  75MHz-100MHz   (default, old DB setting use)
> > >       4  100MHz-130MHz  (suggested, new DB setting use)
> > >       5  Manual
> > > So the value in the example should be [ 0, 1, 2, 3, 4, 5 ].
> > > 
> > > Additionally, P1:0xA1 is recommended to be set as 0x04 in the newest DB
> > > setting. We would adjust the register in next release.
> > 
> > Thank you for digging into the issue.
> > 
> > Based on the above description, the parameter would depend on both the link
> > frequency and possibly also on wire length. I guess there's no harm from
> > using too strong drive, apart from perhaps power consumption? As in
> > principle this could be different for different sensor modes. Albeit I
> > don't remember seeing a sensor where such a parameter would have been
> > needed to be modified.
> > 
> 
> This may be related to something about sensor fine tuning.
> As OV vendor pointed out, the sensor chip provides such one property
> that user could adjust based on their specific project.
> Also, case 4 (0x04) setting is confirmed to have a little more power
> consumption than case 3 (0x03).

Apologies for bringing back an old topic --- the driver supports just a
single mode, using a specific data rate.

If another mode is added later on, will it continue to use the same value
for this? Based on the documentation, it seems that this is primarily
defined by the frequency of the bus, not by board design. Therefore putting
this to DT (and thus ignoring the frequency) appears wrong.

-- 
Kind regards,

Sakari Ailus
