Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7F42701C7
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 18:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgIRQO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 12:14:28 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40546 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgIRQOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 12:14:02 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 787F33A6920;
        Fri, 18 Sep 2020 14:25:48 +0000 (UTC)
Received: from pc-2.home (lfbn-tou-1-1532-46.w90-89.abo.wanadoo.fr [90.89.95.46])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 53901240014;
        Fri, 18 Sep 2020 14:25:23 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 3/3] media: i2c: Introduce a driver for the Techwell TW9900 decoder
Date:   Fri, 18 Sep 2020 16:24:22 +0200
Message-Id: <20200918142422.1086555-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
References: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Techwell video decoder supports PAL, NTSC and SECAM input formats,
and outputs a BT.656 signal.

This commit adds support for this device, based on an implementation
made by Rockchip. This implemention adds basic support for NTSC and PAL,
and some basic brightness and contrast controls.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/media/i2c/Kconfig  |   9 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/tw9900.c | 671 +++++++++++++++++++++++++++++++++++++
 3 files changed, 681 insertions(+)
 create mode 100644 drivers/media/i2c/tw9900.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c7ba76fee599..9b9f97fa4335 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -426,6 +426,15 @@ config VIDEO_TW2804
 	  To compile this driver as a module, choose M here: the
 	  module will be called tw2804.
 
+config VIDEO_TW9900
+	tristate "Techwell TW9900 video decoder"
+	depends on VIDEO_V4L2 && I2C
+	help
+	  Support for the Techwell tw9900 multi-standard video decoder
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called tw9900.
+
 config VIDEO_TW9903
 	tristate "Techwell TW9903 video decoder"
 	depends on VIDEO_V4L2 && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index f0a77473979d..cbc1d9aedd38 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_VIDEO_TVP5150) += tvp5150.o
 obj-$(CONFIG_VIDEO_TVP514X) += tvp514x.o
 obj-$(CONFIG_VIDEO_TVP7002) += tvp7002.o
 obj-$(CONFIG_VIDEO_TW2804) += tw2804.o
+obj-$(CONFIG_VIDEO_TW9900) += tw9900.o
 obj-$(CONFIG_VIDEO_TW9903) += tw9903.o
 obj-$(CONFIG_VIDEO_TW9906) += tw9906.o
 obj-$(CONFIG_VIDEO_TW9910) += tw9910.o
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
new file mode 100644
index 000000000000..950a7bbda80d
--- /dev/null
+++ b/drivers/media/i2c/tw9900.c
@@ -0,0 +1,671 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Techwell TW9900 multi-standard video decoder.
+ *
+ * Copyright (C) 2018 Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/sysfs.h>
+#include <linux/timer.h>
+#include <linux/delay.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#define TW9900_REG_CHIP_ID	0x00
+#define TW9900_REG_CHIP_STATUS  0x01
+#define		TW9900_REG_CHIP_STATUS_VLOCK	0x08
+#define		TW9900_REG_CHIP_STATUS_VDLOSS	0x80
+#define TW9900_REG_OUT_FMT_CTL  0x03
+#define TW9900_REG_CKHY_HSDLY   0x04
+#define TW9900_REG_OUT_CTRL_I	0x05
+#define TW9900_REG_ANALOG_CTL   0x06
+#define TW9900_REG_CROP_HI	0x07
+#define TW9900_REG_VDELAY_LO    0x08
+#define TW9900_REG_VACTIVE_LO   0x09
+#define TW9900_REG_HACTIVE_LO	0x0B
+#define TW9900_REG_CNTRL1	0x0C
+#define TW9900_REG_BRIGHT_CTL   0x10
+#define TW9900_REG_CONTRAST_CTL 0x11
+#define TW9900_REG_VBI_CNTL	0x19
+#define TW9900_REG_ANAL_CTL_II  0x1A
+#define TW9900_REG_OUT_CTRL_II	0x1B
+#define TW9900_REG_STD_SEL      0x1C
+#define TW9900_REG_MISSCNT      0x26
+#define TW9900_REG_MISC_CTL_II  0x2F
+#define TW9900_REG_VVBI         0x55
+
+#define TW9900_CHIP_ID		0x00
+
+#define REG_SC_CTRL_MODE		TW9900_REG_OUT_FMT_CTL
+#define     SC_CTRL_MODE_STANDBY	0xA7
+#define     SC_CTRL_MODE_STREAMING	0xA0
+
+#define REG_NULL			0xFF
+
+#define VSYNC_POLL_INTERVAL_MS  20
+#define VSYNC_WAIT_MAX_POLLS    50
+
+static const char * const tw9900_supply_names[] = {
+	"vdd",
+};
+
+#define TW9900_NUM_SUPPLIES ARRAY_SIZE(tw9900_supply_names)
+
+struct regval {
+	u8 addr;
+	u8 val;
+};
+
+struct tw9900_mode {
+	u32 width;
+	u32 height;
+	u32 skip_top;
+	u32 std;
+	u32 field;
+	const struct regval *reg_list;
+};
+
+struct tw9900 {
+	struct i2c_client	*client;
+	struct gpio_desc	*reset_gpio;
+	struct regulator_bulk_data supplies[TW9900_NUM_SUPPLIES];
+
+	bool			streaming;
+
+	struct v4l2_subdev	subdev;
+	struct v4l2_ctrl_handler hdl;
+	struct media_pad	pad;
+
+	struct timer_list timer;
+	struct work_struct work_i2c_poll;
+
+	const struct tw9900_mode *cur_mode;
+};
+
+#define to_tw9900(sd) container_of(sd, struct tw9900, subdev)
+
+static const struct regval tw9900_init_regs[] = {
+	{TW9900_REG_MISC_CTL_II,	0xE6},
+	{TW9900_REG_MISSCNT,		0x24},
+	{TW9900_REG_OUT_FMT_CTL,	0xA7},
+	{TW9900_REG_ANAL_CTL_II,	0x0A},
+	{TW9900_REG_VDELAY_LO,		0x19},
+	{TW9900_REG_STD_SEL,		0x00},
+	{TW9900_REG_VACTIVE_LO,		0xF0},
+	{TW9900_REG_STD_SEL,		0x07},
+	{TW9900_REG_CKHY_HSDLY,		0x40},
+	{TW9900_REG_ANALOG_CTL,		0x80},
+	{TW9900_REG_CNTRL1,		0xdc},
+	{TW9900_REG_OUT_CTRL_I,		0x98},
+	{REG_NULL, 0x0},
+};
+
+static const struct regval tw9900_yuv_regs[] = {
+	{REG_NULL, 0x0},
+};
+
+static const struct regval tw9900_pal_regs[] = {
+	{TW9900_REG_STD_SEL, 0x01},
+	{REG_NULL, 0x0},
+};
+
+static const struct regval tw9900_ntsc_regs[] = {
+	{TW9900_REG_OUT_FMT_CTL, 0xA4},
+	{TW9900_REG_VDELAY_LO, 0x12},
+	{TW9900_REG_VACTIVE_LO, 0xf0},
+	{TW9900_REG_CROP_HI, 0x02},
+	{TW9900_REG_HACTIVE_LO, 0xD0},
+	{TW9900_REG_VBI_CNTL, 0x01},
+	{TW9900_REG_STD_SEL, 0x00},
+	{REG_NULL, 0x0},
+};
+
+static const struct tw9900_mode supported_modes[] = {
+	{
+		.width = 720,
+		.height = 576,
+		.skip_top = 0,
+		.std = V4L2_STD_PAL,
+		.field = V4L2_FIELD_NONE,
+		.reg_list = tw9900_pal_regs,
+	},
+	{
+		.width = 720,
+		.height = 480,
+		.skip_top = 0,
+		.std = V4L2_STD_NTSC,
+		.field = V4L2_FIELD_NONE,
+		.reg_list = tw9900_ntsc_regs,
+	},
+};
+
+static int tw9900_write_reg(struct i2c_client *client, u8 reg, u8 val)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, reg, val);
+
+	if (ret < 0)
+		dev_err(&client->dev, "write reg error: %d\n", ret);
+
+	return ret;
+}
+
+static int tw9900_write_array(struct i2c_client *client,
+			      const struct regval *regs)
+{
+	int i, ret = 0;
+
+	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++)
+		ret = tw9900_write_reg(client, regs[i].addr, regs[i].val);
+
+	return ret;
+}
+
+static inline u8 tw9900_read_reg(struct i2c_client *client, u8 reg)
+{
+	return i2c_smbus_read_byte_data(client, reg);
+}
+
+static void tw9900_fill_fmt(const struct tw9900_mode *mode,
+			    struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = mode->field;
+	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
+}
+
+static int tw9900_find_closest_mode_index(u32 width, u32 height)
+{
+	int i, best_score = 0, score, best = 0;
+
+	for (i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		score = abs(supported_modes[i].width - width) +
+			abs(supported_modes[i].height - height);
+
+		if (best_score > score) {
+			best_score = score;
+			best = i;
+		}
+	}
+
+	return best;
+}
+
+static int tw9900_find_mode_index(u32 width, u32 height)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
+		if (supported_modes[i].width == width &&
+		    supported_modes[i].height == height)
+			return i;
+
+	/* No match, find the closestmatch */
+	return tw9900_find_closest_mode_index(width, height);
+}
+
+static int tw9900_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
+	int mode_index = tw9900_find_mode_index(mbus_fmt->width,
+						mbus_fmt->height);
+
+	if (mode_index < 0)
+		return -EINVAL;
+
+	tw9900->cur_mode = &supported_modes[mode_index];
+
+	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+
+	/* Update the dimensions in case we don't have a perfect match */
+	mbus_fmt->width = tw9900->cur_mode->width;
+	mbus_fmt->height = tw9900->cur_mode->height;
+
+	return 0;
+}
+
+static int tw9900_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
+
+	tw9900_fill_fmt(tw9900->cur_mode, mbus_fmt);
+
+	return 0;
+}
+
+static int tw9900_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
+
+	return 0;
+}
+
+static int tw9900_enum_frame_sizes(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	u32 index = fse->index;
+
+	if (index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	fse->code = MEDIA_BUS_FMT_UYVY8_2X8;
+
+	fse->min_width  = supported_modes[index].width;
+	fse->max_width  = supported_modes[index].width;
+	fse->max_height = supported_modes[index].height;
+	fse->min_height = supported_modes[index].height;
+
+	return 0;
+}
+
+static int tw9900_g_skip_top_lines(struct v4l2_subdev *sd, u32 *lines)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+
+	*lines = tw9900->cur_mode->skip_top;
+
+	return 0;
+}
+
+static int __tw9900_power_on(struct tw9900 *tw9900)
+{
+	int ret;
+	struct device *dev = &tw9900->client->dev;
+
+	if (tw9900->reset_gpio)
+		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
+
+	ret = regulator_bulk_enable(TW9900_NUM_SUPPLIES, tw9900->supplies);
+	if (ret < 0)
+		goto error;
+
+	usleep_range(50000, 52000);
+
+	if (tw9900->reset_gpio)
+		gpiod_set_value_cansleep(tw9900->reset_gpio, 0);
+
+	usleep_range(1000, 2000);
+
+	ret = tw9900_write_array(tw9900->client, tw9900_init_regs);
+	if (ret) {
+		dev_err(dev, "Failed to init tw9900\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+
+	return ret;
+}
+
+static void __tw9900_power_off(struct tw9900 *tw9900)
+{
+	if (tw9900->reset_gpio)
+		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
+
+	regulator_bulk_disable(TW9900_NUM_SUPPLIES, tw9900->supplies);
+}
+
+static int tw9900_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct tw9900 *tw9900 = container_of(ctrl->handler, struct tw9900, hdl);
+
+	if (pm_runtime_suspended(&tw9900->client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_BRIGHTNESS:
+		tw9900_write_reg(tw9900->client, 0x10, (u8)ctrl->val);
+		break;
+	case V4L2_CID_CONTRAST:
+		tw9900_write_reg(tw9900->client, 0x11, (u8)ctrl->val);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+	struct i2c_client *client = tw9900->client;
+	int i, ret = 0;
+
+	on = !!on;
+	if (on == tw9900->streaming)
+		goto unlock_and_return;
+
+	if (on) {
+		ret = pm_runtime_get_sync(&tw9900->client->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(&client->dev);
+			goto unlock_and_return;
+		}
+
+		ret = v4l2_ctrl_handler_setup(sd->ctrl_handler);
+		if (ret) {
+			pm_runtime_put(&client->dev);
+			goto unlock_and_return;
+		}
+
+		ret = tw9900_write_array(tw9900->client,
+					 tw9900->cur_mode->reg_list);
+		if (ret) {
+			pm_runtime_put(&client->dev);
+			goto unlock_and_return;
+		}
+
+		/* Wait for VSync lock */
+		for (i = 0; i < VSYNC_WAIT_MAX_POLLS; i++) {
+			u8 status = tw9900_read_reg(tw9900->client,
+						    TW9900_REG_CHIP_STATUS);
+			if (!(status & TW9900_REG_CHIP_STATUS_VDLOSS) &&
+			    (status & TW9900_REG_CHIP_STATUS_VLOCK))
+				break;
+
+			msleep(VSYNC_POLL_INTERVAL_MS);
+		}
+
+		ret = tw9900_write_reg(client, REG_SC_CTRL_MODE,
+				       SC_CTRL_MODE_STREAMING);
+		if (ret) {
+			pm_runtime_put(&client->dev);
+			goto unlock_and_return;
+		}
+
+	} else {
+		tw9900_write_reg(client, REG_SC_CTRL_MODE,
+				 SC_CTRL_MODE_STANDBY);
+		pm_runtime_put(&client->dev);
+	}
+
+	tw9900->streaming = on;
+
+unlock_and_return:
+
+	return ret;
+}
+
+#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
+static int tw9900_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct tw9900 *tw9900 = to_tw9900(sd);
+	struct v4l2_mbus_framefmt *try_fmt;
+
+	try_fmt = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+
+	/* Initialize try_fmt */
+	tw9900_fill_fmt(tw9900->cur_mode, try_fmt);
+
+	return 0;
+}
+#endif
+
+static int tw9900_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tw9900 *tw9900 = to_tw9900(sd);
+
+	return __tw9900_power_on(tw9900);
+}
+
+static int tw9900_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tw9900 *tw9900 = to_tw9900(sd);
+
+	__tw9900_power_off(tw9900);
+
+	return 0;
+}
+
+static int tw9900_subscribe_event(struct v4l2_subdev *sd,
+				  struct v4l2_fh *fh,
+				  struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subdev_subscribe(sd, fh, sub);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct dev_pm_ops tw9900_pm_ops = {
+	SET_RUNTIME_PM_OPS(tw9900_runtime_suspend,
+			   tw9900_runtime_resume, NULL)
+};
+
+static const struct v4l2_subdev_core_ops tw9900_core_ops = {
+	.subscribe_event = tw9900_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops tw9900_video_ops = {
+	.s_stream = tw9900_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops tw9900_pad_ops = {
+	.enum_mbus_code = tw9900_enum_mbus_code,
+	.enum_frame_size = tw9900_enum_frame_sizes,
+	.get_fmt = tw9900_get_fmt,
+	.set_fmt = tw9900_set_fmt,
+};
+
+static struct v4l2_subdev_sensor_ops tw9900_sensor_ops = {
+	.g_skip_top_lines	= tw9900_g_skip_top_lines,
+};
+
+static const struct v4l2_subdev_ops tw9900_subdev_ops = {
+	.core	= &tw9900_core_ops,
+	.video	= &tw9900_video_ops,
+	.pad	= &tw9900_pad_ops,
+	.sensor = &tw9900_sensor_ops,
+};
+
+static const struct v4l2_ctrl_ops tw9900_ctrl_ops = {
+	.s_ctrl = tw9900_s_ctrl,
+};
+
+#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
+static const struct v4l2_subdev_internal_ops tw9900_internal_ops = {
+	.open = tw9900_open,
+};
+#endif
+
+static int tw9900_check_sensor_id(struct tw9900 *tw9900,
+				  struct i2c_client *client)
+{
+	struct device *dev = &tw9900->client->dev;
+	u8 id;
+
+	id = tw9900_read_reg(client, TW9900_CHIP_ID);
+
+	if (id != TW9900_CHIP_ID) {
+		dev_err(dev, "Wrong camera sensor id(%04x)\n", id);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "Detected TW9900 (%04x) sensor\n", TW9900_CHIP_ID);
+
+	return 0;
+}
+
+static int tw9900_configure_regulators(struct tw9900 *tw9900)
+{
+	u32 i;
+
+	for (i = 0; i < TW9900_NUM_SUPPLIES; i++)
+		tw9900->supplies[i].supply = tw9900_supply_names[i];
+
+	return devm_regulator_bulk_get(&tw9900->client->dev,
+				       TW9900_NUM_SUPPLIES,
+				       tw9900->supplies);
+}
+
+static int tw9900_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct v4l2_ctrl_handler *hdl;
+	struct tw9900 *tw9900;
+	int ret;
+
+	tw9900 = devm_kzalloc(dev, sizeof(*tw9900), GFP_KERNEL);
+	if (!tw9900)
+		return -ENOMEM;
+
+	tw9900->client = client;
+	tw9900->cur_mode = &supported_modes[0];
+
+	tw9900->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(tw9900->reset_gpio))
+		tw9900->reset_gpio = NULL;
+
+	ret = tw9900_configure_regulators(tw9900);
+	if (ret) {
+		dev_err(dev, "Failed to get power regulators\n");
+		return ret;
+	}
+
+	v4l2_i2c_subdev_init(&tw9900->subdev, client, &tw9900_subdev_ops);
+	tw9900->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+
+	hdl = &tw9900->hdl;
+
+	v4l2_ctrl_handler_init(hdl, 2);
+
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_BRIGHTNESS,
+			  -128, 127, 1, 0);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
+			  0, 255, 1, 0x60);
+
+	tw9900->subdev.ctrl_handler = hdl;
+	if (hdl->error) {
+		int err = hdl->error;
+
+		v4l2_ctrl_handler_free(hdl);
+		return err;
+	}
+
+	ret = __tw9900_power_on(tw9900);
+	if (ret)
+		return ret;
+
+	ret = tw9900_check_sensor_id(tw9900, client);
+	if (ret)
+		goto err_power_off;
+
+#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
+	tw9900->subdev.internal_ops = &tw9900_internal_ops;
+	tw9900->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+#endif
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	tw9900->pad.flags = MEDIA_PAD_FL_SOURCE;
+	tw9900->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ret = media_entity_pads_init(&tw9900->subdev.entity, 1, &tw9900->pad);
+	if (ret < 0)
+		goto err_power_off;
+#endif
+
+	ret = v4l2_async_register_subdev(&tw9900->subdev);
+	if (ret) {
+		dev_err(dev, "v4l2 async register subdev failed\n");
+		goto err_clean_entity;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_clean_entity:
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	media_entity_cleanup(&tw9900->subdev.entity);
+#endif
+err_power_off:
+	__tw9900_power_off(tw9900);
+
+	return ret;
+}
+
+static int tw9900_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct tw9900 *tw9900 = to_tw9900(sd);
+
+	v4l2_async_unregister_subdev(sd);
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	media_entity_cleanup(&sd->entity);
+#endif
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		__tw9900_power_off(tw9900);
+	pm_runtime_set_suspended(&client->dev);
+
+	return 0;
+}
+
+static const struct i2c_device_id tw9900_id[] = {
+	{"tw9900", 0},
+	{},
+};
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tw9900_of_match[] = {
+	{ .compatible = "techwell,tw9900" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tw9900_of_match);
+#endif
+
+static struct i2c_driver tw9900_i2c_driver = {
+	.driver = {
+		.name = "tw9900",
+		.pm = &tw9900_pm_ops,
+		.of_match_table = tw9900_of_match
+	},
+	.probe		= tw9900_probe,
+	.remove		= tw9900_remove,
+	.id_table	= tw9900_id,
+};
+
+module_i2c_driver(tw9900_i2c_driver);
+
+MODULE_DESCRIPTION("tw9900 sensor driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.4

