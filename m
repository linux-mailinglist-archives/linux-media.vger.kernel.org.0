Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBEE26AF83
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 23:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgIOVYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 17:24:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41792 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgIOVYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 17:24:00 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68C99FD8;
        Tue, 15 Sep 2020 23:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600205032;
        bh=e67Vz0DHRCF/b4/hnCUSdRR3v2l7enRlkAwnKLetBYM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oxKJFlpSMk19I+GrYG44a7LJj7zDaN5PgktSkdSERsBHnVso3JA525tZZyvVDIcZe
         xpeAwz8z1R8GxNF0daHtMlLxZ5sRXQgYQ5Zw+/v0aMsQBSNm7WD15Rkr5ZY2v/5apb
         lBygc/tW7raLq47cEG1B0mJ8vC+w9vAyNmfYmsT8=
Date:   Wed, 16 Sep 2020 00:23:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Cozma, Andrei" <Andrei.Cozma@analog.com>
Subject: Re: [PATCH 1/2] media: i2c: Add driver for the Analog Devices
 ADDI9036 ToF front-end
Message-ID: <20200915212322.GB3998@pendragon.ideasonboard.com>
References: <20200910162426.55306-1-bogdan.togorean@analog.com>
 <20200910220138.GJ3940@pendragon.ideasonboard.com>
 <DM6PR03MB5274FF37BB02D98691BB43289B240@DM6PR03MB5274.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR03MB5274FF37BB02D98691BB43289B240@DM6PR03MB5274.namprd03.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bogdan,

On Fri, Sep 11, 2020 at 01:32:39PM +0000, Togorean, Bogdan wrote:
> > On Thu, Sep 10, 2020 at 07:24:06PM +0300, Bogdan Togorean wrote:
> > > The ADDI9036 is a complete, 45 MHz, front-end solution for charge
> > > coupled device (CCD) time of flight (TOF) imaging applications.
> > >
> > > It has 2-lane MIPI CSI-2 RAW12 data output and i2c control interface.
> > >
> > > The programming of calibration and firmware is performed by userspace
> > > SDK through CID_USER class IOCTLs.
> > 
> > I'm afraid that's not acceptable. The firmware should be loaded using
> > the Linux kernel firmware API. As for calibration, is it static data ?
> > How is it generated ?
> 
> Calibration data is static data, generated at production and stored on and EEPROM
> memory on camera board. The camera board consists mainly of ADDI9036 processor
> + CCD image sensor + EEPROM.
> 
> The firmware is a set of (address, data) tuples that are written via I2C.

Is it a firmware in the sense of software running on the ADDI9036, or is
it a device configuration to be loaded in registers ?

> We want this driver to be a generic one and support all implementations
> of ADDI9036 ToF processor. Now the problem is that some implementations 
> store firmware + calibration on external EEPROM and some store just calibration 
> data on EEPROM and firmware is loaded from a file stored in SDK. With the help 
> of the 2 custom controls we move the camera model detection, firmware
> and calibration fetching from driver to user space SDK.
> 
> Also an important point is that the ToF processor has 3 operating modes 
> (near, medium and far). At each mode change a new set of firmware + 
> calibration data is loaded into ADDI9036 chip. If we move the firmware loading
> in driver we would still need a custom enumeration control to select the working mode.
> 
> > > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > > ---
> > >  MAINTAINERS                        |  10 +
> > >  drivers/media/i2c/Kconfig          |  14 +
> > >  drivers/media/i2c/Makefile         |   1 +
> > >  drivers/media/i2c/addi9036.c       | 673 +++++++++++++++++++++++++++++
> > >  include/uapi/linux/v4l2-controls.h |   6 +
> > >  5 files changed, 704 insertions(+)
> > >  create mode 100644 drivers/media/i2c/addi9036.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b5cfab015bd6..fb03ad9ca920 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -477,6 +477,16 @@ W:	http://wiki.analog.com/AD7879
> > >  W:	http://ez.analog.com/community/linux-device-drivers
> > >  F:	drivers/input/touchscreen/ad7879.c
> > >
> > > +ADDI9036 TOF FRONTEND DRIVER
> > > +M:	Bogdan Togorean <bogdan.togorean@analog.com>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Supported
> > > +W:	https://www.analog.com/en/products/addi9036.html
> > > +W:	http://ez.analog.com/community/linux-device-drivers
> > > +T:	git git://linuxtv.org/media_tree.git
> > > +F:	Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > +F:	drivers/media/i2c/addi9036.c
> > > +
> > >  ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
> > >  M:	Jiri Kosina <jikos@kernel.org>
> > >  S:	Maintained
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index c7ba76fee599..087dd307505d 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -725,6 +725,20 @@ config VIDEO_APTINA_PLL
> > >  config VIDEO_SMIAPP_PLL
> > >  	tristate
> > >
> > > +config VIDEO_ADDI9036
> > > +	tristate "Analog Devices ADDI9036 ToF front-end support"
> > > +	depends on I2C && VIDEO_V4L2
> > > +	select MEDIA_CONTROLLER
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	select V4L2_FWNODE
> > > +	select REGMAP_I2C
> > > +	help
> > > +	  This is a Video4Linux2 driver for Analog Devices ADDI9036
> > > +	  Time of Flight front-end.
> > > +
> > > +	  To compile this driver as a module, choose M here: the
> > > +	  module will be called addi9036.
> > > +
> > >  config VIDEO_HI556
> > >  	tristate "Hynix Hi-556 sensor support"
> > >  	depends on I2C && VIDEO_V4L2
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index f0a77473979d..631a7c7612ca 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -26,6 +26,7 @@ obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
> > >  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> > >  obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
> > >  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
> > > +obj-$(CONFIG_VIDEO_ADDI9036) += addi9036.o
> > >  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
> > >  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> > >  obj-$(CONFIG_VIDEO_ADV7180) += adv7180.o
> > > diff --git a/drivers/media/i2c/addi9036.c b/drivers/media/i2c/addi9036.c
> > > new file mode 100644
> > > index 000000000000..76c3444058dc
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/addi9036.c
> > > @@ -0,0 +1,673 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Driver for the Analog Devices ADDI9036 ToF front-end.
> > > + *
> > > + * Copyright (C) 2019-2020 Analog Devices, All Rights Reserved.
> > > + *
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/init.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/types.h>
> > > +#include <linux/version.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +struct addi9036_mode_info {
> > > +	u32 width;
> > > +	u32 height;
> > > +	u32 pixel_rate;
> > > +	u32 link_freq_idx;
> > > +};
> > > +
> > > +struct addi9036 {
> > > +	struct regmap *regmap;
> > > +	struct device *dev;
> > > +	struct v4l2_subdev sd;
> > > +	struct media_pad pad;
> > > +	struct v4l2_fwnode_endpoint ep;
> > > +	struct v4l2_mbus_framefmt fmt;
> > > +	struct v4l2_rect crop;
> > > +
> > > +	const struct addi9036_mode_info *current_mode;
> > > +
> > > +	struct v4l2_ctrl_handler ctrls;
> > > +	struct v4l2_ctrl *pixel_rate;
> > > +	struct v4l2_ctrl *link_freq;
> > > +
> > > +	/* lock to protect power state */
> > > +	struct mutex power_lock;
> > > +	int power_count;
> > > +
> > > +	struct gpio_desc *rst_gpio;
> > > +
> > > +	/* controls */
> > > +	struct v4l2_ctrl *set_chip_config;
> > > +	struct v4l2_ctrl *reg_read;
> > > +};
> > > +
> > > +static inline struct addi9036 *to_addi9036(struct v4l2_subdev *sd)
> > > +{
> > > +	return container_of(sd, struct addi9036, sd);
> > > +}
> > > +
> > > +#define V4L2_CID_AD_DEV_SET_CHIP_CONFIG_QUERY (V4L2_CID_USER_ADDI9036_BASE + 0)
> > > +#define V4L2_CID_AD_DEV_REG_READ_QUERY (V4L2_CID_USER_ADDI9036_BASE + 1)
> > > +
> > > +static const struct reg_sequence addi9036_powerup_setting[] = {
> > > +	{ 0xc4c0, 0x001c },
> > > +	{ 0xc4c3, 0x001c },
> > > +	{ 0xc4d7, 0x0000 },
> > > +	{ 0xc4d5, 0x0002 },
> > > +	{ 0xc4da, 0x0001 },
> > > +	{ 0xc4f0, 0x0000 },
> > > +	{ 0xc427, 0x0003 },
> > > +	{ 0xc427, 0x0001 },
> > > +	{ 0xc427, 0x0000 },
> > > +	{ 0xc426, 0x0030 },
> > > +	{ 0xc426, 0x0010 },
> > > +	{ 0xc426, 0x0000 },
> > > +	{ 0xc423, 0x0080 },
> > > +	{ 0xc431, 0x0080 },
> > > +	{ 0x4001, 0x0007 },
> > > +	{ 0x7c22, 0x0004 }
> > > +};
> > > +
> > > +static const struct reg_sequence addi9036_powerdown_setting[] = {
> > > +	{ 0xc022, 0x0001 },
> > > +	{ 0x4001, 0x0006 },
> > > +	{ 0x7c22, 0x0004 },
> > > +	{ 0xc431, 0x0082 },
> > > +	{ 0xc423, 0x0000 },
> > > +	{ 0xc426, 0x0020 },
> > > +	{ 0xc427, 0x0002 },
> > > +	{ 0xc4c0, 0x003c },
> > > +	{ 0xc4c3, 0x003c },
> > > +	{ 0xc4d5, 0x0003 },
> > > +	{ 0xc4da, 0x0000 },
> > > +	{ 0xc4d7, 0x0001 },
> > > +	{ 0xc4f0, 0x0001 }
> > > +};
> > > +
> > > +static const s64 link_freq_tbl[] = {
> > > +	110529000,
> > > +	221184000,
> > > +};
> > > +
> > > +/* Elements of the structure must be ordered ascending by width & height */
> > > +static const struct addi9036_mode_info addi9036_mode_info_data[] = {
> > > +	{
> > > +		.width = 640,
> > > +		.height = 480,
> > > +		.pixel_rate = 36864000,
> > > +		.link_freq_idx = 0 /* an index in link_freq_tbl[] */
> > > +	},
> > > +	{
> > > +		.width = 640,
> > > +		.height = 960,
> > > +		.pixel_rate = 73728000,
> > > +		.link_freq_idx = 1 /* an index in link_freq_tbl[] */
> > > +	},
> > > +};
> > > +
> > > +static bool addi9306_readable_register(struct device *dev, unsigned int reg)
> > > +{
> > > +	if (((reg >= 0x4000) && (reg <= 0x6FFF)) ||
> > > +	    ((reg >= 0x7C00) && (reg <= 0x7FFF)) ||
> > > +	    ((reg >= 0xC000) && (reg <= 0xC200)) ||
> > > +	    ((reg >= 0xC300) && (reg <= 0xC6BF)))
> > > +		return true;
> > > +	else
> > > +		return false;
> > > +}
> > > +
> > > +static bool addi9306_writeable_register(struct device *dev, unsigned int reg)
> > > +{
> > > +	if (((reg >= 0x4000) && (reg <= 0x6FFF)) ||
> > > +	    ((reg >= 0x7C00) && (reg <= 0x7FFF)) ||
> > > +	    ((reg >= 0xC000) && (reg <= 0xC113)) ||
> > > +	    ((reg >= 0xC300) && (reg <= 0xC7FF)))
> > > +		return true;
> > > +	else
> > > +		return false;
> > > +}
> > > +
> > > +static const struct regmap_config addi9036_i2c_regmap_config = {
> > > +	.reg_bits = 16,
> > > +	.val_bits = 16,
> > > +
> > > +	.max_register = 0xC7FF,
> > > +	.writeable_reg = addi9306_writeable_register,
> > > +	.readable_reg = addi9306_readable_register,
> > > +	.cache_type = REGCACHE_NONE,
> > > +};
> > > +
> > > +static int addi9036_set_power_on(struct addi9036 *addi9036)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (addi9036->rst_gpio)
> > > +		gpiod_set_value_cansleep(addi9036->rst_gpio, 0);
> > > +
> > > +	ret = regmap_register_patch(addi9036->regmap, addi9036_powerup_setting,
> > > +				    ARRAY_SIZE(addi9036_powerup_setting));
> > > +	if (ret)
> > > +		dev_err(addi9036->dev, "Could not set power up registers\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int addi9036_set_power_off(struct addi9036 *addi9036)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = regmap_register_patch(addi9036->regmap,
> > > +				    addi9036_powerdown_setting,
> > > +				    ARRAY_SIZE(addi9036_powerdown_setting));
> > > +	if (ret)
> > > +		dev_err(addi9036->dev, "could not set power down registers\n");
> > > +
> > > +	if (addi9036->rst_gpio)
> > > +		gpiod_set_value_cansleep(addi9036->rst_gpio, 1);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int addi9036_s_power(struct v4l2_subdev *sd, int on)
> > > +{
> > > +	struct addi9036 *addi9036 = to_addi9036(sd);
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&addi9036->power_lock);
> > > +
> > > +	dev_dbg(addi9036->dev, "s_power: %d\n", on);
> > > +
> > > +	/* If the power count is modified from 0 to != 0 or from != 0 to 0,
> > > +	 * update the power state.
> > > +	 */
> > > +	if (addi9036->power_count == !on) {
> > > +		if (on)
> > > +			ret = addi9036_set_power_on(addi9036);
> > > +		else
> > > +			ret = addi9036_set_power_off(addi9036);
> > > +	}
> > > +
> > > +	if (!ret) {
> > > +		/* Update the power count. */
> > > +		addi9036->power_count += on ? 1 : -1;
> > > +		WARN(addi9036->power_count < 0, "Unbalanced power count\n");
> > > +		WARN(addi9036->power_count > 1, "Duplicated s_power call\n");
> > > +	}
> > > +
> > > +	mutex_unlock(&addi9036->power_lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int addi9036_set_chip_config(struct addi9036 *addi9036,
> > > +				    struct v4l2_ctrl *ctrl)
> > > +{
> > > +	int index;
> > > +	unsigned short *reg, *val;
> > > +
> > > +	reg = (unsigned short *)(ctrl->p_new.p_u16);
> > > +	val = (unsigned short *)(ctrl->p_new.p_u16 + 1);
> > > +
> > > +	for (index = 0; index < ctrl->elems; index += 2) {
> > > +		regmap_write(addi9036->regmap, *reg, *val);
> > > +		reg += 2;
> > > +		val += 2;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int addi9036_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct addi9036 *addi9036 = container_of(ctrl->handler,
> > > +						 struct addi9036, ctrls);
> > > +	int ret = 0;
> > > +	unsigned int val;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_AD_DEV_SET_CHIP_CONFIG_QUERY:
> > > +		ret = addi9036_set_chip_config(addi9036, ctrl);
> > > +		break;
> > > +	case V4L2_CID_AD_DEV_REG_READ_QUERY:
> > > +		ret = regmap_read(addi9036->regmap, *(u16 *)(ctrl-
> > >p_new.p_u16),
> > > +				  &val);
> > > +		if (ret)
> > > +			dev_warn(addi9036->dev,
> > > +				 "could not read from register\n");
> > > +		else
> > > +			*(u16 *)(ctrl->p_new.p_u16) = val;
> > > +		break;
> > > +	case V4L2_CID_PIXEL_RATE:
> > > +	case V4L2_CID_LINK_FREQ:
> > > +		break;
> > > +	default:
> > > +		dev_err(addi9036->dev, "%s > Unhandled: %x  param=%x\n",
> > > +			__func__, ctrl->id, ctrl->val);
> > > +		ret = -EINVAL;
> > > +		break;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_ops addi9036_ctrl_ops = {
> > > +	.s_ctrl = addi9036_s_ctrl,
> > > +};
> > > +
> > > +static const struct v4l2_ctrl_config addi9036_ctrl_chip_config = {
> > > +	.ops		= &addi9036_ctrl_ops,
> > > +	.id		= V4L2_CID_AD_DEV_SET_CHIP_CONFIG_QUERY,
> > > +	.name		= "chip_config",
> > > +	.type		= V4L2_CTRL_TYPE_U16,
> > > +	.def		= 0xFF,
> > > +	.min		= 0x00,
> > > +	.max		= 0xFFFF,
> > > +	.step		= 1,
> > > +	.dims		= { 2048 },
> > > +	.elem_size	= 2
> > > +};
> > > +
> > > +static const struct v4l2_ctrl_config addi9036_ctrl_reg_read = {
> > > +	.ops	= &addi9036_ctrl_ops,
> > > +	.id	= V4L2_CID_AD_DEV_REG_READ_QUERY,
> > > +	.name	= "reg_read",
> > > +	.type	= V4L2_CTRL_TYPE_U16,
> > > +	.def	= 0,
> > > +	.min	= 0x00,
> > > +	.max	= 0xFFFF,
> > > +	.step	= 1
> > > +};
> > > +
> > > +static int addi9036_enum_mbus_code(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_pad_config *cfg,
> > > +				   struct v4l2_subdev_mbus_code_enum *code)
> > > +{
> > > +	if (code->index > 0)
> > > +		return -EINVAL;
> > > +
> > > +	code->code = MEDIA_BUS_FMT_SBGGR12_1X12;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int addi9036_enum_frame_size(struct v4l2_subdev *subdev,
> > > +				    struct v4l2_subdev_pad_config *cfg,
> > > +				    struct v4l2_subdev_frame_size_enum *fse)
> > > +{
> > > +	if (fse->code != MEDIA_BUS_FMT_SBGGR12_1X12)
> > > +		return -EINVAL;
> > > +
> > > +	if (fse->index >= ARRAY_SIZE(addi9036_mode_info_data))
> > > +		return -EINVAL;
> > > +
> > > +	fse->min_width = addi9036_mode_info_data[fse->index].width;
> > > +	fse->max_width = addi9036_mode_info_data[fse->index].width;
> > > +	fse->min_height = addi9036_mode_info_data[fse->index].height;
> > > +	fse->max_height = addi9036_mode_info_data[fse->index].height;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct v4l2_mbus_framefmt *
> > > +addi9036_get_pad_format(struct addi9036 *addi9036,
> > > +			struct v4l2_subdev_pad_config *cfg,
> > > +			unsigned int pad,
> > > +			enum v4l2_subdev_format_whence which)
> > > +{
> > > +	switch (which) {
> > > +	case V4L2_SUBDEV_FORMAT_TRY:
> > > +		return v4l2_subdev_get_try_format(&addi9036->sd, cfg, pad);
> > > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > > +		return &addi9036->fmt;
> > > +	default:
> > > +		return NULL;
> > > +	}
> > > +}
> > > +
> > > +static int addi9036_get_format(struct v4l2_subdev *sd,
> > > +			       struct v4l2_subdev_pad_config *cfg,
> > > +			       struct v4l2_subdev_format *format)
> > > +{
> > > +	struct addi9036 *addi9036 = to_addi9036(sd);
> > > +	struct v4l2_mbus_framefmt *pad_format;
> > > +
> > > +	pad_format = addi9036_get_pad_format(addi9036, cfg, format->pad,
> > > +					     format->which);
> > > +
> > > +	if (!pad_format)
> > > +		return -EINVAL;
> > > +
> > > +	format->format = *pad_format;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct v4l2_rect *
> > > +addi9036_get_pad_crop(struct addi9036 *addi9036,
> > > +		      struct v4l2_subdev_pad_config *cfg,
> > > +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> > > +{
> > > +	switch (which) {
> > > +	case V4L2_SUBDEV_FORMAT_TRY:
> > > +		return v4l2_subdev_get_try_crop(&addi9036->sd, cfg, pad);
> > > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > > +		return &addi9036->crop;
> > > +	default:
> > > +		return NULL;
> > > +	}
> > > +}
> > > +
> > > +static const struct addi9036_mode_info *
> > > +addi9036_find_nearest_mode(unsigned int width, unsigned int height)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = ARRAY_SIZE(addi9036_mode_info_data) - 1; i > 0; i--) {
> > > +		if (addi9036_mode_info_data[i].width <= width &&
> > > +		    addi9036_mode_info_data[i].height <= height)
> > > +			break;
> > > +	}
> > > +
> > > +	return &addi9036_mode_info_data[i];
> > > +}
> > > +
> > > +static int addi9036_set_format(struct v4l2_subdev *sd,
> > > +			       struct v4l2_subdev_pad_config *cfg,
> > > +			       struct v4l2_subdev_format *format)
> > > +{
> > > +	struct addi9036 *addi9036 = to_addi9036(sd);
> > > +	struct v4l2_mbus_framefmt *framefmt;
> > > +	struct v4l2_rect *crop;
> > > +	const struct addi9036_mode_info *new_mode;
> > > +	int ret;
> > > +
> > > +	dev_dbg(addi9036->dev, "set_fmt: %x %dx%d\n",
> > > +		format->format.code, format->format.width,
> > > +		format->format.height);
> > > +
> > > +	crop = addi9036_get_pad_crop(addi9036, cfg, format->pad,
> > > +				     format->which);
> > > +
> > > +	if (!crop)
> > > +		return -EINVAL;
> > > +
> > > +	new_mode = addi9036_find_nearest_mode(format->format.width,
> > > +					      format->format.height);
> > > +	crop->width = new_mode->width;
> > > +	crop->height = new_mode->height;
> > > +
> > > +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > +		ret = v4l2_ctrl_s_ctrl_int64(addi9036->pixel_rate,
> > > +					     new_mode->pixel_rate);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		ret = v4l2_ctrl_s_ctrl(addi9036->link_freq,
> > > +				       new_mode->link_freq_idx);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		addi9036->current_mode = new_mode;
> > > +	}
> > > +
> > > +	framefmt = addi9036_get_pad_format(addi9036, cfg, format->pad,
> > > +					   format->which);
> > > +
> > > +	if (!framefmt)
> > > +		return -EINVAL;
> > > +
> > > +	framefmt->width = crop->width;
> > > +	framefmt->height = crop->height;
> > > +	framefmt->code = MEDIA_BUS_FMT_SBGGR12_1X12;
> > > +	framefmt->field = V4L2_FIELD_NONE;
> > > +	framefmt->colorspace = V4L2_COLORSPACE_SRGB;
> > > +
> > > +	format->format = *framefmt;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int addi9036_entity_init_cfg(struct v4l2_subdev *subdev,
> > > +				    struct v4l2_subdev_pad_config *cfg)
> > > +{
> > > +	struct v4l2_subdev_format fmt = { 0 };
> > > +
> > > +	if (cfg)
> > > +		fmt.which = V4L2_SUBDEV_FORMAT_TRY;
> > > +	else
> > > +		fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> > > +
> > > +	fmt.format.width = 640;
> > > +	fmt.format.height = 960;
> > > +
> > > +	addi9036_set_format(subdev, cfg, &fmt);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int addi9036_get_selection(struct v4l2_subdev *sd,
> > > +				  struct v4l2_subdev_pad_config *cfg,
> > > +				  struct v4l2_subdev_selection *sel)
> > > +{
> > > +	struct addi9036 *addi9036 = to_addi9036(sd);
> > > +
> > > +	if (sel->target != V4L2_SEL_TGT_CROP)
> > > +		return -EINVAL;
> > > +
> > > +	sel->r = *addi9036_get_pad_crop(addi9036, cfg, sel->pad, sel->which);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int addi9036_s_stream(struct v4l2_subdev *subdev, int enable)
> > > +{
> > > +	struct addi9036 *addi9036 = to_addi9036(subdev);
> > > +
> > > +	dev_dbg(addi9036->dev, "stream %d\n", enable);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct v4l2_subdev_core_ops addi9036_core_ops = {
> > > +	.s_power	= addi9036_s_power,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_video_ops addi9036_video_ops = {
> > > +	.s_stream	= addi9036_s_stream,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_pad_ops addi9036_subdev_pad_ops = {
> > > +	.init_cfg		= addi9036_entity_init_cfg,
> > > +	.enum_mbus_code		= addi9036_enum_mbus_code,
> > > +	.enum_frame_size	= addi9036_enum_frame_size,
> > > +	.get_fmt		= addi9036_get_format,
> > > +	.set_fmt		= addi9036_set_format,
> > > +	.get_selection		= addi9036_get_selection,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_ops addi9036_subdev_ops = {
> > > +	.core	= &addi9036_core_ops,
> > > +	.video	= &addi9036_video_ops,
> > > +	.pad	= &addi9036_subdev_pad_ops,
> > > +};
> > > +
> > > +static int addi9036_probe(struct i2c_client *client)
> > > +{
> > > +	struct device *dev = &client->dev;
> > > +	struct fwnode_handle *endpoint;
> > > +	struct addi9036 *addi9036;
> > > +	int ret;
> > > +
> > > +	dev_dbg(dev, "%s: i2c addr = 0x%x\n", __func__, client->addr);
> > > +
> > > +	addi9036 = devm_kzalloc(dev, sizeof(struct addi9036), GFP_KERNEL);
> > > +	if (!addi9036)
> > > +		return -ENOMEM;
> > > +
> > > +	addi9036->dev = dev;
> > > +
> > > +	addi9036->regmap = devm_regmap_init_i2c(client,
> > > +						&addi9036_i2c_regmap_config);
> > > +	if (IS_ERR(addi9036->regmap)) {
> > > +		dev_err(dev, "Error initializing i2c regmap\n");
> > > +		return PTR_ERR(addi9036->regmap);
> > > +	}
> > > +
> > > +	mutex_init(&addi9036->power_lock);
> > > +
> > > +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > > +	if (!endpoint) {
> > > +		dev_err(dev, "endpoint node not found\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_parse(endpoint, &addi9036->ep);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "parsing endpoint node failed\n");
> > > +		return ret;
> > > +	}
> > > +	fwnode_handle_put(endpoint);
> > > +
> > > +	if (addi9036->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> > > +		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	addi9036->rst_gpio = gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(addi9036->rst_gpio)) {
> > > +		dev_info(dev, "Unable to get \"reset\" gpio\n");
> > > +		return PTR_ERR(addi9036->rst_gpio);
> > > +	}
> > > +
> > > +	v4l2_ctrl_handler_init(&addi9036->ctrls, 4);
> > > +
> > > +	addi9036->pixel_rate = v4l2_ctrl_new_std(&addi9036->ctrls,
> > > +						  &addi9036_ctrl_ops,
> > > +						  V4L2_CID_PIXEL_RATE,
> > > +						  1, INT_MAX, 1, 1);
> > > +	addi9036->link_freq = v4l2_ctrl_new_int_menu(&addi9036->ctrls,
> > > +						     &addi9036_ctrl_ops,
> > > +						     V4L2_CID_LINK_FREQ,
> > > +						     ARRAY_SIZE(
> > > +							     link_freq_tbl) - 1,
> > > +						     0, link_freq_tbl);
> > > +	if (addi9036->link_freq)
> > > +		addi9036->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	addi9036->set_chip_config = v4l2_ctrl_new_custom(&addi9036->ctrls,
> > > +						&addi9036_ctrl_chip_config,
> > > +						NULL);
> > > +
> > > +	addi9036->reg_read = v4l2_ctrl_new_custom(&addi9036->ctrls,
> > > +						  &addi9036_ctrl_reg_read,
> > > +						  NULL);
> > > +
> > > +	addi9036->sd.ctrl_handler = &addi9036->ctrls;
> > > +
> > > +	if (addi9036->ctrls.error) {
> > > +		dev_err(dev, "%s: control initialization error %d\n",
> > > +			__func__, addi9036->ctrls.error);
> > > +		ret = addi9036->ctrls.error;
> > > +		goto free_ctrl;
> > > +	}
> > > +
> > > +	v4l2_i2c_subdev_init(&addi9036->sd, client, &addi9036_subdev_ops);
> > > +	addi9036->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	addi9036->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +	addi9036->sd.dev = &client->dev;
> > > +	addi9036->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +
> > > +	ret = media_entity_pads_init(&addi9036->sd.entity, 1, &addi9036->pad);
> > > +
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "could not register media entity\n");
> > > +		goto free_ctrl;
> > > +	}
> > > +
> > > +	ret = addi9036_s_power(&addi9036->sd, true);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "could not power up addi9036\n");
> > > +		goto free_entity;
> > > +	}
> > > +
> > > +	dev_info(dev, "addi9036 detected at address 0x%02x\n", client->addr);
> > > +
> > > +	ret = addi9036_s_power(&addi9036->sd, false);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "could not power down addi9036\n");
> > > +		goto free_entity;
> > > +	}
> > > +
> > > +	addi9036_entity_init_cfg(&addi9036->sd, NULL);
> > > +
> > > +	ret = v4l2_async_register_subdev(&addi9036->sd);
> > > +	if (ret < 0)
> > > +		dev_err(dev, "could not register v4l2 device\n");
> > > +
> > > +	return 0;
> > > +
> > > +free_entity:
> > > +	media_entity_cleanup(&addi9036->sd.entity);
> > > +free_ctrl:
> > > +	v4l2_ctrl_handler_free(&addi9036->ctrls);
> > > +	mutex_destroy(&addi9036->power_lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int addi9036_remove(struct i2c_client *client)
> > > +{
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct addi9036 *addi9036 = to_addi9036(sd);
> > > +
> > > +	v4l2_async_unregister_subdev(&addi9036->sd);
> > > +	media_entity_cleanup(&addi9036->sd.entity);
> > > +	if (addi9036->rst_gpio)
> > > +		gpiod_put(addi9036->rst_gpio);
> > > +	v4l2_ctrl_handler_free(&addi9036->ctrls);
> > > +	mutex_destroy(&addi9036->power_lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct i2c_device_id addi9036_id[] = {
> > > +	{ "addi9036", 0 },
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, addi9036_id);
> > > +
> > > +static const struct of_device_id addi9036_of_match[] = {
> > > +	{ .compatible = "adi,addi9036" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, addi9036_of_match);
> > > +
> > > +static struct i2c_driver addi9036_i2c_driver = {
> > > +	.driver			= {
> > > +		.of_match_table = addi9036_of_match,
> > > +		.name		= "addi9036",
> > > +	},
> > > +	.probe_new		= addi9036_probe,
> > > +	.remove			= addi9036_remove,
> > > +	.id_table		= addi9036_id,
> > > +};
> > > +
> > > +module_i2c_driver(addi9036_i2c_driver);
> > > +
> > > +MODULE_DESCRIPTION("Analog Devices ADDI9036 Camera Driver");
> > > +MODULE_AUTHOR("Bogdan Togorean");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2- controls.h
> > > index 62271418c1be..f88b56479bc1 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -198,6 +198,12 @@ enum v4l2_colorfx {
> > >   */
> > >  #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
> > >
> > > +/*
> > > + * The base for the addi9036 driver controls.
> > > + * We reserve 16 controls for this driver.
> > > + */
> > > +#define V4L2_CID_USER_ADDI9036_BASE		(V4L2_CID_USER_BASE + 0x10e0)
> > > +
> > >  /* MPEG-class control IDs */
> > >  /* The MPEG controls are applicable to all codec controls
> > >   * and the 'MPEG' part of the define is historical */

-- 
Regards,

Laurent Pinchart
