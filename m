Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E925F4E7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 10:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfGDIsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 04:48:03 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47695 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726908AbfGDIsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 04:48:03 -0400
X-UUID: bd726acb3fa84817848c94e7d73eccde-20190704
X-UUID: bd726acb3fa84817848c94e7d73eccde-20190704
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 845869686; Thu, 04 Jul 2019 16:47:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 4 Jul 2019 16:47:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 4 Jul 2019 16:47:46 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <--to=drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [RFC,V2,2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Date:   Thu, 4 Jul 2019 16:46:51 +0800
Message-ID: <20190704084651.3105-3-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds a V4L2 sub-device driver for OV02A10 image sensor.
The OV02A10 is a 1/5" CMOS sensor from Omnivision.
Supports output format: 10-bit Raw.
The OV02A10 has a single MIPI lane interface and use the I2C bus for control and the CSI-2 bus for data.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 MAINTAINERS                 |    1 +
 drivers/media/i2c/Kconfig   |   12 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ov02a10.c | 1017 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1031 insertions(+)
 create mode 100644 drivers/media/i2c/ov02a10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62b81ff..863aaab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11576,6 +11576,7 @@ M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
+F:	drivers/media/i2c/ov02a10.c
 F:	Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 
 OMNIVISION OV2680 SENSOR DRIVER
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7793358..480aa42 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -615,6 +615,18 @@ config VIDEO_IMX355
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx355.
 
+config VIDEO_OV02A10
+	tristate "OmniVision OV02A10 sensor support"
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CAMERA_SUPPORT
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV02A10 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov02a10.
+
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	depends on VIDEO_V4L2 && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d8ad9da..4b8f67b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
 obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
 obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
+obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
 obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
 obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
 obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
new file mode 100644
index 0000000..afd6063
--- /dev/null
+++ b/drivers/media/i2c/ov02a10.c
@@ -0,0 +1,1017 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#define CHIP_ID                                         0x2509
+#define OV02A10_REG_CHIP_ID_H                           0x02
+#define OV02A10_REG_CHIP_ID_L                           0x03
+#define OV02A10_ID(_msb, _lsb)                          ((_msb) << 8 | (_lsb))
+
+/* bit[1] vertical upside down */
+/* bit[0] horizontal mirror */
+#define REG_MIRROR_FLIP_CONTROL                         0x3f
+
+/* Orientation */
+#define REG_CONFIG_MIRROR_FLIP                          0x03
+
+#define REG_PAGE_SWITCH                                 0xfd
+#define REG_GLOBAL_EFFECTIVE                            0x01
+#define REG_ENABLE                                      BIT(0)
+
+#define REG_SC_CTRL_MODE                                0xac
+#define SC_CTRL_MODE_STANDBY                            0x00
+#define SC_CTRL_MODE_STREAMING                          0x01
+
+#define OV02A10_REG_EXPOSURE_H                          0x03
+#define OV02A10_REG_EXPOSURE_L                          0x04
+#define	OV02A10_EXPOSURE_MIN                            4
+#define	OV02A10_EXPOSURE_STEP                           1
+
+#define OV02A10_REG_VTS_H                               0x05
+#define OV02A10_REG_VTS_L                               0x06
+#define OV02A10_VTS_MAX                                 0x209f
+#define OV02A10_VTS_MIN                                 0x04cf
+
+#define OV02A10_REG_GAIN                                0x24
+#define OV02A10_GAIN_MIN                                0x10
+#define OV02A10_GAIN_MAX                                0xf8
+#define OV02A10_GAIN_STEP                               0x01
+#define OV02A10_GAIN_DEFAULT                            0x40
+
+#define REG_NULL                                        0xff
+
+#define OV02A10_LANES                                   1
+#define OV02A10_BITS_PER_SAMPLE                         10
+
+static const char * const ov02a10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
+#define OV02A10_NUM_SUPPLIES ARRAY_SIZE(ov02a10_supply_names)
+
+struct regval {
+	u16 addr;
+	u8 val;
+};
+
+struct ov02a10_mode {
+	u32 width;
+	u32 height;
+	u32 exp_def;
+	u32 hts_def;
+	u32 vts_def;
+	const struct regval *reg_list;
+};
+
+struct ov02a10 {
+	struct clk		*xvclk;
+	struct gpio_desc	*pwdn_gpio;
+	struct gpio_desc	*reset_gpio;
+	struct regulator_bulk_data supplies[OV02A10_NUM_SUPPLIES];
+
+	bool			streaming;
+	bool			upside_down;
+
+	/*
+	 * Serialize control access, get/set format, get selection
+	 * and start streaming.
+	 */
+	struct mutex		mutex;
+	struct v4l2_subdev	subdev;
+	struct media_pad	pad;
+	struct v4l2_ctrl	*anal_gain;
+	struct v4l2_ctrl	*exposure;
+	struct v4l2_ctrl	*hblank;
+	struct v4l2_ctrl	*vblank;
+	struct v4l2_ctrl	*hflip;
+	struct v4l2_ctrl	*vflip;
+	struct v4l2_ctrl	*test_pattern;
+	struct v4l2_mbus_framefmt	fmt;
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	const struct ov02a10_mode *cur_mode;
+};
+
+#define to_ov02a10(sd) container_of(sd, struct ov02a10, subdev)
+
+static inline void msleep_range(unsigned int delay_base)
+{
+	usleep_range(delay_base * 1000, delay_base * 1000 + 500);
+}
+
+/* MIPI color bar enable output */
+static const struct regval ov02a10_test_pattern_enable_regs[] = {
+	{0xfd, 0x01},
+	{0x0d, 0x00},
+	{0xb6, 0x01},
+	{0x01, 0x01},
+	{0xfd, 0x01},
+	{0xac, 0x01},
+	{REG_NULL, 0x00}
+};
+
+/* MIPI color bar disable output */
+static const struct regval ov02a10_test_pattern_disable_regs[] = {
+	{0xfd, 0x01},
+	{0x0d, 0x00},
+	{0xb6, 0x00},
+	{0x01, 0x01},
+	{0xfd, 0x01},
+	{0xac, 0x01},
+	{REG_NULL, 0x00}
+};
+
+/*
+ * Xclk 24Mhz
+ * Pclk 39Mhz
+ * linelength 934(0x3a6)
+ * framelength 1390(0x56E)
+ * grabwindow_width 1600
+ * grabwindow_height 1200
+ * max_framerate 30fps
+ * mipi_datarate per lane 780Mbps
+ */
+static const struct regval ov02a10_1600x1200_regs[] = {
+	{0xfd, 0x01},
+	{0xac, 0x00},
+	{0xfd, 0x00},
+	{0x2f, 0x29},
+	{0x34, 0x00},
+	{0x35, 0x21},
+	{0x30, 0x15},
+	{0x33, 0x01},
+	{0xfd, 0x01},
+	{0x44, 0x00},
+	{0x2a, 0x4c},
+	{0x2b, 0x1e},
+	{0x2c, 0x60},
+	{0x25, 0x11},
+	{0x03, 0x01},
+	{0x04, 0xae},
+	{0x09, 0x00},
+	{0x0a, 0x02},
+	{0x06, 0xa6},
+	{0x31, 0x00},
+	{0x24, 0x40},
+	{0x01, 0x01},
+	{0xfb, 0x73},
+	{0xfd, 0x01},
+	{0x16, 0x04},
+	{0x1c, 0x09},
+	{0x21, 0x42},
+	{0x12, 0x04},
+	{0x13, 0x10},
+	{0x11, 0x40},
+	{0x33, 0x81},
+	{0xd0, 0x00},
+	{0xd1, 0x01},
+	{0xd2, 0x00},
+	{0x50, 0x10},
+	{0x51, 0x23},
+	{0x52, 0x20},
+	{0x53, 0x10},
+	{0x54, 0x02},
+	{0x55, 0x20},
+	{0x56, 0x02},
+	{0x58, 0x48},
+	{0x5d, 0x15},
+	{0x5e, 0x05},
+	{0x66, 0x66},
+	{0x68, 0x68},
+	{0x6b, 0x00},
+	{0x6c, 0x00},
+	{0x6f, 0x40},
+	{0x70, 0x40},
+	{0x71, 0x0a},
+	{0x72, 0xf0},
+	{0x73, 0x10},
+	{0x75, 0x80},
+	{0x76, 0x10},
+	{0x84, 0x00},
+	{0x85, 0x10},
+	{0x86, 0x10},
+	{0x87, 0x00},
+	{0x8a, 0x22},
+	{0x8b, 0x22},
+	{0x19, 0xf1},
+	{0x29, 0x01},
+	{0xfd, 0x01},
+	{0x9d, 0xd6},
+	{0xa0, 0x29},
+	{0xa1, 0x03},
+	{0xad, 0x62},
+	{0xae, 0x00},
+	{0xaf, 0x85},
+	{0xb1, 0x01},
+	{0x8e, 0x06},
+	{0x8f, 0x40},
+	{0x90, 0x04},
+	{0x91, 0xb0},
+	{0x45, 0x01},
+	{0x46, 0x00},
+	{0x47, 0x6c},
+	{0x48, 0x03},
+	{0x49, 0x8b},
+	{0x4a, 0x00},
+	{0x4b, 0x07},
+	{0x4c, 0x04},
+	{0x4d, 0xb7},
+	{0xf0, 0x40},
+	{0xf1, 0x40},
+	{0xf2, 0x40},
+	{0xf3, 0x40},
+	{0x3f, 0x00},
+	{0xfd, 0x01},
+	{0x05, 0x00},
+	{0x06, 0xa6},
+	{0xfd, 0x01},
+	{REG_NULL, 0x00}
+};
+
+#define OV02A10_LINK_FREQ_390MHZ		390000000
+static const s64 link_freq_menu_items[] = {
+	OV02A10_LINK_FREQ_390MHZ
+};
+
+static const char * const ov02a10_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bar",
+};
+
+static const struct ov02a10_mode supported_modes[] = {
+	{
+		.width = 1600,
+		.height = 1200,
+		.exp_def = 0x01ae,
+		.hts_def = 0x03a6,
+		.vts_def = 0x056e,
+		.reg_list = ov02a10_1600x1200_regs,
+	},
+};
+
+/* write a register */
+static int ov02a10_write_reg(struct ov02a10 *ov02a10, u8 addr, u8 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	u8 buf[2] = {addr, val};
+	int ret;
+
+	ret = i2c_master_send(client, buf, 2);
+
+	if (ret != 2) {
+		dev_err(&client->dev, "%s: error: reg=%x, val=%x\n",
+			__func__, addr, val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int ov02a10_write_array(struct ov02a10 *ov02a10,
+			       const struct regval *regs)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; regs[i].addr != REG_NULL; i++) {
+		ret = ov02a10_write_reg(ov02a10, regs[i].addr, regs[i].val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* read a register */
+static int ov02a10_read_reg(struct ov02a10 *ov02a10, u8 reg, u8 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	u8 data = reg;
+	struct i2c_msg msg = {
+		.addr	= client->addr,
+		.flags	= 0,
+		.len	= 1,
+		.buf	= &data,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 0)
+		goto err_wr;
+
+	msg.flags = I2C_M_RD;
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 0)
+		goto err_rd;
+
+	*val = data;
+	return 0;
+
+err_rd:
+	dev_err(&client->dev, "i2c_transfer --I2C_M_RD failed\n");
+err_wr:
+	dev_err(&client->dev, "read error: reg=0x%02x: %d\n", reg, ret);
+	return ret;
+}
+
+static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
+			     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int ov02a10_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
+	int ret = 0;
+
+	mutex_lock(&ov02a10->mutex);
+
+	if (ov02a10->streaming) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* only one mode supported */
+	mbus_fmt->code = ov02a10->fmt.code;
+	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
+	ov02a10->fmt = fmt->format;
+
+unlock:
+	mutex_unlock(&ov02a10->mutex);
+
+	return ret;
+}
+
+static int ov02a10_get_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
+
+	mutex_lock(&ov02a10->mutex);
+
+	fmt->format = ov02a10->fmt;
+	mbus_fmt->code = ov02a10->fmt.code;
+	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
+
+	mutex_unlock(&ov02a10->mutex);
+
+	return 0;
+}
+
+static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	if (code->index >= ARRAY_SIZE(supported_modes) || !(code->index))
+		return -EINVAL;
+
+	code->code = ov02a10->fmt.code;
+
+	return 0;
+}
+
+static int ov02a10_enum_frame_sizes(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes) || !(fse->index))
+		return -EINVAL;
+
+	fse->min_width  = supported_modes[fse->index].width;
+	fse->max_width  = supported_modes[fse->index].width;
+	fse->max_height = supported_modes[fse->index].height;
+	fse->min_height = supported_modes[fse->index].height;
+
+	return 0;
+}
+
+static int __ov02a10_power_on(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = clk_prepare_enable(ov02a10->xvclk);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable xvclk\n");
+		return ret;
+	}
+
+	/* note: set 0 is high, set 1 is low */
+	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 0);
+
+	ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators\n");
+		goto disable_clk;
+	}
+	msleep_range(7);
+
+	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 1);
+	msleep_range(10);
+
+	gpiod_set_value_cansleep(ov02a10->reset_gpio, 0);
+	msleep_range(10);
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(ov02a10->xvclk);
+
+	return ret;
+}
+
+static void __ov02a10_power_off(struct ov02a10 *ov02a10)
+{
+	clk_disable_unprepare(ov02a10->xvclk);
+	gpiod_set_value_cansleep(ov02a10->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov02a10->pwdn_gpio, 1);
+	regulator_bulk_disable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
+}
+
+static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	int ret;
+
+	/* Apply default values of current mode */
+	ret = ov02a10_write_array(ov02a10, ov02a10->cur_mode->reg_list);
+	if (ret)
+		return ret;
+
+	/* Apply customized values from user */
+	ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
+	if (ret)
+		return ret;
+
+	/* Set Orientation be 180 degree */
+	if (ov02a10->upside_down) {
+		ret = ov02a10_write_reg(ov02a10, REG_MIRROR_FLIP_CONTROL,
+					REG_CONFIG_MIRROR_FLIP);
+		if (ret) {
+			dev_err(&client->dev, "%s failed to set orientation\n",
+				__func__);
+			return ret;
+		}
+		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
+					REG_ENABLE);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* set stream on register */
+	return ov02a10_write_reg(ov02a10,
+				 REG_SC_CTRL_MODE, SC_CTRL_MODE_STREAMING);
+}
+
+static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
+{
+	return ov02a10_write_reg(ov02a10,
+				 REG_SC_CTRL_MODE, SC_CTRL_MODE_STANDBY);
+}
+
+static int ov02a10_entity_init_cfg(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = { 0 };
+
+	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.width = 1600;
+	fmt.format.height = 1200;
+
+	ov02a10_set_fmt(subdev, cfg, &fmt);
+
+	return 0;
+}
+
+static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	int ret = 0;
+
+	dev_dbg(&client->dev, "ov02a10 s_stream (%d)\n", on);
+	mutex_lock(&ov02a10->mutex);
+
+	if (ov02a10->streaming == on)
+		goto unlock_and_return;
+
+	if (on) {
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(&client->dev);
+			goto unlock_and_return;
+		}
+
+		ret = __ov02a10_start_stream(ov02a10);
+		if (ret) {
+			__ov02a10_stop_stream(ov02a10);
+			ov02a10->streaming = !on;
+			goto err_rpm_put;
+		}
+	} else {
+		__ov02a10_stop_stream(ov02a10);
+		pm_runtime_put(&client->dev);
+	}
+
+	ov02a10->streaming = on;
+	mutex_unlock(&ov02a10->mutex);
+
+	return ret;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+unlock_and_return:
+	mutex_unlock(&ov02a10->mutex);
+
+	return ret;
+}
+
+static int ov02a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
+									fh->pad,
+									0);
+
+	mutex_lock(&ov02a10->mutex);
+	/* Initialize try_fmt */
+	try_fmt->code = ov02a10->fmt.code;
+	ov02a10_fill_fmt(&supported_modes[0], try_fmt);
+
+	mutex_unlock(&ov02a10->mutex);
+
+	return 0;
+}
+
+static int __maybe_unused ov02a10_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	return __ov02a10_power_on(ov02a10);
+}
+
+static int __maybe_unused ov02a10_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	__ov02a10_power_off(ov02a10);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ov02a10_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov02a10_runtime_suspend,
+			   ov02a10_runtime_resume, NULL)
+};
+
+static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, s32 value)
+{
+	if (value)
+		return ov02a10_write_array(ov02a10,
+					   ov02a10_test_pattern_enable_regs);
+
+	return ov02a10_write_array(ov02a10,
+		ov02a10_test_pattern_disable_regs);
+}
+
+static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov02a10 *ov02a10 = container_of(ctrl->handler,
+					     struct ov02a10, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	s64 max_expo;
+	int ret;
+
+	/* Propagate change of current control to all related controls */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Update max exposure while meeting expected vblanking */
+		max_expo = ov02a10->cur_mode->height + ctrl->val - 4;
+		__v4l2_ctrl_modify_range(ov02a10->exposure,
+					 ov02a10->exposure->minimum, max_expo,
+					 ov02a10->exposure->step,
+					 ov02a10->exposure->default_value);
+	}
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		ret = ov02a10_write_reg(ov02a10, REG_PAGE_SWITCH, REG_ENABLE);
+		if (ret < 0)
+			return ret;
+		ret = ov02a10_write_reg(ov02a10, OV02A10_REG_EXPOSURE_H,
+					((ctrl->val >> 8) & 0xFF));
+		if (!ret) {
+			ret = ov02a10_write_reg(ov02a10, OV02A10_REG_EXPOSURE_L,
+						(ctrl->val & 0xFF));
+			if (ret < 0)
+				return ret;
+		}
+		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
+					REG_ENABLE);
+		if (ret < 0)
+			return ret;
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov02a10_write_reg(ov02a10, REG_PAGE_SWITCH, REG_ENABLE);
+		if (ret < 0)
+			return ret;
+		ret = ov02a10_write_reg(ov02a10, OV02A10_REG_GAIN,
+					(ctrl->val & 0xFF));
+		if (ret < 0)
+			return ret;
+		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
+					REG_ENABLE);
+		if (ret < 0)
+			return ret;
+		break;
+	case V4L2_CID_VBLANK:
+		ret = ov02a10_write_reg(ov02a10, REG_PAGE_SWITCH, REG_ENABLE);
+		if (ret < 0)
+			return ret;
+		ret = ov02a10_write_reg(ov02a10, OV02A10_REG_VTS_H,
+					(((ctrl->val +
+					ov02a10->cur_mode->height - 1224) >> 8)
+					& 0xFF));
+		if (!ret) {
+			ret = ov02a10_write_reg(ov02a10, OV02A10_REG_VTS_L,
+						((ctrl->val +
+						ov02a10->cur_mode->height -
+						1224) & 0xFF));
+			if (ret < 0)
+				return ret;
+		}
+		ret = ov02a10_write_reg(ov02a10, REG_GLOBAL_EFFECTIVE,
+					REG_ENABLE);
+		if (ret < 0)
+			return ret;
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov02a10_set_test_pattern(ov02a10, ctrl->val);
+		if (ret < 0)
+			return ret;
+		break;
+	default:
+		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
+			 __func__, ctrl->id, ctrl->val);
+		ret = -EINVAL;
+		break;
+	};
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops ov02a10_video_ops = {
+	.s_stream = ov02a10_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ov02a10_pad_ops = {
+	.init_cfg = ov02a10_entity_init_cfg,
+	.enum_mbus_code = ov02a10_enum_mbus_code,
+	.enum_frame_size = ov02a10_enum_frame_sizes,
+	.get_fmt = ov02a10_get_fmt,
+	.set_fmt = ov02a10_set_fmt,
+};
+
+static const struct v4l2_subdev_ops ov02a10_subdev_ops = {
+	.video	= &ov02a10_video_ops,
+	.pad	= &ov02a10_pad_ops,
+};
+
+static const struct media_entity_operations ov02a10_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops ov02a10_internal_ops = {
+	.open = ov02a10_open,
+};
+
+static const struct v4l2_ctrl_ops ov02a10_ctrl_ops = {
+	.s_ctrl = ov02a10_set_ctrl,
+};
+
+static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	const struct ov02a10_mode *mode;
+	struct v4l2_ctrl_handler *handler;
+	struct v4l2_ctrl *ctrl;
+	u64 exposure_max;
+	u32 pixel_rate, h_blank;
+	int ret;
+
+	handler = &ov02a10->ctrl_handler;
+	mode = ov02a10->cur_mode;
+	ret = v4l2_ctrl_handler_init(handler, 10);
+	if (ret)
+		return ret;
+	handler->lock = &ov02a10->mutex;
+
+	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
+				      0, 0, link_freq_menu_items);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = (link_freq_menu_items[0] * 2 * OV02A10_LANES) /
+		     OV02A10_BITS_PER_SAMPLE;
+	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
+			  0, pixel_rate, 1, pixel_rate);
+
+	h_blank = mode->hts_def - mode->width;
+	ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
+					    h_blank, h_blank, 1, h_blank);
+	if (ov02a10->hblank)
+		ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
+					    V4L2_CID_VBLANK, mode->vts_def -
+					    mode->height,
+					    OV02A10_VTS_MAX - mode->height, 1,
+					    mode->vts_def - mode->height);
+
+	exposure_max = mode->vts_def - 4;
+	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OV02A10_EXPOSURE_MIN,
+					      exposure_max,
+					      OV02A10_EXPOSURE_STEP,
+					      mode->exp_def);
+
+	ov02a10->anal_gain = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
+					       V4L2_CID_ANALOGUE_GAIN,
+					       OV02A10_GAIN_MIN,
+					       OV02A10_GAIN_MAX,
+					       OV02A10_GAIN_STEP,
+					       OV02A10_GAIN_DEFAULT);
+
+	ov02a10->test_pattern =
+	   v4l2_ctrl_new_std_menu_items(handler,
+					&ov02a10_ctrl_ops,
+					V4L2_CID_TEST_PATTERN,
+					ARRAY_SIZE(ov02a10_test_pattern_menu) -
+					1, 0, 0, ov02a10_test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		dev_err(&client->dev,
+			"Failed to init controls(%d)\n", ret);
+		goto err_free_handler;
+	}
+
+	ov02a10->subdev.ctrl_handler = handler;
+
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(handler);
+
+	return ret;
+}
+
+static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	u16 id;
+	u8 pid = 0;
+	u8 ver = 0;
+	int ret;
+
+	/* Check sensor revision */
+	ret = ov02a10_read_reg(ov02a10, OV02A10_REG_CHIP_ID_H, &pid);
+	if (ret)
+		return ret;
+
+	ret = ov02a10_read_reg(ov02a10, OV02A10_REG_CHIP_ID_L, &ver);
+	if (ret)
+		return ret;
+
+	id = OV02A10_ID(pid, ver);
+	if (id != CHIP_ID) {
+		dev_err(&client->dev, "Unexpected sensor id(%04x)\n", id);
+		return ret;
+	}
+	dev_dbg(&client->dev, "Detected OV%04X sensor\n", id);
+
+	return 0;
+}
+
+static int ov02a10_configure_regulators(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	unsigned int i;
+
+	for (i = 0; i < OV02A10_NUM_SUPPLIES; i++)
+		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
+
+	return devm_regulator_bulk_get(&client->dev,
+				       OV02A10_NUM_SUPPLIES,
+				       ov02a10->supplies);
+}
+
+static int ov02a10_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ov02a10 *ov02a10;
+	u32 rotation;
+	u32 xclk_freq;
+	int ret;
+
+	dev_dbg(dev, "ov02a10 probe\n");
+	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
+	if (!ov02a10)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
+	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	/* optional indication of physical rotation of sensor */
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
+				       &rotation);
+	if (!ret) {
+		switch (rotation) {
+		case 180:
+			ov02a10->upside_down = true;
+			ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
+			break;
+		case 0:
+			break;
+		default:
+			dev_warn(dev, "%u degrees rotation is not supported, ignoring...\n",
+				 rotation);
+		}
+	}
+
+	/* get system clock (xvclk) */
+	ov02a10->xvclk = devm_clk_get(dev, "xvclk");
+	if (IS_ERR(ov02a10->xvclk)) {
+		dev_err(dev, "Failed to get xvclk\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
+	if (ret) {
+		dev_err(dev, "Failed to get xclk frequency\n");
+		return ret;
+	}
+
+	/* external clock must be 24MHz, allow 1% tolerance */
+	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
+		dev_err(dev, "external clock frequency %u is not supported\n",
+			xclk_freq);
+		return -EINVAL;
+	}
+	dev_dbg(dev, "external clock frequency %u\n", xclk_freq);
+
+	ret = clk_set_rate(ov02a10->xvclk, xclk_freq);
+	if (ret) {
+		dev_err(dev, "Failed to set xvclk frequency (24MHz)\n");
+		return ret;
+	}
+
+	ov02a10->pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_OUT_LOW);
+	if (IS_ERR(ov02a10->pwdn_gpio)) {
+		dev_err(dev, "Failed to get powerdown-gpios\n");
+		return -EINVAL;
+	}
+
+	ov02a10->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov02a10->reset_gpio)) {
+		dev_err(dev, "Failed to get reset-gpios\n");
+		return -EINVAL;
+	}
+
+	ret = ov02a10_configure_regulators(ov02a10);
+	if (ret) {
+		dev_err(dev, "Failed to get power regulators\n");
+		return ret;
+	}
+
+	mutex_init(&ov02a10->mutex);
+	ov02a10->cur_mode = &supported_modes[0];
+	ret = ov02a10_initialize_controls(ov02a10);
+	if (ret) {
+		dev_err(dev, "Failed to initialize controls\n");
+		goto err_destroy_mutex;
+	}
+
+	ret = __ov02a10_power_on(ov02a10);
+	if (ret)
+		goto err_free_handler;
+
+	ret = ov02a10_check_sensor_id(ov02a10);
+	if (ret)
+		goto err_power_off;
+
+	ov02a10->subdev.internal_ops = &ov02a10_internal_ops;
+	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
+	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
+	if (ret < 0) {
+		dev_err(dev, "failed to init entity pads: %d", ret);
+		goto err_power_off;
+	}
+
+	ret = v4l2_async_register_subdev(&ov02a10->subdev);
+	if (ret) {
+		dev_err(dev, "failed to register V4L2 subdev: %d",
+			ret);
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
+	media_entity_cleanup(&ov02a10->subdev.entity);
+err_power_off:
+	__ov02a10_power_off(ov02a10);
+err_free_handler:
+	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
+err_destroy_mutex:
+	mutex_destroy(&ov02a10->mutex);
+
+	return ret;
+}
+
+static int ov02a10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		__ov02a10_power_off(ov02a10);
+	pm_runtime_set_suspended(&client->dev);
+	mutex_destroy(&ov02a10->mutex);
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id ov02a10_of_match[] = {
+	{ .compatible = "ovti,ov02a10" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ov02a10_of_match);
+#endif
+
+static struct i2c_driver ov02a10_i2c_driver = {
+	.driver = {
+		.name = "ov02a10",
+		.pm = &ov02a10_pm_ops,
+		.of_match_table = ov02a10_of_match,
+	},
+	.probe_new	= &ov02a10_probe,
+	.remove		= &ov02a10_remove,
+};
+
+module_i2c_driver(ov02a10_i2c_driver);
+
+MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
+MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
+MODULE_LICENSE("GPL v2");
+
-- 
2.9.2

