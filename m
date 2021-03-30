Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A5D34EA3A
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 16:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhC3OU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 10:20:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:27483 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231918AbhC3OUs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 10:20:48 -0400
IronPort-SDR: oT3QUe0/FvK6srrknITVCsaljLuLQ2Gp5qICmrwnisZxcyrsD6p6cqYAakJW4awCG4udi4ra9e
 DECGgYwyhqfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191805454"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="191805454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:20:44 -0700
IronPort-SDR: ZFts/ro8pfnvp3uVbM+T+Df+mpTHX4YCvTwIhfDOmuZZGs1wo6mymQ5gyvyBLM1pMmXvQei4e3
 HulzzUNpNhhA==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="418190264"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.1])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:20:41 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 6/6] media: i2c: Add ov9282 camera sensor driver
Date:   Tue, 30 Mar 2021 15:20:23 +0100
Message-Id: <20210330142023.141-7-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
References: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

Add a v4l2 sub-device driver for the OmniVisison ov9282
black&white image sensor.
The camera sensor uses the i2c bus for control and the
csi-2 bus for data.

The following features are supported:
- manual exposure and analog gain control support
- vblank/hblank/pixel rate/link freq control support
- supported resolution:
    - 1280x720 @ 30fps

Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |   14 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ov9282.c | 1134 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1150 insertions(+)
 create mode 100644 drivers/media/i2c/ov9282.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ece5c641a764..8010ea5bb9f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13428,6 +13428,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+F:	drivers/media/i2c/ov9282.c
 
 OMNIVISION OV9640 SENSOR DRIVER
 M:	Petr Cvek <petrcvekcz@gmail.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 3ba1abbf0fd1..06f0531e2119 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1116,6 +1116,20 @@ config VIDEO_OV8865
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov8865.
 
+config VIDEO_OV9282
+	tristate "OmniVision OV9282 sensor support"
+	depends on OF_GPIO
+	depends on I2C && VIDEO_V4L2
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV9282 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov9282.
+
 config VIDEO_OV9640
 	tristate "OmniVision OV9640 sensor support"
 	depends on I2C && VIDEO_V4L2
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 0556447c1089..2d43f0352605 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_OV772X) += ov772x.o
 obj-$(CONFIG_VIDEO_OV7740) += ov7740.o
 obj-$(CONFIG_VIDEO_OV8856) += ov8856.o
 obj-$(CONFIG_VIDEO_OV8865) += ov8865.o
+obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
 obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
 obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
 obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
new file mode 100644
index 000000000000..b1b1b624b248
--- /dev/null
+++ b/drivers/media/i2c/ov9282.c
@@ -0,0 +1,1134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * OmniVision ov9282 Camera Sensor Driver
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#include <asm/unaligned.h>
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+/* Streaming Mode */
+#define OV9282_REG_MODE_SELECT	0x0100
+#define OV9282_MODE_STANDBY	0x00
+#define OV9282_MODE_STREAMING	0x01
+
+/* Lines per frame */
+#define OV9282_REG_LPFR		0x380e
+
+/* Chip ID */
+#define OV9282_REG_ID		0x300a
+#define OV9282_ID		0x9281
+
+/* Exposure control */
+#define OV9282_REG_EXPOSURE	0x3500
+#define OV9282_EXPOSURE_MIN	1
+#define OV9282_EXPOSURE_OFFSET	12
+#define OV9282_EXPOSURE_STEP	1
+#define OV9282_EXPOSURE_DEFAULT	0x0282
+
+/* Analog gain control */
+#define OV9282_REG_AGAIN	0x3509
+#define OV9282_AGAIN_MIN	0x10
+#define OV9282_AGAIN_MAX	0xff
+#define OV9282_AGAIN_STEP	1
+#define OV9282_AGAIN_DEFAULT	0x10
+
+/* Group hold register */
+#define OV9282_REG_HOLD		0x3308
+
+/* Input clock rate */
+#define OV9282_INCLK_RATE	24000000
+
+/* CSI2 HW configuration */
+#define OV9282_LINK_FREQ	400000000
+#define OV9282_NUM_DATA_LANES	2
+
+#define OV9282_REG_MIN		0x00
+#define OV9282_REG_MAX		0xfffff
+
+/**
+ * struct ov9282_reg - ov9282 sensor register
+ * @address: Register address
+ * @val: Register value
+ */
+struct ov9282_reg {
+	u16 address;
+	u8 val;
+};
+
+/**
+ * struct ov9282_reg_list - ov9282 sensor register list
+ * @num_of_regs: Number of registers in the list
+ * @regs: Pointer to register list
+ */
+struct ov9282_reg_list {
+	u32 num_of_regs;
+	const struct ov9282_reg *regs;
+};
+
+/**
+ * struct ov9282_mode - ov9282 sensor mode structure
+ * @width: Frame width
+ * @height: Frame height
+ * @code: Format code
+ * @hblank: Horizontal blanking in lines
+ * @vblank: Vertical blanking in lines
+ * @vblank_min: Minimum vertical blanking in lines
+ * @vblank_max: Maximum vertical blanking in lines
+ * @pclk: Sensor pixel clock
+ * @link_freq_idx: Link frequency index
+ * @reg_list: Register list for sensor mode
+ */
+struct ov9282_mode {
+	u32 width;
+	u32 height;
+	u32 code;
+	u32 hblank;
+	u32 vblank;
+	u32 vblank_min;
+	u32 vblank_max;
+	u64 pclk;
+	u32 link_freq_idx;
+	struct ov9282_reg_list reg_list;
+};
+
+/**
+ * struct ov9282 - ov9282 sensor device structure
+ * @dev: Pointer to generic device
+ * @client: Pointer to i2c client
+ * @sd: V4L2 sub-device
+ * @pad: Media pad. Only one pad supported
+ * @reset_gpio: Sensor reset gpio
+ * @inclk: Sensor input clock
+ * @ctrl_handler: V4L2 control handler
+ * @link_freq_ctrl: Pointer to link frequency control
+ * @pclk_ctrl: Pointer to pixel clock control
+ * @hblank_ctrl: Pointer to horizontal blanking control
+ * @vblank_ctrl: Pointer to vertical blanking control
+ * @exp_ctrl: Pointer to exposure control
+ * @again_ctrl: Pointer to analog gain control
+ * @vblank: Vertical blanking in lines
+ * @cur_mode: Pointer to current selected sensor mode
+ * @mutex: Mutex for serializing sensor controls
+ * @streaming: Flag indicating streaming state
+ */
+struct ov9282 {
+	struct device *dev;
+	struct i2c_client *client;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct gpio_desc *reset_gpio;
+	struct clk *inclk;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq_ctrl;
+	struct v4l2_ctrl *pclk_ctrl;
+	struct v4l2_ctrl *hblank_ctrl;
+	struct v4l2_ctrl *vblank_ctrl;
+	struct {
+		struct v4l2_ctrl *exp_ctrl;
+		struct v4l2_ctrl *again_ctrl;
+	};
+	u32 vblank;
+	const struct ov9282_mode *cur_mode;
+	struct mutex mutex;
+	bool streaming;
+};
+
+static const s64 link_freq[] = {
+	OV9282_LINK_FREQ,
+};
+
+/* Sensor mode registers */
+static const struct ov9282_reg mode_1280x720_regs[] = {
+	{0x0302, 0x32},
+	{0x030d, 0x50},
+	{0x030e, 0x02},
+	{0x3001, 0x00},
+	{0x3004, 0x00},
+	{0x3005, 0x00},
+	{0x3006, 0x04},
+	{0x3011, 0x0a},
+	{0x3013, 0x18},
+	{0x301c, 0xf0},
+	{0x3022, 0x01},
+	{0x3030, 0x10},
+	{0x3039, 0x32},
+	{0x303a, 0x00},
+	{0x3500, 0x00},
+	{0x3501, 0x5f},
+	{0x3502, 0x1e},
+	{0x3503, 0x08},
+	{0x3505, 0x8c},
+	{0x3507, 0x03},
+	{0x3508, 0x00},
+	{0x3509, 0x10},
+	{0x3610, 0x80},
+	{0x3611, 0xa0},
+	{0x3620, 0x6e},
+	{0x3632, 0x56},
+	{0x3633, 0x78},
+	{0x3666, 0x00},
+	{0x366f, 0x5a},
+	{0x3680, 0x84},
+	{0x3712, 0x80},
+	{0x372d, 0x22},
+	{0x3731, 0x80},
+	{0x3732, 0x30},
+	{0x3778, 0x00},
+	{0x377d, 0x22},
+	{0x3788, 0x02},
+	{0x3789, 0xa4},
+	{0x378a, 0x00},
+	{0x378b, 0x4a},
+	{0x3799, 0x20},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x05},
+	{0x3805, 0x0f},
+	{0x3806, 0x02},
+	{0x3807, 0xdf},
+	{0x3808, 0x05},
+	{0x3809, 0x00},
+	{0x380a, 0x02},
+	{0x380b, 0xd0},
+	{0x380c, 0x05},
+	{0x380d, 0xfa},
+	{0x380e, 0x06},
+	{0x380f, 0xce},
+	{0x3810, 0x00},
+	{0x3811, 0x08},
+	{0x3812, 0x00},
+	{0x3813, 0x08},
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+	{0x3820, 0x3c},
+	{0x3821, 0x84},
+	{0x3881, 0x42},
+	{0x38a8, 0x02},
+	{0x38a9, 0x80},
+	{0x38b1, 0x00},
+	{0x38c4, 0x00},
+	{0x38c5, 0xc0},
+	{0x38c6, 0x04},
+	{0x38c7, 0x80},
+	{0x3920, 0xff},
+	{0x4003, 0x40},
+	{0x4008, 0x02},
+	{0x4009, 0x05},
+	{0x400c, 0x00},
+	{0x400d, 0x03},
+	{0x4010, 0x40},
+	{0x4043, 0x40},
+	{0x4307, 0x30},
+	{0x4317, 0x00},
+	{0x4501, 0x00},
+	{0x4507, 0x00},
+	{0x4509, 0x80},
+	{0x450a, 0x08},
+	{0x4601, 0x04},
+	{0x470f, 0x00},
+	{0x4f07, 0x00},
+	{0x4800, 0x20},
+	{0x5000, 0x9f},
+	{0x5001, 0x00},
+	{0x5e00, 0x00},
+	{0x5d00, 0x07},
+	{0x5d01, 0x00},
+	{0x0101, 0x01},
+	{0x1000, 0x03},
+	{0x5a08, 0x84},
+};
+
+/* Supported sensor mode configurations */
+static const struct ov9282_mode supported_mode = {
+	.width = 1280,
+	.height = 720,
+	.hblank = 250,
+	.vblank = 1022,
+	.vblank_min = 151,
+	.vblank_max = 51540,
+	.pclk = 160000000,
+	.link_freq_idx = 0,
+	.code = MEDIA_BUS_FMT_Y10_1X10,
+	.reg_list = {
+		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
+		.regs = mode_1280x720_regs,
+	},
+};
+
+/**
+ * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
+ * @subdev: pointer to ov9282 V4L2 sub-device
+ *
+ * Return: pointer to ov9282 device
+ */
+static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct ov9282, sd);
+}
+
+/**
+ * ov9282_read_reg() - Read registers.
+ * @ov9282: pointer to ov9282 device
+ * @reg: register address
+ * @len: length of bytes to read. Max supported bytes is 4
+ * @val: pointer to register value to be filled.
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
+	struct i2c_msg msgs[2] = {0};
+	u8 addr_buf[2] = {0};
+	u8 data_buf[4] = {0};
+	int ret;
+
+	if (WARN_ON(len > 4))
+		return -EINVAL;
+
+	put_unaligned_be16(reg, addr_buf);
+
+	/* Write register address */
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = ARRAY_SIZE(addr_buf);
+	msgs[0].buf = addr_buf;
+
+	/* Read data from register */
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = &data_buf[4 - len];
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs))
+		return -EIO;
+
+	*val = get_unaligned_be32(data_buf);
+
+	return 0;
+}
+
+/**
+ * ov9282_write_reg() - Write register
+ * @ov9282: pointer to ov9282 device
+ * @reg: register address
+ * @len: length of bytes. Max supported bytes is 4
+ * @val: register value
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
+	u8 buf[6] = {0};
+
+	if (WARN_ON(len > 4))
+		return -EINVAL;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
+	if (i2c_master_send(client, buf, len + 2) != len + 2)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * ov9282_write_regs() - Write a list of registers
+ * @ov9282: pointer to ov9282 device
+ * @regs: list of registers to be written
+ * @len: length of registers array
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_write_regs(struct ov9282 *ov9282,
+			     const struct ov9282_reg *regs, u32 len)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = ov9282_write_reg(ov9282, regs[i].address, 1, regs[i].val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * ov9282_update_controls() - Update control ranges based on streaming mode
+ * @ov9282: pointer to ov9282 device
+ * @mode: pointer to ov9282_mode sensor mode
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_update_controls(struct ov9282 *ov9282,
+				  const struct ov9282_mode *mode)
+{
+	int ret;
+
+	ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl(ov9282->hblank_ctrl, mode->hblank);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
+					mode->vblank_max, 1, mode->vblank);
+}
+
+/**
+ * ov9282_update_exp_gain() - Set updated exposure and gain
+ * @ov9282: pointer to ov9282 device
+ * @exposure: updated exposure value
+ * @gain: updated analog gain value
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
+{
+	u32 lpfr;
+	int ret;
+
+	lpfr = ov9282->vblank + ov9282->cur_mode->height;
+
+	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u, lpfr %u",
+		exposure, gain, lpfr);
+
+	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
+	if (ret)
+		return ret;
+
+	ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
+	if (ret)
+		goto error_release_group_hold;
+
+	ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
+	if (ret)
+		goto error_release_group_hold;
+
+	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+
+error_release_group_hold:
+	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
+
+	return ret;
+}
+
+/**
+ * ov9282_set_ctrl() - Set subdevice control
+ * @ctrl: pointer to v4l2_ctrl structure
+ *
+ * Supported controls:
+ * - V4L2_CID_VBLANK
+ * - cluster controls:
+ *   - V4L2_CID_ANALOGUE_GAIN
+ *   - V4L2_CID_EXPOSURE
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov9282 *ov9282 =
+		container_of(ctrl->handler, struct ov9282, ctrl_handler);
+	u32 analog_gain;
+	u32 exposure;
+	int ret;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		ov9282->vblank = ov9282->vblank_ctrl->val;
+
+		dev_dbg(ov9282->dev, "Received vblank %u, new lpfr %u",
+			ov9282->vblank,
+			ov9282->vblank + ov9282->cur_mode->height);
+
+		ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl,
+					       OV9282_EXPOSURE_MIN,
+					       ov9282->vblank +
+					       ov9282->cur_mode->height -
+					       OV9282_EXPOSURE_OFFSET,
+					       1, OV9282_EXPOSURE_DEFAULT);
+		break;
+	case V4L2_CID_EXPOSURE:
+		/* Set controls only if sensor is in power on state */
+		if (!pm_runtime_get_if_in_use(ov9282->dev))
+			return 0;
+
+		exposure = ctrl->val;
+		analog_gain = ov9282->again_ctrl->val;
+
+		dev_dbg(ov9282->dev, "Received exp %u, analog gain %u",
+			exposure, analog_gain);
+
+		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
+
+		pm_runtime_put(ov9282->dev);
+
+		break;
+	default:
+		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+/* V4l2 subdevice control ops*/
+static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
+	.s_ctrl = ov9282_set_ctrl,
+};
+
+/**
+ * ov9282_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
+ * @sd: pointer to ov9282 V4L2 sub-device structure
+ * @cfg: V4L2 sub-device pad configuration
+ * @code: V4L2 sub-device code enumeration need to be filled
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = supported_mode.code;
+
+	return 0;
+}
+
+/**
+ * ov9282_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
+ * @sd: pointer to ov9282 V4L2 sub-device structure
+ * @cfg: V4L2 sub-device pad configuration
+ * @fsize: V4L2 sub-device size enumeration need to be filled
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fsize)
+{
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	if (fsize->code != supported_mode.code)
+		return -EINVAL;
+
+	fsize->min_width = supported_mode.width;
+	fsize->max_width = fsize->min_width;
+	fsize->min_height = supported_mode.height;
+	fsize->max_height = fsize->min_height;
+
+	return 0;
+}
+
+/**
+ * ov9282_fill_pad_format() - Fill subdevice pad format
+ *                            from selected sensor mode
+ * @ov9282: pointer to ov9282 device
+ * @mode: pointer to ov9282_mode sensor mode
+ * @fmt: V4L2 sub-device format need to be filled
+ */
+static void ov9282_fill_pad_format(struct ov9282 *ov9282,
+				   const struct ov9282_mode *mode,
+				   struct v4l2_subdev_format *fmt)
+{
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.code = mode->code;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+/**
+ * ov9282_get_pad_format() - Get subdevice pad format
+ * @sd: pointer to ov9282 V4L2 sub-device structure
+ * @cfg: V4L2 sub-device pad configuration
+ * @fmt: V4L2 sub-device format need to be set
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_get_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ov9282 *ov9282 = to_ov9282(sd);
+
+	mutex_lock(&ov9282->mutex);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *framefmt;
+
+		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		fmt->format = *framefmt;
+	} else {
+		ov9282_fill_pad_format(ov9282, ov9282->cur_mode, fmt);
+	}
+
+	mutex_unlock(&ov9282->mutex);
+
+	return 0;
+}
+
+/**
+ * ov9282_set_pad_format() - Set subdevice pad format
+ * @sd: pointer to ov9282 V4L2 sub-device structure
+ * @cfg: V4L2 sub-device pad configuration
+ * @fmt: V4L2 sub-device format need to be set
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ov9282 *ov9282 = to_ov9282(sd);
+	const struct ov9282_mode *mode;
+	int ret = 0;
+
+	mutex_lock(&ov9282->mutex);
+
+	mode = &supported_mode;
+	ov9282_fill_pad_format(ov9282, mode, fmt);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *framefmt;
+
+		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+		*framefmt = fmt->format;
+	} else {
+		ret = ov9282_update_controls(ov9282, mode);
+		if (!ret)
+			ov9282->cur_mode = mode;
+	}
+
+	mutex_unlock(&ov9282->mutex);
+
+	return ret;
+}
+
+/**
+ * ov9282_init_pad_cfg() - Initialize sub-device pad configuration
+ * @sd: pointer to ov9282 V4L2 sub-device structure
+ * @cfg: V4L2 sub-device pad configuration
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg)
+{
+	struct ov9282 *ov9282 = to_ov9282(sd);
+	struct v4l2_subdev_format fmt = { 0 };
+
+	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	ov9282_fill_pad_format(ov9282, &supported_mode, &fmt);
+
+	return ov9282_set_pad_format(sd, cfg, &fmt);
+}
+
+/**
+ * ov9282_start_streaming() - Start sensor stream
+ * @ov9282: pointer to ov9282 device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_start_streaming(struct ov9282 *ov9282)
+{
+	const struct ov9282_reg_list *reg_list;
+	int ret;
+
+	/* Write sensor mode registers */
+	reg_list = &ov9282->cur_mode->reg_list;
+	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to write initial registers");
+		return ret;
+	}
+
+	/* Setup handler will write actual exposure and gain */
+	ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to setup handler");
+		return ret;
+	}
+
+	/* Start streaming */
+	ret = ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
+			       1, OV9282_MODE_STREAMING);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to start streaming");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * ov9282_stop_streaming() - Stop sensor stream
+ * @ov9282: pointer to ov9282 device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_stop_streaming(struct ov9282 *ov9282)
+{
+	return ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
+				1, OV9282_MODE_STANDBY);
+}
+
+/**
+ * ov9282_set_stream() - Enable sensor streaming
+ * @sd: pointer to ov9282 subdevice
+ * @enable: set to enable sensor streaming
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ov9282 *ov9282 = to_ov9282(sd);
+	int ret;
+
+	mutex_lock(&ov9282->mutex);
+
+	if (ov9282->streaming == enable) {
+		mutex_unlock(&ov9282->mutex);
+		return 0;
+	}
+
+	if (enable) {
+		ret = pm_runtime_get_sync(ov9282->dev);
+		if (ret)
+			goto error_power_off;
+
+		ret = ov9282_start_streaming(ov9282);
+		if (ret)
+			goto error_power_off;
+	} else {
+		ov9282_stop_streaming(ov9282);
+		pm_runtime_put(ov9282->dev);
+	}
+
+	ov9282->streaming = enable;
+
+	mutex_unlock(&ov9282->mutex);
+
+	return 0;
+
+error_power_off:
+	pm_runtime_put(ov9282->dev);
+	mutex_unlock(&ov9282->mutex);
+
+	return ret;
+}
+
+/**
+ * ov9282_detect() - Detect ov9282 sensor
+ * @ov9282: pointer to ov9282 device
+ *
+ * Return: 0 if successful, -EIO if sensor id does not match
+ */
+static int ov9282_detect(struct ov9282 *ov9282)
+{
+	int ret;
+	u32 val;
+
+	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV9282_ID) {
+		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
+			OV9282_ID, val);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+/**
+ * ov9282_parse_hw_config() - Parse HW configuration and check if supported
+ * @ov9282: pointer to ov9282 device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_parse_hw_config(struct ov9282 *ov9282)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(ov9282->dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep;
+	unsigned long rate;
+	unsigned int i;
+	int ret;
+
+	if (!fwnode)
+		return -ENXIO;
+
+	/* Request optional reset pin */
+	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(ov9282->reset_gpio)) {
+		dev_err(ov9282->dev, "failed to get reset gpio %ld",
+			PTR_ERR(ov9282->reset_gpio));
+		return PTR_ERR(ov9282->reset_gpio);
+	}
+
+	/* Get sensor input clock */
+	ov9282->inclk = devm_clk_get(ov9282->dev, NULL);
+	if (IS_ERR(ov9282->inclk)) {
+		dev_err(ov9282->dev, "could not get inclk");
+		return PTR_ERR(ov9282->inclk);
+	}
+
+	rate = clk_get_rate(ov9282->inclk);
+	if (rate != OV9282_INCLK_RATE) {
+		dev_err(ov9282->dev, "inclk frequency mismatch");
+		return -EINVAL;
+	}
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -ENXIO;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
+		dev_err(ov9282->dev,
+			"number of CSI2 data lanes %d is not supported",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto done_endpoint_free;
+	}
+
+	if (!bus_cfg.nr_of_link_frequencies) {
+		dev_err(ov9282->dev, "no link frequencies defined");
+		ret = -EINVAL;
+		goto done_endpoint_free;
+	}
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
+		if (bus_cfg.link_frequencies[i] == OV9282_LINK_FREQ)
+			goto done_endpoint_free;
+
+	ret = -EINVAL;
+
+done_endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+/* V4l2 subdevice ops */
+static const struct v4l2_subdev_video_ops ov9282_video_ops = {
+	.s_stream = ov9282_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
+	.init_cfg = ov9282_init_pad_cfg,
+	.enum_mbus_code = ov9282_enum_mbus_code,
+	.enum_frame_size = ov9282_enum_frame_size,
+	.get_fmt = ov9282_get_pad_format,
+	.set_fmt = ov9282_set_pad_format,
+};
+
+static const struct v4l2_subdev_ops ov9282_subdev_ops = {
+	.video = &ov9282_video_ops,
+	.pad = &ov9282_pad_ops,
+};
+
+/**
+ * ov9282_power_on() - Sensor power on sequence
+ * @dev: pointer to i2c device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov9282 *ov9282 = to_ov9282(sd);
+	int ret;
+
+	usleep_range(400, 600);
+
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
+
+	ret = clk_prepare_enable(ov9282->inclk);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to enable inclk");
+		goto error_reset;
+	}
+
+	usleep_range(400, 600);
+
+	return 0;
+
+error_reset:
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+
+	return ret;
+}
+
+/**
+ * ov9282_power_off() - Sensor power off sequence
+ * @dev: pointer to i2c device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov9282 *ov9282 = to_ov9282(sd);
+
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+
+	clk_disable_unprepare(ov9282->inclk);
+
+	return 0;
+}
+
+/**
+ * ov9282_init_controls() - Initialize sensor subdevice controls
+ * @ov9282: pointer to ov9282 device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_init_controls(struct ov9282 *ov9282)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
+	const struct ov9282_mode *mode = ov9282->cur_mode;
+	u32 lpfr;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 6);
+	if (ret)
+		return ret;
+
+	/* Serialize controls with sensor device */
+	ctrl_hdlr->lock = &ov9282->mutex;
+
+	/* Initialize exposure and gain */
+	lpfr = mode->vblank + mode->height;
+	ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+					     &ov9282_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     OV9282_EXPOSURE_MIN,
+					     lpfr - OV9282_EXPOSURE_OFFSET,
+					     OV9282_EXPOSURE_STEP,
+					     OV9282_EXPOSURE_DEFAULT);
+
+	ov9282->again_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+					       &ov9282_ctrl_ops,
+					       V4L2_CID_ANALOGUE_GAIN,
+					       OV9282_AGAIN_MIN,
+					       OV9282_AGAIN_MAX,
+					       OV9282_AGAIN_STEP,
+					       OV9282_AGAIN_DEFAULT);
+
+	v4l2_ctrl_cluster(2, &ov9282->exp_ctrl);
+
+	ov9282->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+						&ov9282_ctrl_ops,
+						V4L2_CID_VBLANK,
+						mode->vblank_min,
+						mode->vblank_max,
+						1, mode->vblank);
+
+	/* Read only controls */
+	ov9282->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+					      &ov9282_ctrl_ops,
+					      V4L2_CID_PIXEL_RATE,
+					      mode->pclk, mode->pclk,
+					      1, mode->pclk);
+
+	ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
+							&ov9282_ctrl_ops,
+							V4L2_CID_LINK_FREQ,
+							ARRAY_SIZE(link_freq) -
+							1,
+							mode->link_freq_idx,
+							link_freq);
+	if (ov9282->link_freq_ctrl)
+		ov9282->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ov9282->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+						&ov9282_ctrl_ops,
+						V4L2_CID_HBLANK,
+						OV9282_REG_MIN,
+						OV9282_REG_MAX,
+						1, mode->hblank);
+	if (ov9282->hblank_ctrl)
+		ov9282->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	if (ctrl_hdlr->error) {
+		dev_err(ov9282->dev, "control init failed: %d",
+			ctrl_hdlr->error);
+		v4l2_ctrl_handler_free(ctrl_hdlr);
+		return ctrl_hdlr->error;
+	}
+
+	ov9282->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+}
+
+/**
+ * ov9282_probe() - I2C client device binding
+ * @client: pointer to i2c client device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_probe(struct i2c_client *client)
+{
+	struct ov9282 *ov9282;
+	int ret;
+
+	ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL);
+	if (!ov9282)
+		return -ENOMEM;
+
+	ov9282->dev = &client->dev;
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
+
+	ret = ov9282_parse_hw_config(ov9282);
+	if (ret) {
+		dev_err(ov9282->dev, "HW configuration is not supported");
+		return ret;
+	}
+
+	mutex_init(&ov9282->mutex);
+
+	ret = ov9282_power_on(ov9282->dev);
+	if (ret) {
+		dev_err(ov9282->dev, "failed to power-on the sensor");
+		goto error_mutex_destroy;
+	}
+
+	/* Check module identity */
+	ret = ov9282_detect(ov9282);
+	if (ret) {
+		dev_err(ov9282->dev, "failed to find sensor: %d", ret);
+		goto error_power_off;
+	}
+
+	/* Set default mode to max resolution */
+	ov9282->cur_mode = &supported_mode;
+	ov9282->vblank = ov9282->cur_mode->vblank;
+
+	ret = ov9282_init_controls(ov9282);
+	if (ret) {
+		dev_err(ov9282->dev, "failed to init controls: %d", ret);
+		goto error_power_off;
+	}
+
+	/* Initialize subdev */
+	ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov9282->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* Initialize source pad */
+	ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
+	if (ret) {
+		dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
+		goto error_handler_free;
+	}
+
+	ret = v4l2_async_register_subdev_sensor_common(&ov9282->sd);
+	if (ret < 0) {
+		dev_err(ov9282->dev,
+			"failed to register async subdev: %d", ret);
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(ov9282->dev);
+	pm_runtime_enable(ov9282->dev);
+	pm_runtime_idle(ov9282->dev);
+
+	return 0;
+
+error_media_entity:
+	media_entity_cleanup(&ov9282->sd.entity);
+error_handler_free:
+	v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
+error_power_off:
+	ov9282_power_off(ov9282->dev);
+error_mutex_destroy:
+	mutex_destroy(&ov9282->mutex);
+
+	return ret;
+}
+
+/**
+ * ov9282_remove() - I2C client device unbinding
+ * @client: pointer to I2C client device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int ov9282_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov9282 *ov9282 = to_ov9282(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	pm_runtime_suspended(&client->dev);
+
+	mutex_destroy(&ov9282->mutex);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ov9282_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov9282_power_off, ov9282_power_on, NULL)
+};
+
+static const struct of_device_id ov9282_of_match[] = {
+	{ .compatible = "ovti,ov9282" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, ov9282_of_match);
+
+static struct i2c_driver ov9282_driver = {
+	.probe_new = ov9282_probe,
+	.remove = ov9282_remove,
+	.driver = {
+		.name = "ov9282",
+		.pm = &ov9282_pm_ops,
+		.of_match_table = ov9282_of_match,
+	},
+};
+
+module_i2c_driver(ov9282_driver);
+
+MODULE_DESCRIPTION("OmniVision ov9282 sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.11.0

