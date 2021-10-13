Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC7642B9DB
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238687AbhJMIHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbhJMIHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:07:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F13FC061714
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 01:05:33 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1maZGV-0000iH-B5; Wed, 13 Oct 2021 10:05:31 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1maZGU-0006do-9A; Wed, 13 Oct 2021 10:05:30 +0200
Date:   Wed, 13 Oct 2021 10:05:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <20211013080530.GB31981@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, kernel@pengutronix.de
References: <20211012084150.755160-1-m.tretter@pengutronix.de>
 <20211012084150.755160-4-m.tretter@pengutronix.de>
 <f4fca151a04b1c30fca7b2f40dacb2a3b4b4f2c6.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f4fca151a04b1c30fca7b2f40dacb2a3b4b4f2c6.camel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:39:33 up 237 days, 11:03, 137 users,  load average: 0.16, 0.20,
 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 Oct 2021 15:27:11 +0200, Philipp Zabel wrote:
> On Tue, 2021-10-12 at 10:41 +0200, Michael Tretter wrote:
> > From: Marek Vasut <marex@denx.de>
> > 
> > Add driver for the Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder.
> > This chip supports 1/2/4 analog video inputs and converts them into
> > 1/2/4 VCs in MIPI CSI2 stream.
> > 
> > This driver currently supports ISL79987 and both 720x480 and 720x576
> > resolutions, however as per specification, all inputs must use the
> > same resolution and standard. The only supported pixel format is now
> > YUYV/YUV422. The chip should support RGB565 on the CSI2 as well, but
> > this is currently unsupported.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > To: linux-media@vger.kernel.org
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changelog:
> > 
> > v5: none
> > 
> > v4:
> > 
> > - fix lines over 80 chars where applicable
> > - fix possible NULL pointer access in link_freq
> > - initialize bus type with CSI2_DPHY
> > - iterate over pads instead of hard coded 4
> > - merge power_{on,off} functions into resume,suspend
> > - switch to v4l2_subdev_state
> > - report field order based on video standard
> > - add error message for timeout
> > - simplify dev_dbg statement in update_std
> > - call v4l2_ctrl_handler_setup
> > - don't set control if pm_runtime is not enabled
> > - fix YUV422 byte order
> > - switch to pre_streamon callback for LP11 mode
> > 
> > v3:
> > 
> > - follow dt binding change: pd-gpios -> powerdown-gpios
> > 
> > v2:
> > 
> > - general cleanup
> > - remove isl7998x_g_mbus_config function
> > - implement enum_frame_size function
> > - replace msleep with usleep_range
> > - rework set_fmt/get_fmt functions
> > - calculate number of inputs using number of input ports
> > - switch to runtime_pm
> > - add reset gpio
> > - add adv_debug support
> > - add MAINTAINERS entry
> > ---
> >  MAINTAINERS                  |    8 +
> >  drivers/media/i2c/Kconfig    |    9 +
> >  drivers/media/i2c/Makefile   |    1 +
> >  drivers/media/i2c/isl7998x.c | 1416 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 1434 insertions(+)
> >  create mode 100644 drivers/media/i2c/isl7998x.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ee91c5472bc1..60449758d40b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9739,6 +9739,14 @@ L:	linux-iio@vger.kernel.org
> >  F:	Documentation/devicetree/bindings/counter/interrupt-counter.yaml
> >  F:	drivers/counter/interrupt-cnt.c
> >  
> > +INTERSIL ISL7998X VIDEO DECODER DRIVER
> > +M:	Michael Tretter <m.tretter@pengutronix.de>
> > +R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> > +F:	drivers/media/i2c/isl7998x.c
> > +
> >  INVENSENSE ICM-426xx IMU DRIVER
> >  M:	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
> >  L:	linux-iio@vger.kernel.org
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index adb348aa8396..ab2d9d45af0e 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -325,6 +325,15 @@ config VIDEO_BT866
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called bt866.
> >  
> > +config VIDEO_ISL7998X
> > +	tristate "Intersil ISL7998x video decoder"
> > +	depends on VIDEO_V4L2 && I2C
> > +	depends on OF_GPIO
> > +	select VIDEO_V4L2_SUBDEV_API
> 
> This is missing a select MEDIA_CONTROLLER, which VIDEO_V4L2_SUBDEV_API
> depends on. As is, the driver doesn't compile without MEDIA_CONTROLLER
> enabled.

I will select MEDIA_CONTROLLER in v6.

> 
> [...]
> > diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> > new file mode 100644
> > index 000000000000..72f5ca63f810
> > --- /dev/null
> > +++ b/drivers/media/i2c/isl7998x.c
> > @@ -0,0 +1,1416 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Intersil ISL7998x analog to MIPI CSI-2 or BT.656 decoder driver.
> > + *
> > + * Copyright (C) 2018-2019 Marek Vasut <marex@denx.de>
> > + * Copyright (C) 2021 Michael Tretter <kernel@pengutronix.de>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/i2c.h>
> > +#include <linux/log2.h>
> 
> Is this header used for anything?

Currently not. This might be an artifact of a previous version. I will remove
the header.

> 
> [...]
> > +struct isl7998x {
> > +	struct v4l2_subdev		subdev;
> > +	struct regmap			*regmap;
> > +	struct gpio_desc		*pd_gpio;
> > +	struct gpio_desc		*rstb_gpio;
> > +	unsigned int			nr_mipi_lanes;
> > +	u32				nr_inputs;
> > +
> > +	const struct isl7998x_mode	*mode;
> > +	const struct isl7998x_datafmt	*fmt;
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> 
> This is not required if the driver selects MEDIA_CONTROLLER.
> To make it buildable without MEDIA_CONTROLLER, a few more #ifdefs would
> be required in other places.

See above.

> 
> > +	struct media_pad		pads[ISL7998x_NUM_PADS];
> > +#endif
> > +
> > +	struct v4l2_ctrl_handler	ctrl_handler;
> > +	/* protect ctrl_handler */
> > +	struct mutex			ctrl_mutex;
> > +
> > +	/* V4L2 Controls */
> > +	struct v4l2_ctrl		*link_freq;
> > +	u8				test_pattern;
> > +	u8				test_pattern_bars;
> > +	u8				test_pattern_chans;
> > +	u8				test_pattern_color;
> > +};
> [...]
> > +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
> > +{
> > +	struct device *dev = isl7998x->subdev.dev;
> > +	unsigned int retry;
> > +	u32 chip_id;
> > +	int ret = -ETIMEDOUT;
> > +
> > +	for (retry = 10; ret && retry > 0; retry--) {
> > +		ret = regmap_read(isl7998x->regmap,
> > +				  ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
> > +		usleep_range(1000, 2000);
> > +	}
> 
> Consider using regmap_read_poll_timeout() here.

Ack. I forgot about this function.

> 
> > +	if (ret) {
> > +		dev_err(dev, "timeout while waiting for ISL7998x\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	dev_dbg(dev, "Found ISL799%x\n", chip_id);
> > +
> > +	return 0;
> > +}
> [...]
> > +static int isl7998x_update_std(struct isl7998x *isl7998x)
> > +{
> > +#define ISL7998x_INPUTS			4
> > +	struct device *dev = isl7998x->subdev.dev;
> > +	unsigned int std_id[ISL7998x_INPUTS];
> > +	u8 scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
> > +	unsigned int i;
> > +	int ret;
> > +	u32 reg;
> > +
> > +	ret = pm_runtime_resume_and_get(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	while (true) {
> 
> Should this timeout, just in case the decoder never leaves the detection
> state?

From what I have seen so far, the detection algorithm in the decoder always
finishes, even if there is no signal on the input. Adding a timeout doesn't
hurt, though, and I will do so.

> 
> > +		for (i = 0; i < ISL7998x_INPUTS; i++) {
> > +			ret = regmap_read(isl7998x->regmap,
> > +					  ISL7998x_REG_Px_DEC_SDT(i + 1), &reg);
> > +			if (ret)
> > +				goto out;
> > +
> > +			/* Detection is still in progress, restart. */
> > +			if (reg & ISL7998x_REG_Px_DEC_SDT_DET) {
> > +				scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
> > +				break;
> > +			}
> > +
> > +			scanning &= ~BIT(i);
> > +			std_id[i] = FIELD_GET(ISL7998x_REG_Px_DEC_SDT_NOW, reg);
> > +		}
> > +
> > +		if (!scanning)
> > +			break;
> > +
> > +		/*
> > +		 * Duration of standard detection is not documented. Wait for
> > +		 * an arbitrary time before checking again.
> > +		 */
> > +		usleep_range(1000, 2000);
> > +	}
> [...]
> > +static int isl7998x_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct v4l2_fwnode_endpoint endpoint = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > +	};
> > +	struct device_node *ep;
> > +	struct isl7998x *isl7998x;
> > +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> > +	int nr_inputs;
> > +	int ret;
> [...]
> > +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> > +	if (!ep)
> > +		return dev_err_probe(dev, -EINVAL, "Missing endpoint node\n");
> 
> I think this should use fwnode_graph_get_endpoint_by_id() instead.

Ack. This should also use ISL7998x_PAD_OUT instead of hard coded 0.

> 
> > +	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
> > +	of_node_put(ep);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to parse endpoint\n");
> > +
> > +	if (endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
> > +	    endpoint.bus.mipi_csi2.num_data_lanes > 2)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Invalid bus type or number of MIPI lanes\n");
> 
> This doesn't check bus type, as stated.

Ack. I updated the initialization and check, but missed the error message.

Thanks!

Michael
