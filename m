Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AA81C8D26
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 16:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEGOAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 10:00:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:7975 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725969AbgEGOAH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 10:00:07 -0400
IronPort-SDR: rE5mJvSOY4jlrTKyg5N1cVErkYNKzsN2Kjy3ubhuOEvme314CfHFcHZf0s5EPRKVzpR/8iRpwK
 oonpkA/hEBjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 07:00:06 -0700
IronPort-SDR: nHg03Jtzxqxpk53+oPQicTxzPUA5TyRzpGZkoZRsE6KoOchQu219sne80JrX9id5bvkMNu5N7k
 jD6REUlx7y3Q==
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="251520648"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 07:00:02 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2A3C820752; Thu,  7 May 2020 17:00:00 +0300 (EEST)
Date:   Thu, 7 May 2020 17:00:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        <shengnan.wang@mediatek.com>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200507135959.GD9190@paasikivi.fi.intel.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-3-dongchun.zhu@mediatek.com>
 <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03>
 <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Thu, May 07, 2020 at 03:46:31PM +0200, Tomasz Figa wrote:
> Hi Sakari, Dongchun,
> 
> On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > HI Dongchun,
> >
> > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > Hi Sakari,
> > >
> > > Thanks for the review.
> > >
> > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > control to set the desired focus via IIC serial interface.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                |   1 +
> > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > >  drivers/media/i2c/Makefile |   1 +
> > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 453 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 8d72c41..c92dc99 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > >  S:       Maintained
> > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > +F:       drivers/media/i2c/dw9768.c
> > > > >
> > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > index 125d596..6a3f9da 100644
> > > > > --- a/drivers/media/i2c/Kconfig
> > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > >     capability. This is designed for linear control of
> > > > >     voice coil motors, controlled via I2C serial interface.
> > > > >
> > > > > +config VIDEO_DW9768
> > > > > + tristate "DW9768 lens voice coil support"
> > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > >
> > > > Please check how this works in the media tree master branch now --- it's
> > > > largely select based.
> > > >
> > >
> > > The actuator driver uses some structures that require the
> > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > dependency to avoid possible build error when it's not enabled.
> >
> > Please make sure this works with current media tree master. Right now it
> > does not.
> >
> 
> Dongchun, as Sakari said, please make sure to base the patches on the
> master branch of the media tree.
> (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> dependency selection there seems to have changed recently.
> 
> > >
> > > > In general the patch seems fine to me, but please see the other comments
> > > > below, too.
> > > >
> > > > > + depends on PM
> > > > > + help
> > > > > +   This is a driver for the DW9768 camera lens voice coil.
> > > > > +   DW9768 is a 10 bit DAC with 100mA output current sink
> > > > > +   capability. This is designed for linear control of
> > > > > +   voice coil motors, controlled via I2C serial interface.
> > > > > +
> > > > >  config VIDEO_DW9807_VCM
> > > > >   tristate "DW9807 lens voice coil support"
> > > > >   depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > > index 77bf7d0..4057476 100644
> > > > > --- a/drivers/media/i2c/Makefile
> > > > > +++ b/drivers/media/i2c/Makefile
> > > > > @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
> > > > >  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
> > > > >  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
> > > > >  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> > > > > +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
> > > > >  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
> > > > >  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
> > > > >  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> > > > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > > > new file mode 100644
> > > > > index 0000000..dd68534
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/dw9768.c
> > > > > @@ -0,0 +1,440 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +// Copyright (c) 2020 MediaTek Inc.
> > > > > +
> > > > > +#include <linux/delay.h>
> > > > > +#include <linux/i2c.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > > +#include <media/v4l2-async.h>
> > > > > +#include <media/v4l2-ctrls.h>
> > > > > +#include <media/v4l2-device.h>
> > > > > +#include <media/v4l2-subdev.h>
> > > > > +
> > > > > +#define DW9768_NAME                              "dw9768"
> > > > > +#define DW9768_MAX_FOCUS_POS                     (1024 - 1)
> > > > > +/*
> > > > > + * This sets the minimum granularity for the focus positions.
> > > > > + * A value of 1 gives maximum accuracy for a desired focus position
> > > > > + */
> > > > > +#define DW9768_FOCUS_STEPS                       1
> > > > > +
> > > > > +/*
> > > > > + * Ring control and Power control register
> > > > > + * Bit[1] RING_EN
> > > > > + * 0: Direct mode
> > > > > + * 1: AAC mode (ringing control mode)
> > > > > + * Bit[0] PD
> > > > > + * 0: Normal operation mode
> > > > > + * 1: Power down mode
> > > > > + * DW9768 requires waiting time of Topr after PD reset takes place.
> > > > > + */
> > > > > +#define DW9768_RING_PD_CONTROL_REG               0x02
> > > > > +#define DW9768_PD_MODE_OFF                       0x00
> > > > > +#define DW9768_PD_MODE_EN                        BIT(0)
> > > > > +#define DW9768_AAC_MODE_EN                       BIT(1)
> > > > > +
> > > > > +/*
> > > > > + * DW9768 separates two registers to control the VCM position.
> > > > > + * One for MSB value, another is LSB value.
> > > > > + * DAC_MSB: D[9:8] (ADD: 0x03)
> > > > > + * DAC_LSB: D[7:0] (ADD: 0x04)
> > > > > + * D[9:0] DAC data input: positive output current = D[9:0] / 1023 * 100[mA]
> > > > > + */
> > > > > +#define DW9768_MSB_ADDR                          0x03
> > > > > +#define DW9768_LSB_ADDR                          0x04
> > > > > +#define DW9768_STATUS_ADDR                       0x05
> > > > > +
> > > > > +/*
> > > > > + * AAC mode control & prescale register
> > > > > + * Bit[7:5] Namely AC[2:0], decide the VCM mode and operation time.
> > > > > + * 000 Direct(default)
> > > > > + * 001 AAC2 0.48xTvib
> > > > > + * 010 AAC3 0.70xTvib
> > > > > + * 011 AAC4 0.75xTvib
> > > > > + * 100 Reserved
> > > > > + * 101 AAC8 1.13xTvib
> > > > > + * 110 Reserved
> > > > > + * 111 Reserved
> > > > > + * Bit[2:0] Namely PRESC[2:0], set the internal clock dividing rate as follow.
> > > > > + * 000 2
> > > > > + * 001 1(default)
> > > > > + * 010 1/2
> > > > > + * 011 1/4
> > > > > + * 100 8
> > > > > + * 101 4
> > > > > + * 110 Reserved
> > > > > + * 111 Reserved
> > > > > + */
> > > > > +#define DW9768_AAC_PRESC_REG                     0x06
> > > > > +#define DW9768_AAC3_SELECT_DIVIDING_RATE_1       0x41
> > > >
> > > > I guess we can start with these values. But I can't think of another option
> > > > than putting them into DT if there are differences between what hardware
> > > > platforms require.
> > > >
> > >
> > > Let's have a discussion about this.
> > > Now these non-default register settings represent one AAC operation
> > > mode, this is one option and works for a given lens or a module.
> > > If sometime in the future hardware platforms require another different
> > > settings, then DT properties may need to be created.
> >
> > If these values indeed are specific to a given lens (and presumably also a
> > spring), then I'd put them to DT right now --- we don't have drivers for
> > these components the drivers of which could hold this information, nor it
> > makes sense to add them just for that.
> >
> 
> I tend to stay on the conservative side and only add DT properties
> once there is really a need to do so. Right now we haven't seen any
> system which would use different values of these parameters.

I think it's also conservative to put things that are system specific to
DT. :-)

In practice we haven't put lens specific parameters to DT before, but
that's because 1) devices that need them are old, and so are the drivers
and the matter was not recognised at the time they were merged and 2) a lot
of devices these days don't have such configuration registers.

That said, I don't have a strong opinion on this one, but I think putting
this to DT would be a safer bet in the long run as this is specific to the
board, not the device itself.

-- 
Regards,

Sakari Ailus
