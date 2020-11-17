Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828852B634B
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 14:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732115AbgKQNhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 08:37:01 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:56395 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732598AbgKQNgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 08:36:37 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7EA6420001D;
        Tue, 17 Nov 2020 13:36:32 +0000 (UTC)
Date:   Tue, 17 Nov 2020 14:36:35 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v5 1/8] media: i2c: Add driver for RDACM21 camera module
Message-ID: <20201117133634.s62i32hcwzikmhzb@uno.localdomain>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-2-jacopo+renesas@jmondi.org>
 <df3ad394-66d6-951a-1ddf-621151a4d581@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df3ad394-66d6-951a-1ddf-621151a4d581@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, Nov 16, 2020 at 02:47:49PM +0000, Kieran Bingham wrote:
> On 16/11/2020 13:52, Jacopo Mondi wrote:
> > The RDACM21 is a GMSL camera supporting 1280x1080 resolution images
> > developed by IMI based on an Omnivision OV10640 sensor, an Omnivision
> > OV490 ISP and a Maxim MAX9271 GMSL serializer.
> >
> > The driver uses the max9271 library module, to maximize code reuse with
> > other camera module drivers using the same serializer, such as rdacm20.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  MAINTAINERS                 |  12 +
> >  drivers/media/i2c/Kconfig   |  13 +
> >  drivers/media/i2c/Makefile  |   2 +
> >  drivers/media/i2c/rdacm21.c | 595 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 622 insertions(+)
> >  create mode 100644 drivers/media/i2c/rdacm21.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cef6b6090d76..9a5026fd6788 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14750,6 +14750,18 @@ F:	drivers/media/i2c/max9271.c
> >  F:	drivers/media/i2c/max9271.h
> >  F:	drivers/media/i2c/rdacm20.c
> >
> > +RDACM21 Camera Sensor
> > +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
> > +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/i2c/rdacm2x-gmsl.yaml
> > +F:	drivers/media/i2c/max9271.c
> > +F:	drivers/media/i2c/max9271.h
> > +F:	drivers/media/i2c/rdacm21.c
> > +
> >  RDC R-321X SoC
> >  M:	Florian Fainelli <florian@openwrt.org>
> >  S:	Maintained
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index c64326ca331c..64f4316d11ad 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -1185,6 +1185,19 @@ config VIDEO_RDACM20
> >  	  This camera should be used in conjunction with a GMSL
> >  	  deserialiser such as the MAX9286.
> >
> > +config VIDEO_RDACM21
> > +	tristate "IMI RDACM21 camera support"
> > +	depends on I2C
> > +	select V4L2_FWNODE
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select MEDIA_CONTROLLER
> > +	help
> > +	  This driver supports the IMI RDACM21 GMSL camera, used in
> > +	  ADAS systems.
> > +
> > +	  This camera should be used in conjunction with a GMSL
> > +	  deserialiser such as the MAX9286.
> > +
> >  config VIDEO_RJ54N1
> >  	tristate "Sharp RJ54N1CB0C sensor support"
> >  	depends on I2C && VIDEO_V4L2
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index f0a77473979d..f3641b58929d 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -122,6 +122,8 @@ obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> >  obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> >  rdacm20-camera_module-objs	:= rdacm20.o max9271.o
> >  obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
> > +rdacm21-camera_module-objs	:= rdacm21.o max9271.o
> > +obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
> >  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> >
> >  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > new file mode 100644
> > index 000000000000..5f9267e26258
> > --- /dev/null
> > +++ b/drivers/media/i2c/rdacm21.c
> > @@ -0,0 +1,595 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * IMI RDACM21 GMSL Camera Driver
> > + *
> > + * Copyright (C) 2017-2020 Jacopo Mondi
> > + * Copyright (C) 2017-2019 Kieran Bingham
> > + * Copyright (C) 2017-2019 Laurent Pinchart
> > + * Copyright (C) 2017-2019 Niklas Söderlund
> > + * Copyright (C) 2016 Renesas Electronics Corporation
> > + * Copyright (C) 2015 Cogent Embedded, Inc.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/fwnode.h>
> > +#include <linux/init.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/videodev2.h>
> > +
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-subdev.h>
> > +#include "max9271.h"
> > +
> > +#define OV10640_ID_LOW			0xa6
> > +
> > +#define OV490_I2C_ADDRESS		0x24
> > +
> > +#define OV490_PAGE_HIGH_REG		0xfffd
> > +#define OV490_PAGE_LOW_REG		0xfffe
> > +
> > +#define OV490_DVP_CTRL3			0x80286009
> > +
> > +#define OV490_ODS_CTRL_FRAME_OUTPUT_EN	0x0c
> > +#define OV490_ODS_CTRL			0x8029d000
> > +
> > +#define OV490_ID_VAL			0x0490
> > +#define OV490_ID(_p, _v)		((((_p) & 0xff) << 8) | ((_v) & 0xff))
> > +#define OV490_PID			0x8080300a
> > +#define OV490_VER			0x8080300b
> > +
> > +#define OV490_ISP_HSIZE_LOW		0x80820060
> > +#define OV490_ISP_HSIZE_HIGH		0x80820061
> > +#define OV490_ISP_VSIZE_LOW		0x80820062
> > +#define OV490_ISP_VSIZE_HIGH		0x80820063
> > +
> > +#define OV10640_PIXEL_RATE		(55000000)
> > +
> > +struct rdacm21_device {
> > +	struct device			*dev;
> > +	struct max9271_device		*serializer;
> > +	struct i2c_client		*isp;
> > +	struct v4l2_subdev		sd;
> > +	struct media_pad		pad;
> > +	struct v4l2_mbus_framefmt	fmt;
> > +	struct v4l2_ctrl_handler	ctrls;
> > +	u32				addrs[32];
> > +	u16				last_page;
> > +};
> > +
> > +static inline struct rdacm21_device *sd_to_rdacm21(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct rdacm21_device, sd);
> > +}
> > +
> > +static inline struct rdacm21_device *i2c_to_rdacm21(struct i2c_client *client)
> > +{
> > +	return sd_to_rdacm21(i2c_get_clientdata(client));
> > +}
> > +
> > +static const struct ov490_reg {
> > +	u16 reg;
> > +	u8 val;
> > +} ov490_regs_wizard[] = {
> > +	{0xfffd, 0x80},
> > +	{0xfffe, 0x82},
> > +	{0x0071, 0x11},
> > +	{0x0075, 0x11},
> > +	{0xfffe, 0x29},
> > +	{0x6010, 0x01},
> > +	/*
> > +	 * OV490 EMB line disable in YUV and RAW data,
> > +	 * NOTE: EMB line is still used in ISP and sensor
> > +	 */
> > +	{0xe000, 0x14},
> > +	{0xfffe, 0x28},
> > +	{0x6000, 0x04},
> > +	{0x6004, 0x00},
> > +	/*
> > +	 * PCLK polarity - useless due to silicon bug.
> > +	 * Use 0x808000bb register instead.
> > +	 */
> > +	{0x6008, 0x00},
> > +	{0xfffe, 0x80},
> > +	{0x0091, 0x00},
> > +	/* bit[3]=0 - PCLK polarity workaround. */
> > +	{0x00bb, 0x1d},
> > +	/* Ov490 FSIN: app_fsin_from_fsync */
> > +	{0xfffe, 0x85},
> > +	{0x0008, 0x00},
> > +	{0x0009, 0x01},
> > +	/* FSIN0 source. */
> > +	{0x000A, 0x05},
> > +	{0x000B, 0x00},
> > +	/* FSIN0 delay. */
> > +	{0x0030, 0x02},
> > +	{0x0031, 0x00},
> > +	{0x0032, 0x00},
> > +	{0x0033, 0x00},
> > +	/* FSIN1 delay. */
> > +	{0x0038, 0x02},
> > +	{0x0039, 0x00},
> > +	{0x003A, 0x00},
> > +	{0x003B, 0x00},
> > +	/* FSIN0 length. */
> > +	{0x0070, 0x2C},
> > +	{0x0071, 0x01},
> > +	{0x0072, 0x00},
> > +	{0x0073, 0x00},
> > +	/* FSIN1 length. */
> > +	{0x0074, 0x64},
> > +	{0x0075, 0x00},
> > +	{0x0076, 0x00},
> > +	{0x0077, 0x00},
> > +	{0x0000, 0x14},
> > +	{0x0001, 0x00},
> > +	{0x0002, 0x00},
> > +	{0x0003, 0x00},
> > +	/*
> > +	 * Load fsin0,load fsin1,load other,
> > +	 * It will be cleared automatically.
> > +	 */
> > +	{0x0004, 0x32},
> > +	{0x0005, 0x00},
> > +	{0x0006, 0x00},
> > +	{0x0007, 0x00},
> > +	{0xfffe, 0x80},
> > +	/* Sensor FSIN. */
> > +	{0x0081, 0x00},
> > +	/* ov10640 FSIN enable */
> > +	{0xfffe, 0x19},
> > +	{0x5000, 0x00},
> > +	{0x5001, 0x30},
> > +	{0x5002, 0x8c},
> > +	{0x5003, 0xb2},
> > +	{0xfffe, 0x80},
> > +	{0x00c0, 0xc1},
> > +	/* ov10640 HFLIP=1 by default */
> > +	{0xfffe, 0x19},
> > +	{0x5000, 0x01},
> > +	{0x5001, 0x00},
> > +	{0xfffe, 0x80},
> > +	{0x00c0, 0xdc},
> > +};
> > +
> > +static int ov490_read(struct rdacm21_device *dev, u16 reg, u8 *val)
> > +{
> > +	u8 buf[2] = { reg >> 8, reg };
> > +	int ret;
> > +
> > +	ret = i2c_master_send(dev->isp, buf, 2);
> > +	if (ret == 2)
> > +		ret = i2c_master_recv(dev->isp, val, 1);
> > +
> > +	if (ret < 0) {
> > +		dev_dbg(dev->dev, "%s: register 0x%04x read failed (%d)\n",
> > +			__func__, reg, ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov490_write(struct rdacm21_device *dev, u16 reg, u8 val)
> > +{
> > +	u8 buf[3] = { reg >> 8, reg, val };
> > +	int ret;
> > +
> > +	ret = i2c_master_send(dev->isp, buf, 3);
> > +	if (ret < 0) {
> > +		dev_err(dev->dev, "%s: register 0x%04x write failed (%d)\n",
> > +			__func__, reg, ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov490_set_page(struct rdacm21_device *dev, u16 reg)
> > +{
> > +	bool page_new = false;
> > +	u8 page_high = reg >> 8;
> > +	u8 page_low = reg;
> > +	int ret;
> > +
> > +	if (page_high != (dev->last_page >> 8)) {
> > +		ret = ov490_write(dev, OV490_PAGE_HIGH_REG, page_high);
> > +		if (ret)
> > +			return ret;
> > +		page_new = true;
> > +	}
> > +
> > +	if (page_low != (u8)dev->last_page) {
> > +		ret = ov490_write(dev, OV490_PAGE_LOW_REG, page_low);
> > +		if (ret)
> > +			return ret;
> > +		page_new = true;
> > +	}
> > +
> > +	if (page_new) {
> > +		dev->last_page = reg;
> > +		usleep_range(100, 150);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov490_read_reg(struct rdacm21_device *dev, u32 reg, u8 *val)
> > +{
> > +	int ret;
> > +
> > +	ret = ov490_set_page(dev, reg >> 16);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov490_read(dev, (u16)reg, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(dev->dev, "%s: 0x%08x = 0x%02x\n", __func__, reg, *val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov490_write_reg(struct rdacm21_device *dev, u32 reg, u8 val)
> > +{
> > +	int ret;
> > +
> > +	ret = ov490_set_page(dev, reg >> 16);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov490_write(dev, (u16)reg, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(dev->dev, "%s: 0x%08x = 0x%02x\n", __func__, reg, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rdacm21_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct rdacm21_device *dev = sd_to_rdacm21(sd);
> > +
> > +	/*
> > +	 * Enable serial link now that the ISP provides a valid pixel clock
> > +	 * to start serializing video data on the GMSL link.
> > +	 */
> > +	return max9271_set_serial_link(dev->serializer, enable);
> > +}
> > +
> > +static int rdacm21_enum_mbus_code(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_pad_config *cfg,
> > +				  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->pad || code->index > 0)
> > +		return -EINVAL;
> > +
> > +	code->code = MEDIA_BUS_FMT_YUYV8_1X16;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rdacm21_get_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   struct v4l2_subdev_format *format)
> > +{
> > +	struct v4l2_mbus_framefmt *mf = &format->format;
> > +	struct rdacm21_device *dev = sd_to_rdacm21(sd);
> > +
> > +	if (format->pad)
> > +		return -EINVAL;
> > +
> > +	mf->width		= dev->fmt.width;
> > +	mf->height		= dev->fmt.height;
> > +	mf->code		= MEDIA_BUS_FMT_YUYV8_1X16;
> > +	mf->colorspace		= V4L2_COLORSPACE_SRGB;
> > +	mf->field		= V4L2_FIELD_NONE;
> > +	mf->ycbcr_enc		= V4L2_YCBCR_ENC_601;
> > +	mf->quantization	= V4L2_QUANTIZATION_FULL_RANGE;
> > +	mf->xfer_func		= V4L2_XFER_FUNC_NONE;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct v4l2_subdev_video_ops rdacm21_video_ops = {
> > +	.s_stream	= rdacm21_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
> > +	.enum_mbus_code = rdacm21_enum_mbus_code,
> > +	.get_fmt	= rdacm21_get_fmt,
> > +	.set_fmt	= rdacm21_get_fmt,
> > +};
> > +
> > +static struct v4l2_subdev_ops rdacm21_subdev_ops = {
> > +	.video		= &rdacm21_video_ops,
> > +	.pad		= &rdacm21_subdev_pad_ops,
> > +};
> > +
> > +static int ov490_initialize(struct rdacm21_device *dev)
> > +{
> > +	unsigned int ov490_pid_retry = 20;
> > +	unsigned int timeout;
> > +	u8 pid, ver, val;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Read OV490 Id to test communications. */
> > +pid_retry:
> > +	ret = ov490_read_reg(dev, OV490_PID, &pid);
> > +	if (ret < 0) {
> > +		/* Give OV490 a few more cycles to exit from reset. */
> > +		if (ov490_pid_retry--) {
> > +			usleep_range(1000, 2000);
> > +			goto pid_retry;
> > +		}
> > +
> > +		dev_err(dev->dev, "OV490 PID read failed (%d)\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = ov490_read_reg(dev, OV490_VER, &ver);
> > +	if (ret < 0) {
> > +		dev_err(dev->dev, "OV490 VERSION read failed (%d)\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (OV490_ID(pid, ver) != OV490_ID_VAL) {
> > +		dev_err(dev->dev, "OV490 ID mismatch: (0x%04x)\n",
> > +			OV490_ID(pid, ver));
> > +		return -ENODEV;
> > +	}
> > +
> > +	/* Wait for firmware boot by reading streamon status. */
> > +	for (timeout = 300; timeout > 0; timeout--) {
> > +		ov490_read_reg(dev, OV490_ODS_CTRL, &val);
> > +		if (val == OV490_ODS_CTRL_FRAME_OUTPUT_EN)
> > +			break;
> > +		mdelay(1);
> > +	}
> > +	if (!timeout) {
> > +		dev_err(dev->dev, "Timeout firmware boot wait\n");
> > +		return -ENODEV;
> > +	}
> > +	dev_dbg(dev->dev, "Firmware booted in %u msec\n", 300 - timeout);
> > +
> > +	/* Read OV10640 Id to test communications. */
> > +	ov490_write(dev, 0xfffd, 0x80);
> > +	ov490_write(dev, 0xfffe, 0x19);
> > +	usleep_range(100, 150);
>
> Is that setting a page? Or doing something else?
>
> > +
> > +	ov490_write(dev, 0x5000, 0x01);
> > +	ov490_write(dev, 0x5001, 0x30);
> > +	ov490_write(dev, 0x5002, 0x0a);
> > +
> > +	ov490_write(dev, 0xfffe, 0x80);
> > +	usleep_range(100, 150);
> > +	ov490_write(dev, 0xc0, 0xc1);
> > +	ov490_write(dev, 0xfffe, 0x19);
>
> And here?
>
> Can this not go through the new helpers?
>
> If the 'read_reg', 'write_reg', helpers are not appropriate, at least
> setting the pages could be done with set_page() ... but I'd be surprised
> if those couldn't be handled with ov490_write_reg() ?

As I've said in previous reply, I prefer the comunication with ov10640
to be kept explicit as long as we don't have more users and I don't
better understand what register 0x5000 is for.

I can go through set_page() but the I have to pass 0x8019 which kind
of defeat the purpose of defining registers by name

I prefer to keep this as it is.

>
>
>
> > +	usleep_range(1000, 1500);
> > +	ov490_read(dev, 0x5000, &val);
> > +	if (val != OV10640_ID_LOW) {
> > +		dev_err(dev->dev, "OV10640 ID mismatch: (0x%02x)\n", val);
> > +		return -ENODEV;
> > +	}
> > +
> > +	dev_dbg(dev->dev, "OV10640 ID = 0x%2x\n", val);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(ov490_regs_wizard); ++i) {
> > +		ret = ov490_write(dev, ov490_regs_wizard[i].reg,
> > +				  ov490_regs_wizard[i].val);
> > +		if (ret < 0) {
> > +			dev_err(dev->dev,
> > +				"%s: register %u (0x%04x) write failed (%d)\n",
> > +				__func__, i, ov490_regs_wizard[i].reg, ret);
> > +
> > +			return -EIO;
> > +		}
> > +
> > +		usleep_range(100, 150);
> > +	}
> > +
> > +	/*
> > +	 * The ISP is programmed with the content of a serial flash memory.
> > +	 * Read the firmware configuration to reflect it through the V4L2 APIs.
> > +	 */
> > +	ov490_read_reg(dev, OV490_ISP_HSIZE_HIGH, &val);
> > +	dev->fmt.width = (val & 0xf) << 8;
> > +	ov490_read_reg(dev, OV490_ISP_HSIZE_LOW, &val);
> > +	dev->fmt.width |= (val & 0xff);
> > +
> > +	ov490_read_reg(dev, OV490_ISP_VSIZE_HIGH, &val);
> > +	dev->fmt.height = (val & 0xf) << 8;
> > +	ov490_read_reg(dev, OV490_ISP_VSIZE_LOW, &val);
> > +	dev->fmt.height |= val & 0xff;
> > +
>
>
> Hrm, these look like "ov490_read_reg_long()", but given they're the only
> occurrences of a "long read" I think we could leave it as is.
>
>
> > +	/* Set bus width to 12 bits with [0:11] ordering. */
> > +	ov490_write_reg(dev, OV490_DVP_CTRL3, 0x10);
> > +
> > +	dev_info(dev->dev, "Identified RDACM21 camera module\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int rdacm21_initialize(struct rdacm21_device *dev)
> > +{
> > +	int ret;
> > +
> > +	/* Verify communication with the MAX9271: ping to wakeup. */
> > +	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
> > +	i2c_smbus_read_byte(dev->serializer->client);
> > +
> > +	/* Serial link disabled during config as it needs a valid pixel clock. */
> > +	ret = max9271_set_serial_link(dev->serializer, false);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set GPO high to hold OV490 in reset during max9271 configuration. */
> > +	ret = max9271_set_gpios(dev->serializer, MAX9271_GPO);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Configure I2C bus at 105Kbps speed and configure GMSL link. */
> > +	ret = max9271_configure_i2c(dev->serializer,
> > +				    MAX9271_I2CSLVSH_469NS_234NS |
> > +				    MAX9271_I2CSLVTO_1024US |
> > +				    MAX9271_I2CMSTBT_105KBPS);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = max9271_configure_gmsl_link(dev->serializer);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
> > +	if (ret)
> > +		return ret;
> > +	dev->serializer->client->addr = dev->addrs[0];
> > +
> > +	/*
> > +	 * Release OV490 from reset and program address translation
> > +	 * before performing OV490 configuration.
> > +	 */
> > +	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPO);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = max9271_set_translation(dev->serializer, dev->addrs[1],
> > +				      OV490_I2C_ADDRESS);
> > +	if (ret)
> > +		return ret;
> > +	dev->isp->addr = dev->addrs[1];
> > +
> > +	ret = ov490_initialize(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Set reverse channel high threshold to increase noise immunity.
> > +	 *
> > +	 * This should be compensated by increasing the reverse channel
> > +	 * amplitude on the remote deserializer side.
> > +	 */
> > +	ret = max9271_set_high_threshold(dev->serializer, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rdacm21_probe(struct i2c_client *client)
> > +{
> > +	struct rdacm21_device *dev;
> > +	struct fwnode_handle *ep;
> > +	int ret;
> > +
> > +	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
> > +	if (!dev)
> > +		return -ENOMEM;
> > +	dev->dev = &client->dev;
> > +
> > +	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
> > +				       GFP_KERNEL);
> > +	if (!dev->serializer)
> > +		return -ENOMEM;
> > +
> > +	dev->serializer->client = client;
> > +
> > +	ret = of_property_read_u32_array(client->dev.of_node, "reg",
> > +					 dev->addrs, 2);
> > +	if (ret < 0) {
> > +		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Create the dummy I2C client for the sensor. */
> > +	dev->isp = i2c_new_dummy_device(client->adapter, OV490_I2C_ADDRESS);
> > +	if (IS_ERR(dev->isp))
> > +		return PTR_ERR(dev->isp);
> > +
> > +	ret = rdacm21_initialize(dev);
> > +	if (ret < 0)
> > +		goto error;
> > +
> > +	/* Initialize and register the subdevice. */
> > +	v4l2_i2c_subdev_init(&dev->sd, client, &rdacm21_subdev_ops);
> > +	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +	v4l2_ctrl_handler_init(&dev->ctrls, 1);
> > +	v4l2_ctrl_new_std(&dev->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> > +			  OV10640_PIXEL_RATE, OV10640_PIXEL_RATE, 1,
> > +			  OV10640_PIXEL_RATE);
> > +	dev->sd.ctrl_handler = &dev->ctrls;
> > +
> > +	ret = dev->ctrls.error;
> > +	if (ret)
> > +		goto error_free_ctrls;
> > +
> > +	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	dev->sd.entity.flags |= MEDIA_ENT_F_CAM_SENSOR;
> > +	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> > +	if (ret < 0)
> > +		goto error_free_ctrls;
> > +
> > +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> > +	if (!ep) {
> > +		dev_err(&client->dev,
> > +			"Unable to get endpoint in node %pOF\n",
> > +			client->dev.of_node);
> > +		ret = -ENOENT;
> > +		goto error_free_ctrls;
> > +	}
> > +	dev->sd.fwnode = ep;
> > +
> > +	ret = v4l2_async_register_subdev(&dev->sd);
> > +	if (ret)
> > +		goto error_put_node;
> > +
> > +	return 0;
> > +
> > +error_put_node:
> > +	fwnode_handle_put(dev->sd.fwnode);
> > +error_free_ctrls:
> > +	v4l2_ctrl_handler_free(&dev->ctrls);
> > +error:
> > +	i2c_unregister_device(dev->isp);
> > +
> > +	return ret;
> > +}
> > +
> > +static int rdacm21_remove(struct i2c_client *client)
> > +{
> > +	struct rdacm21_device *dev = i2c_to_rdacm21(client);
> > +
> > +	fwnode_handle_put(dev->sd.fwnode);
> > +	v4l2_async_unregister_subdev(&dev->sd);
> > +	v4l2_ctrl_handler_free(&dev->ctrls);
> > +	i2c_unregister_device(dev->isp);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rdacm21_of_ids[] = {
> > +	{ .compatible = "imi,rdacm21" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, rdacm21_of_ids);
> > +
> > +static struct i2c_driver rdacm21_i2c_driver = {
> > +	.driver	= {
> > +		.name	= "rdacm21",
> > +		.of_match_table = rdacm21_of_ids,
> > +	},
> > +	.probe_new	= rdacm21_probe,
> > +	.remove		= rdacm21_remove,
> > +};
> > +
> > +module_i2c_driver(rdacm21_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("GMSL Camera driver for RDACM21");
> > +MODULE_AUTHOR("Jacopo Mondi, Kieran Bingham, Laurent Pinchart, Niklas Söderlund, Vladimir Barinov");
> > +MODULE_LICENSE("GPL v2");
> >
>
