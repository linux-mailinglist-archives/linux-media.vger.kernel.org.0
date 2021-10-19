Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0D2433609
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 14:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbhJSMf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 08:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235684AbhJSMf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 08:35:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4CDC061745
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 05:33:44 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mcoJL-0003VU-0P; Tue, 19 Oct 2021 14:33:43 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mcoJJ-0007S7-SG; Tue, 19 Oct 2021 14:33:41 +0200
Date:   Tue, 19 Oct 2021 14:33:41 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 3/3] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <20211019123341.GD13895@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, p.zabel@pengutronix.de,
        Ian Arkver <ian.arkver.dev@gmail.com>, kernel@pengutronix.de
References: <20211014133150.365169-1-m.tretter@pengutronix.de>
 <20211014133150.365169-4-m.tretter@pengutronix.de>
 <4ff0e946-83e6-5f89-5cba-4aa71c83bbbf@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ff0e946-83e6-5f89-5cba-4aa71c83bbbf@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:22:18 up 243 days, 11:46, 125 users,  load average: 0.13, 0.21,
 0.31
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 18 Oct 2021 15:57:29 +0200, Hans Verkuil wrote:
> Ah, I thought this was a camera sensor, but it is a video receiver. That's not
> the same as a camera sensor, and video receivers use a different API:
> VIDIOC_S/G_STD, VIDIOC_ENUMSTD and VIDIOC_QUERYSTD (or in this case the SUBDEV
> variants of these ioctls). See for more details below:
> 
> On 14/10/2021 15:31, Michael Tretter wrote:
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
> > v6:
> > 
> > - remove unused log2.h
> > - add select MEDIA_CONTROLLER
> > - use poll_read_timeout to wait for power on
> > - add timeout to polling for video standard
> > - use fwnode_graph_get_endpoint_by_id
> > - fix invalid bus type error message
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
> >  drivers/media/i2c/Kconfig    |   10 +
> >  drivers/media/i2c/Makefile   |    1 +
> >  drivers/media/i2c/isl7998x.c | 1394 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 1413 insertions(+)
> >  create mode 100644 drivers/media/i2c/isl7998x.c
> > 
> 
> <snip>
> 
> > diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> > new file mode 100644
> > index 000000000000..130e0b33b38a
> > --- /dev/null
> > +++ b/drivers/media/i2c/isl7998x.c
> > @@ -0,0 +1,1394 @@
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
> > +#include <linux/module.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/v4l2-mediabus.h>
> > +#include <linux/videodev2.h>
> > +
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +
> > +#define V4L2_CID_TEST_PATTERN_COLOR	(V4L2_CID_USER_BASE | 0x1001)
> > +#define V4L2_CID_TEST_PATTERN_CHANNELS	(V4L2_CID_USER_BASE | 0x1002)
> > +#define V4L2_CID_TEST_PATTERN_BARS	(V4L2_CID_USER_BASE | 0x1003)
> 
> You must create a driver-specific range in v4l2-controls.h for these.
> See e.g. V4L2_CID_USER_CODA_BASE for how to do that.

Ack.

> 
> <snip>
> 
> > +
> > +enum isl7998x_pads {
> > +	ISL7998x_PAD_OUT,
> > +	ISL7998x_PAD_VIN1,
> > +	ISL7998x_PAD_VIN2,
> > +	ISL7998x_PAD_VIN3,
> > +	ISL7998x_PAD_VIN4,
> > +	ISL7998x_NUM_PADS
> > +};
> > +
> > +struct isl7998x_datafmt {
> > +	u32			code;
> > +	enum v4l2_colorspace	colorspace;
> > +};
> > +
> > +static const struct isl7998x_datafmt isl7998x_colour_fmts[] = {
> > +	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_COLORSPACE_SRGB },
> > +};
> > +
> > +/* Menu items for LINK_FREQ V4L2 control */
> > +static const s64 link_freq_menu_items[] = {
> > +	/* 1 channel, 1 lane or 2 channels, 2 lanes */
> > +	108000000,
> > +	/* 2 channels, 1 lane or 4 channels, 2 lanes */
> > +	216000000,
> > +	/* 4 channels, 1 lane */
> > +	432000000,
> > +};
> > +
> > +/* Menu items for TEST_PATTERN V4L2 control */
> > +static const char * const isl7998x_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"PAL (720x576)",
> > +	"NTSC (720x480)",
> > +};
> 
> Which test pattern should be used depends on the selected standard
> (VIDIOC_S_STD). So this menu can just be "Disabled" and "Enabled"
> and let the driver pick the PAL or NTSC version depending on the
> standard.

My problem was that I wanted make this independent of the standard that is
detected on the input. With S_STD and allowing to override the detected
standard, this can be implemented in a much better way.

> 
> > +
> > +static const char * const isl7998x_test_pattern_bars[] = {
> > +	"bbbbwb", "bbbwwb", "bbwbwb", "bbwwwb",
> > +};
> > +
> > +static const char * const isl7998x_test_pattern_colors[] = {
> > +	"Yellow", "Blue", "Green", "Pink",
> > +};
> > +
> > +struct isl7998x_mode {
> > +	unsigned int width;
> > +	unsigned int height;
> > +	enum v4l2_field field;
> > +};
> > +
> > +static const struct isl7998x_mode supported_modes[] = {
> > +	{
> > +		.width = 720,
> > +		.height = 576,
> > +		.field = V4L2_FIELD_SEQ_TB,
> > +	},
> > +	{
> > +		.width = 720,
> > +		.height = 480,
> > +		.field = V4L2_FIELD_SEQ_BT,
> > +	},
> > +};
> > +
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
> > +	struct media_pad		pads[ISL7998x_NUM_PADS];
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
> > +
> > +static struct isl7998x *sd_to_isl7998x(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct isl7998x, subdev);
> > +}
> > +
> > +static struct isl7998x *i2c_to_isl7998x(const struct i2c_client *client)
> > +{
> > +	return sd_to_isl7998x(i2c_get_clientdata(client));
> > +}
> > +
> > +static const struct isl7998x_mode *isl7998x_get_mode(struct isl7998x *isl7998x)
> > +{
> > +	switch (isl7998x->test_pattern) {
> > +	case 1:
> > +		return &supported_modes[0];
> > +	case 2:
> > +		return &supported_modes[1];
> > +	default:
> > +		return isl7998x->mode;
> > +	}
> > +}
> > +
> > +static int isl7998x_get_nr_inputs(struct device_node *of_node)
> > +{
> > +	struct device_node *port;
> > +	unsigned int inputs = 0;
> > +	unsigned int i;
> > +
> > +	if (of_graph_get_endpoint_count(of_node) > ISL7998x_NUM_PADS)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The driver does not provide means to remap the input ports. It
> > +	 * always configures input ports to start from VID1. Ensure that the
> > +	 * device tree is correct.
> > +	 */
> > +	for (i = ISL7998x_PAD_VIN1; i < ISL7998x_PAD_VIN4; i++) {
> > +		port = of_graph_get_port_by_id(of_node, i);
> > +		if (!port)
> > +			continue;
> > +
> > +		inputs |= BIT(i);
> > +		of_node_put(port);
> > +	}
> > +
> > +	switch (inputs) {
> > +	case BIT(ISL7998x_PAD_VIN1):
> > +		return 1;
> > +	case BIT(ISL7998x_PAD_VIN1) | BIT(ISL7998x_PAD_VIN2):
> > +		return 2;
> > +	case BIT(ISL7998x_PAD_VIN1) | BIT(ISL7998x_PAD_VIN2) |
> > +	     BIT(ISL7998x_PAD_VIN3) | BIT(ISL7998x_PAD_VIN4):
> > +		return 4;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int isl7998x_wait_power_on(struct isl7998x *isl7998x)
> > +{
> > +	struct device *dev = isl7998x->subdev.dev;
> > +	u32 chip_id;
> > +	int ret;
> > +	int err;
> > +
> > +	ret = read_poll_timeout(regmap_read, err, !err, 2000, 20000, false,
> > +				isl7998x->regmap,
> > +				ISL7998x_REG_P0_PRODUCT_ID_CODE, &chip_id);
> > +	if (ret) {
> > +		dev_err(dev, "timeout while waiting for ISL7998x\n");
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(dev, "Found ISL799%x\n", chip_id);
> > +
> > +	return ret;
> > +}
> > +
> > +static int isl7998x_init(struct isl7998x *isl7998x)
> > +{
> > +	const unsigned int lanes = isl7998x->nr_mipi_lanes;
> > +	const u32 isl7998x_video_in_chan_map[] = { 0x00, 0x11, 0x02, 0x02 };
> > +	const struct reg_sequence isl7998x_init_seq_custom[] = {
> > +		{ ISL7998x_REG_P0_VIDEO_IN_CHAN_CTL,
> > +		  isl7998x_video_in_chan_map[isl7998x->nr_inputs - 1] },
> > +		{ ISL7998x_REG_P0_CLK_CTL_4,
> > +		  (lanes == 1) ? 0x40 : 0x41 },
> > +		{ ISL7998x_REG_P5_LI_ENGINE_CTL,
> > +		  (lanes == 1) ? 0x01 : 0x02 },
> > +		{ ISL7998x_REG_P5_LI_ENGINE_LINE_CTL,
> > +		  0x20 | ((isl7998x->mode->width >> 7) & 0x1f) },
> > +		{ ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH,
> > +		  (isl7998x->mode->width << 1) & 0xff },
> > +	};
> > +	struct device *dev = isl7998x->subdev.dev;
> > +	struct regmap *regmap = isl7998x->regmap;
> > +	int ret;
> > +
> > +	dev_dbg(dev, "configuring %d lanes for %d inputs (%dx%d)\n",
> > +		isl7998x->nr_mipi_lanes, isl7998x->nr_inputs,
> > +		isl7998x->mode->width, isl7998x->mode->height);
> > +
> > +	ret = regmap_register_patch(regmap, isl7998x_init_seq_1,
> > +				    ARRAY_SIZE(isl7998x_init_seq_1));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_register_patch(regmap, isl7998x_init_seq_custom,
> > +				    ARRAY_SIZE(isl7998x_init_seq_custom));
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_register_patch(regmap, isl7998x_init_seq_2,
> > +				     ARRAY_SIZE(isl7998x_init_seq_2));
> > +}
> > +
> > +static const struct isl7998x_video_std {
> > +	int id;
> > +	const char *name;
> > +	const struct isl7998x_mode *mode;
> > +} isl7998x_std_res[] = {
> > +	{ 0, "NTSC (M)", &supported_modes[1]},
> > +	{ 1, "PAL (B, D, G, H, I)", &supported_modes[0]},
> > +	{ 2, "SECAM", &supported_modes[0]},
> > +	{ 3, "NTSC4.43", &supported_modes[1]},
> > +	{ 4, "PAL (M)", &supported_modes[1]},
> > +	{ 5, "PAL (CN)", &supported_modes[0]},
> > +	{ 6, "PAL 60", &supported_modes[1]},
> > +	{ 7, "N/A", NULL},
> > +};
> > +
> > +/*
> > + * Detect and set video standard on video inputs.
> > + */
> > +static int isl7998x_update_std(struct isl7998x *isl7998x)
> > +{
> > +#define ISL7998x_INPUTS			4
> > +	struct device *dev = isl7998x->subdev.dev;
> > +	unsigned int std_id[ISL7998x_INPUTS];
> > +	unsigned int i;
> > +	int ret;
> > +	u32 reg;
> > +
> > +	ret = pm_runtime_resume_and_get(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i = 0; i < ISL7998x_INPUTS; i++) {
> > +		ret = regmap_read_poll_timeout(isl7998x->regmap,
> > +				ISL7998x_REG_Px_DEC_SDT(i + 1),
> > +				reg, reg & ISL7998x_REG_Px_DEC_SDT_DET,
> > +				2000, 500 * USEC_PER_MSEC);
> > +		std_id[i] = FIELD_GET(ISL7998x_REG_Px_DEC_SDT_NOW, reg);
> 
> Hmm, what happens if there is no signal for this input? Does it pick a random
> standard? Or is it N/A?

In my tests, it always detected PAL (B, D, G, H, I), if there is no signal.
This isn't documented, but my guess is that this is the fallback, if nothing
is detected.

> 
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> > +	/*
> > +	 * According to Renesas FAE, all input cameras must have the
> > +	 * same standard on this chip.
> > +	 */
> > +	for (i = 0; i < isl7998x->nr_inputs; i++) {
> > +		dev_dbg(dev, "input %d: detected %s\n",
> > +			i, isl7998x_std_res[std_id[i]].name);
> > +		if (std_id[0] != std_id[i])
> > +			dev_warn(dev,
> > +				 "incompatible standards: %s on input %d (expected %s)\n",
> > +				 isl7998x_std_res[std_id[i]].name, i,
> > +				 isl7998x_std_res[std_id[0]].name);
> 
> It is probably fine if some of the inputs are N/A, as long as the others are
> a match.
> 
> > +	}
> > +
> > +	isl7998x->mode = isl7998x_std_res[std_id[0]].mode;
> 
> Nack. That's not how video receivers work. Everyone who writes a driver for a
> video receiver for the first time makes the same mistake...
> 
> The driver must support VIDIOC_SUBDEV_G/S_STD, ENUMSTD and QUERYSTD ioctls.
> To support VIDIOC_SUBDEV_ENUMSTD the driver must implement the g_tvnorms subdev op,
> which returns the mask of supported standards.
> 
> QUERYSTD will return the detected standard for all inputs. That is effectively
> isl7998x_update_std(), except without the actual updating of the mode part, i.e.
> it just detects and changes nothing.
> 
> If there are incompatible standards detected for different inputs, then you can
> either just pick one or return -ENODATA.
> 
> VIDIOC_SUBDEV_G_STD returns the currently selected standard (typically probe will
> initialize this to NTSC) and VIDIOC_SUBDEV_S_STD sets the standard.
> 
> The typical userspace usage is to call QUERYSTD first, then call S_STD with what
> QUERYSTD detected.
> 
> Setting a new standard will automatically change the width and height and reset
> any cropping. If streaming is in progress, then changing to a different standard
> (and thus resolution) is not allowed and S_STD must return -EBUSY.
> 
> You can't change the format to something different from the standard, unless there
> is a scaler, in which case the video is scaled to the requested format. So for
> video receivers S_FMT will typically just overwrite the width and height depending
> on the current standard.
> 
> Also implement the g_input_status subdev op to give feedback to userspace whether
> or not there is a signal.
> 
> If the hardware supports detecting signal (standard) changes through e.g. an interrupt,
> then you can raise the V4L2_EVENT_SOURCE_CHANGE event to tell userspace about this,
> but for some reason this is rarely present in video receivers.

Thanks for the clarification. This should actually be straightforward to
implement. I will do so in v7.

> 
> > +
> > +out:
> > +	pm_runtime_put(dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int isl7998x_set_test_pattern(struct isl7998x *isl7998x)
> > +{
> > +	const struct reg_sequence isl7998x_init_seq_tpg_off[] = {
> > +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL, 0 },
> > +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2, 0 }
> > +	};
> > +	const struct reg_sequence isl7998x_init_seq_tpg_on[] = {
> > +		{ ISL7998x_REG_P5_TP_GEN_BAR_PATTERN,
> > +		  isl7998x->test_pattern_bars << 6 },
> > +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2,
> > +		  isl7998x->test_pattern == 1 ? BIT(2) : 0 },
> > +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL,
> > +		  (isl7998x->test_pattern_chans << 4) |
> > +		  (isl7998x->test_pattern_color << 2) }
> > +	};
> > +	struct device *dev = isl7998x->subdev.dev;
> > +	struct regmap *regmap = isl7998x->regmap;
> > +	int ret;
> > +
> > +	if (!pm_runtime_enabled(dev) || !pm_runtime_get_if_in_use(dev))
> > +		return 0;
> > +
> > +	if (isl7998x->test_pattern != 0) {
> > +		dev_dbg(dev, "test pattern: %s, channels 0x%x, %s, %s\n",
> > +			isl7998x_test_pattern_menu[isl7998x->test_pattern],
> > +			isl7998x->test_pattern_chans,
> > +			isl7998x_test_pattern_bars[isl7998x->test_pattern_bars],
> > +			isl7998x_test_pattern_colors[isl7998x->test_pattern_color]);
> > +		ret = regmap_register_patch(regmap, isl7998x_init_seq_tpg_on,
> > +					    ARRAY_SIZE(isl7998x_init_seq_tpg_on));
> > +	} else {
> > +		ret = regmap_register_patch(regmap, isl7998x_init_seq_tpg_off,
> > +					    ARRAY_SIZE(isl7998x_init_seq_tpg_off));
> > +	}
> > +
> > +	pm_runtime_put(dev);
> > +
> > +	return ret;
> > +}
> > +
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +static int isl7998x_g_register(struct v4l2_subdev *sd,
> > +			       struct v4l2_dbg_register *reg)
> > +{
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = regmap_read(isl7998x->regmap, reg->reg, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	reg->size = 1;
> > +	reg->val = val;
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_s_register(struct v4l2_subdev *sd,
> > +			       const struct v4l2_dbg_register *reg)
> > +{
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +
> > +	return regmap_write(isl7998x->regmap, reg->reg, reg->val);
> > +}
> > +#endif
> > +
> > +static int isl7998x_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct device *dev = &client->dev;
> > +	int ret = 0;
> > +	u32 reg;
> > +
> > +	dev_dbg(dev, "stream %s\n", enable ? "ON" : "OFF");
> > +
> > +	if (enable) {
> > +		ret = isl7998x_set_test_pattern(isl7998x);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	regmap_read(isl7998x->regmap,
> > +		    ISL7998x_REG_P5_LI_ENGINE_CTL, &reg);
> > +	if (enable)
> > +		reg &= ~BIT(7);
> > +	else
> > +		reg |= BIT(7);
> > +	ret = regmap_write(isl7998x->regmap,
> > +			   ISL7998x_REG_P5_LI_ENGINE_CTL, reg);
> > +
> > +	return ret;
> > +}
> > +
> > +static int isl7998x_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct device *dev = &client->dev;
> > +
> > +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
> > +		return pm_runtime_resume_and_get(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_post_streamoff(struct v4l2_subdev *sd)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct device *dev = &client->dev;
> > +
> > +	pm_runtime_put(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_enum_mbus_code(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *sd_state,
> > +				   struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->index >= ARRAY_SIZE(isl7998x_colour_fmts))
> > +		return -EINVAL;
> > +
> > +	code->code = isl7998x_colour_fmts[code->index].code;
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_enum_frame_size(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_state *sd_state,
> > +				    struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	if (fse->index >= ARRAY_SIZE(supported_modes))
> > +		return -EINVAL;
> > +
> > +	if (fse->code != isl7998x_colour_fmts[0].code)
> > +		return -EINVAL;
> > +
> > +	fse->min_width = supported_modes[fse->index].width;
> > +	fse->max_width = fse->min_width;
> > +	fse->min_height = supported_modes[fse->index].height;
> > +	fse->max_height = fse->min_height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_get_fmt(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *sd_state,
> > +			    struct v4l2_subdev_format *format)
> > +{
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +	struct v4l2_mbus_framefmt *mf = &format->format;
> > +	const struct isl7998x_mode *mode = isl7998x_get_mode(isl7998x);
> > +
> > +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +		format->format = *v4l2_subdev_get_try_format(sd, sd_state,
> > +							     format->pad);
> > +		return 0;
> > +	}
> > +
> > +	mf->width	= mode->width;
> > +	mf->height	= mode->height;
> > +	mf->code	= isl7998x->fmt->code;
> > +	mf->field	= mode->field;
> > +	mf->colorspace	= 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_set_fmt(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *sd_state,
> > +			    struct v4l2_subdev_format *format)
> > +{
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +	struct v4l2_mbus_framefmt *mf = &format->format;
> > +	const struct isl7998x_mode *mode = isl7998x_get_mode(isl7998x);
> > +
> > +	mf->width = mode->width;
> > +	mf->height = mode->height;
> > +	mf->code = isl7998x->fmt->code;
> > +	mf->field = mode->field;
> > +
> > +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> > +		*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = format->format;
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl7998x_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct isl7998x *isl7998x = container_of(ctrl->handler,
> > +						 struct isl7998x, ctrl_handler);
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_TEST_PATTERN_BARS:
> > +		isl7998x->test_pattern_bars = ctrl->val & 0x3;
> > +		return isl7998x_set_test_pattern(isl7998x);
> > +	case V4L2_CID_TEST_PATTERN_CHANNELS:
> > +		isl7998x->test_pattern_chans = ctrl->val & 0xf;
> > +		return isl7998x_set_test_pattern(isl7998x);
> > +	case V4L2_CID_TEST_PATTERN_COLOR:
> > +		isl7998x->test_pattern_color = ctrl->val & 0x3;
> > +		return isl7998x_set_test_pattern(isl7998x);
> > +	case V4L2_CID_TEST_PATTERN:
> > +		isl7998x->test_pattern = ctrl->val;
> > +		return isl7998x_set_test_pattern(isl7998x);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops isl7998x_subdev_core_ops = {
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +	.g_register	= isl7998x_g_register,
> > +	.s_register	= isl7998x_s_register,
> > +#endif
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops isl7998x_subdev_video_ops = {
> > +	.s_stream	= isl7998x_s_stream,
> > +	.pre_streamon	= isl7998x_pre_streamon,
> > +	.post_streamoff	= isl7998x_post_streamoff,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops isl7998x_subdev_pad_ops = {
> > +	.enum_mbus_code		= isl7998x_enum_mbus_code,
> > +	.enum_frame_size	= isl7998x_enum_frame_size,
> > +	.get_fmt		= isl7998x_get_fmt,
> > +	.set_fmt		= isl7998x_set_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_ops isl7998x_subdev_ops = {
> > +	.core		= &isl7998x_subdev_core_ops,
> > +	.video		= &isl7998x_subdev_video_ops,
> > +	.pad		= &isl7998x_subdev_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations isl7998x_entity_ops = {
> > +	.link_validate = v4l2_subdev_link_validate,
> > +};
> > +
> > +static const struct v4l2_ctrl_ops isl7998x_ctrl_ops = {
> > +	.s_ctrl			= isl7998x_set_ctrl,
> > +};
> > +
> > +static const struct v4l2_ctrl_config isl7998x_ctrls[] = {
> > +	{
> > +		.ops		= &isl7998x_ctrl_ops,
> > +		.id		= V4L2_CID_TEST_PATTERN_BARS,
> > +		.type		= V4L2_CTRL_TYPE_MENU,
> > +		.name		= "Test Pattern Bars",
> > +		.max		= ARRAY_SIZE(isl7998x_test_pattern_bars) - 1,
> > +		.def		= 0,
> > +		.qmenu		= isl7998x_test_pattern_bars,
> > +	}, {
> > +		.ops		= &isl7998x_ctrl_ops,
> > +		.id		= V4L2_CID_TEST_PATTERN_CHANNELS,
> > +		.type		= V4L2_CTRL_TYPE_INTEGER,
> > +		.name		= "Test Pattern Channels",
> > +		.min		= 0,
> > +		.max		= 0xf,
> > +		.step		= 1,
> > +		.def		= 0xf,
> > +		.flags		= 0,
> > +	}, {
> > +		.ops		= &isl7998x_ctrl_ops,
> > +		.id		= V4L2_CID_TEST_PATTERN_COLOR,
> > +		.type		= V4L2_CTRL_TYPE_MENU,
> > +		.name		= "Test Pattern Color",
> > +		.max		= ARRAY_SIZE(isl7998x_test_pattern_colors) - 1,
> > +		.def		= 0,
> > +		.qmenu		= isl7998x_test_pattern_colors,
> > +	},
> 
> How exactly do these interact? How does it work precisely?

The TEST_PATTERN_CHANNELS has a bit for each of the four decoders of this
chip. This switches the connected MIPI CSI-2 virtual channel from the video
input to the test pattern.

The test pattern consists mostly of rectangles in various shades of gray. On
the top, there is a colored bar. The color of the bar can be adjusted using
the TEST_PATTERN_COLOR control. In the top left corner, there is a field with
a pattern of black and white vertical bars. This pattern can be changed using
the TEST_PATTERN_BARS control.

Should I document this somewhere and, if yes, where?

Michael

> 
> Regards,
> 
> 	Hans
> 
> > +};
> > +
> > +#define ISL7998x_REG_DECODER_ACA_READABLE_RANGE(page)			\
> > +	/* Decoder range */						\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_INPUT_FMT(page),		\
> > +			 ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_ANCTL(page),		\
> > +			 ISL7998x_REG_Px_DEC_CSC_CTL(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_BRIGHT(page),		\
> > +			 ISL7998x_REG_Px_DEC_HUE(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_VERT_PEAK(page),		\
> > +			 ISL7998x_REG_Px_DEC_CORING(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
> > +			 ISL7998x_REG_Px_DEC_SDTR(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMPG(page),		\
> > +			 ISL7998x_REG_Px_DEC_DATA_CONV(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_INTERNAL_TEST(page),	\
> > +			 ISL7998x_REG_Px_DEC_INTERNAL_TEST(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_H_DELAY_CTL(page),		\
> > +			 ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(page)),	\
> > +	/* ACA range */							\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_1(page),		\
> > +			 ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_Y_AVG(page),		\
> > +			 ISL7998x_REG_Px_ACA_CTL_4(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(page),	\
> > +			 ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(page),		\
> > +			 ISL7998x_REG_Px_DEC_PAGE(page))
> > +
> > +#define ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(page)			\
> > +	/* Decoder range */						\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_INPUT_FMT(page),		\
> > +			 ISL7998x_REG_Px_DEC_INPUT_FMT(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page),	\
> > +			 ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_ANCTL(page),		\
> > +			 ISL7998x_REG_Px_DEC_CSC_CTL(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_BRIGHT(page),		\
> > +			 ISL7998x_REG_Px_DEC_HUE(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_VERT_PEAK(page),		\
> > +			 ISL7998x_REG_Px_DEC_CORING(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
> > +			 ISL7998x_REG_Px_DEC_SDTR(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMPG(page),		\
> > +			 ISL7998x_REG_Px_DEC_MISC3(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMD(page),		\
> > +			 ISL7998x_REG_Px_DEC_DATA_CONV(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_INTERNAL_TEST(page),	\
> > +			 ISL7998x_REG_Px_DEC_INTERNAL_TEST(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_H_DELAY_CTL(page),		\
> > +			 ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(page)),	\
> > +	/* ACA range */							\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_1(page),		\
> > +			 ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_2(page),		\
> > +			 ISL7998x_REG_Px_ACA_CTL_4(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(page),	\
> > +			 ISL7998x_REG_Px_ACA_HIST_DATA_LO(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page),	\
> > +			 ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page)),	\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(page),		\
> > +			 ISL7998x_REG_Px_DEC_PAGE(page))
> > +
> > +#define ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(page)			\
> > +	/* Decoder range */						\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_STATUS_1(page),		\
> > +			 ISL7998x_REG_Px_DEC_STATUS_1(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
> > +			 ISL7998x_REG_Px_DEC_SDT(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_MVSN(page),		\
> > +			 ISL7998x_REG_Px_DEC_HFREF(page)),		\
> > +	/* ACA range */							\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_Y_AVG(page),		\
> > +			 ISL7998x_REG_Px_ACA_Y_HIGH(page)),		\
> > +	regmap_reg_range(ISL7998x_REG_Px_ACA_HIST_DATA_LO(page),	\
> > +			 ISL7998x_REG_Px_ACA_FLEX_WIN_CR_CLR(page))
> > +
> > +static const struct regmap_range isl7998x_readable_ranges[] = {
> > +	regmap_reg_range(ISL7998x_REG_P0_PRODUCT_ID_CODE,
> > +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
> > +	regmap_reg_range(ISL7998x_REG_P0_INTERRUPT_STATUS,
> > +			 ISL7998x_REG_P0_CLOCK_DELAY),
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(0),
> > +			 ISL7998x_REG_Px_DEC_PAGE(0)),
> > +
> > +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(1),
> > +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(2),
> > +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(3),
> > +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(4),
> > +
> > +	regmap_reg_range(ISL7998x_REG_P5_LI_ENGINE_CTL,
> > +			 ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL),
> > +	regmap_reg_range(ISL7998x_REG_P5_FIFO_THRSH_CNT_1,
> > +			 ISL7998x_REG_P5_PLL_ANA),
> > +	regmap_reg_range(ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1,
> > +			 ISL7998x_REG_P5_HIST_LINE_CNT_2),
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(5),
> > +			 ISL7998x_REG_Px_DEC_PAGE(5)),
> > +};
> > +
> > +static const struct regmap_range isl7998x_writeable_ranges[] = {
> > +	regmap_reg_range(ISL7998x_REG_P0_SW_RESET_CTL,
> > +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
> > +	regmap_reg_range(ISL7998x_REG_P0_CHAN_1_IRQ,
> > +			 ISL7998x_REG_P0_SHORT_DIAG_IRQ_EN),
> > +	regmap_reg_range(ISL7998x_REG_P0_CLOCK_DELAY,
> > +			 ISL7998x_REG_P0_CLOCK_DELAY),
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(0),
> > +			 ISL7998x_REG_Px_DEC_PAGE(0)),
> > +
> > +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(1),
> > +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(2),
> > +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(3),
> > +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(4),
> > +
> > +	regmap_reg_range(ISL7998x_REG_P5_LI_ENGINE_CTL,
> > +			 ISL7998x_REG_P5_ESC_MODE_TIME_CTL),
> > +	regmap_reg_range(ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL,
> > +			 ISL7998x_REG_P5_PLL_ANA),
> > +	regmap_reg_range(ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1,
> > +			 ISL7998x_REG_P5_HIST_LINE_CNT_2),
> > +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(5),
> > +			 ISL7998x_REG_Px_DEC_PAGE(5)),
> > +
> > +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(0xf),
> > +};
> > +
> > +static const struct regmap_range isl7998x_volatile_ranges[] = {
> > +	/* Product id code register is used to check availability */
> > +	regmap_reg_range(ISL7998x_REG_P0_PRODUCT_ID_CODE,
> > +			 ISL7998x_REG_P0_PRODUCT_ID_CODE),
> > +	regmap_reg_range(ISL7998x_REG_P0_MPP1_SYNC_CTL,
> > +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
> > +	regmap_reg_range(ISL7998x_REG_P0_INTERRUPT_STATUS,
> > +			 ISL7998x_REG_P0_INTERRUPT_STATUS),
> > +	regmap_reg_range(ISL7998x_REG_P0_CHAN_1_STATUS,
> > +			 ISL7998x_REG_P0_SHORT_DIAG_STATUS),
> > +
> > +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(1),
> > +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(2),
> > +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(3),
> > +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(4),
> > +
> > +	regmap_reg_range(ISL7998x_REG_P5_AUTO_TEST_ERR_DET,
> > +			 ISL7998x_REG_P5_PIC_HEIGHT_LOW),
> > +};
> > +
> > +static const struct regmap_access_table isl7998x_readable_table = {
> > +	.yes_ranges = isl7998x_readable_ranges,
> > +	.n_yes_ranges = ARRAY_SIZE(isl7998x_readable_ranges),
> > +};
> > +
> > +static const struct regmap_access_table isl7998x_writeable_table = {
> > +	.yes_ranges = isl7998x_writeable_ranges,
> > +	.n_yes_ranges = ARRAY_SIZE(isl7998x_writeable_ranges),
> > +};
> > +
> > +static const struct regmap_access_table isl7998x_volatile_table = {
> > +	.yes_ranges = isl7998x_volatile_ranges,
> > +	.n_yes_ranges = ARRAY_SIZE(isl7998x_volatile_ranges),
> > +};
> > +
> > +static const struct regmap_range_cfg isl7998x_ranges[] = {
> > +	{
> > +		.range_min	= ISL7998x_REG_Pn_BASE(0),
> > +		.range_max	= ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf),
> > +		.selector_reg	= ISL7998x_REG_Px_DEC_PAGE(0),
> > +		.selector_mask	= ISL7998x_REG_Px_DEC_PAGE_MASK,
> > +		.window_start	= 0,
> > +		.window_len	= 256,
> > +	}
> > +};
> > +
> > +static const struct regmap_config isl7998x_regmap = {
> > +	.reg_bits	= 8,
> > +	.val_bits	= 8,
> > +	.max_register	= ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf),
> > +	.ranges		= isl7998x_ranges,
> > +	.num_ranges	= ARRAY_SIZE(isl7998x_ranges),
> > +	.rd_table	= &isl7998x_readable_table,
> > +	.wr_table	= &isl7998x_writeable_table,
> > +	.volatile_table	= &isl7998x_volatile_table,
> > +	.cache_type	= REGCACHE_RBTREE,
> > +};
> > +
> > +static int isl7998x_mc_init(struct isl7998x *isl7998x)
> > +{
> > +	unsigned int i;
> > +
> > +	isl7998x->subdev.entity.ops = &isl7998x_entity_ops;
> > +	isl7998x->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > +
> > +	isl7998x->pads[ISL7998x_PAD_OUT].flags = MEDIA_PAD_FL_SOURCE;
> > +	for (i = ISL7998x_PAD_VIN1; i < ISL7998x_NUM_PADS; i++)
> > +		isl7998x->pads[i].flags = MEDIA_PAD_FL_SINK;
> > +
> > +	return media_entity_pads_init(&isl7998x->subdev.entity,
> > +				      ISL7998x_NUM_PADS,
> > +				      isl7998x->pads);
> > +}
> > +
> > +static int get_link_freq_menu_index(unsigned int lanes,
> > +				    unsigned int inputs)
> > +{
> > +	int ret = -EINVAL;
> > +
> > +	switch (lanes) {
> > +	case 1:
> > +		if (inputs == 1)
> > +			ret = 0;
> > +		if (inputs == 2)
> > +			ret = 1;
> > +		if (inputs == 4)
> > +			ret = 2;
> > +		break;
> > +	case 2:
> > +		if (inputs == 2)
> > +			ret = 0;
> > +		if (inputs == 4)
> > +			ret = 1;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int isl7998x_init_controls(struct isl7998x *isl7998x)
> > +{
> > +	struct v4l2_subdev *sd = &isl7998x->subdev;
> > +	int link_freq_index;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ret = v4l2_ctrl_handler_init(&isl7998x->ctrl_handler,
> > +				     2 + ARRAY_SIZE(isl7998x_ctrls));
> > +	if (ret)
> > +		return ret;
> > +
> > +	mutex_init(&isl7998x->ctrl_mutex);
> > +	isl7998x->ctrl_handler.lock = &isl7998x->ctrl_mutex;
> > +	link_freq_index = get_link_freq_menu_index(isl7998x->nr_mipi_lanes,
> > +						   isl7998x->nr_inputs);
> > +	if (link_freq_index < 0 ||
> > +	    link_freq_index >= ARRAY_SIZE(link_freq_menu_items)) {
> > +		dev_err(sd->dev,
> > +			"failed to find MIPI link freq: %d lanes, %d inputs\n",
> > +			isl7998x->nr_mipi_lanes, isl7998x->nr_inputs);
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> > +	isl7998x->link_freq = v4l2_ctrl_new_int_menu(&isl7998x->ctrl_handler,
> > +						     &isl7998x_ctrl_ops,
> > +						     V4L2_CID_LINK_FREQ,
> > +						     ARRAY_SIZE(link_freq_menu_items) - 1,
> > +						     link_freq_index,
> > +						     link_freq_menu_items);
> > +	if (isl7998x->link_freq)
> > +		isl7998x->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(isl7998x_ctrls); i++)
> > +		v4l2_ctrl_new_custom(&isl7998x->ctrl_handler,
> > +				     &isl7998x_ctrls[i], NULL);
> > +
> > +	v4l2_ctrl_new_std_menu_items(&isl7998x->ctrl_handler,
> > +				     &isl7998x_ctrl_ops,
> > +				     V4L2_CID_TEST_PATTERN,
> > +				     ARRAY_SIZE(isl7998x_test_pattern_menu) - 1,
> > +				     0, 0, isl7998x_test_pattern_menu);
> > +
> > +	ret = isl7998x->ctrl_handler.error;
> > +	if (ret)
> > +		goto err;
> > +
> > +	isl7998x->subdev.ctrl_handler = &isl7998x->ctrl_handler;
> > +	v4l2_ctrl_handler_setup(&isl7998x->ctrl_handler);
> > +
> > +	return 0;
> > +
> > +err:
> > +	mutex_destroy(&isl7998x->ctrl_mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static void isl7998x_remove_controls(struct isl7998x *isl7998x)
> > +{
> > +	v4l2_ctrl_handler_free(isl7998x->subdev.ctrl_handler);
> > +	mutex_destroy(&isl7998x->ctrl_mutex);
> > +}
> > +
> > +static int isl7998x_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct v4l2_fwnode_endpoint endpoint = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > +	};
> > +	struct fwnode_handle *ep;
> > +	struct isl7998x *isl7998x;
> > +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> > +	int nr_inputs;
> > +	int ret;
> > +
> > +	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
> > +	if (!ret) {
> > +		dev_warn(&adapter->dev,
> > +			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
> > +		return -EIO;
> > +	}
> > +
> > +	isl7998x = devm_kzalloc(dev, sizeof(*isl7998x), GFP_KERNEL);
> > +	if (!isl7998x)
> > +		return -ENOMEM;
> > +
> > +	isl7998x->pd_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > +						    GPIOD_OUT_HIGH);
> > +	if (IS_ERR(isl7998x->pd_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(isl7998x->pd_gpio),
> > +				     "Failed to retrieve/request PD GPIO\n");
> > +
> > +	isl7998x->rstb_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						      GPIOD_OUT_HIGH);
> > +	if (IS_ERR(isl7998x->rstb_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(isl7998x->rstb_gpio),
> > +				     "Failed to retrieve/request RSTB GPIO\n");
> > +
> > +	isl7998x->regmap = devm_regmap_init_i2c(client, &isl7998x_regmap);
> > +	if (IS_ERR(isl7998x->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(isl7998x->regmap),
> > +				     "Failed to allocate register map\n");
> > +
> > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> > +					     ISL7998x_PAD_OUT, 0, 0);
> > +	if (!ep)
> > +		return dev_err_probe(dev, -EINVAL, "Missing endpoint node\n");
> > +
> > +	ret = v4l2_fwnode_endpoint_parse(ep, &endpoint);
> > +	fwnode_handle_put(ep);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to parse endpoint\n");
> > +
> > +	if (endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
> > +	    endpoint.bus.mipi_csi2.num_data_lanes > 2)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Invalid number of MIPI lanes\n");
> > +
> > +	isl7998x->nr_mipi_lanes = endpoint.bus.mipi_csi2.num_data_lanes;
> > +
> > +	nr_inputs = isl7998x_get_nr_inputs(dev->of_node);
> > +	if (nr_inputs < 0)
> > +		return dev_err_probe(dev, nr_inputs,
> > +				     "Invalid number of input ports\n");
> > +	isl7998x->nr_inputs = nr_inputs;
> > +
> > +	v4l2_i2c_subdev_init(&isl7998x->subdev, client, &isl7998x_subdev_ops);
> > +	isl7998x->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +	ret = isl7998x_mc_init(isl7998x);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	isl7998x->mode = &supported_modes[0];
> > +	isl7998x->fmt = &isl7998x_colour_fmts[0];
> > +
> > +	ret = isl7998x_init_controls(isl7998x);
> > +	if (ret)
> > +		goto err_entity_cleanup;
> > +
> > +	ret = v4l2_async_register_subdev(&isl7998x->subdev);
> > +	if (ret < 0)
> > +		goto err_controls_cleanup;
> > +
> > +	pm_runtime_enable(dev);
> > +
> > +	ret = isl7998x_update_std(isl7998x);
> > +	if (ret)
> > +		goto err_init_cleanup;
> > +
> > +	return 0;
> > +
> > +err_init_cleanup:
> > +	pm_runtime_disable(dev);
> > +	v4l2_async_unregister_subdev(&isl7998x->subdev);
> > +err_controls_cleanup:
> > +	isl7998x_remove_controls(isl7998x);
> > +err_entity_cleanup:
> > +	media_entity_cleanup(&isl7998x->subdev.entity);
> > +
> > +	return ret;
> > +}
> > +
> > +static int isl7998x_remove(struct i2c_client *client)
> > +{
> > +	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
> > +
> > +	pm_runtime_disable(&client->dev);
> > +	v4l2_async_unregister_subdev(&isl7998x->subdev);
> > +	isl7998x_remove_controls(isl7998x);
> > +	media_entity_cleanup(&isl7998x->subdev.entity);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id isl7998x_of_match[] = {
> > +	{ .compatible = "isil,isl79987", },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, isl7998x_of_match);
> > +
> > +static const struct i2c_device_id isl7998x_id[] = {
> > +	{ "isl79987", 0 },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, isl7998x_id);
> > +
> > +static int __maybe_unused isl7998x_runtime_resume(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +	int ret;
> > +
> > +	gpiod_set_value(isl7998x->rstb_gpio, 1);
> > +	gpiod_set_value(isl7998x->pd_gpio, 0);
> > +	gpiod_set_value(isl7998x->rstb_gpio, 0);
> > +
> > +	ret = isl7998x_wait_power_on(isl7998x);
> > +	if (ret)
> > +		goto err;
> > +
> > +	return isl7998x_init(isl7998x);
> > +
> > +err:
> > +	gpiod_set_value(isl7998x->pd_gpio, 1);
> > +
> > +	return ret;
> > +}
> > +
> > +static int __maybe_unused isl7998x_runtime_suspend(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> > +
> > +	gpiod_set_value(isl7998x->pd_gpio, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops isl7998x_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(isl7998x_runtime_suspend,
> > +			   isl7998x_runtime_resume,
> > +			   NULL)
> > +};
> > +
> > +static struct i2c_driver isl7998x_i2c_driver = {
> > +	.driver = {
> > +		.name = "isl7998x",
> > +		.of_match_table = of_match_ptr(isl7998x_of_match),
> > +		.pm = &isl7998x_pm_ops,
> > +	},
> > +	.probe_new	= isl7998x_probe,
> > +	.remove		= isl7998x_remove,
> > +	.id_table	= isl7998x_id,
> > +};
> > +
> > +module_i2c_driver(isl7998x_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Intersil ISL7998x Analog to MIPI CSI-2/BT656 decoder");
> > +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> > +MODULE_LICENSE("GPL v2");
> > 
> 
> 
