Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2646421A2
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 03:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbiLECj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Dec 2022 21:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbiLECj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Dec 2022 21:39:57 -0500
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A684FD24
        for <linux-media@vger.kernel.org>; Sun,  4 Dec 2022 18:39:53 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0209365-0.000820379-0.978243;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=lee.jackson@arducam.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.QNt2drq_1670207969;
Received: from localhost(mailfrom:lee.jackson@arducam.com fp:SMTPD_---.QNt2drq_1670207969)
          by smtp.aliyun-inc.com;
          Mon, 05 Dec 2022 10:39:30 +0800
Date:   Mon, 5 Dec 2022 10:39:29 +0800
From:   "lee.jackson" <lee.jackson@arducam.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4 2/2] media: i2c: Add driver for IMX519 sensor
Message-ID: <20221205103929.00000d2d@arducam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,INVALID_MSGID,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds a driver for the 16MPix IMX519 CSI2 sensor.
Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
currently only supports 2 lanes.

The following Bayer modes are currently available:

4656x3496 10-bit @ 10fps
3840x2160 10-bit (cropped) @ 21fps
2328x1748 10-bit (binned) @ 30fps
1920x1080 10-bit (cropped/binned) @ 60fps
1280x720 10-bit (cropped/binned) @ 120fps

Signed-off-by: lee.jackson <lee.jackson@arducam.com>
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |   13 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx519.c | 2022 ++++++++++++++++++++++++++++++++++++
 4 files changed, 2037 insertions(+)
 create mode 100644 drivers/media/i2c/imx519.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fe906632209..1a9134b6b85d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19239,6 +19239,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
+F:	drivers/media/i2c/imx519.c
 
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7806d4b81716..f7f55099552c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -228,6 +228,19 @@ config VIDEO_IMX412
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx412.
 
+config VIDEO_IMX519
+	tristate "Sony IMX519 sensor support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX519 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called IMX519.
+
 config VIDEO_MAX9271_LIB
 	tristate
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 0a2933103dd9..26d1ec51e88b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_VIDEO_IMX334) += imx334.o
 obj-$(CONFIG_VIDEO_IMX335) += imx335.o
 obj-$(CONFIG_VIDEO_IMX355) += imx355.o
 obj-$(CONFIG_VIDEO_IMX412) += imx412.o
+obj-$(CONFIG_VIDEO_IMX519) += imx519.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
diff --git a/drivers/media/i2c/imx519.c b/drivers/media/i2c/imx519.c
new file mode 100644
index 000000000000..0c68c456e48f
--- /dev/null
+++ b/drivers/media/i2c/imx519.c
@@ -0,0 +1,2022 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A V4L2 driver for Sony IMX519 cameras.
+ * Copyright (C) 2022 Arducam Technology co., Ltd.
+ *
+ * Based on Sony IMX477 camera driver
+ * Copyright (C) 2020 Raspberry Pi (Trading) Ltd
+ */
+#include <asm/unaligned.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define IMX519_REG_VALUE_08BIT		1
+#define IMX519_REG_VALUE_16BIT		2
+
+/* Chip ID */
+#define IMX519_REG_CHIP_ID		0x0016
+#define IMX519_CHIP_ID			0x0519
+
+#define IMX519_REG_MODE_SELECT		0x0100
+#define IMX519_MODE_STANDBY		0x00
+#define IMX519_MODE_STREAMING		0x01
+
+#define IMX519_REG_ORIENTATION		0x101
+
+#define IMX519_XCLK_FREQ		24000000
+
+#define IMX519_DEFAULT_LINK_FREQ	493500000
+
+/* Pixel rate is fixed at 686MHz for all the modes */
+#define IMX519_PIXEL_RATE		686000000
+
+/* V_TIMING internal */
+#define IMX519_REG_FRAME_LENGTH		0x0340
+#define IMX519_FRAME_LENGTH_MAX		0xffdc
+
+/* Long exposure multiplier */
+#define IMX519_LONG_EXP_SHIFT_MAX	7
+#define IMX519_LONG_EXP_SHIFT_REG	0x3100
+
+/* Exposure control */
+#define IMX519_REG_EXPOSURE		0x0202
+#define IMX519_EXPOSURE_OFFSET		32
+#define IMX519_EXPOSURE_MIN		20
+#define IMX519_EXPOSURE_STEP		1
+#define IMX519_EXPOSURE_DEFAULT		0x3e8
+#define IMX519_EXPOSURE_MAX		(IMX519_FRAME_LENGTH_MAX - \
+					 IMX519_EXPOSURE_OFFSET)
+
+/* Analog gain control */
+#define IMX519_REG_ANALOG_GAIN		0x0204
+#define IMX519_ANA_GAIN_MIN		0
+#define IMX519_ANA_GAIN_MAX		960
+#define IMX519_ANA_GAIN_STEP		1
+#define IMX519_ANA_GAIN_DEFAULT		0x0
+
+/* Digital gain control */
+#define IMX519_REG_DIGITAL_GAIN		0x020e
+#define IMX519_DGTL_GAIN_MIN		0x0100
+#define IMX519_DGTL_GAIN_MAX		0xffff
+#define IMX519_DGTL_GAIN_DEFAULT	0x0100
+#define IMX519_DGTL_GAIN_STEP		1
+
+/* Test Pattern Control */
+#define IMX519_REG_TEST_PATTERN		0x0600
+#define IMX519_TEST_PATTERN_DISABLE	0
+#define IMX519_TEST_PATTERN_SOLID_COLOR	1
+#define IMX519_TEST_PATTERN_COLOR_BARS	2
+#define IMX519_TEST_PATTERN_GREY_COLOR	3
+#define IMX519_TEST_PATTERN_PN9		4
+
+/* Test pattern colour components */
+#define IMX519_REG_TEST_PATTERN_R	0x0602
+#define IMX519_REG_TEST_PATTERN_GR	0x0604
+#define IMX519_REG_TEST_PATTERN_B	0x0606
+#define IMX519_REG_TEST_PATTERN_GB	0x0608
+#define IMX519_TEST_PATTERN_COLOUR_MIN	0
+#define IMX519_TEST_PATTERN_COLOUR_MAX	0x0fff
+#define IMX519_TEST_PATTERN_COLOUR_STEP	1
+#define IMX519_TEST_PATTERN_R_DEFAULT	IMX519_TEST_PATTERN_COLOUR_MAX
+#define IMX519_TEST_PATTERN_GR_DEFAULT	0
+#define IMX519_TEST_PATTERN_B_DEFAULT	0
+#define IMX519_TEST_PATTERN_GB_DEFAULT	0
+
+/* IMX519 native and active pixel array size. */
+#define IMX519_NATIVE_WIDTH		4672U
+#define IMX519_NATIVE_HEIGHT		3648U
+#define IMX519_PIXEL_ARRAY_LEFT		8U
+#define IMX519_PIXEL_ARRAY_TOP		48U
+#define IMX519_PIXEL_ARRAY_WIDTH	4656U
+#define IMX519_PIXEL_ARRAY_HEIGHT	3496U
+
+struct imx519_reg {
+	u16 address;
+	u8 val;
+};
+
+struct imx519_reg_list {
+	unsigned int num_of_regs;
+	const struct imx519_reg *regs;
+};
+
+/* Mode : resolution and related config&values */
+struct imx519_mode {
+	/* Frame width */
+	unsigned int width;
+
+	/* Frame height */
+	unsigned int height;
+
+	/* H-timing in pixels */
+	unsigned int line_length_pix;
+
+	/* Analog crop rectangle. */
+	struct v4l2_rect crop;
+
+	/* Highest possible framerate. */
+	struct v4l2_fract timeperframe_min;
+
+	/* Default framerate. */
+	struct v4l2_fract timeperframe_default;
+
+	/* Default register values */
+	struct imx519_reg_list reg_list;
+};
+
+static const struct imx519_reg mode_common_regs[] = {
+	{0x0136, 0x18},
+	{0x0137, 0x00},
+	{0x3c7e, 0x01},
+	{0x3c7f, 0x07},
+	{0x3020, 0x00},
+	{0x3e35, 0x01},
+	{0x3f7f, 0x01},
+	{0x5609, 0x57},
+	{0x5613, 0x51},
+	{0x561f, 0x5e},
+	{0x5623, 0xd2},
+	{0x5637, 0x11},
+	{0x5657, 0x11},
+	{0x5659, 0x12},
+	{0x5733, 0x60},
+	{0x5905, 0x57},
+	{0x590f, 0x51},
+	{0x591b, 0x5e},
+	{0x591f, 0xd2},
+	{0x5933, 0x11},
+	{0x5953, 0x11},
+	{0x5955, 0x12},
+	{0x5a2f, 0x60},
+	{0x5a85, 0x57},
+	{0x5a8f, 0x51},
+	{0x5a9b, 0x5e},
+	{0x5a9f, 0xd2},
+	{0x5ab3, 0x11},
+	{0x5ad3, 0x11},
+	{0x5ad5, 0x12},
+	{0x5baf, 0x60},
+	{0x5c15, 0x2a},
+	{0x5c17, 0x80},
+	{0x5c19, 0x31},
+	{0x5c1b, 0x87},
+	{0x5c25, 0x25},
+	{0x5c27, 0x7b},
+	{0x5c29, 0x2a},
+	{0x5c2b, 0x80},
+	{0x5c2d, 0x31},
+	{0x5c2f, 0x87},
+	{0x5c35, 0x2b},
+	{0x5c37, 0x81},
+	{0x5c39, 0x31},
+	{0x5c3b, 0x87},
+	{0x5c45, 0x25},
+	{0x5c47, 0x7b},
+	{0x5c49, 0x2a},
+	{0x5c4b, 0x80},
+	{0x5c4d, 0x31},
+	{0x5c4f, 0x87},
+	{0x5c55, 0x2d},
+	{0x5c57, 0x83},
+	{0x5c59, 0x32},
+	{0x5c5b, 0x88},
+	{0x5c65, 0x29},
+	{0x5c67, 0x7f},
+	{0x5c69, 0x2e},
+	{0x5c6b, 0x84},
+	{0x5c6d, 0x32},
+	{0x5c6f, 0x88},
+	{0x5e69, 0x04},
+	{0x5e9d, 0x00},
+	{0x5f18, 0x10},
+	{0x5f1a, 0x0e},
+	{0x5f20, 0x12},
+	{0x5f22, 0x10},
+	{0x5f24, 0x0e},
+	{0x5f28, 0x10},
+	{0x5f2a, 0x0e},
+	{0x5f30, 0x12},
+	{0x5f32, 0x10},
+	{0x5f34, 0x0e},
+	{0x5f38, 0x0f},
+	{0x5f39, 0x0d},
+	{0x5f3c, 0x11},
+	{0x5f3d, 0x0f},
+	{0x5f3e, 0x0d},
+	{0x5f61, 0x07},
+	{0x5f64, 0x05},
+	{0x5f67, 0x03},
+	{0x5f6a, 0x03},
+	{0x5f6d, 0x07},
+	{0x5f70, 0x07},
+	{0x5f73, 0x05},
+	{0x5f76, 0x02},
+	{0x5f79, 0x07},
+	{0x5f7c, 0x07},
+	{0x5f7f, 0x07},
+	{0x5f82, 0x07},
+	{0x5f85, 0x03},
+	{0x5f88, 0x02},
+	{0x5f8b, 0x01},
+	{0x5f8e, 0x01},
+	{0x5f91, 0x04},
+	{0x5f94, 0x05},
+	{0x5f97, 0x02},
+	{0x5f9d, 0x07},
+	{0x5fa0, 0x07},
+	{0x5fa3, 0x07},
+	{0x5fa6, 0x07},
+	{0x5fa9, 0x03},
+	{0x5fac, 0x01},
+	{0x5faf, 0x01},
+	{0x5fb5, 0x03},
+	{0x5fb8, 0x02},
+	{0x5fbb, 0x01},
+	{0x5fc1, 0x07},
+	{0x5fc4, 0x07},
+	{0x5fc7, 0x07},
+	{0x5fd1, 0x00},
+	{0x6302, 0x79},
+	{0x6305, 0x78},
+	{0x6306, 0xa5},
+	{0x6308, 0x03},
+	{0x6309, 0x20},
+	{0x630b, 0x0a},
+	{0x630d, 0x48},
+	{0x630f, 0x06},
+	{0x6311, 0xa4},
+	{0x6313, 0x03},
+	{0x6314, 0x20},
+	{0x6316, 0x0a},
+	{0x6317, 0x31},
+	{0x6318, 0x4a},
+	{0x631a, 0x06},
+	{0x631b, 0x40},
+	{0x631c, 0xa4},
+	{0x631e, 0x03},
+	{0x631f, 0x20},
+	{0x6321, 0x0a},
+	{0x6323, 0x4a},
+	{0x6328, 0x80},
+	{0x6329, 0x01},
+	{0x632a, 0x30},
+	{0x632b, 0x02},
+	{0x632c, 0x20},
+	{0x632d, 0x02},
+	{0x632e, 0x30},
+	{0x6330, 0x60},
+	{0x6332, 0x90},
+	{0x6333, 0x01},
+	{0x6334, 0x30},
+	{0x6335, 0x02},
+	{0x6336, 0x20},
+	{0x6338, 0x80},
+	{0x633a, 0xa0},
+	{0x633b, 0x01},
+	{0x633c, 0x60},
+	{0x633d, 0x02},
+	{0x633e, 0x60},
+	{0x633f, 0x01},
+	{0x6340, 0x30},
+	{0x6341, 0x02},
+	{0x6342, 0x20},
+	{0x6343, 0x03},
+	{0x6344, 0x80},
+	{0x6345, 0x03},
+	{0x6346, 0x90},
+	{0x6348, 0xf0},
+	{0x6349, 0x01},
+	{0x634a, 0x20},
+	{0x634b, 0x02},
+	{0x634c, 0x10},
+	{0x634d, 0x03},
+	{0x634e, 0x60},
+	{0x6350, 0xa0},
+	{0x6351, 0x01},
+	{0x6352, 0x60},
+	{0x6353, 0x02},
+	{0x6354, 0x50},
+	{0x6355, 0x02},
+	{0x6356, 0x60},
+	{0x6357, 0x01},
+	{0x6358, 0x30},
+	{0x6359, 0x02},
+	{0x635a, 0x30},
+	{0x635b, 0x03},
+	{0x635c, 0x90},
+	{0x635f, 0x01},
+	{0x6360, 0x10},
+	{0x6361, 0x01},
+	{0x6362, 0x40},
+	{0x6363, 0x02},
+	{0x6364, 0x50},
+	{0x6368, 0x70},
+	{0x636a, 0xa0},
+	{0x636b, 0x01},
+	{0x636c, 0x50},
+	{0x637d, 0xe4},
+	{0x637e, 0xb4},
+	{0x638c, 0x8e},
+	{0x638d, 0x38},
+	{0x638e, 0xe3},
+	{0x638f, 0x4c},
+	{0x6390, 0x30},
+	{0x6391, 0xc3},
+	{0x6392, 0xae},
+	{0x6393, 0xba},
+	{0x6394, 0xeb},
+	{0x6395, 0x6e},
+	{0x6396, 0x34},
+	{0x6397, 0xe3},
+	{0x6398, 0xcf},
+	{0x6399, 0x3c},
+	{0x639a, 0xf3},
+	{0x639b, 0x0c},
+	{0x639c, 0x30},
+	{0x639d, 0xc1},
+	{0x63b9, 0xa3},
+	{0x63ba, 0xfe},
+	{0x7600, 0x01},
+	{0x79a0, 0x01},
+	{0x79a1, 0x01},
+	{0x79a2, 0x01},
+	{0x79a3, 0x01},
+	{0x79a4, 0x01},
+	{0x79a5, 0x20},
+	{0x79a9, 0x00},
+	{0x79aa, 0x01},
+	{0x79ad, 0x00},
+	{0x79af, 0x00},
+	{0x8173, 0x01},
+	{0x835c, 0x01},
+	{0x8a74, 0x01},
+	{0x8c1f, 0x00},
+	{0x8c27, 0x00},
+	{0x8c3b, 0x03},
+	{0x9004, 0x0b},
+	{0x920c, 0x6a},
+	{0x920d, 0x22},
+	{0x920e, 0x6a},
+	{0x920f, 0x23},
+	{0x9214, 0x6a},
+	{0x9215, 0x20},
+	{0x9216, 0x6a},
+	{0x9217, 0x21},
+	{0x9385, 0x3e},
+	{0x9387, 0x1b},
+	{0x938d, 0x4d},
+	{0x938f, 0x43},
+	{0x9391, 0x1b},
+	{0x9395, 0x4d},
+	{0x9397, 0x43},
+	{0x9399, 0x1b},
+	{0x939d, 0x3e},
+	{0x939f, 0x2f},
+	{0x93a5, 0x43},
+	{0x93a7, 0x2f},
+	{0x93a9, 0x2f},
+	{0x93ad, 0x34},
+	{0x93af, 0x2f},
+	{0x93b5, 0x3e},
+	{0x93b7, 0x2f},
+	{0x93bd, 0x4d},
+	{0x93bf, 0x43},
+	{0x93c1, 0x2f},
+	{0x93c5, 0x4d},
+	{0x93c7, 0x43},
+	{0x93c9, 0x2f},
+	{0x974b, 0x02},
+	{0x995c, 0x8c},
+	{0x995d, 0x00},
+	{0x995e, 0x00},
+	{0x9963, 0x64},
+	{0x9964, 0x50},
+	{0xaa0a, 0x26},
+	{0xae03, 0x04},
+	{0xae04, 0x03},
+	{0xae05, 0x03},
+	{0xbc1c, 0x08},
+	{0xbcf1, 0x02},
+};
+
+/* 16 mpix 10fps */
+static const struct imx519_reg mode_4656x3496_regs[] = {
+	{0x0111, 0x02},
+	{0x0112, 0x0a},
+	{0x0113, 0x0a},
+	{0x0114, 0x01},
+	{0x0342, 0x42},
+	{0x0343, 0x00},
+	{0x0340, 0x0d},
+	{0x0341, 0xf4},
+	{0x0344, 0x00},
+	{0x0345, 0x00},
+	{0x0346, 0x00},
+	{0x0347, 0x00},
+	{0x0348, 0x12},
+	{0x0349, 0x2f},
+	{0x034a, 0x0d},
+	{0x034b, 0xa7},
+	{0x0220, 0x00},
+	{0x0221, 0x11},
+	{0x0222, 0x01},
+	{0x0900, 0x00},
+	{0x0901, 0x11},
+	{0x0902, 0x0a},
+	{0x3f4c, 0x01},
+	{0x3f4d, 0x01},
+	{0x4254, 0x7f},
+	{0x0401, 0x00},
+	{0x0404, 0x00},
+	{0x0405, 0x10},
+	{0x0408, 0x00},
+	{0x0409, 0x00},
+	{0x040a, 0x00},
+	{0x040b, 0x00},
+	{0x040c, 0x12},
+	{0x040d, 0x30},
+	{0x040e, 0x0d},
+	{0x040f, 0xa8},
+	{0x034c, 0x12},
+	{0x034d, 0x30},
+	{0x034e, 0x0d},
+	{0x034f, 0xa8},
+	{0x0301, 0x06},
+	{0x0303, 0x04},
+	{0x0305, 0x04},
+	{0x0306, 0x01},
+	{0x0307, 0x57},
+	{0x0309, 0x0a},
+	{0x030b, 0x02},
+	{0x030d, 0x04},
+	{0x030e, 0x01},
+	{0x030f, 0x49},
+	{0x0310, 0x01},
+	{0x0820, 0x07},
+	{0x0821, 0xb6},
+	{0x0822, 0x00},
+	{0x0823, 0x00},
+	{0x3e20, 0x01},
+	{0x3e37, 0x00},
+	{0x3e3b, 0x00},
+	{0x0106, 0x00},
+	{0x0b00, 0x00},
+	{0x3230, 0x00},
+	{0x3f14, 0x01},
+	{0x3f3c, 0x01},
+	{0x3f0d, 0x0a},
+	{0x3fbc, 0x00},
+	{0x3c06, 0x00},
+	{0x3c07, 0x48},
+	{0x3c0a, 0x00},
+	{0x3c0b, 0x00},
+	{0x3f78, 0x00},
+	{0x3f79, 0x40},
+	{0x3f7c, 0x00},
+	{0x3f7d, 0x00},
+};
+
+/* 4k 21fps mode */
+static const struct imx519_reg mode_3840x2160_regs[] = {
+	{0x0111, 0x02},
+	{0x0112, 0x0a},
+	{0x0113, 0x0a},
+	{0x0114, 0x01},
+	{0x0342, 0x38},
+	{0x0343, 0x70},
+	{0x0340, 0x08},
+	{0x0341, 0xd4},
+	{0x0344, 0x01},
+	{0x0345, 0x98},
+	{0x0346, 0x02},
+	{0x0347, 0xa0},
+	{0x0348, 0x10},
+	{0x0349, 0x97},
+	{0x034a, 0x0b},
+	{0x034b, 0x17},
+	{0x0220, 0x00},
+	{0x0221, 0x11},
+	{0x0222, 0x01},
+	{0x0900, 0x00},
+	{0x0901, 0x11},
+	{0x0902, 0x0a},
+	{0x3f4c, 0x01},
+	{0x3f4d, 0x01},
+	{0x4254, 0x7f},
+	{0x0401, 0x00},
+	{0x0404, 0x00},
+	{0x0405, 0x10},
+	{0x0408, 0x00},
+	{0x0409, 0x00},
+	{0x040a, 0x00},
+	{0x040b, 0x00},
+	{0x040c, 0x0f},
+	{0x040d, 0x00},
+	{0x040e, 0x08},
+	{0x040f, 0x70},
+	{0x034c, 0x0f},
+	{0x034d, 0x00},
+	{0x034e, 0x08},
+	{0x034f, 0x70},
+	{0x0301, 0x06},
+	{0x0303, 0x04},
+	{0x0305, 0x04},
+	{0x0306, 0x01},
+	{0x0307, 0x57},
+	{0x0309, 0x0a},
+	{0x030b, 0x02},
+	{0x030d, 0x04},
+	{0x030e, 0x01},
+	{0x030f, 0x49},
+	{0x0310, 0x01},
+	{0x0820, 0x07},
+	{0x0821, 0xb6},
+	{0x0822, 0x00},
+	{0x0823, 0x00},
+	{0x3e20, 0x01},
+	{0x3e37, 0x00},
+	{0x3e3b, 0x00},
+	{0x0106, 0x00},
+	{0x0b00, 0x00},
+	{0x3230, 0x00},
+	{0x3f14, 0x01},
+	{0x3f3c, 0x01},
+	{0x3f0d, 0x0a},
+	{0x3fbc, 0x00},
+	{0x3c06, 0x00},
+	{0x3c07, 0x48},
+	{0x3c0a, 0x00},
+	{0x3c0b, 0x00},
+	{0x3f78, 0x00},
+	{0x3f79, 0x40},
+	{0x3f7c, 0x00},
+	{0x3f7d, 0x00},
+};
+
+/* 2x2 binned 30fps mode */
+static const struct imx519_reg mode_2328x1748_regs[] = {
+	{0x0111, 0x02},
+	{0x0112, 0x0a},
+	{0x0113, 0x0a},
+	{0x0114, 0x01},
+	{0x0342, 0x24},
+	{0x0343, 0x12},
+	{0x0340, 0x09},
+	{0x0341, 0xac},
+	{0x0344, 0x00},
+	{0x0345, 0x00},
+	{0x0346, 0x00},
+	{0x0347, 0x00},
+	{0x0348, 0x12},
+	{0x0349, 0x2f},
+	{0x034a, 0x0d},
+	{0x034b, 0xa7},
+	{0x0220, 0x00},
+	{0x0221, 0x11},
+	{0x0222, 0x01},
+	{0x0900, 0x01},
+	{0x0901, 0x22},
+	{0x0902, 0x0a},
+	{0x3f4c, 0x01},
+	{0x3f4d, 0x01},
+	{0x4254, 0x7f},
+	{0x0401, 0x00},
+	{0x0404, 0x00},
+	{0x0405, 0x10},
+	{0x0408, 0x00},
+	{0x0409, 0x00},
+	{0x040a, 0x00},
+	{0x040b, 0x00},
+	{0x040c, 0x09},
+	{0x040d, 0x18},
+	{0x040e, 0x06},
+	{0x040f, 0xd4},
+	{0x034c, 0x09},
+	{0x034d, 0x18},
+	{0x034e, 0x06},
+	{0x034f, 0xd4},
+	{0x0301, 0x06},
+	{0x0303, 0x04},
+	{0x0305, 0x04},
+	{0x0306, 0x01},
+	{0x0307, 0x57},
+	{0x0309, 0x0a},
+	{0x030b, 0x02},
+	{0x030d, 0x04},
+	{0x030e, 0x01},
+	{0x030f, 0x49},
+	{0x0310, 0x01},
+	{0x0820, 0x07},
+	{0x0821, 0xb6},
+	{0x0822, 0x00},
+	{0x0823, 0x00},
+	{0x3e20, 0x01},
+	{0x3e37, 0x00},
+	{0x3e3b, 0x00},
+	{0x0106, 0x00},
+	{0x0b00, 0x00},
+	{0x3230, 0x00},
+	{0x3f14, 0x01},
+	{0x3f3c, 0x01},
+	{0x3f0d, 0x0a},
+	{0x3fbc, 0x00},
+	{0x3c06, 0x00},
+	{0x3c07, 0x48},
+	{0x3c0a, 0x00},
+	{0x3c0b, 0x00},
+	{0x3f78, 0x00},
+	{0x3f79, 0x40},
+	{0x3f7c, 0x00},
+	{0x3f7d, 0x00},
+};
+
+/* 1080p 60fps mode */
+static const struct imx519_reg mode_1920x1080_regs[] = {
+	{0x0111, 0x02},
+	{0x0112, 0x0a},
+	{0x0113, 0x0a},
+	{0x0114, 0x01},
+	{0x0342, 0x25},
+	{0x0343, 0xd9},
+	{0x0340, 0x04},
+	{0x0341, 0x9c},
+	{0x0344, 0x01},
+	{0x0345, 0x98},
+	{0x0346, 0x02},
+	{0x0347, 0xa2},
+	{0x0348, 0x10},
+	{0x0349, 0x97},
+	{0x034a, 0x0b},
+	{0x034b, 0x15},
+	{0x0220, 0x00},
+	{0x0221, 0x11},
+	{0x0222, 0x01},
+	{0x0900, 0x01},
+	{0x0901, 0x22},
+	{0x0902, 0x0a},
+	{0x3f4c, 0x01},
+	{0x3f4d, 0x01},
+	{0x4254, 0x7f},
+	{0x0401, 0x00},
+	{0x0404, 0x00},
+	{0x0405, 0x10},
+	{0x0408, 0x00},
+	{0x0409, 0x00},
+	{0x040a, 0x00},
+	{0x040b, 0x00},
+	{0x040c, 0x07},
+	{0x040d, 0x80},
+	{0x040e, 0x04},
+	{0x040f, 0x38},
+	{0x034c, 0x07},
+	{0x034d, 0x80},
+	{0x034e, 0x04},
+	{0x034f, 0x38},
+	{0x0301, 0x06},
+	{0x0303, 0x04},
+	{0x0305, 0x04},
+	{0x0306, 0x01},
+	{0x0307, 0x57},
+	{0x0309, 0x0a},
+	{0x030b, 0x02},
+	{0x030d, 0x04},
+	{0x030e, 0x01},
+	{0x030f, 0x49},
+	{0x0310, 0x01},
+	{0x0820, 0x07},
+	{0x0821, 0xb6},
+	{0x0822, 0x00},
+	{0x0823, 0x00},
+	{0x3e20, 0x01},
+	{0x3e37, 0x00},
+	{0x3e3b, 0x00},
+	{0x0106, 0x00},
+	{0x0b00, 0x00},
+	{0x3230, 0x00},
+	{0x3f14, 0x01},
+	{0x3f3c, 0x01},
+	{0x3f0d, 0x0a},
+	{0x3fbc, 0x00},
+	{0x3c06, 0x00},
+	{0x3c07, 0x48},
+	{0x3c0a, 0x00},
+	{0x3c0b, 0x00},
+	{0x3f78, 0x00},
+	{0x3f79, 0x40},
+	{0x3f7c, 0x00},
+	{0x3f7d, 0x00},
+};
+
+/* 720p 120fps mode */
+static const struct imx519_reg mode_1280x720_regs[] = {
+	{0x0111, 0x02},
+	{0x0112, 0x0a},
+	{0x0113, 0x0a},
+	{0x0114, 0x01},
+	{0x0342, 0x1b},
+	{0x0343, 0x3b},
+	{0x0340, 0x03},
+	{0x0341, 0x34},
+	{0x0344, 0x04},
+	{0x0345, 0x18},
+	{0x0346, 0x04},
+	{0x0347, 0x12},
+	{0x0348, 0x0e},
+	{0x0349, 0x17},
+	{0x034a, 0x09},
+	{0x034b, 0xb6},
+	{0x0220, 0x00},
+	{0x0221, 0x11},
+	{0x0222, 0x01},
+	{0x0900, 0x01},
+	{0x0901, 0x22},
+	{0x0902, 0x0a},
+	{0x3f4c, 0x01},
+	{0x3f4d, 0x01},
+	{0x4254, 0x7f},
+	{0x0401, 0x00},
+	{0x0404, 0x00},
+	{0x0405, 0x10},
+	{0x0408, 0x00},
+	{0x0409, 0x00},
+	{0x040a, 0x00},
+	{0x040b, 0x00},
+	{0x040c, 0x05},
+	{0x040d, 0x00},
+	{0x040e, 0x02},
+	{0x040f, 0xd0},
+	{0x034c, 0x05},
+	{0x034d, 0x00},
+	{0x034e, 0x02},
+	{0x034f, 0xd0},
+	{0x0301, 0x06},
+	{0x0303, 0x04},
+	{0x0305, 0x04},
+	{0x0306, 0x01},
+	{0x0307, 0x57},
+	{0x0309, 0x0a},
+	{0x030b, 0x02},
+	{0x030d, 0x04},
+	{0x030e, 0x01},
+	{0x030f, 0x49},
+	{0x0310, 0x01},
+	{0x0820, 0x07},
+	{0x0821, 0xb6},
+	{0x0822, 0x00},
+	{0x0823, 0x00},
+	{0x3e20, 0x01},
+	{0x3e37, 0x00},
+	{0x3e3b, 0x00},
+	{0x0106, 0x00},
+	{0x0b00, 0x00},
+	{0x3230, 0x00},
+	{0x3f14, 0x01},
+	{0x3f3c, 0x01},
+	{0x3f0d, 0x0a},
+	{0x3fbc, 0x00},
+	{0x3c06, 0x00},
+	{0x3c07, 0x48},
+	{0x3c0a, 0x00},
+	{0x3c0b, 0x00},
+	{0x3f78, 0x00},
+	{0x3f79, 0x40},
+	{0x3f7c, 0x00},
+	{0x3f7d, 0x00},
+};
+
+/* Mode configs */
+static const struct imx519_mode supported_modes_10bit[] = {
+	{
+		.width = 4656,
+		.height = 3496,
+		.line_length_pix = 0x4200,
+		.crop = {
+			.left = IMX519_PIXEL_ARRAY_LEFT,
+			.top = IMX519_PIXEL_ARRAY_TOP,
+			.width = 4656,
+			.height = 3496,
+		},
+		.timeperframe_min = {
+			.numerator = 100,
+			.denominator = 1000
+		},
+		.timeperframe_default = {
+			.numerator = 100,
+			.denominator = 1000
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_4656x3496_regs),
+			.regs = mode_4656x3496_regs,
+		}
+	},
+	{
+		.width = 3840,
+		.height = 2160,
+		.line_length_pix = 0x3870,
+		.crop = {
+			.left = IMX519_PIXEL_ARRAY_LEFT + 408,
+			.top = IMX519_PIXEL_ARRAY_TOP + 672,
+			.width = 3840,
+			.height = 2160,
+		},
+		.timeperframe_min = {
+			.numerator = 100,
+			.denominator = 2100
+		},
+		.timeperframe_default = {
+			.numerator = 100,
+			.denominator = 2100
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_3840x2160_regs),
+			.regs = mode_3840x2160_regs,
+		}
+	},
+	{
+		.width = 2328,
+		.height = 1748,
+		.line_length_pix = 0x2412,
+		.crop = {
+			.left = IMX519_PIXEL_ARRAY_LEFT,
+			.top = IMX519_PIXEL_ARRAY_TOP,
+			.width = 4656,
+			.height = 3496,
+		},
+		.timeperframe_min = {
+			.numerator = 100,
+			.denominator = 3000
+		},
+		.timeperframe_default = {
+			.numerator = 100,
+			.denominator = 3000
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2328x1748_regs),
+			.regs = mode_2328x1748_regs,
+		}
+	},
+	{
+		.width = 1920,
+		.height = 1080,
+		.line_length_pix = 0x25D9,
+		.crop = {
+			.left = IMX519_PIXEL_ARRAY_LEFT + 408,
+			.top = IMX519_PIXEL_ARRAY_TOP + 674,
+			.width = 3840,
+			.height = 2160,
+		},
+		.timeperframe_min = {
+			.numerator = 100,
+			.denominator = 6000
+		},
+		.timeperframe_default = {
+			.numerator = 100,
+			.denominator = 6000
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
+			.regs = mode_1920x1080_regs,
+		}
+	},
+	{
+		.width = 1280,
+		.height = 720,
+		.line_length_pix = 0x1B3B,
+		.crop = {
+			.left = IMX519_PIXEL_ARRAY_LEFT + 1048,
+			.top = IMX519_PIXEL_ARRAY_TOP + 1042,
+			.width = 2560,
+			.height = 1440,
+		},
+		.timeperframe_min = {
+			.numerator = 100,
+			.denominator = 12000
+		},
+		.timeperframe_default = {
+			.numerator = 100,
+			.denominator = 12000
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
+			.regs = mode_1280x720_regs,
+		}
+	}
+};
+
+/*
+ * The supported formats.
+ * This table MUST contain 4 entries per format, to cover the various flip
+ * combinations in the order
+ * - no flip
+ * - h flip
+ * - v flip
+ * - h&v flips
+ */
+static const u32 codes[] = {
+	/* 10-bit modes. */
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
+static const char * const imx519_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bars",
+	"Solid Color",
+	"Grey Color Bars",
+	"PN9"
+};
+
+static const int imx519_test_pattern_val[] = {
+	IMX519_TEST_PATTERN_DISABLE,
+	IMX519_TEST_PATTERN_COLOR_BARS,
+	IMX519_TEST_PATTERN_SOLID_COLOR,
+	IMX519_TEST_PATTERN_GREY_COLOR,
+	IMX519_TEST_PATTERN_PN9,
+};
+
+/* regulator supplies */
+static const char * const imx519_supply_name[] = {
+	/* Supplies can be enabled in any order */
+	"vana",  /* Analog (2.8V) supply */
+	"vdig",  /* Digital Core (1.05V) supply */
+	"vddl",  /* IF (1.8V) supply */
+};
+
+#define IMX519_NUM_SUPPLIES ARRAY_SIZE(imx519_supply_name)
+
+/*
+ * Initialisation delay between XCLR low->high and the moment when the sensor
+ * can start capture (i.e. can leave software standby), given by T7 in the
+ * datasheet is 8ms.  This does include I2C setup time as well.
+ *
+ * Note, that delay between XCLR low->high and reading the CCI ID register (T6
+ * in the datasheet) is much smaller - 600us.
+ */
+#define IMX519_XCLR_MIN_DELAY_US	8000
+#define IMX519_XCLR_DELAY_RANGE_US	1000
+
+struct imx519 {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	unsigned int fmt_code;
+
+	struct clk *xclk;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[IMX519_NUM_SUPPLIES];
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	/* V4L2 Controls */
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+
+	/* Current mode */
+	const struct imx519_mode *mode;
+
+	/*
+	 * Mutex for serialized access:
+	 * Protect sensor module set pad format and start/stop streaming safely.
+	 */
+	struct mutex mutex;
+
+	/* Streaming on/off */
+	bool streaming;
+
+	/* Rewrite common registers on stream on? */
+	bool common_regs_written;
+
+	/* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
+	unsigned int long_exp_shift;
+};
+
+static inline struct imx519 *to_imx519(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct imx519, sd);
+}
+
+/* Read registers up to 2 at a time */
+static int imx519_read_reg(struct imx519 *imx519, u16 reg, u32 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	struct i2c_msg msgs[2];
+	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
+	u8 data_buf[4] = { 0, };
+	int ret;
+
+	if (len > 4)
+		return -EINVAL;
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
+/* Write registers up to 2 at a time */
+static int imx519_write_reg(struct imx519 *imx519, u16 reg, u32 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	u8 buf[6];
+
+	if (len > 4)
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
+/* Write a list of registers */
+static int imx519_write_regs(struct imx519 *imx519,
+			     const struct imx519_reg *regs, u32 len)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = imx519_write_reg(imx519, regs[i].address, 1, regs[i].val);
+		if (ret) {
+			dev_err_ratelimited(&client->dev,
+					    "Failed to write reg 0x%4.4x. error = %d\n",
+					    regs[i].address, ret);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/* Get bayer order based on flip setting. */
+static u32 imx519_get_format_code(struct imx519 *imx519)
+{
+	unsigned int i;
+
+	lockdep_assert_held(&imx519->mutex);
+
+	i = (imx519->vflip->val ? 2 : 0) |
+	    (imx519->hflip->val ? 1 : 0);
+
+	return codes[i];
+}
+
+static int imx519_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct imx519 *imx519 = to_imx519(sd);
+	struct v4l2_mbus_framefmt *try_fmt_img =
+		v4l2_subdev_get_try_format(sd, fh->state, 0);
+	struct v4l2_rect *try_crop =
+		v4l2_subdev_get_try_crop(sd, fh->state, 0);
+
+	mutex_lock(&imx519->mutex);
+
+	/* Initialize try_fmt for the image pad */
+	try_fmt_img->width = supported_modes_10bit[0].width;
+	try_fmt_img->height = supported_modes_10bit[0].height;
+	try_fmt_img->code = imx519_get_format_code(imx519);
+	try_fmt_img->field = V4L2_FIELD_NONE;
+
+	/* Initialize try_crop */
+	try_crop->left = IMX519_PIXEL_ARRAY_LEFT;
+	try_crop->top = IMX519_PIXEL_ARRAY_TOP;
+	try_crop->width = IMX519_PIXEL_ARRAY_WIDTH;
+	try_crop->height = IMX519_PIXEL_ARRAY_HEIGHT;
+
+	mutex_unlock(&imx519->mutex);
+
+	return 0;
+}
+
+static void imx519_adjust_exposure_range(struct imx519 *imx519)
+{
+	int exposure_max, exposure_def;
+
+	/* Honour the VBLANK limits when setting exposure. */
+	exposure_max = imx519->mode->height + imx519->vblank->val -
+		       IMX519_EXPOSURE_OFFSET;
+	exposure_def = min(exposure_max, imx519->exposure->val);
+	__v4l2_ctrl_modify_range(imx519->exposure, imx519->exposure->minimum,
+				 exposure_max, imx519->exposure->step,
+				 exposure_def);
+}
+
+static int imx519_set_frame_length(struct imx519 *imx519, unsigned int val)
+{
+	int ret = 0;
+
+	imx519->long_exp_shift = 0;
+
+	while (val > IMX519_FRAME_LENGTH_MAX) {
+		imx519->long_exp_shift++;
+		val >>= 1;
+	}
+
+	ret = imx519_write_reg(imx519, IMX519_REG_FRAME_LENGTH,
+			       IMX519_REG_VALUE_16BIT, val);
+	if (ret)
+		return ret;
+
+	return imx519_write_reg(imx519, IMX519_LONG_EXP_SHIFT_REG,
+				IMX519_REG_VALUE_08BIT, imx519->long_exp_shift);
+}
+
+static int imx519_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx519 *imx519 =
+		container_of(ctrl->handler, struct imx519, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	int ret = 0;
+
+	/*
+	 * The VBLANK control may change the limits of usable exposure, so check
+	 * and adjust if necessary.
+	 */
+	if (ctrl->id == V4L2_CID_VBLANK)
+		imx519_adjust_exposure_range(imx519);
+
+	/*
+	 * Applying V4L2 control value only happens
+	 * when power is up for streaming
+	 */
+	if (pm_runtime_get_if_in_use(&client->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = imx519_write_reg(imx519, IMX519_REG_ANALOG_GAIN,
+				       IMX519_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = imx519_write_reg(imx519, IMX519_REG_EXPOSURE,
+				       IMX519_REG_VALUE_16BIT, ctrl->val >>
+							imx519->long_exp_shift);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = imx519_write_reg(imx519, IMX519_REG_DIGITAL_GAIN,
+				       IMX519_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN,
+				       IMX519_REG_VALUE_16BIT,
+				       imx519_test_pattern_val[ctrl->val]);
+		break;
+	case V4L2_CID_TEST_PATTERN_RED:
+		ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_R,
+				       IMX519_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENR:
+		ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_GR,
+				       IMX519_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN_BLUE:
+		ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_B,
+				       IMX519_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENB:
+		ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_GB,
+				       IMX519_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = imx519_write_reg(imx519, IMX519_REG_ORIENTATION, 1,
+				       imx519->hflip->val |
+				       imx519->vflip->val << 1);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = imx519_set_frame_length(imx519,
+					      imx519->mode->height + ctrl->val);
+		break;
+	default:
+		dev_info(&client->dev,
+			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
+			 ctrl->id, ctrl->val);
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops imx519_ctrl_ops = {
+	.s_ctrl = imx519_set_ctrl,
+};
+
+static int imx519_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct imx519 *imx519 = to_imx519(sd);
+
+	if (code->index > 0)
+		return -EINVAL;
+
+	mutex_lock(&imx519->mutex);
+	code->code = imx519_get_format_code(imx519);
+	mutex_unlock(&imx519->mutex);
+
+	return 0;
+}
+
+static int imx519_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct imx519 *imx519 = to_imx519(sd);
+
+	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+		return -EINVAL;
+
+	mutex_lock(&imx519->mutex);
+	if (fse->code != imx519_get_format_code(imx519)) {
+		mutex_unlock(&imx519->mutex);
+		return -EINVAL;
+	}
+	mutex_unlock(&imx519->mutex);
+
+	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static void imx519_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
+static void imx519_update_image_pad_format(struct imx519 *imx519,
+					   const struct imx519_mode *mode,
+					   struct v4l2_subdev_format *fmt)
+{
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	imx519_reset_colorspace(&fmt->format);
+}
+
+static int imx519_get_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct imx519 *imx519 = to_imx519(sd);
+
+	mutex_lock(&imx519->mutex);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *try_fmt =
+			v4l2_subdev_get_try_format(&imx519->sd, sd_state,
+						   fmt->pad);
+		/* update the code which could change due to vflip or hflip: */
+		try_fmt->code = imx519_get_format_code(imx519);
+		fmt->format = *try_fmt;
+	} else {
+		imx519_update_image_pad_format(imx519, imx519->mode,
+					       fmt);
+		fmt->format.code = imx519_get_format_code(imx519);
+	}
+
+	mutex_unlock(&imx519->mutex);
+
+	return 0;
+}
+
+static
+unsigned int imx519_get_frame_length(const struct imx519_mode *mode,
+				     const struct v4l2_fract *timeperframe)
+{
+	u64 frame_length;
+
+	frame_length = (u64)timeperframe->numerator * IMX519_PIXEL_RATE;
+	do_div(frame_length,
+	       (u64)timeperframe->denominator * mode->line_length_pix);
+
+	if (WARN_ON(frame_length > IMX519_FRAME_LENGTH_MAX))
+		frame_length = IMX519_FRAME_LENGTH_MAX;
+
+	return max_t(unsigned int, frame_length, mode->height);
+}
+
+static void imx519_set_framing_limits(struct imx519 *imx519)
+{
+	unsigned int frm_length_min, frm_length_default, hblank;
+	const struct imx519_mode *mode = imx519->mode;
+
+	frm_length_min = imx519_get_frame_length(mode, &mode->timeperframe_min);
+	frm_length_default =
+		     imx519_get_frame_length(mode, &mode->timeperframe_default);
+
+	/* Default to no long exposure multiplier. */
+	imx519->long_exp_shift = 0;
+
+	/* Update limits and set FPS to default */
+	__v4l2_ctrl_modify_range(imx519->vblank, frm_length_min - mode->height,
+				 ((1 << IMX519_LONG_EXP_SHIFT_MAX) *
+					IMX519_FRAME_LENGTH_MAX) - mode->height,
+				 1, frm_length_default - mode->height);
+
+	/* Setting this will adjust the exposure limits as well. */
+	__v4l2_ctrl_s_ctrl(imx519->vblank, frm_length_default - mode->height);
+
+	/*
+	 * Currently PPL is fixed to the mode specified value, so hblank
+	 * depends on mode->width only, and is not changeable in any
+	 * way other than changing the mode.
+	 */
+	hblank = mode->line_length_pix - mode->width;
+	__v4l2_ctrl_modify_range(imx519->hblank, hblank, hblank, 1, hblank);
+}
+
+static int imx519_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *framefmt;
+	const struct imx519_mode *mode;
+	struct imx519 *imx519 = to_imx519(sd);
+
+	mutex_lock(&imx519->mutex);
+
+	/* Bayer order varies with flips */
+	fmt->format.code = imx519_get_format_code(imx519);
+
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit),
+				      width, height,
+				      fmt->format.width,
+				      fmt->format.height);
+	imx519_update_image_pad_format(imx519, mode, fmt);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state,
+						      fmt->pad);
+		*framefmt = fmt->format;
+	} else {
+		imx519->mode = mode;
+		imx519->fmt_code = fmt->format.code;
+		imx519_set_framing_limits(imx519);
+	}
+
+	mutex_unlock(&imx519->mutex);
+
+	return 0;
+}
+
+static const struct v4l2_rect *
+__imx519_get_pad_crop(struct imx519 *imx519, struct v4l2_subdev_state *sd_state,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&imx519->sd, sd_state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx519->mode->crop;
+	}
+
+	return NULL;
+}
+
+static int imx519_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct imx519 *imx519 = to_imx519(sd);
+
+		mutex_lock(&imx519->mutex);
+		sel->r = *__imx519_get_pad_crop(imx519, sd_state, sel->pad,
+						sel->which);
+		mutex_unlock(&imx519->mutex);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = IMX519_NATIVE_WIDTH;
+		sel->r.height = IMX519_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = IMX519_PIXEL_ARRAY_LEFT;
+		sel->r.top = IMX519_PIXEL_ARRAY_TOP;
+		sel->r.width = IMX519_PIXEL_ARRAY_WIDTH;
+		sel->r.height = IMX519_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+/* Start streaming */
+static int imx519_start_streaming(struct imx519 *imx519)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	const struct imx519_reg_list *reg_list;
+	int ret;
+
+	if (!imx519->common_regs_written) {
+		ret = imx519_write_regs(imx519, mode_common_regs,
+					ARRAY_SIZE(mode_common_regs));
+
+		if (ret) {
+			dev_err(&client->dev, "%s failed to set common settings\n",
+				__func__);
+			return ret;
+		}
+		imx519->common_regs_written = true;
+	}
+
+	/* Apply default values of current mode */
+	reg_list = &imx519->mode->reg_list;
+	ret = imx519_write_regs(imx519, reg_list->regs, reg_list->num_of_regs);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		return ret;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(imx519->sd.ctrl_handler);
+	if (ret)
+		return ret;
+
+	/* set stream on register */
+	return imx519_write_reg(imx519, IMX519_REG_MODE_SELECT,
+				IMX519_REG_VALUE_08BIT, IMX519_MODE_STREAMING);
+}
+
+/* Stop streaming */
+static int imx519_stop_streaming(struct imx519 *imx519)
+{
+	/* set stream off register */
+	return imx519_write_reg(imx519, IMX519_REG_MODE_SELECT,
+				IMX519_REG_VALUE_08BIT, IMX519_MODE_STANDBY);
+}
+
+static int imx519_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct imx519 *imx519 = to_imx519(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	mutex_lock(&imx519->mutex);
+	if (imx519->streaming == enable) {
+		mutex_unlock(&imx519->mutex);
+		return 0;
+	}
+
+	if (enable) {
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
+			goto err_unlock;
+
+		/*
+		 * Apply default & customized values
+		 * and then start streaming.
+		 */
+		ret = imx519_start_streaming(imx519);
+		if (ret)
+			goto err_rpm_put;
+	} else {
+		ret = imx519_stop_streaming(imx519);
+		pm_runtime_put(&client->dev);
+	}
+
+	imx519->streaming = enable;
+
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(imx519->vflip, enable);
+	__v4l2_ctrl_grab(imx519->hflip, enable);
+
+	mutex_unlock(&imx519->mutex);
+
+	return ret;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+err_unlock:
+	mutex_unlock(&imx519->mutex);
+
+	return ret;
+}
+
+/* Power/clock management functions */
+static int imx519_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx519 *imx519 = to_imx519(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(IMX519_NUM_SUPPLIES,
+				    imx519->supplies);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable regulators\n",
+			__func__);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(imx519->xclk);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable clock\n",
+			__func__);
+		goto reg_off;
+	}
+
+	gpiod_set_value_cansleep(imx519->reset_gpio, 1);
+	usleep_range(IMX519_XCLR_MIN_DELAY_US,
+		     IMX519_XCLR_MIN_DELAY_US + IMX519_XCLR_DELAY_RANGE_US);
+
+	return 0;
+
+reg_off:
+	regulator_bulk_disable(IMX519_NUM_SUPPLIES, imx519->supplies);
+
+	return ret;
+}
+
+static int imx519_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx519 *imx519 = to_imx519(sd);
+
+	gpiod_set_value_cansleep(imx519->reset_gpio, 0);
+	regulator_bulk_disable(IMX519_NUM_SUPPLIES, imx519->supplies);
+	clk_disable_unprepare(imx519->xclk);
+
+	/* Force reprogramming of the common registers when powered up again. */
+	imx519->common_regs_written = false;
+
+	return 0;
+}
+
+static int __maybe_unused imx519_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx519 *imx519 = to_imx519(sd);
+	int ret;
+
+	if (imx519->streaming)
+		ret = imx519_stop_streaming(imx519);
+
+	return ret;
+}
+
+static int __maybe_unused imx519_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx519 *imx519 = to_imx519(sd);
+	int ret;
+
+	if (imx519->streaming) {
+		ret = imx519_start_streaming(imx519);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	imx519_stop_streaming(imx519);
+	imx519->streaming = 0;
+
+	return ret;
+}
+
+static int imx519_get_regulators(struct imx519 *imx519)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	unsigned int i;
+
+	for (i = 0; i < IMX519_NUM_SUPPLIES; i++)
+		imx519->supplies[i].supply = imx519_supply_name[i];
+
+	return devm_regulator_bulk_get(&client->dev,
+				       IMX519_NUM_SUPPLIES,
+				       imx519->supplies);
+}
+
+/* Verify chip ID */
+static int imx519_identify_module(struct imx519 *imx519, u32 expected_id)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	int ret;
+	u32 val;
+
+	ret = imx519_read_reg(imx519, IMX519_REG_CHIP_ID,
+			      IMX519_REG_VALUE_16BIT, &val);
+	if (ret) {
+		dev_err(&client->dev, "failed to read chip id %x, with error %d\n",
+			expected_id, ret);
+		return ret;
+	}
+
+	if (val != expected_id) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			expected_id, val);
+		return -EIO;
+	}
+
+	dev_info(&client->dev, "Device found is imx%x\n", val);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops imx519_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops imx519_video_ops = {
+	.s_stream = imx519_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops imx519_pad_ops = {
+	.enum_mbus_code = imx519_enum_mbus_code,
+	.get_fmt = imx519_get_pad_format,
+	.set_fmt = imx519_set_pad_format,
+	.get_selection = imx519_get_selection,
+	.enum_frame_size = imx519_enum_frame_size,
+};
+
+static const struct v4l2_subdev_ops imx519_subdev_ops = {
+	.core = &imx519_core_ops,
+	.video = &imx519_video_ops,
+	.pad = &imx519_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops imx519_internal_ops = {
+	.open = imx519_open,
+};
+
+/* Initialize control handlers */
+static int imx519_init_controls(struct imx519 *imx519)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
+	struct v4l2_fwnode_device_properties props;
+	unsigned int i;
+	int ret;
+
+	ctrl_hdlr = &imx519->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 16);
+	if (ret)
+		return ret;
+
+	mutex_init(&imx519->mutex);
+	ctrl_hdlr->lock = &imx519->mutex;
+
+	/* By default, PIXEL_RATE is read only */
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  IMX519_PIXEL_RATE, IMX519_PIXEL_RATE, 1,
+			  IMX519_PIXEL_RATE);
+
+	/*
+	 * Create the controls here, but mode specific limits are setup
+	 * in the imx519_set_framing_limits() call below.
+	 */
+	imx519->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops,
+					   V4L2_CID_VBLANK, 0, 0xffff, 1, 0);
+	imx519->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops,
+					   V4L2_CID_HBLANK, 0, 0xffff, 1, 0);
+
+	/* HBLANK is read-only for now, but does change with mode. */
+	if (imx519->hblank)
+		imx519->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx519->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX519_EXPOSURE_MIN,
+					     IMX519_EXPOSURE_MAX,
+					     IMX519_EXPOSURE_STEP,
+					     IMX519_EXPOSURE_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  IMX519_ANA_GAIN_MIN, IMX519_ANA_GAIN_MAX,
+			  IMX519_ANA_GAIN_STEP, IMX519_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  IMX519_DGTL_GAIN_MIN, IMX519_DGTL_GAIN_MAX,
+			  IMX519_DGTL_GAIN_STEP, IMX519_DGTL_GAIN_DEFAULT);
+
+	imx519->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx519->hflip)
+		imx519->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	imx519->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx519->vflip)
+		imx519->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx519_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx519_test_pattern_menu) - 1,
+				     0, 0, imx519_test_pattern_menu);
+	for (i = 0; i < 4; i++) {
+		/*
+		 * The assumption is that
+		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
+		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
+		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
+		 */
+		v4l2_ctrl_new_std(ctrl_hdlr, &imx519_ctrl_ops,
+				  V4L2_CID_TEST_PATTERN_RED + i,
+				  IMX519_TEST_PATTERN_COLOUR_MIN,
+				  IMX519_TEST_PATTERN_COLOUR_MAX,
+				  IMX519_TEST_PATTERN_COLOUR_STEP,
+				  IMX519_TEST_PATTERN_COLOUR_MAX);
+		/* The "Solid color" pattern is white by default */
+	}
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(&client->dev, "%s control init failed (%d)\n",
+			__func__, ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx519_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	imx519->sd.ctrl_handler = ctrl_hdlr;
+
+	mutex_lock(&imx519->mutex);
+
+	/* Setup exposure and frame/line length limits. */
+	imx519_set_framing_limits(imx519);
+
+	mutex_unlock(&imx519->mutex);
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+	mutex_destroy(&imx519->mutex);
+
+	return ret;
+}
+
+static void imx519_free_controls(struct imx519 *imx519)
+{
+	v4l2_ctrl_handler_free(imx519->sd.ctrl_handler);
+	mutex_destroy(&imx519->mutex);
+}
+
+static int imx519_check_hwcfg(struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	int ret = -EINVAL;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
+		dev_err(dev, "could not parse endpoint\n");
+		goto error_out;
+	}
+
+	/* Check the number of MIPI CSI2 data lanes */
+	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+		dev_err(dev, "only 2 data lanes are currently supported\n");
+		goto error_out;
+	}
+
+	/* Check the link frequency set in device tree */
+	if (!ep_cfg.nr_of_link_frequencies) {
+		dev_err(dev, "link-frequency property not found in DT\n");
+		goto error_out;
+	}
+
+	if (ep_cfg.nr_of_link_frequencies != 1 ||
+	    ep_cfg.link_frequencies[0] != IMX519_DEFAULT_LINK_FREQ) {
+		dev_err(dev, "Link frequency not supported: %lld\n",
+			ep_cfg.link_frequencies[0]);
+		goto error_out;
+	}
+
+	ret = 0;
+
+error_out:
+	v4l2_fwnode_endpoint_free(&ep_cfg);
+	fwnode_handle_put(endpoint);
+
+	return ret;
+}
+
+static const struct of_device_id imx519_dt_ids[] = {
+	{ .compatible = "sony,imx519"},
+	{ /* sentinel */ }
+};
+
+static int imx519_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct imx519 *imx519;
+	const struct of_device_id *match;
+	u32 xclk_freq;
+	int ret;
+
+	imx519 = devm_kzalloc(&client->dev, sizeof(*imx519), GFP_KERNEL);
+	if (!imx519)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&imx519->sd, client, &imx519_subdev_ops);
+
+	match = of_match_device(imx519_dt_ids, dev);
+	if (!match)
+		return -ENODEV;
+
+	/* Check the hardware configuration in device tree */
+	if (imx519_check_hwcfg(dev))
+		return -EINVAL;
+
+	/* Get system clock (xclk) */
+	imx519->xclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(imx519->xclk)) {
+		dev_err(dev, "failed to get xclk\n");
+		return PTR_ERR(imx519->xclk);
+	}
+
+	xclk_freq = clk_get_rate(imx519->xclk);
+	if (xclk_freq != IMX519_XCLK_FREQ) {
+		dev_err(dev, "xclk frequency not supported: %d Hz\n",
+			xclk_freq);
+		return -EINVAL;
+	}
+
+	ret = imx519_get_regulators(imx519);
+	if (ret) {
+		dev_err(dev, "failed to get regulators\n");
+		return ret;
+	}
+
+	/* Request optional enable pin */
+	imx519->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+
+	/*
+	 * The sensor must be powered for imx519_identify_module()
+	 * to be able to read the CHIP_ID register
+	 */
+	ret = imx519_power_on(dev);
+	if (ret)
+		return ret;
+
+	ret = imx519_identify_module(imx519, IMX519_CHIP_ID);
+	if (ret)
+		goto error_power_off;
+
+	/* Set default mode to max resolution */
+	imx519->mode = &supported_modes_10bit[0];
+	imx519->fmt_code = MEDIA_BUS_FMT_SRGGB10_1X10;
+
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	/* This needs the pm runtime to be registered. */
+	ret = imx519_init_controls(imx519);
+	if (ret)
+		goto error_rpm_disable;
+
+	/* Initialize subdev */
+	imx519->sd.internal_ops = &imx519_internal_ops;
+	imx519->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	imx519->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* Initialize source pads */
+	imx519->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&imx519->sd.entity, 1, &imx519->pad);
+	if (ret) {
+		dev_err(dev, "failed to init entity pads: %d\n", ret);
+		goto error_handler_free;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&imx519->sd);
+	if (ret < 0) {
+		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
+		goto error_media_entity;
+	}
+
+	return 0;
+
+error_media_entity:
+	media_entity_cleanup(&imx519->sd.entity);
+
+error_handler_free:
+	imx519_free_controls(imx519);
+
+error_rpm_disable:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+
+error_power_off:
+	imx519_power_off(&client->dev);
+
+	return ret;
+}
+
+static void imx519_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx519 *imx519 = to_imx519(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	imx519_free_controls(imx519);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		imx519_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+MODULE_DEVICE_TABLE(of, imx519_dt_ids);
+
+static const struct dev_pm_ops imx519_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(imx519_suspend, imx519_resume)
+	SET_RUNTIME_PM_OPS(imx519_power_off, imx519_power_on, NULL)
+};
+
+static struct i2c_driver imx519_i2c_driver = {
+	.driver = {
+		.name = "imx519",
+		.of_match_table	= imx519_dt_ids,
+		.pm = &imx519_pm_ops,
+	},
+	.probe_new = imx519_probe,
+	.remove = imx519_remove,
+};
+
+module_i2c_driver(imx519_i2c_driver);
+
+MODULE_AUTHOR("lee.jackson <lee.jackson@arducam.com>");
+MODULE_DESCRIPTION("Sony IMX519 sensor driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1
