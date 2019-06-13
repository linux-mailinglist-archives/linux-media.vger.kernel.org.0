Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53AD34467F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfFMQwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:52:16 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:63574 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730126AbfFMDXJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 23:23:09 -0400
X-UUID: c3f2a8fd5eb34d9d9e9148758fc0a364-20190613
X-UUID: c3f2a8fd5eb34d9d9e9148758fc0a364-20190613
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 829889266; Thu, 13 Jun 2019 11:22:50 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Jun
 2019 11:22:49 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Jun 2019 11:22:46 +0800
Message-ID: <1560396166.9392.71.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] media: i2c: ov02a10: Add ov02a10 camera sensor
 driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <menghui.lin@mediatek.com>,
        <shengnan.wang@mediatek.com>, <tfiga@google.com>
Date:   Thu, 13 Jun 2019 11:22:46 +0800
In-Reply-To: <fe888828-8e97-f9d9-b94a-d804b58b67ab@linux.intel.com>
References: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
         <20190523102204.24112-2-dongchun.zhu@mediatek.com>
         <fe888828-8e97-f9d9-b94a-d804b58b67ab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Tue, 2019-05-28 at 14:20 +0800, Bingbu Cao wrote:
> 
> On 5/23/19 6:22 PM, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > 
> > Add a V4L2 sub-device driver for the OmniVision image sensor.
> > This is a camera sensor using the I2C bus for control and the
> > CSI-2 bus for data.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1067 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 1068 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> > 
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index d8ad9da..4b8f67b 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
> >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> >  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
> >  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> > +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> >  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
> >  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
> >  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > new file mode 100644
> > index 0000000..39472ff
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov02a10.c
> > @@ -0,0 +1,1067 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * A V4L2 driver for OmniVision OV02A10 cameras.
> > + *
> > + * Based on Omnivision OV02A10 Camera Driver
> > + * Copyright (C) 2019 MediaTek Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation version 2.
> > + *
> > + * This program is distributed .as is. WITHOUT ANY WARRANTY of any
> > + * kind, whether express or implied; without even the implied warranty
> > + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/sysfs.h>
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define CHIP_ID                                         0x2509
> > +#define OV02A10_REG_CHIP_ID_H                           0x02
> > +#define OV02A10_REG_CHIP_ID_L                           0x03
> > +#define OV02A10_ID(_msb, _lsb)                          ((_msb) << 8 | (_lsb))
> > +
> > +/* bit[1] vertical upside down */
> > +/* bit[0] horizontal mirror */
> > +#define OV02A10_REG_UPDOWN_MIRROR                       0x3F
> > +
> > +/* enable mirror & flip global effective */
> > +#define OV02A10_REG_UPDOWN_MIRROR_ENABLE                0x01
> > +
> > +#define ov02a10_XVCLK_FREQ                              24000000
> > +#define REG_SC_CTRL_MODE                                0xac
> > +
> > +#define SC_CTRL_MODE_STANDBY                            0x00
> > +#define SC_CTRL_MODE_STREAMING                          0x01
> > +
> > +#define ov02a10_REG_EXPOSURE_H                          0x03
> > +#define ov02a10_REG_EXPOSURE_L                          0x04
> > +#define	ov02a10_EXPOSURE_MIN                            4
> > +#define	ov02a10_EXPOSURE_STEP                           1
> > +
> > +#define ov02a10_REG_VTS_H                               0x05
> > +#define ov02a10_REG_VTS_L                               0x06
> > +#define ov02a10_VTS_MAX                                 0x209f
> > +#define ov02a10_VTS_MIN                                 0x04cf
> > +
> > +#define ov02a10_REG_GAIN                                0x24
> > +#define ov02a10_GAIN_MIN                                0x10
> > +#define ov02a10_GAIN_MAX                                0xf8
> > +#define ov02a10_GAIN_STEP                               0x01
> > +#define ov02a10_GAIN_DEFAULT                            0x40
> > +
> > +#define ov02a10_REG_TEST_PATTERN                        0x0d
> > +#define ov02a10_TEST_PATTERN_DISABLED                   0x00
> > +#define ov02a10_TEST_PATTERN_COLOR_BAR                  0x01
> > +
> > +#define REG_NULL                                        0xFF
> > +
> > +#define ov02a10_LANES                                   1
> > +#define ov02a10_BITS_PER_SAMPLE                         10
> 
> I prefer using capital letters in macro.
> 

Fixed in next release.

> > +
> > +static const char * const ov02a10_supply_names[] = {
> > +	"avdd",		/* Analog power */
> > +	"dovdd",	/* Digital I/O power */
> > +	"dvdd",		/* Digital core power */
> > +};
> > +
> > +#define ov02a10_NUM_SUPPLIES ARRAY_SIZE(ov02a10_supply_names)
> > +
> > +struct regval {
> > +	u16 addr;
> > +	u8 val;
> > +};
> > +
> > +struct ov02a10_mode {
> > +	u32 width;
> > +	u32 height;
> > +	u32 exp_def;
> > +	u32 hts_def;
> > +	u32 vts_def;
> > +	const struct regval *reg_list;
> > +};
> > +
> > +struct ov02a10 {
> > +	struct i2c_client	*client;
> > +	struct clk		*xvclk;
> > +	struct gpio_desc	*pwdn_gpio;
> > +	struct gpio_desc	*reset_gpio;
> > +	struct regulator_bulk_data supplies[ov02a10_NUM_SUPPLIES];
> > +
> > +	bool			streaming;
> > +	bool			upside_down;
> > +
> > +	/*
> > +	 * Serialize control access, get/set format, get selection
> > +	 * and start streaming.
> > +	 */
> > +	struct mutex		mutex;
> > +	struct v4l2_subdev	subdev;
> > +	struct media_pad	pad;
> > +	struct v4l2_ctrl	*anal_gain;
> > +	struct v4l2_ctrl	*exposure;
> > +	struct v4l2_ctrl	*hblank;
> > +	struct v4l2_ctrl	*vblank;
> > +	struct v4l2_ctrl	*test_pattern;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +
> > +	const struct ov02a10_mode *cur_mode;
> > +};
> > +
> > +#define to_ov02a10(sd) container_of(sd, struct ov02a10, subdev)
> > +
> > +/* test pattern output */
> > +static struct regval ov02a10_test_pattern_regs[] = {
> > +	{0xfd, 0x01},
> > +	{0x0d, 0x00},
> > +	{0xb6, 0x01},
> > +	{0x01, 0x01},
> > +	{0xfd, 0x01},
> > +	{0xac, 0x01},
> > +	{REG_NULL, 0x00}
> > +};
> > +
> > +/*
> > + * Xclk 24Mhz
> > + * Pclk 39Mhz
> > + * linelength 934(0x3a6)
> > + * framelength 1390(0x56E)
> > + * grabwindow_width 1600
> > + * grabwindow_height 1200
> > + * max_framerate 30fps
> > + * mipi_datarate per lane 780Mbps
> > + */
> > +static struct regval ov02a10_1600x1200_regs[] = {
> > +	{0xfd, 0x01},
> > +	{0xac, 0x00},
> > +	{0xfd, 0x00},
> > +	{0x2f, 0x29},
> > +	{0x34, 0x00},
> > +	{0x35, 0x21},
> > +	{0x30, 0x15},
> > +	{0x33, 0x01},
> > +	{0xfd, 0x01},
> > +	{0x44, 0x00},
> > +	{0x2a, 0x4c},
> > +	{0x2b, 0x1e},
> > +	{0x2c, 0x60},
> > +	{0x25, 0x11},
> > +	{0x03, 0x01},
> > +	{0x04, 0xae},
> > +	{0x09, 0x00},
> > +	{0x0a, 0x02},
> > +	{0x06, 0xa6},
> > +	{0x31, 0x00},
> > +	{0x24, 0x40},
> > +	{0x01, 0x01},
> > +	{0xfb, 0x73},
> > +	{0xfd, 0x01},
> > +	{0x16, 0x04},
> > +	{0x1c, 0x09},
> > +	{0x21, 0x42},
> > +	{0x12, 0x04},
> > +	{0x13, 0x10},
> > +	{0x11, 0x40},
> > +	{0x33, 0x81},
> > +	{0xd0, 0x00},
> > +	{0xd1, 0x01},
> > +	{0xd2, 0x00},
> > +	{0x50, 0x10},
> > +	{0x51, 0x23},
> > +	{0x52, 0x20},
> > +	{0x53, 0x10},
> > +	{0x54, 0x02},
> > +	{0x55, 0x20},
> > +	{0x56, 0x02},
> > +	{0x58, 0x48},
> > +	{0x5d, 0x15},
> > +	{0x5e, 0x05},
> > +	{0x66, 0x66},
> > +	{0x68, 0x68},
> > +	{0x6b, 0x00},
> > +	{0x6c, 0x00},
> > +	{0x6f, 0x40},
> > +	{0x70, 0x40},
> > +	{0x71, 0x0a},
> > +	{0x72, 0xf0},
> > +	{0x73, 0x10},
> > +	{0x75, 0x80},
> > +	{0x76, 0x10},
> > +	{0x84, 0x00},
> > +	{0x85, 0x10},
> > +	{0x86, 0x10},
> > +	{0x87, 0x00},
> > +	{0x8a, 0x22},
> > +	{0x8b, 0x22},
> > +	{0x19, 0xf1},
> > +	{0x29, 0x01},
> > +	{0xfd, 0x01},
> > +	{0x9d, 0x96},
> > +	{0xa0, 0x29},
> > +	{0xa1, 0x05},
> > +	{0xad, 0x62},
> > +	{0xae, 0x00},
> > +	{0xaf, 0x85},
> > +	{0xb1, 0x01},
> > +	{0x8e, 0x06},
> > +	{0x8f, 0x40},
> > +	{0x90, 0x04},
> > +	{0x91, 0xb0},
> > +	{0x45, 0x01},
> > +	{0x46, 0x00},
> > +	{0x47, 0x6c},
> > +	{0x48, 0x03},
> > +	{0x49, 0x8b},
> > +	{0x4a, 0x00},
> > +	{0x4b, 0x07},
> > +	{0x4c, 0x04},
> > +	{0x4d, 0xb7},
> > +	{0xf0, 0x40},
> > +	{0xf1, 0x40},
> > +	{0xf2, 0x40},
> > +	{0xf3, 0x40},
> > +	{0x3f, 0x00},
> > +	{0xfd, 0x01},
> > +	{0x05, 0x00},
> > +	{0x06, 0xa6},
> > +	{0xfd, 0x01},
> > +	{REG_NULL, 0x00}
> > +};
> > +
> > +#define ov02a10_LINK_FREQ_390MHZ		390000000
> How about OV02A10_LINK_FREQ_390MHZ?
> 

Fixed in next release.

> > +static const s64 link_freq_menu_items[] = {
> > +	ov02a10_LINK_FREQ_390MHZ
> > +};
> > +
> > +static const char * const ov02a10_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Color Bar",
> > +};
> > +
> > +static const int ov02a10_test_pattern_val[] = {
> > +	ov02a10_TEST_PATTERN_DISABLED,
> > +	ov02a10_TEST_PATTERN_COLOR_BAR,
> > +};
> This array is not needed, as the index align with the actual pattern value.

Fixed in next release.

> > +
> > +static const struct ov02a10_mode supported_modes[] = {
> > +	{
> > +		.width = 1600,
> > +		.height = 1200,
> > +		.exp_def = 0x01ae,
> > +		.hts_def = 0x03a6,
> > +		.vts_def = 0x056e,
> > +		.reg_list = ov02a10_1600x1200_regs,
> > +	},
> > +};
> > +
> > +/* write a register */
> > +static int ov02a10_write_reg(struct i2c_client *client, u8 addr, u8 val)
> > +{
> > +	u8 buf[2] = { addr, val };
> remove extra space

Fixed in next release.

> > +
> > +	int ret = i2c_master_send(client, buf, 2);
> > +
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "%s: error: reg=%x, val=%x\n",
> > +			__func__, addr, val);
> > +		return ret;
> > +	}
> > +
> > +	return ret == 2 ? 0 : ret;
> I think it is better to return an error code instead of ret for fail case.
> > +}
> > +
> > +static int ov02a10_write_array(struct i2c_client *client,
> > +			       const struct regval *regs)
> > +{
> > +	int ret = 0;
> > +	u32 i;
> > +
> > +	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++) {
> > +		ret = ov02a10_write_reg(client, regs[i].addr, regs[i].val);
> > +		if (ret < 0)
> > +			return ret;
> As no error message here and above, no any error message post for fail case.

Fixed in next release.

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* read a register */
> > +static int ov02a10_read_reg(struct i2c_client *client, u8 reg, u8 *val)
> > +{
> > +	int ret;
> > +	u8 data = reg;
> > +	struct i2c_msg msg = {
> > +		.addr	= client->addr,
> > +		.flags	= 0,
> > +		.len	= 1,
> > +		.buf	= &data,
> > +	};
> > +
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "i2c_transfer failed, ret %d\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	msg.flags = I2C_M_RD;
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "i2c_transfer --I2C_M_RD failed, \
> > +			ret %d\n", ret);
> Is it better squash this error message into goto?

The variable ret describes the i2c_transfer result of reading register.
If seperating the error msg to goto, then we may need to define another
one.

> > +		goto err;
> > +	}
> > +
> > +	*val = data;
> > +	return 0;
> > +
> > +err:
> > +	dev_err(&client->dev, "Failed reading register 0x%02x!\n", reg);
> > +	return ret;
> > +}
> > +
> > +static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
> > +			     struct v4l2_mbus_framefmt *fmt)
> > +{
> > +	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +	fmt->width = mode->width;
> > +	fmt->height = mode->height;
> > +	fmt->field = V4L2_FIELD_NONE;
> > +}
> > +
> > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > +
> > +	/* only one mode supported for now */
> > +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > +
> > +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_pad_config *cfg,
> > +				  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->index >= ARRAY_SIZE(supported_modes))
> > +		return -EINVAL;
> > +
> > +	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_enum_frame_sizes(struct v4l2_subdev *sd,
> > +				    struct v4l2_subdev_pad_config *cfg,
> > +				    struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	int index = fse->index;
> > +
> > +	if (index >= ARRAY_SIZE(supported_modes))
> > +		return -EINVAL;
> > +
> > +	fse->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +
> > +	fse->min_width  = supported_modes[index].width;
> > +	fse->max_width  = supported_modes[index].width;
> > +	fse->max_height = supported_modes[index].height;
> > +	fse->min_height = supported_modes[index].height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int __ov02a10_power_on(struct ov02a10 *ov02a10)
> > +{
> > +	int ret;
> > +
> > +	struct device *dev = &ov02a10->client->dev;
> > +
> > +	ret = clk_prepare_enable(ov02a10->xvclk);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to enable xvclk\n");
> > +		return ret;
> > +	}
> > +
> > +	/* note: set 0 is high, set 1 is low */
> > +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
> > +	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 0);
> > +
> > +	ret = regulator_bulk_enable(ov02a10_NUM_SUPPLIES, ov02a10->supplies);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to enable regulators\n");
> > +		goto disable_clk;
> > +	}
> > +	usleep_range(7 * 1000, 8 * 1000);
> > +
> > +	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 1);
> > +	usleep_range(10 * 1000, 12 * 1000);
> > +
> > +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 0);
> > +	usleep_range(10 * 1000, 12 * 1000);
> > +
> > +#ifdef SENSOR_HARDWARE_RESET
> what is the purpose this macro? My understanding - if reset_gpio is not
> NULL, driver should do hardware reset.

Sorry that this is hardware reset mechanism. Here we didn't use it.
This would be fixed in next release.

> > +	/* sensor hardware reset */
> > +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
> > +	usleep_range(10 * 1000, 12 * 1000);
> > +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 0);
> > +	usleep_range(10 * 1000, 12 * 1000);
> > +#endif
> > +
> Could you clean up the usleep_range value here? If you want to need
> bigger sleep, you can use msleep.

Fixed in next release.

> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(ov02a10->xvclk);
> > +
> > +	return ret;
> > +}
> > +
> > +static void __ov02a10_power_off(struct ov02a10 *ov02a10)
> > +{
> > +	clk_disable_unprepare(ov02a10->xvclk);
> > +	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
> > +	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 1);
> > +	regulator_bulk_disable(ov02a10_NUM_SUPPLIES, ov02a10->supplies);
> > +}
> > +
> > +static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
> > +{
> > +	int ret;
> > +
> > +	ret = ov02a10_write_array(ov02a10->client, ov02a10->cur_mode->reg_list);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __v4l2_ctrl_handler_setup(&ov02a10->ctrl_handler);
> > +	if (ret) {
> > +		pr_err("__v4l2_ctrl_handler_setup fail %d\n", ret);
> dev_err?

Fixed in next release.

> > +		return ret;
> > +	}
> > +
> > +	return ov02a10_write_reg(ov02a10->client,
> > +				 REG_SC_CTRL_MODE, SC_CTRL_MODE_STREAMING);
> > +}
> > +
> > +static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
> > +{
> > +	return ov02a10_write_reg(ov02a10->client,
> > +				 REG_SC_CTRL_MODE, SC_CTRL_MODE_STANDBY);
> > +}
> > +
> > +static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +	struct i2c_client *client = ov02a10->client;
> > +	int ret = 0;
> > +
> > +	pr_info("ov02a10 s_stream-(%d)\n", on);
> remove this debug info, or use dev_dbg?
> > +	mutex_lock(&ov02a10->mutex);
> > +
> > +	if (ov02a10->streaming == !on) {
> You can runtime pm interface to check the power status.
> And I suggest use:
> if (on) {
> 	...
> 	return 0;
> }
> 
> /*stream off */
> ...
> 

Thanks for kind suggestions. Fixed in next release.

> > +		if (on) {
> > +			ret = pm_runtime_get_sync(&client->dev);
> > +			if (ret < 0) {
> > +				pm_runtime_put_noidle(&client->dev);
> > +				goto unlock_and_return;
> > +			}
> > +
> > +			ret = __ov02a10_start_stream(ov02a10);
> > +			if (ret) {
> > +				v4l2_err(sd, "start stream failed while write regs\n");
> > +				pm_runtime_put(&client->dev);
> > +				goto unlock_and_return;
> > +			}
> > +		} else {
> > +			__ov02a10_stop_stream(ov02a10);
> > +			pm_runtime_put(&client->dev);
> > +		}
> > +
> > +		ov02a10->streaming = on;
> > +	}
> > +
> > +unlock_and_return:
> > +	mutex_unlock(&ov02a10->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> > +static int ov02a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > +{
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +	struct v4l2_mbus_framefmt *try_fmt;
> > +
> > +	mutex_lock(&ov02a10->mutex);
> > +
> > +	try_fmt = v4l2_subdev_get_try_format(sd, fh->pad, 0);
> > +	/* Initialize try_fmt */
> > +	ov02a10_fill_fmt(&supported_modes[0], try_fmt);
> > +
> > +	mutex_unlock(&ov02a10->mutex);
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static int __maybe_unused ov02a10_runtime_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +
> > +	return __ov02a10_power_on(ov02a10);
> > +}
> > +
> > +static int __maybe_unused ov02a10_runtime_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +
> > +	if (ov02a10->streaming == 1) {
> > +		__ov02a10_stop_stream(ov02a10);
> Why not use ov02a10_s_stream?

This func is to suspend, thus we need to stop streaming.
And __ov02a10_stop_stream interface is also called by ov02a10_s_stream.

> > +		ov02a10->streaming = 0;
> > +	}
> > +	__ov02a10_power_off(ov02a10);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ov02a10_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(ov02a10_runtime_suspend,
> > +			   ov02a10_runtime_resume, NULL)
> > +};
> > +
> > +static int ov02a10_mod_reg(struct ov02a10 *ov02a10, u16 reg,
> > +			   u8 mask, u8 val)
> indent issue
> 

Fixed in next release.

> > +{
> > +	u8 read_val;
> > +	int ret;
> > +
> > +	ret = ov02a10_read_reg(ov02a10->client, reg, &read_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	read_val &= ~mask;
> > +	val &= mask;
> > +	val |= read_val;
> > +
> > +	return ov02a10_write_reg(ov02a10->client, reg, val);
> > +}
> > +
> > +/* mirror & flip reg setting effective */
> > +static int ov02a10_bayer_order(struct ov02a10 *ov02a10)
> > +{
> > +	int ret;
> > +
> > +	ret = ov02a10_write_reg(ov02a10->client,
> > +				OV02A10_REG_UPDOWN_MIRROR_ENABLE,
> > +				SC_CTRL_MODE_STREAMING);
> 
> SC_CTRL_MODE_STRAMING? Is it correct?
> 

Fixed in next release.

> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_set_ctrl_hflip(struct ov02a10 *ov02a10, int value)
> > +{
> > +	/*
> > +	 * If sensor is mounted upside down, mirror logic is inversed.
> > +	 *
> > +	 * Sensor is a BSI (Back Side Illuminated) one,
> > +	 * so image captured is physically mirrored.
> > +	 * This is why mirror logic is inversed in
> > +	 * order to cancel this mirror effect.
> > +	 */
> > +
> > +	/*
> > +	 * P1: 0x3F:
> > +	 * - [1]:	Vertical upside down
> > +	 * - [0]:	Horizontal mirror
> > +	 */
> Move this comment above?

Fixed in next release.

> > +
> > +	int ret;
> > +
> > +	ret = ov02a10_mod_reg(ov02a10, OV02A10_REG_UPDOWN_MIRROR,
> > +			      BIT(0),
> > +			      (!(value ^ ov02a10->upside_down)) ?
> > +			      BIT(0) : 0);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return ov02a10_bayer_order(ov02a10);
> > +}
> > +
> > +static int ov02a10_set_ctrl_vflip(struct ov02a10 *ov02a10, int value)
> > +{
> > +	/* If sensor is mounted upside down, flip logic is inversed */
> > +
> > +	/*
> > +	 * P1: 0x3F:
> > +	 * - [1]:	Vertical upside down
> > +	 * - [0]:	Horizontal mirror
> > +	 */
> Same as above.

Fixed in next release.

> > +
> > +	int ret;
> > +
> > +	ret = ov02a10_mod_reg(ov02a10, OV02A10_REG_UPDOWN_MIRROR,
> > +			      BIT(1),
> > +			      (value ^ ov02a10->upside_down) ?
> > +			      BIT(1) : 0);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return ov02a10_bayer_order(ov02a10);
> > +}
> > +
> > +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, s32 value)
> > +{
> > +	int ret = 0;
> > +
> > +	if (value)
> > +		return ov02a10_write_array(ov02a10->client,
> > +					   ov02a10_test_pattern_regs);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct ov02a10 *ov02a10 = container_of(ctrl->handler,
> > +					     struct ov02a10, ctrl_handler);
> > +	struct i2c_client *client = ov02a10->client;
> > +	s64 max_expo;
> > +	int ret = 0;
> > +
> > +	/* Propagate change of current control to all related controls */
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_VBLANK:
> > +		/* Update max exposure while meeting expected vblanking */
> > +		max_expo = ov02a10->cur_mode->height + ctrl->val - 4;
> > +		__v4l2_ctrl_modify_range(ov02a10->exposure,
> > +					 ov02a10->exposure->minimum, max_expo,
> > +					 ov02a10->exposure->step,
> > +					 ov02a10->exposure->default_value);
> > +		break;
> > +	}
> > +
> > +	if (pm_runtime_get_if_in_use(&client->dev) <= 0)
> > +		return 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_EXPOSURE:
> > +		ret = ov02a10_write_reg(client, 0xfd, 0x01);
> > +		if (ret < 0)
> > +			return ret;
> > +		ret = ov02a10_write_reg(client, ov02a10_REG_EXPOSURE_H,
> > +					((ctrl->val >> 8) & 0xFF));
> > +		if (!ret) {
> > +			ret = ov02a10_write_reg(client, ov02a10_REG_EXPOSURE_L,
> > +						(ctrl->val & 0xFF));
> > +			if (ret < 0)
> > +				return ret;
> > +		}
> > +		ret = ov02a10_write_reg(client, 0x01, 0x01);
> > +		if (ret < 0)
> > +			return ret;
> > +		break;
> > +	case V4L2_CID_ANALOGUE_GAIN:
> > +		ret = ov02a10_write_reg(client, 0xfd, 0x01);
> > +		if (ret < 0)
> > +			return ret;
> > +		ret = ov02a10_write_reg(client, ov02a10_REG_GAIN,
> > +					(ctrl->val & 0xFF));
> > +		if (ret < 0)
> > +			return ret;
> > +		ret = ov02a10_write_reg(client, 0x01, 0x01);
> > +		if (ret < 0)
> > +			return ret;
> > +		break;
> > +	case V4L2_CID_VBLANK:
> > +		ret = ov02a10_write_reg(client, 0xfd, 0x01);
> > +		if (ret < 0)
> > +			return ret;
> > +		ret = ov02a10_write_reg(client, ov02a10_REG_VTS_H,
> > +					(((ctrl->val +
> > +					ov02a10->cur_mode->height - 1224) >> 8)
> > +					& 0xFF));
> > +		if (!ret) {
> > +			ret = ov02a10_write_reg(client, ov02a10_REG_VTS_L,
> > +						((ctrl->val +
> > +						ov02a10->cur_mode->height -
> > +						1224) & 0xFF));
> > +			if (ret < 0)
> > +				return ret;
> > +		}
> > +		ret = ov02a10_write_reg(client, 0x01, 0x01);
> > +		if (ret < 0)
> > +			return ret;
> > +		break;
> > +	case V4L2_CID_TEST_PATTERN:
> > +		ret =
> > +		 ov02a10_set_test_pattern(ov02a10,
> > +					  ov02a10_test_pattern_val[ctrl->val]);
> As comment above, you can use ctrl->val directly.

Fixed in next release.

> > +		break;
> > +	case V4L2_CID_HFLIP:
> > +		if (ov02a10->streaming)
> > +			return -EBUSY;
> > +		if (ctrl->val)
> > +			ret = ov02a10_set_ctrl_hflip(ov02a10, ctrl->val);
> > +		break;
> > +	case V4L2_CID_VFLIP:
> > +		if (ov02a10->streaming)
> > +			return -EBUSY;
> > +		if (ctrl->val)
> > +			ret = ov02a10_set_ctrl_vflip(ov02a10, ctrl->val);
> > +		break;
> > +	default:
> > +		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> > +			 __func__, ctrl->id, ctrl->val);
> > +		ret = -EINVAL;
> > +		break;
> > +	};
> > +
> > +	pm_runtime_put(&client->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ov02a10_video_ops = {
> > +	.s_stream = ov02a10_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ov02a10_pad_ops = {
> > +	.enum_mbus_code = ov02a10_enum_mbus_code,
> > +	.enum_frame_size = ov02a10_enum_frame_sizes,
> > +	.get_fmt = ov02a10_get_fmt,
> > +	.set_fmt = ov02a10_set_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ov02a10_subdev_ops = {
> > +	.video	= &ov02a10_video_ops,
> > +	.pad	= &ov02a10_pad_ops,
> > +};
> > +
> > +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> > +static const struct v4l2_subdev_internal_ops ov02a10_internal_ops = {
> > +	.open = ov02a10_open,
> > +};
> > +#endif
> > +
> > +static const struct v4l2_ctrl_ops ov02a10_ctrl_ops = {
> > +	.s_ctrl = ov02a10_set_ctrl,
> > +};
> > +
> > +static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
> > +{
> > +	const struct ov02a10_mode *mode;
> > +	struct v4l2_ctrl_handler *handler;
> > +	struct v4l2_ctrl *ctrl;
> > +	u64 exposure_max;
> > +	u32 pixel_rate, h_blank;
> > +	int ret;
> > +
> > +	handler = &ov02a10->ctrl_handler;
> > +	mode = ov02a10->cur_mode;
> > +	ret = v4l2_ctrl_handler_init(handler, 8);
> > +	if (ret)
> > +		return ret;
> > +	handler->lock = &ov02a10->mutex;
> > +
> > +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> > +				      0, 0, link_freq_menu_items);
> > +	if (ctrl)
> > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	pixel_rate = (link_freq_menu_items[0] * 2 * ov02a10_LANES) /
> > +		     ov02a10_BITS_PER_SAMPLE;
> > +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> > +			  0, pixel_rate, 1, pixel_rate);
> > +
> > +	h_blank = mode->hts_def - mode->width;
> > +	ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> > +					    h_blank, h_blank, 1, h_blank);
> > +	if (ov02a10->hblank)
> > +		ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > +					    V4L2_CID_VBLANK, mode->vts_def -
> > +					    mode->height,
> > +					    ov02a10_VTS_MAX - mode->height, 1,
> > +					    mode->vts_def - mode->height);
> > +
> > +	exposure_max = mode->vts_def - 4;
> > +	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > +					      V4L2_CID_EXPOSURE,
> > +					      ov02a10_EXPOSURE_MIN,
> > +					      exposure_max,
> > +					      ov02a10_EXPOSURE_STEP,
> > +					      mode->exp_def);
> > +
> > +	ov02a10->anal_gain = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > +					       V4L2_CID_ANALOGUE_GAIN,
> > +					       ov02a10_GAIN_MIN,
> > +					       ov02a10_GAIN_MAX,
> > +					       ov02a10_GAIN_STEP,
> > +					       ov02a10_GAIN_DEFAULT);
> > +
> > +	ov02a10->test_pattern =
> > +	   v4l2_ctrl_new_std_menu_items(handler,
> > +					&ov02a10_ctrl_ops,
> > +					V4L2_CID_TEST_PATTERN,
> > +					ARRAY_SIZE(ov02a10_test_pattern_menu) -
> > +					1, 0, 0, ov02a10_test_pattern_menu);
> > +
> > +	if (handler->error) {
> > +		ret = handler->error;
> > +		dev_err(&ov02a10->client->dev,
> > +			"Failed to init controls(%d)\n", ret);
> > +		goto err_free_handler;
> > +	}
> > +
> > +	ov02a10->subdev.ctrl_handler = handler;
> > +
> > +	return 0;
> > +
> > +err_free_handler:
> > +	v4l2_ctrl_handler_free(handler);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10,
> > +				   struct i2c_client *client)
> > +{
> > +	struct device *dev = &ov02a10->client->dev;
> > +	u8 pid = 0;
> > +	u8 ver = 0;
> > +	int ret;
> > +
> > +	/* Check sensor revision */
> > +	ret = ov02a10_read_reg(client, OV02A10_REG_CHIP_ID_H, &pid);
> > +	if (!ret)
> > +		ret = ov02a10_read_reg(client, OV02A10_REG_CHIP_ID_L, &ver);
> > +
> > +	if (!ret) {
> > +		unsigned short id;
> > +
> > +		id = OV02A10_ID(pid, ver);
> > +		dev_info(dev, "ov02a10_sensor id(%04x)\n", id);
> dev_dbg

Fixed in next release.

> > +		if (id != CHIP_ID) {
> > +			dev_err(dev, "Unexpected sensor id(%04x), ret(%d)\n",
> > +				id, ret);
> > +			return ret;
> > +		}
> > +		dev_info(dev, "Detected OV%04X sensor\n", id);
> dev_dbg

Fixed in next release.

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ov02a10_configure_regulators(struct ov02a10 *ov02a10)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ov02a10_NUM_SUPPLIES; i++)
> > +		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > +
> > +	return devm_regulator_bulk_get(&ov02a10->client->dev,
> > +				       ov02a10_NUM_SUPPLIES,
> > +				       ov02a10->supplies);
> > +}
> > +
> > +static int ov02a10_probe(struct i2c_client *client,
> > +			 const struct i2c_device_id *id)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct ov02a10 *ov02a10;
> > +	u32 rotation;
> > +	int ret;
> > +
> > +	dev_info(dev, "ov02a10 probe ++\n");
> dev_dbg, remove ++

Fixed in next release.

> > +	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > +	if (!ov02a10)
> > +		return -ENOMEM;
> > +
> > +	ov02a10->client = client;
> > +	ov02a10->cur_mode = &supported_modes[0];
> > +
> > +	/* optional indication of physical rotation of sensor */
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
> > +				       &rotation);
> > +	if (!ret) {
> > +		switch (rotation) {
> > +		case 180:
> > +			ov02a10->upside_down = true;
> > +			/* fall through */
> > +		case 0:
> > +			break;
> > +		default:
> > +			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
> > +				 rotation);
> > +		}
> > +	}
> > +
> > +	ov02a10->xvclk = devm_clk_get(dev, "xvclk");
> > +	if (IS_ERR(ov02a10->xvclk)) {
> > +		dev_err(dev, "Failed to get xvclk\n");
> > +		return -EINVAL;
> > +	}
> > +	ret = clk_set_rate(ov02a10->xvclk, ov02a10_XVCLK_FREQ);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to set xvclk rate (24MHz)\n");
> > +		return ret;
> > +	}
> > +	if (clk_get_rate(ov02a10->xvclk) != ov02a10_XVCLK_FREQ)
> > +		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
> > +
> > +	ov02a10->pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_OUT_LOW);
> > +	if (IS_ERR(ov02a10->pwdn_gpio)) {
> > +		dev_err(dev, "Failed to get powerdown-gpios\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ov02a10->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(ov02a10->reset_gpio)) {
> > +		dev_err(dev, "Failed to get reset-gpios\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = ov02a10_configure_regulators(ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to get power regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	mutex_init(&ov02a10->mutex);
> > +	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > +	ret = ov02a10_initialize_controls(ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to initialize controls\n");
> > +		goto err_destroy_mutex;
> > +	}
> > +
> > +	ret = __ov02a10_power_on(ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to power on\n");
> > +		goto err_free_handler;
> > +	}
> > +
> > +	ret = ov02a10_check_sensor_id(ov02a10, client);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to detect id, go to power off\n");
> > +		goto err_power_off;
> > +	}
> > +
> > +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> > +	ov02a10->subdev.internal_ops = &ov02a10_internal_ops;
> > +	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +#endif
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed init pads\n");
> > +		goto err_power_off;
> > +	}
> > +#endif
> > +
> > +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > +	if (ret) {
> > +		dev_err(dev, "v4l2 async register subdev failed\n");
> > +		goto err_clean_entity;
> > +	}
> > +
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +	pm_runtime_idle(dev);
> > +	dev_info(dev, "ov02a10 probe --\n");
> dev_dbg, and other dev_info().

Fixed in next release.

> > +
> > +	return 0;
> > +
> > +err_clean_entity:
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +	media_entity_cleanup(&ov02a10->subdev.entity);
> > +#endif
> > +err_power_off:
> > +	__ov02a10_power_off(ov02a10);
> > +err_free_handler:
> > +	v4l2_ctrl_handler_free(&ov02a10->ctrl_handler);
> > +err_destroy_mutex:
> > +	mutex_destroy(&ov02a10->mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ov02a10_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +	media_entity_cleanup(&sd->entity);
> > +#endif
> > +	v4l2_ctrl_handler_free(&ov02a10->ctrl_handler);
> > +	mutex_destroy(&ov02a10->mutex);
> > +
> > +	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		__ov02a10_power_off(ov02a10);
> > +	pm_runtime_set_suspended(&client->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +#if IS_ENABLED(CONFIG_OF)
> > +static const struct of_device_id ov02a10_of_match[] = {
> > +	{ .compatible = "ovti,ov02a10" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, ov02a10_of_match);
> > +#endif
> > +
> > +static struct i2c_driver ov02a10_i2c_driver = {
> > +	.driver = {
> > +		.name = "ov02a10",
> > +		.pm = &ov02a10_pm_ops,
> > +		.of_match_table = of_match_ptr(ov02a10_of_match),
> > +	},
> > +	.probe		= &ov02a10_probe,
> > +	.remove		= &ov02a10_remove,
> > +};
> > +
> > +module_i2c_driver(ov02a10_i2c_driver);
> > +
> > +MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
> > +MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
> > +MODULE_LICENSE("GPL v2");
> > 


