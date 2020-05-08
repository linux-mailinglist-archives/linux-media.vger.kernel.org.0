Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEBF1CB991
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 23:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgEHVN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 17:13:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:48048 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgEHVN1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 17:13:27 -0400
IronPort-SDR: 3iIOMECG5H9WUkpLrtzquvIZzMLV3D/jf1Ynnc4d2Yh76IgClY0wN/PQ3+DbK7vaSbEi4u+Bl/
 QeOELVv1aw5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 14:13:25 -0700
IronPort-SDR: 4Yj8Pe7aNJHLmyZkySqEOfIXuzX55Y2O2GKpRt8zVRl0b+jWmRzCog8Fs2FLpGfesYGpV3yIge
 k3pfLlFM6S5A==
X-IronPort-AV: E=Sophos;i="5.73,369,1583222400"; 
   d="scan'208";a="408232174"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 14:13:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2DE1520680; Sat,  9 May 2020 00:13:19 +0300 (EEST)
Date:   Sat, 9 May 2020 00:13:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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
Message-ID: <20200508211319.GJ9190@paasikivi.fi.intel.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-3-dongchun.zhu@mediatek.com>
 <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03>
 <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
 <1588907288.8804.188.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588907288.8804.188.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Fri, May 08, 2020 at 11:08:08AM +0800, Dongchun Zhu wrote:
> Hi Sakari, Tomasz,
> 
> Thanks for the review.
> 
> On Thu, 2020-05-07 at 15:46 +0200, Tomasz Figa wrote:
> > Hi Sakari, Dongchun,
> > 
> > On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > HI Dongchun,
> > >
> > > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > > Hi Sakari,
> > > >
> > > > Thanks for the review.
> > > >
> > > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > > Hi Dongchun,
> > > > >
> > > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > > control to set the desired focus via IIC serial interface.
> > > > > >
> > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > ---
> > > > > >  MAINTAINERS                |   1 +
> > > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  4 files changed, 453 insertions(+)
> > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > >
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index 8d72c41..c92dc99 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > > >  S:       Maintained
> > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > >
> > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > index 125d596..6a3f9da 100644
> > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > > >     capability. This is designed for linear control of
> > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > >
> > > > > > +config VIDEO_DW9768
> > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > >
> > > > > Please check how this works in the media tree master branch now --- it's
> > > > > largely select based.
> > > > >
> > > >
> > > > The actuator driver uses some structures that require the
> > > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > > dependency to avoid possible build error when it's not enabled.
> > >
> > > Please make sure this works with current media tree master. Right now it
> > > does not.
> > >
> > 
> > Dongchun, as Sakari said, please make sure to base the patches on the
> > master branch of the media tree.
> > (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> > dependency selection there seems to have changed recently.
> > 
> 
> I searched the patches on the media tree master branch.
> It seems that we need to remove the VIDEO_V4L2_SUBDEV_API dependency in
> Kconfig, and add #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API to include
> v4l2-subdev code.
> The change mainly is to make build pass, and don't return ENOTTY if
> SUBDEV_API is not set.
> Am I right?

Please see Kconfig entries for other similar drivers from Dongwoon.

> 
> > > >
> > > > > In general the patch seems fine to me, but please see the other comments
> > > > > below, too.
> > > > >
> > > > > > + depends on PM
> > > > > > + help
> > > > > > +   This is a driver for the DW9768 camera lens voice coil.
> > > > > > +   DW9768 is a 10 bit DAC with 100mA output current sink
> > > > > > +   capability. This is designed for linear control of
> > > > > > +   voice coil motors, controlled via I2C serial interface.
> > > > > > +
> > > > > >  config VIDEO_DW9807_VCM
> > > > > >   tristate "DW9807 lens voice coil support"
> > > > > >   depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > > > index 77bf7d0..4057476 100644
> > > > > > --- a/drivers/media/i2c/Makefile
> > > > > > +++ b/drivers/media/i2c/Makefile
> > > > > > @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
> > > > > >  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
> > > > > >  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
> > > > > >  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> > > > > > +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
> > > > > >  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
> > > > > >  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
> > > > > >  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> > > > > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > > > > new file mode 100644
> > > > > > index 0000000..dd68534
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/media/i2c/dw9768.c
> > > > > > @@ -0,0 +1,440 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +// Copyright (c) 2020 MediaTek Inc.
> > > > > > +
> > > > > > +#include <linux/delay.h>
> > > > > > +#include <linux/i2c.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > > +#include <linux/regulator/consumer.h>
> > > > > > +#include <media/v4l2-async.h>
> > > > > > +#include <media/v4l2-ctrls.h>
> > > > > > +#include <media/v4l2-device.h>
> > > > > > +#include <media/v4l2-subdev.h>
> > > > > > +
> > > > > > +#define DW9768_NAME                              "dw9768"
> > > > > > +#define DW9768_MAX_FOCUS_POS                     (1024 - 1)
> > > > > > +/*
> > > > > > + * This sets the minimum granularity for the focus positions.
> > > > > > + * A value of 1 gives maximum accuracy for a desired focus position
> > > > > > + */
> > > > > > +#define DW9768_FOCUS_STEPS                       1
> > > > > > +
> > > > > > +/*
> > > > > > + * Ring control and Power control register
> > > > > > + * Bit[1] RING_EN
> > > > > > + * 0: Direct mode
> > > > > > + * 1: AAC mode (ringing control mode)
> > > > > > + * Bit[0] PD
> > > > > > + * 0: Normal operation mode
> > > > > > + * 1: Power down mode
> > > > > > + * DW9768 requires waiting time of Topr after PD reset takes place.
> > > > > > + */
> > > > > > +#define DW9768_RING_PD_CONTROL_REG               0x02
> > > > > > +#define DW9768_PD_MODE_OFF                       0x00
> > > > > > +#define DW9768_PD_MODE_EN                        BIT(0)
> > > > > > +#define DW9768_AAC_MODE_EN                       BIT(1)
> > > > > > +
> > > > > > +/*
> > > > > > + * DW9768 separates two registers to control the VCM position.
> > > > > > + * One for MSB value, another is LSB value.
> > > > > > + * DAC_MSB: D[9:8] (ADD: 0x03)
> > > > > > + * DAC_LSB: D[7:0] (ADD: 0x04)
> > > > > > + * D[9:0] DAC data input: positive output current = D[9:0] / 1023 * 100[mA]
> > > > > > + */
> > > > > > +#define DW9768_MSB_ADDR                          0x03
> > > > > > +#define DW9768_LSB_ADDR                          0x04
> > > > > > +#define DW9768_STATUS_ADDR                       0x05
> > > > > > +
> > > > > > +/*
> > > > > > + * AAC mode control & prescale register
> > > > > > + * Bit[7:5] Namely AC[2:0], decide the VCM mode and operation time.
> > > > > > + * 000 Direct(default)
> > > > > > + * 001 AAC2 0.48xTvib
> > > > > > + * 010 AAC3 0.70xTvib
> > > > > > + * 011 AAC4 0.75xTvib
> > > > > > + * 100 Reserved
> > > > > > + * 101 AAC8 1.13xTvib
> > > > > > + * 110 Reserved
> > > > > > + * 111 Reserved
> > > > > > + * Bit[2:0] Namely PRESC[2:0], set the internal clock dividing rate as follow.
> > > > > > + * 000 2
> > > > > > + * 001 1(default)
> > > > > > + * 010 1/2
> > > > > > + * 011 1/4
> > > > > > + * 100 8
> > > > > > + * 101 4
> > > > > > + * 110 Reserved
> > > > > > + * 111 Reserved
> > > > > > + */
> > > > > > +#define DW9768_AAC_PRESC_REG                     0x06
> > > > > > +#define DW9768_AAC3_SELECT_DIVIDING_RATE_1       0x41
> > > > >
> > > > > I guess we can start with these values. But I can't think of another option
> > > > > than putting them into DT if there are differences between what hardware
> > > > > platforms require.
> > > > >
> > > >
> > > > Let's have a discussion about this.
> > > > Now these non-default register settings represent one AAC operation
> > > > mode, this is one option and works for a given lens or a module.
> > > > If sometime in the future hardware platforms require another different
> > > > settings, then DT properties may need to be created.
> > >
> > > If these values indeed are specific to a given lens (and presumably also a
> > > spring), then I'd put them to DT right now --- we don't have drivers for
> > > these components the drivers of which could hold this information, nor it
> > > makes sense to add them just for that.
> > >
> > 
> > I tend to stay on the conservative side and only add DT properties
> > once there is really a need to do so. Right now we haven't seen any
> > system which would use different values of these parameters.
> > 
> > Best regards,
> > Tomasz
> > 
> > > >
> > > > > > +
> > > > > > +/*
> > > > > > + * VCM period of vibration register
> > > > > > + * Bit[5:0] Defined as VCM rising periodic time (Tvib) together with PRESC[2:0]
> > > > > > + * Tvib = (6.3ms + AACT[5:0] * 0.1ms) * Dividing Rate
> > > > > > + * Dividing Rate is the internal clock dividing rate that is defined at
> > > > > > + * PRESCALE register (ADD: 0x06)
> > > > > > + */
> > > > > > +#define DW9768_AAC_TIME_REG                      0x07
> > > > > > +#define DW9768_AACT_CNT                          0x39
> > > > > > +
> > > > > > +/*
> > > > > > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > > > > > + * or in the case of PD reset taking place.
> > > > > > + */
> > > > > > +#define DW9768_T_OPR_US                          1000
> > > > > > +
> > > > > > +/*
> > > > > > + * This acts as the minimum granularity of lens movement.
> > > > > > + * Keep this value power of 2, so the control steps can be
> > > > > > + * uniformly adjusted for gradual lens movement, with desired
> > > > > > + * number of control steps.
> > > > > > + */
> > > > > > +#define DW9768_MOVE_STEPS                        16
> > > > > > +
> > > > > > +/*
> > > > > > + * DW9768_AAC_PRESC_REG & DW9768_AAC_TIME_REG determine VCM operation time.
> > > > > > + * If DW9768_AAC_PRESC_REG is 0x41, and DW9768_AAC_TIME_REG is 0x39, VCM mode
> > > > > > + * would be AAC3, Operation Time would be 0.70xTvib, that is 8.40ms.
> > > > > > + */
> > > > > > +#define DW9768_MOVE_DELAY_US                     8400
> > > > > > +#define DW9768_STABLE_TIME_US                    20000
> > > > > > +
> > > > > > +static const char * const dw9768_supply_names[] = {
> > > > > > + "vin",  /* I2C I/O interface power */
> > > > > > + "vdd",  /* VCM power */
> > > > > > +};
> > > > > > +
> > > > > > +/* dw9768 device structure */
> > > > > > +struct dw9768 {
> > > > > > + struct regulator_bulk_data supplies[ARRAY_SIZE(dw9768_supply_names)];
> > > > > > + struct v4l2_ctrl_handler ctrls;
> > > > > > + struct v4l2_ctrl *focus;
> > > > > > + struct v4l2_subdev sd;
> > > > > > +};
> > > > > > +
> > > > > > +static inline struct dw9768 *to_dw9768(struct v4l2_ctrl *ctrl)
> > > > > > +{
> > > > > > + return container_of(ctrl->handler, struct dw9768, ctrls);
> > > > > > +}
> > > > >
> > > > > This is used in a single place. I'd just use container_of() directly there.
> > > > >
> > > >
> > > > Thanks for the reminder.
> > > > Fixed in next release.
> > > >
> > > > > > +
> > > > > > +static inline struct dw9768 *sd_to_dw9768(struct v4l2_subdev *subdev)
> > > > > > +{
> > > > > > + return container_of(subdev, struct dw9768, sd);
> > > > > > +}
> > > > > > +
> > > > > > +struct regval_list {
> > > > > > + u8 reg_num;
> > > > > > + u8 value;
> > > > > > +};
> > > > > > +
> > > > > > +static const struct regval_list dw9768_init_regs[] = {
> > > > > > + {DW9768_RING_PD_CONTROL_REG, DW9768_AAC_MODE_EN},
> > > > > > + {DW9768_AAC_PRESC_REG, DW9768_AAC3_SELECT_DIVIDING_RATE_1},
> > > > > > + {DW9768_AAC_TIME_REG, DW9768_AACT_CNT},
> > > > > > +};
> > > > > > +
> > > > > > +static int dw9768_write_array(struct dw9768 *dw9768,
> > > > > > +                       const struct regval_list *vals, size_t len)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > + unsigned int i;
> > > > > > + int ret;
> > > > > > +
> > > > > > + for (i = 0; i < len; i++) {
> > > > > > +         ret = i2c_smbus_write_byte_data(client, vals[i].reg_num,
> > > > > > +                                         vals[i].value);
> > > > > > +         if (ret < 0)
> > > > > > +                 return ret;
> > > > > > + }
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_set_dac(struct dw9768 *dw9768, u16 val)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > +
> > > > > > + /* Write VCM position to registers */
> > > > > > + return i2c_smbus_write_word_swapped(client, DW9768_MSB_ADDR, val);
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_init(struct dw9768 *dw9768)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > + int ret, val;
> > > > > > +
> > > > > > + /* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
> > > > > > + ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> > > > > > +                                 DW9768_PD_MODE_OFF);
> > > > > > + if (ret < 0)
> > > > > > +         return ret;
> > > > > > +
> > > > > > + /*
> > > > > > +  * DW9769 requires waiting delay time of t_OPR
> > > > > > +  * after PD reset takes place.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > > > > > +
> > > > > > + ret = dw9768_write_array(dw9768, dw9768_init_regs,
> > > > > > +                          ARRAY_SIZE(dw9768_init_regs));
> > > > > > + if (ret)
> > > > > > +         return ret;
> > > > > > +
> > > > > > + for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> > > > > > +      val <= dw9768->focus->val;
> > > > > > +      val += DW9768_MOVE_STEPS) {
> > > > > > +         ret = dw9768_set_dac(dw9768, val);
> > > > > > +         if (ret) {
> > > > > > +                 dev_err(&client->dev, "%s I2C failure: %d",
> > > > > > +                         __func__, ret);
> > > > > > +                 return ret;
> > > > > > +         }
> > > > > > +         usleep_range(DW9768_MOVE_DELAY_US,
> > > > > > +                      DW9768_MOVE_DELAY_US + 1000);
> > > > > > + }
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_release(struct dw9768 *dw9768)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > + int ret, val;
> > > > > > +
> > > > > > + val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> > > > > > + for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > > > > > +         ret = dw9768_set_dac(dw9768, val);
> > > > > > +         if (ret) {
> > > > > > +                 dev_err(&client->dev, "I2C write fail: %d", ret);
> > > > > > +                 return ret;
> > > > > > +         }
> > > > > > +         usleep_range(DW9768_MOVE_DELAY_US, DW9768_MOVE_DELAY_US + 1000);
> > > > > > + }
> > > > > > +
> > > > > > + /*
> > > > > > +  * Wait for the motor to stabilize after the last movement
> > > > > > +  * to prevent the motor from shaking.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_STABLE_TIME_US - DW9768_MOVE_DELAY_US,
> > > > > > +              DW9768_STABLE_TIME_US - DW9768_MOVE_DELAY_US + 1000);
> > > > > > +
> > > > > > + ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> > > > > > +                                 DW9768_PD_MODE_EN);
> > > > > > + if (ret < 0)
> > > > > > +         return ret;
> > > > > > +
> > > > > > + /*
> > > > > > +  * DW9769 requires waiting delay time of t_OPR
> > > > > > +  * after PD reset takes place.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int __maybe_unused dw9768_runtime_suspend(struct device *dev)
> > > > > > +{
> > > > > > + struct i2c_client *client = to_i2c_client(dev);
> > > > > > + struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > + struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > > > > +
> > > > > > + dw9768_release(dw9768);
> > > > > > + regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > > > > > +                        dw9768->supplies);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int __maybe_unused dw9768_runtime_resume(struct device *dev)
> > > > > > +{
> > > > > > + struct i2c_client *client = to_i2c_client(dev);
> > > > > > + struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > + struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > > > > + int ret;
> > > > > > +
> > > > > > + ret = regulator_bulk_enable(ARRAY_SIZE(dw9768_supply_names),
> > > > > > +                             dw9768->supplies);
> > > > > > + if (ret < 0) {
> > > > > > +         dev_err(dev, "failed to enable regulators\n");
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > > > + /*
> > > > > > +  * The datasheet refers to t_OPR that needs to be waited before sending
> > > > > > +  * I2C commands after power-up.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > > > > > +
> > > > > > + ret = dw9768_init(dw9768);
> > > > > > + if (ret < 0)
> > > > > > +         goto disable_regulator;
> > > > > > +
> > > > > > + return 0;
> > > > > > +
> > > > > > +disable_regulator:
> > > > > > + regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > > > > > +                        dw9768->supplies);
> > > > > > +
> > > > > > + return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > +{
> > > > > > + struct dw9768 *dw9768 = to_dw9768(ctrl);
> > > > > > +
> > > > > > + if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> > > > > > +         return dw9768_set_dac(dw9768, ctrl->val);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct v4l2_ctrl_ops dw9768_ctrl_ops = {
> > > > > > + .s_ctrl = dw9768_set_ctrl,
> > > > > > +};
> > > > > > +
> > > > > > +static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > > > > +{
> > > > > > + int ret;
> > > > > > +
> > > > > > + ret = pm_runtime_get_sync(sd->dev);
> > > > > > + if (ret < 0) {
> > > > > > +         pm_runtime_put_noidle(sd->dev);
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > > > > +{
> > > > > > + pm_runtime_put(sd->dev);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct v4l2_subdev_internal_ops dw9768_int_ops = {
> > > > > > + .open = dw9768_open,
> > > > > > + .close = dw9768_close,
> > > > > > +};
> > > > > > +
> > > > > > +static const struct v4l2_subdev_ops dw9768_ops = { };
> > > > > > +
> > > > > > +static int dw9768_init_controls(struct dw9768 *dw9768)
> > > > > > +{
> > > > > > + struct v4l2_ctrl_handler *hdl = &dw9768->ctrls;
> > > > > > + const struct v4l2_ctrl_ops *ops = &dw9768_ctrl_ops;
> > > > > > +
> > > > > > + v4l2_ctrl_handler_init(hdl, 1);
> > > > > > +
> > > > > > + dw9768->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0,
> > > > > > +                                   DW9768_MAX_FOCUS_POS,
> > > > > > +                                   DW9768_FOCUS_STEPS, 0);
> > > > > > +
> > > > > > + if (hdl->error)
> > > > > > +         return hdl->error;
> > > > > > +
> > > > > > + dw9768->sd.ctrl_handler = hdl;
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_probe(struct i2c_client *client)
> > > > > > +{
> > > > > > + struct device *dev = &client->dev;
> > > > > > + struct dw9768 *dw9768;
> > > > > > + unsigned int i;
> > > > > > + int ret;
> > > > > > +
> > > > > > + dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> > > > > > + if (!dw9768)
> > > > > > +         return -ENOMEM;
> > > > > > +
> > > > > > + v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> > > > > > +
> > > > > > + for (i = 0; i < ARRAY_SIZE(dw9768_supply_names); i++)
> > > > > > +         dw9768->supplies[i].supply = dw9768_supply_names[i];
> > > > > > +
> > > > > > + ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dw9768_supply_names),
> > > > > > +                               dw9768->supplies);
> > > > > > + if (ret) {
> > > > > > +         dev_err(dev, "failed to get regulators\n");
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > > > + ret = dw9768_init_controls(dw9768);
> > > > > > + if (ret)
> > > > > > +         goto entity_cleanup;
> > > > > > +
> > > > > > + dw9768->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > + dw9768->sd.internal_ops = &dw9768_int_ops;
> > > > > > +
> > > > > > + ret = media_entity_pads_init(&dw9768->sd.entity, 0, NULL);
> > > > > > + if (ret < 0)
> > > > > > +         goto entity_cleanup;
> > > > > > +
> > > > > > + dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > > > > > +
> > > > > > + pm_runtime_enable(dev);
> > > > > > + if (!pm_runtime_enabled(dev)) {
> > > > > > +         ret = dw9768_runtime_resume(dev);
> > > > > > +         if (ret < 0) {
> > > > > > +                 dev_err(dev, "failed to power on: %d\n", ret);
> > > > > > +                 goto entity_cleanup;
> > > > > > +         }
> > > > > > + }
> > > > > > +
> > > > > > + ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > > + if (ret < 0)
> > > > > > +         goto entity_cleanup;
> > > > > > +
> > > > > > + return 0;
> > > > > > +
> > > > > > +entity_cleanup:
> > > > > > + v4l2_ctrl_handler_free(&dw9768->ctrls);
> > > > > > + media_entity_cleanup(&dw9768->sd.entity);
> > > > > > + return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_remove(struct i2c_client *client)
> > > > > > +{
> > > > > > + struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > + struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > > > > +
> > > > > > + pm_runtime_disable(&client->dev);
> > > > > > + v4l2_async_unregister_subdev(&dw9768->sd);
> > > > > > + v4l2_ctrl_handler_free(&dw9768->ctrls);
> > > > > > + media_entity_cleanup(&dw9768->sd.entity);
> > > > > > + if (!pm_runtime_status_suspended(&client->dev))
> > > > > > +         dw9768_runtime_suspend(&client->dev);
> > > > > > + pm_runtime_set_suspended(&client->dev);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct of_device_id dw9768_of_table[] = {
> > > > > > + { .compatible = "dongwoon,dw9768" },
> > > > > > + {}
> > > > > > +};
> > > > > > +MODULE_DEVICE_TABLE(of, dw9768_of_table);
> > > > > > +
> > > > > > +static const struct dev_pm_ops dw9768_pm_ops = {
> > > > > > + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > > > > +                         pm_runtime_force_resume)
> > > > > > + SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> > > > > > +};
> > > > > > +
> > > > > > +static struct i2c_driver dw9768_i2c_driver = {
> > > > > > + .driver = {
> > > > > > +         .name = DW9768_NAME,
> > > > > > +         .pm = &dw9768_pm_ops,
> > > > > > +         .of_match_table = dw9768_of_table,
> > > > > > + },
> > > > > > + .probe_new  = dw9768_probe,
> > > > > > + .remove = dw9768_remove,
> > > > > > +};
> > > > > > +module_i2c_driver(dw9768_i2c_driver);
> > > > > > +
> > > > > > +MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
> > > > > > +MODULE_DESCRIPTION("DW9768 VCM driver");
> > > > > > +MODULE_LICENSE("GPL v2");
> > > > >
> > > >
> > >
> > > --
> > > Sakari Ailus
> 

-- 
Sakari Ailus
