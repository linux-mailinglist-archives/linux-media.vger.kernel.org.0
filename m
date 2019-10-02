Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64834C4B97
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 12:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfJBKhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 06:37:47 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59752 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726330AbfJBKhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 06:37:47 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 42D02634C89;
        Wed,  2 Oct 2019 13:37:17 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iFc0R-0002AN-Nb; Wed, 02 Oct 2019 13:37:15 +0300
Date:   Wed, 2 Oct 2019 13:37:15 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Message-ID: <20191002103715.GR896@valkosipuli.retiisi.org.uk>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
 <20190830091943.22646-3-manivannan.sadhasivam@linaro.org>
 <20190923092209.GL5525@valkosipuli.retiisi.org.uk>
 <20191001184200.GA7739@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001184200.GA7739@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Wed, Oct 02, 2019 at 12:12:00AM +0530, Manivannan Sadhasivam wrote:
> Hi Sakari,
> 
> On Mon, Sep 23, 2019 at 12:22:09PM +0300, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > On Fri, Aug 30, 2019 at 02:49:42PM +0530, Manivannan Sadhasivam wrote:
> > > Add driver for Sony IMX290 CMOS image sensor driver. The driver only
> > > supports I2C interface for programming and MIPI CSI-2 for sensor output.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/media/i2c/Kconfig  |  11 +
> > >  drivers/media/i2c/Makefile |   1 +
> > >  drivers/media/i2c/imx290.c | 881 +++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 893 insertions(+)
> > >  create mode 100644 drivers/media/i2c/imx290.c
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 79ce9ec6fc1b..4ebb80b18748 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -595,6 +595,17 @@ config VIDEO_IMX274
> > >  	  This is a V4L2 sensor driver for the Sony IMX274
> > >  	  CMOS image sensor.
> > >  
> > > +config VIDEO_IMX290
> > > +	tristate "Sony IMX290 sensor support"
> > > +	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > +	depends on MEDIA_CAMERA_SUPPORT
> > 
> > Please drop this line. It will be redundant very soon.
> > 
> 
> okay.
> 
> > > +	help
> > > +	  This is a Video4Linux2 sensor driver for the Sony
> > > +	  IMX290 camera sensor.
> > > +
> > > +	  To compile this driver as a module, choose M here: the
> > > +	  module will be called imx290.
> > > +
> > >  config VIDEO_IMX319
> > >  	tristate "Sony IMX319 sensor support"
> > >  	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index fd4ea86dedd5..04411ddb4922 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -111,6 +111,7 @@ obj-$(CONFIG_VIDEO_TC358743)	+= tc358743.o
> > >  obj-$(CONFIG_VIDEO_IMX214)	+= imx214.o
> > >  obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
> > >  obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
> > > +obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
> > >  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> > >  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> > >  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > new file mode 100644
> > > index 000000000000..db5bb0d69eb8
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -0,0 +1,881 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Sony IMX290 CMOS Image Sensor Driver
> > > + *
> > > + * Copyright (C) 2019 FRAMOS GmbH.
> > > + *
> > > + * Copyright (C) 2019 Linaro Ltd.
> > > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <media/media-entity.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +#define IMX290_STANDBY 0x3000
> > > +#define IMX290_REGHOLD 0x3001
> > > +#define IMX290_XMSTA 0x3002
> > > +#define IMX290_GAIN 0x3014
> > > +
> > > +#define IMX290_DEFAULT_LINK_FREQ 445500000
> > > +
> > > +static const char * const imx290_supply_name[] = {
> > > +	"vdda",
> > > +	"vddd",
> > > +	"vdddo",
> > > +};
> > > +
> > > +#define IMX290_NUM_SUPPLIES ARRAY_SIZE(imx290_supply_name)
> > > +
> > > +struct imx290_regval {
> > > +	u16 reg;
> > > +	u8 val;
> > > +};
> > > +
> > > +struct imx290_mode {
> > > +	u32 width;
> > > +	u32 height;
> > > +	u32 pixel_rate;
> > > +	u32 link_freq_index;
> > > +
> > > +	const struct imx290_regval *data;
> > > +	u32 data_size;
> > > +};
> > > +
> > > +struct imx290 {
> > > +	struct device *dev;
> > > +	struct clk *xclk;
> > > +	struct regmap *regmap;
> > > +
> > > +	struct v4l2_subdev sd;
> > > +	struct v4l2_fwnode_endpoint ep;
> > > +	struct media_pad pad;
> > > +	struct v4l2_mbus_framefmt current_format;
> > > +	const struct imx290_mode *current_mode;
> > > +
> > > +	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
> > > +	struct gpio_desc *rst_gpio;
> > > +
> > > +	struct v4l2_ctrl_handler ctrls;
> > > +	struct v4l2_ctrl *link_freq;
> > > +	struct v4l2_ctrl *pixel_rate;
> > > +
> > > +	struct mutex lock;
> > > +};
> > > +
> > > +struct imx290_pixfmt {
> > > +	u32 code;
> > > +};
> > > +
> > > +static const struct imx290_pixfmt imx290_formats[] = {
> > > +	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
> > 
> > You have a single format here. You don't need the entire array, do you?
> > 
> > Unless you have plans to add more, that is.
> > 
> 
> Yes, the sensor supports RAW12 format as well and it will be added once
> this driver is merged.

Ok. 

> 
> > > +};
> > > +
> > > +static struct regmap_config imx290_regmap_config = {

Should this be const, too?

> > > +	.reg_bits = 16,
> > > +	.val_bits = 8,
> > > +	.cache_type = REGCACHE_RBTREE,
> > > +};

...

> > > +static int imx290_write_buffered_reg(struct imx290 *imx290, u16 address_low,
> > > +				     u8 nr_regs, u32 value)
> > > +{
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x01);
> > > +	if (ret) {
> > > +		dev_err(imx290->dev, "Error setting hold register\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (i = 0; i < nr_regs; i++) {
> > > +		ret = imx290_write_reg(imx290, address_low + i,
> > > +				       (u8)(value >> (i * 8)));
> > > +		if (ret) {
> > > +			dev_err(imx290->dev, "Error writing buffered registers\n");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x00);
> > > +	if (ret) {
> > > +		dev_err(imx290->dev, "Error setting hold register\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx290_set_gain(struct imx290 *imx290, u32 value)
> > > +{
> > > +	int ret;
> > > +
> > > +	u32 adjusted_value = (value * 10) / 3;
> > 
> > What's the purpose of this? Why not to use the value directly?
> > 
> 
> The gain register accepts the value 10/3 of the actual gain required. Hence,
> we need to manually do the calculation before updating the value. I can
> add a comment here to clarify.

It's better to use the register value directly. Otherwise the granularity
won't be available to the user space.

> 
> > > +
> > > +	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, adjusted_value);
> > > +	if (ret)
> > > +		dev_err(imx290->dev, "Unable to write gain\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx290_set_power_on(struct imx290 *imx290)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(imx290->xclk);
> > 
> > Please move the code from this function to the runtime PM runtime suspend
> > callback. The same for imx290_set_power_off().
> > 
> 
> May I know why? I think since this is being used only once, you're suggesting
> to move to the callback function itself but please see the comment below. I
> will reuse this function to power on the device during probe.

Yes, you can call the same function from probe, even if it's used as a
runtime PM callback.

There's no need to have a function that acts as a wrapper for calling it
with a different type of an argument.

-- 
Kind regards,

Sakari Ailus
