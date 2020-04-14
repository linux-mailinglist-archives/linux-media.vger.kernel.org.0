Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB5C1A8BD8
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 22:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505436AbgDNUCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 16:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505430AbgDNUCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 16:02:23 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB3CC03C1AC
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:21 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id f8so745104lfe.12
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=93eQmoAS6iN3nLt/Fs9CPIFvJsFPY+LO56r2iHo1/yo=;
        b=i80XBi2cChdxBtILuvb+xNLEvBSjjHeS1rwR6A0mK3TVK0WHCAMHPR+Vi5XTN6fBau
         0M0hDhh2QeOhb5r1QNveT/LlBMSxYFCnEj1LXHJo+ngHX+O71F6qSWd5aznrnb3MB5a+
         etE6XeHujaAQnjtbjXPEo1An7Dnb78xEEXN70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=93eQmoAS6iN3nLt/Fs9CPIFvJsFPY+LO56r2iHo1/yo=;
        b=hJ93MBkXLAIk/Swbfb65uXM6g/dhwecZrZnRldQuY1f/j1tFOxCMwputXDpiDgY69Z
         yLw6Oh/pHF1c9t/GK+RIvXIA+A+lt4u75aRAaHOQcS24bX7IFCLDgLy4JhCVygofgnrU
         mqQDwnIU2DnoGZozi4wSlJNU/7Z3GzkyfhsaR6FKUQBEzXn0wLvKvIza5rQ5+J0OcRb3
         b8ujZ5bgcBPp+Gpk6i1DICBuZG2rVKqVB0Ai0dEdxfhrGi9AIPeiQnmIKNJGcUGzlq0F
         bZsHaWaMSoVGQSDw1zOsv9W7se587dY0jYHhvm357MSkNITQIT7rNeG9KOEkEI3iZnpy
         BLlQ==
X-Gm-Message-State: AGi0PubN+a5p6tpPkiQJjpiZBar9fT5eXm92rNKsem3DoswxLuXAhplJ
        qFpuxwPJw2ntvuYbOA4l++Yzdw==
X-Google-Smtp-Source: APiQypKzdNkDLYPVTk5sGgOGLDf4o33Lv3m41cnGoUFyPQO6et/gOEY3hX0xLFcmQFMOounsm+qm4A==
X-Received: by 2002:a19:2d1d:: with SMTP id k29mr870518lfj.46.1586894539449;
        Tue, 14 Apr 2020 13:02:19 -0700 (PDT)
Received: from localhost.localdomain (62-243-86-95-cable.dk.customer.tdc.net. [62.243.86.95])
        by smtp.gmail.com with ESMTPSA id v4sm3525254ljj.104.2020.04.14.13.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:02:18 -0700 (PDT)
From:   Daniel Gomez <daniel@qtec.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Daniel Gomez <daniel@qtec.com>
Subject: [RFC PATCH 3/3] media: imx378: Add imx378 camera sensor driver
Date:   Tue, 14 Apr 2020 22:01:51 +0200
Message-Id: <20200414200151.80089-4-daniel@qtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414200151.80089-1-daniel@qtec.com>
References: <20200414200151.80089-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2 sub-device driver for the Sony IMX378 image sensor.
This is a camera sensor using the I2C bus for control and the
CSI-2 bus for data.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx378.c | 1829 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1841 insertions(+)
 create mode 100644 drivers/media/i2c/imx378.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index efd12bf4f8eb..8ea630275faf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -796,6 +796,17 @@ config VIDEO_IMX355
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx355.
 
+config VIDEO_IMX378
+	tristate "Sony IMX378 sensor support"
+	depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX378 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx378.
+
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	depends on VIDEO_V4L2 && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 77bf7d0b691f..dff1c9ec444f 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -117,6 +117,7 @@ obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
 obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
 obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
+obj-$(CONFIG_VIDEO_IMX378)	+= imx378.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
 
 obj-$(CONFIG_SDR_MAX2175) += max2175.o
diff --git a/drivers/media/i2c/imx378.c b/drivers/media/i2c/imx378.c
new file mode 100644
index 000000000000..6e22c3b45f72
--- /dev/null
+++ b/drivers/media/i2c/imx378.c
@@ -0,0 +1,1829 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * imx378.c - imx378 sensor driver
+ *
+ * Copyright 2019 Qtechnology A/S
+ *
+ * Daniel Gomez <daniel@qtec.com>
+ *
+ * Based on imx214.c and imx355.c
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define IMX378_DEFAULT_CLK_FREQ 24000000
+#define IMX378_DEFAULT_LINK_FREQ 480000000
+#define IMX378_DEFAULT_LINK_MFREQ (IMX378_DEFAULT_LINK_FREQ / 1000000)
+#define IMX378_DEFAULT_PIXEL_RATE ((IMX378_DEFAULT_LINK_FREQ * 8LL) / 10)
+#define IMX378_DEFAULT_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
+#define IMX378_DEFAULT_FIVAL {1, 30}
+#define IMX378_LINE_LENGTH 4444
+#define IMX378_MIN_WIDTH 4
+#define IMX378_MIN_HEIGHT 4
+#define IMX378_MAX_DEFAULT_WIDTH 4032
+#define IMX378_MAX_DEFAULT_HEIGHT 3040
+#define IMX378_MAX_BOUNDS_WIDTH 4032
+#define IMX378_MAX_BOUNDS_HEIGHT 3104
+#define IMX378_CID_CUSTOM_BASE (V4L2_CID_USER_BASE | 0xf000)
+#define IMX378_CID_GREEN_BALANCE (IMX378_CID_CUSTOM_BASE + 0)
+
+static const char * const imx378_supply_name[] = {
+	"vdda",
+	"vddd",
+	"vdddo",
+};
+
+#define IMX378_NUM_SUPPLIES ARRAY_SIZE(imx378_supply_name)
+
+struct imx378 {
+	struct device *dev;
+	struct clk *xclk;
+	struct regmap *regmap;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_rect crop;
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *analogue_gain;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
+	struct v4l2_ctrl *green_balance;
+	struct v4l2_ctrl *temperature;
+
+	struct regulator_bulk_data supplies[IMX378_NUM_SUPPLIES];
+
+	struct gpio_desc *enable_gpio;
+
+	struct mutex mutex;
+
+	struct v4l2_fract fival;
+
+	bool streaming;
+};
+
+struct reg_8 {
+	u16 addr;
+	u8 val;
+};
+
+enum {
+	IMX378_TABLE_WAIT_MS = 0,
+	IMX378_TABLE_END,
+	IMX378_MAX_RETRIES,
+	IMX378_WAIT_MS
+};
+
+static const struct reg_8 mode_table_common[] = {
+	/* software standby settings */
+	{0x0100, 0x00},
+
+	/* software reset */
+	{0x0103, 0x01},
+
+	/* CSI */
+	{0x0112, 0x0A},
+	{0x0113, 0x0A},
+	{0x0114, 0x03},
+
+	/* global settings */
+	{0x0136, 0x18},
+	{0x0137, 0x00},
+
+	{0x0202, 0x20},
+	{0x0203, 0xa0},
+	{0x0204, 0x03},
+	{0x0205, 0xd2},
+	{0x020e, 0x01},
+	{0x020f, 0x00},
+	{0x0210, 0x02},
+	{0x0211, 0x21},
+	{0x0212, 0x01},
+	{0x0213, 0xee},
+	{0x0214, 0x01},
+	{0x0215, 0x00},
+	{0x0220, 0x00},
+	{0x0221, 0x11},
+
+	{0x0301, 0x05},
+	{0x0303, 0x02},
+	{0x0305, 0x03},
+	{0x0306, 0x00},
+	{0x0307, 0x96},
+
+	{0x0309, 0x0a},
+	{0x030b, 0x01},
+	{0x030d, 0x02},
+	{0x030e, 0x00},
+	{0x030f, 0xf6},
+	{0x0310, 0x00},
+	{0x0340, 0x04},
+	{0x0341, 0xb0},
+	{0x0342, 0x20},
+	{0x0343, 0x08},
+	{0x0344, 0x00},
+	{0x0345, 0x00},
+	{0x0346, 0x01},
+	{0x0347, 0x78},
+	{0x0348, 0x0f},
+	{0x0349, 0xd7},
+	{0x0350, 0x01},
+	{0x034a, 0x0a},
+	{0x034b, 0x67},
+	{0x034c, 0x07},
+	{0x034d, 0x80},
+	{0x034e, 0x04},
+	{0x034f, 0x38},
+	{0x0381, 0x01},
+	{0x0383, 0x01},
+	{0x0385, 0x01},
+	{0x0387, 0x01},
+
+	{0x0401, 0x00},
+	{0x0404, 0x00},
+	{0x0405, 0x10},
+	{0x0408, 0x00},
+	{0x0409, 0x6c},
+	{0x040a, 0x00},
+	{0x040b, 0x40},
+	{0x040c, 0x07},
+	{0x040d, 0x80},
+	{0x040e, 0x04},
+	{0x040f, 0x38},
+
+	{0x0900, 0x00},
+	{0x0901, 0x11},
+	{0x0902, 0x02},
+
+	{0x0c1a, 0x01},
+	{0x0c1b, 0x01},
+
+	{0x3030, 0x01},
+	{0x3032, 0x00},
+	{0x3033, 0x40},
+	{0x3140, 0x02},
+	{0x38a8, 0x1f},
+	{0x38a9, 0xff},
+	{0x38aa, 0x1f},
+	{0x38ab, 0xff},
+	{0x3c00, 0x00},
+	{0x3c01, 0x03},
+	{0x3c02, 0xdc},
+	{0x3d8a, 0x01},
+	{0x3e20, 0x01},
+	{0x3e37, 0x01},
+	{0x3f0d, 0x00},
+	{0x3f50, 0x00},
+	{0x3f56, 0x00},
+	{0x3f57, 0x01},
+	{0x3ff9, 0x00},
+
+	{0x4421, 0x08},
+	{0x4ae9, 0x18},
+	{0x4ae9, 0x21},
+	{0x4aea, 0x08},
+	{0x4aea, 0x80},
+
+	{0x55d4, 0x00},
+	{0x55d5, 0x00},
+	{0x55d6, 0x07},
+	{0x55d7, 0xff},
+	{0x55e8, 0x07},
+	{0x55e9, 0xff},
+	{0x55ea, 0x00},
+	{0x55eb, 0x00},
+	{0x5748, 0x07},
+	{0x5749, 0xff},
+	{0x574a, 0x00},
+	{0x574b, 0x00},
+	{0x574c, 0x07},
+	{0x574d, 0xff},
+	{0x574e, 0x00},
+	{0x574f, 0x00},
+	{0x5754, 0x00},
+	{0x5755, 0x00},
+	{0x5756, 0x07},
+	{0x5757, 0xff},
+	{0x5973, 0x04},
+	{0x5974, 0x01},
+	{0x5d13, 0xc3},
+	{0x5d14, 0x58},
+	{0x5d15, 0xa3},
+	{0x5d16, 0x1d},
+	{0x5d17, 0x65},
+	{0x5d18, 0x8c},
+	{0x5d1a, 0x06},
+	{0x5d1b, 0xa9},
+	{0x5d1c, 0x45},
+	{0x5d1d, 0x3a},
+	{0x5d1e, 0xab},
+	{0x5d1f, 0x15},
+	{0x5d21, 0x0e},
+	{0x5d22, 0x52},
+	{0x5d23, 0xaa},
+	{0x5d24, 0x7d},
+	{0x5d25, 0x57},
+	{0x5d26, 0xa8},
+	{0x5d37, 0x5a},
+	{0x5d38, 0x5a},
+	{0x5d77, 0x7f},
+
+	{0x7b3b, 0x01},
+	{0x7b4c, 0x00},
+	{0x7b53, 0x01},
+	{0x7b75, 0x0e},
+	{0x7b76, 0x0b},
+	{0x7b77, 0x08},
+	{0x7b78, 0x0a},
+	{0x7b79, 0x47},
+	{0x7b7c, 0x00},
+	{0x7b7d, 0x00},
+
+	{0x8d1f, 0x00},
+	{0x8d27, 0x00},
+
+	{0x9004, 0x03},
+	{0x9200, 0x50},
+	{0x9201, 0x6c},
+	{0x9202, 0x71},
+	{0x9203, 0x00},
+	{0x9204, 0x71},
+	{0x9205, 0x01},
+	{0x9304, 0x03},
+	{0x9305, 0x00},
+	{0x9369, 0x5a},
+	{0x936b, 0x55},
+	{0x936d, 0x28},
+	{0x9371, 0x6a},
+	{0x9373, 0x6a},
+	{0x9375, 0x64},
+	{0x9905, 0x00},
+	{0x9907, 0x00},
+	{0x9909, 0x00},
+	{0x990b, 0x00},
+	{0x991a, 0x00},
+	{0x9944, 0x3c},
+	{0x9947, 0x3c},
+	{0x994a, 0x8c},
+	{0x994b, 0x50},
+	{0x994c, 0x1b},
+	{0x994d, 0x8c},
+	{0x994e, 0x50},
+	{0x994f, 0x1b},
+	{0x9950, 0x8c},
+	{0x9951, 0x1b},
+	{0x9952, 0x0a},
+	{0x9953, 0x8c},
+	{0x9954, 0x1b},
+	{0x9955, 0x0a},
+	{0x996b, 0x8c},
+	{0x996c, 0x64},
+	{0x996d, 0x50},
+	{0x9a13, 0x04},
+	{0x9a14, 0x04},
+	{0x9a19, 0x00},
+	{0x9a1c, 0x04},
+	{0x9a1d, 0x04},
+	{0x9a26, 0x05},
+	{0x9a27, 0x05},
+	{0x9a2c, 0x01},
+	{0x9a2d, 0x03},
+	{0x9a2f, 0x05},
+	{0x9a30, 0x05},
+	{0x9a41, 0x00},
+	{0x9a46, 0x00},
+	{0x9a47, 0x00},
+	{0x9a4c, 0x0d},
+	{0x9a4d, 0x0d},
+	{0x9c17, 0x35},
+	{0x9c1d, 0x31},
+	{0x9c29, 0x50},
+	{0x9c3b, 0x2f},
+	{0x9c41, 0x6b},
+	{0x9c47, 0x2d},
+	{0x9c4d, 0x40},
+	{0x9c6b, 0x00},
+	{0x9c71, 0xc8},
+	{0x9c73, 0x32},
+	{0x9c75, 0x04},
+	{0x9c7d, 0x2d},
+	{0x9c83, 0x40},
+	{0x9c94, 0x3f},
+	{0x9c95, 0x3f},
+	{0x9c96, 0x3f},
+	{0x9c97, 0x00},
+	{0x9c98, 0x00},
+	{0x9c99, 0x00},
+	{0x9c9a, 0x3f},
+	{0x9c9b, 0x3f},
+	{0x9c9c, 0x3f},
+	{0x9ca0, 0x0f},
+	{0x9ca1, 0x0f},
+	{0x9ca2, 0x0f},
+	{0x9ca3, 0x00},
+	{0x9ca4, 0x00},
+	{0x9ca5, 0x00},
+	{0x9ca6, 0x1e},
+	{0x9ca7, 0x1e},
+	{0x9ca8, 0x1e},
+	{0x9ca9, 0x00},
+	{0x9caa, 0x00},
+	{0x9cab, 0x00},
+	{0x9cac, 0x09},
+	{0x9cad, 0x09},
+	{0x9cae, 0x09},
+	{0x9cbd, 0x50},
+	{0x9cbf, 0x50},
+	{0x9cc1, 0x50},
+	{0x9cc3, 0x40},
+	{0x9cc5, 0x40},
+	{0x9cc7, 0x40},
+	{0x9cc9, 0x0a},
+	{0x9ccb, 0x0a},
+	{0x9ccd, 0x0a},
+	{0x9d17, 0x35},
+	{0x9d1d, 0x31},
+	{0x9d29, 0x50},
+	{0x9d3b, 0x2f},
+	{0x9d41, 0x6b},
+	{0x9d47, 0x42},
+	{0x9d4d, 0x5a},
+	{0x9d6b, 0x00},
+	{0x9d71, 0xc8},
+	{0x9d73, 0x32},
+	{0x9d75, 0x04},
+	{0x9d7d, 0x42},
+	{0x9d83, 0x5a},
+	{0x9d94, 0x3f},
+	{0x9d95, 0x3f},
+	{0x9d96, 0x3f},
+	{0x9d97, 0x00},
+	{0x9d98, 0x00},
+	{0x9d99, 0x00},
+	{0x9d9a, 0x3f},
+	{0x9d9b, 0x3f},
+	{0x9d9c, 0x3f},
+	{0x9d9d, 0x1f},
+	{0x9d9e, 0x1f},
+	{0x9d9f, 0x1f},
+	{0x9da0, 0x0f},
+	{0x9da1, 0x0f},
+	{0x9da2, 0x0f},
+	{0x9da3, 0x00},
+	{0x9da4, 0x00},
+	{0x9da5, 0x00},
+	{0x9da6, 0x1e},
+	{0x9da7, 0x1e},
+	{0x9da8, 0x1e},
+	{0x9da9, 0x00},
+	{0x9daa, 0x00},
+	{0x9dab, 0x00},
+	{0x9dac, 0x09},
+	{0x9dad, 0x09},
+	{0x9dae, 0x09},
+	{0x9dc9, 0x0a},
+	{0x9dcb, 0x0a},
+	{0x9dcd, 0x0a},
+	{0x9e17, 0x35},
+	{0x9e1d, 0x31},
+	{0x9e29, 0x50},
+	{0x9e3b, 0x2f},
+	{0x9e41, 0x6b},
+	{0x9e47, 0x2d},
+	{0x9e4d, 0x40},
+	{0x9e6b, 0x00},
+	{0x9e71, 0xc8},
+	{0x9e73, 0x32},
+	{0x9e75, 0x04},
+	{0x9e94, 0x0f},
+	{0x9e95, 0x0f},
+	{0x9e96, 0x0f},
+	{0x9e97, 0x00},
+	{0x9e98, 0x00},
+	{0x9e99, 0x00},
+	{0x9e9a, 0x2f},
+	{0x9e9b, 0x2f},
+	{0x9e9c, 0x2f},
+	{0x9e9d, 0x00},
+	{0x9e9e, 0x00},
+	{0x9e9f, 0x00},
+	{0x9ea0, 0x0f},
+	{0x9ea1, 0x0f},
+	{0x9ea2, 0x0f},
+	{0x9ea3, 0x00},
+	{0x9ea4, 0x00},
+	{0x9ea5, 0x00},
+	{0x9ea6, 0x3f},
+	{0x9ea7, 0x3f},
+	{0x9ea8, 0x3f},
+	{0x9ea9, 0x00},
+	{0x9eaa, 0x00},
+	{0x9eab, 0x00},
+	{0x9eac, 0x09},
+	{0x9ead, 0x09},
+	{0x9eae, 0x09},
+	{0x9ec9, 0x0a},
+	{0x9ecb, 0x0a},
+	{0x9ecd, 0x0a},
+	{0x9f17, 0x35},
+	{0x9f1d, 0x31},
+	{0x9f29, 0x50},
+	{0x9f3b, 0x2f},
+	{0x9f41, 0x6b},
+	{0x9f47, 0x42},
+	{0x9f4d, 0x5a},
+	{0x9f6b, 0x00},
+	{0x9f71, 0xc8},
+	{0x9f73, 0x32},
+	{0x9f75, 0x04},
+	{0x9f94, 0x0f},
+	{0x9f95, 0x0f},
+	{0x9f96, 0x0f},
+	{0x9f97, 0x00},
+	{0x9f98, 0x00},
+	{0x9f99, 0x00},
+	{0x9f9a, 0x2f},
+	{0x9f9b, 0x2f},
+	{0x9f9c, 0x2f},
+	{0x9f9d, 0x00},
+	{0x9f9e, 0x00},
+	{0x9f9f, 0x00},
+	{0x9fa0, 0x0f},
+	{0x9fa1, 0x0f},
+	{0x9fa2, 0x0f},
+	{0x9fa3, 0x00},
+	{0x9fa4, 0x00},
+	{0x9fa5, 0x00},
+	{0x9fa6, 0x1e},
+	{0x9fa7, 0x1e},
+	{0x9fa8, 0x1e},
+	{0x9fa9, 0x00},
+	{0x9faa, 0x00},
+	{0x9fab, 0x00},
+	{0x9fac, 0x09},
+	{0x9fad, 0x09},
+	{0x9fae, 0x09},
+	{0x9fc9, 0x0a},
+	{0x9fcb, 0x0a},
+	{0x9fcd, 0x0a},
+
+	{0xa001, 0x0a},
+	{0xa003, 0x0a},
+	{0xa005, 0x0a},
+	{0xa006, 0x01},
+	{0xa007, 0xc0},
+	{0xa009, 0xc0},
+	{0xa14b, 0xff},
+	{0xa151, 0x0c},
+	{0xa153, 0x50},
+	{0xa155, 0x02},
+	{0xa157, 0x00},
+	{0xa1ad, 0xff},
+	{0xa1b3, 0x0c},
+	{0xa1b5, 0x50},
+	{0xa1b9, 0x00},
+	{0xa24b, 0xff},
+	{0xa257, 0x00},
+	{0xa2a9, 0x60},
+	{0xa2ad, 0xff},
+	{0xa2b7, 0x00},
+	{0xa2b9, 0x00},
+
+	{0xb21f, 0x04},
+	{0xb35c, 0x00},
+	{0xb35e, 0x08},
+	{0xbcf1, 0x02},
+	{0xe000, 0x00},
+	{0xf61c, 0x04},
+	{0xf61e, 0x04},
+
+	{IMX378_TABLE_END, 0x00}
+};
+
+static inline struct imx378 *to_imx378(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct imx378, sd);
+}
+
+static int imx378_set_flip_mode(struct imx378 *imx378, u32 code)
+{
+	/* WORKAROUND to update controls */
+	imx378->vflip->flags &= ~V4L2_CTRL_FLAG_READ_ONLY;
+	imx378->hflip->flags &= ~V4L2_CTRL_FLAG_READ_ONLY;
+
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		v4l2_ctrl_s_ctrl(imx378->vflip, 1);
+		v4l2_ctrl_s_ctrl(imx378->hflip, 1);
+		break;
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+		v4l2_ctrl_s_ctrl(imx378->vflip, 1);
+		v4l2_ctrl_s_ctrl(imx378->hflip, 0);
+		break;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		v4l2_ctrl_s_ctrl(imx378->vflip, 0);
+		v4l2_ctrl_s_ctrl(imx378->hflip, 1);
+		break;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		v4l2_ctrl_s_ctrl(imx378->vflip, 0);
+		v4l2_ctrl_s_ctrl(imx378->hflip, 0);
+		break;
+	default:
+		break;
+	}
+
+	/* WORKAROUND to update controls */
+	imx378->vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	imx378->hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	return 0;
+}
+
+static u32 imx378_get_format_code(struct imx378 *imx378)
+{
+	/*
+	 * Only one bayer order is supported.
+	 * It depends on the flip settings.
+	 */
+	u32 code;
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
+		{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
+	};
+
+	lockdep_assert_held(&imx378->mutex);
+	code = codes[imx378->vflip->val][imx378->hflip->val];
+
+	return code;
+}
+
+static int imx378_read_reg16(struct imx378 *imx378, u16 addr, u16 *val)
+{
+	int ret;
+	u32 h_val = 0, l_val = 0;
+
+	ret = regmap_read(imx378->regmap, addr + 1, &l_val);
+	if (ret) {
+		pr_err("%s:i2c read failed, %x\n", __func__, addr + 1);
+		return ret;
+	}
+
+	*val = l_val & 0xFF;
+
+	ret = regmap_read(imx378->regmap, addr, &h_val);
+	if (ret) {
+		pr_err("%s:i2c read failed, %x\n", __func__, addr);
+		return ret;
+	}
+
+	*val |= (h_val & 0xFF) << 8;
+
+	return ret;
+}
+
+static int imx378_write_reg16(struct imx378 *imx378, u16 addr, u16 val)
+{
+	int ret;
+
+	ret = regmap_write(imx378->regmap, addr + 1, val);
+	if (ret) {
+		pr_err("%s:i2c write failed, %x = %x\n",
+			__func__, addr + 1, val);
+		return ret;
+	}
+
+	ret = regmap_write(imx378->regmap, addr, val >> 8);
+	if (ret) {
+		pr_err("%s:i2c write failed, %x = %x\n",
+			__func__, addr, val >> 8);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int __maybe_unused imx378_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx378 *imx378 = to_imx378(sd);
+	int ret;
+
+	gpiod_set_value_cansleep(imx378->enable_gpio, 0);
+
+	ret = regulator_bulk_enable(IMX378_NUM_SUPPLIES, imx378->supplies);
+	if (ret < 0) {
+		dev_err(imx378->dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(2000, 3000);
+
+	ret = clk_prepare_enable(imx378->xclk);
+	if (ret < 0) {
+		regulator_bulk_disable(IMX378_NUM_SUPPLIES, imx378->supplies);
+		dev_err(imx378->dev, "clk prepare enable failed\n");
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(imx378->enable_gpio, 1);
+	usleep_range(12000, 15000);
+
+	return 0;
+}
+
+static int __maybe_unused imx378_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx378 *imx378 = to_imx378(sd);
+
+	gpiod_set_value_cansleep(imx378->enable_gpio, 0);
+
+	clk_disable_unprepare(imx378->xclk);
+
+	regulator_bulk_disable(IMX378_NUM_SUPPLIES, imx378->supplies);
+	usleep_range(10, 20);
+
+	return 0;
+}
+
+static int imx378_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct imx378 *imx378 = container_of(sd, struct imx378, sd);
+
+	if (code->index != 0 || code->pad != 0)
+		return -EINVAL;
+
+	code->code = imx378_get_format_code(imx378);
+
+	return 0;
+}
+
+static int imx378_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct imx378 *imx378 = container_of(sd, struct imx378, sd);
+
+	if (fse->index != 0)
+		return -EINVAL;
+
+	mutex_lock(&imx378->mutex);
+	if (fse->code != imx378_get_format_code(imx378)) {
+		mutex_unlock(&imx378->mutex);
+		return -EINVAL;
+	}
+	mutex_unlock(&imx378->mutex);
+
+	fse->min_width = IMX378_MIN_WIDTH;
+	fse->max_width = IMX378_MAX_BOUNDS_WIDTH;
+	fse->min_height = IMX378_MIN_HEIGHT;
+	fse->max_height = IMX378_MAX_BOUNDS_HEIGHT;
+
+	return 0;
+}
+
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int imx378_s_register(struct v4l2_subdev *sd,
+			     const struct v4l2_dbg_register *reg)
+{
+	struct imx378 *imx378 = container_of(sd, struct imx378, sd);
+
+	return regmap_write(imx378->regmap, reg->reg, reg->val);
+}
+
+static int imx378_g_register(struct v4l2_subdev *sd,
+			     struct v4l2_dbg_register *reg)
+{
+	struct imx378 *imx378 = container_of(sd, struct imx378, sd);
+	unsigned int aux;
+	int ret;
+
+	reg->size = 1;
+	ret = regmap_read(imx378->regmap, reg->reg, &aux);
+	reg->val = aux;
+
+	return ret;
+}
+#endif
+
+static const struct v4l2_subdev_core_ops imx378_core_ops = {
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = imx378_g_register,
+	.s_register = imx378_s_register,
+#endif
+};
+
+static int imx378_set_img_size(struct imx378 *imx378)
+{
+	u32 frame_length;
+	int ret;
+
+	ret = imx378_write_reg16(imx378, 0x34c, imx378->fmt.width);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x34e, imx378->fmt.height);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x40c, imx378->fmt.width);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x40e, imx378->fmt.height);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x342, IMX378_LINE_LENGTH);
+	if (ret < 0)
+		goto error;
+
+	frame_length = IMX378_DEFAULT_LINK_FREQ /
+		       ((imx378->fival.denominator / imx378->fival.numerator)
+		       * IMX378_LINE_LENGTH);
+
+	ret = imx378_write_reg16(imx378, 0x340, frame_length);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x344, imx378->crop.left);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x348, imx378->crop.left +
+				 imx378->fmt.width - 1);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x346, imx378->crop.top);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x34a, imx378->crop.top +
+				 imx378->fmt.height - 1);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x408, 0);
+	if (ret < 0)
+		goto error;
+
+	ret = imx378_write_reg16(imx378, 0x40a, 0);
+	if (ret < 0)
+		goto error;
+
+	ret = regmap_write(imx378->regmap, 0xb04, 1);
+	if (ret < 0)
+		goto error;
+
+	return ret;
+
+error:
+	dev_err(imx378->dev, "could not set image size %d\n", ret);
+	return ret;
+}
+
+static struct v4l2_mbus_framefmt *
+__imx378_get_pad_format(struct imx378 *imx378,
+			struct v4l2_subdev_pad_config *cfg,
+			unsigned int pad,
+			enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&imx378->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx378->fmt;
+	default:
+		return NULL;
+	}
+}
+
+static int imx378_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+
+	mutex_lock(&imx378->mutex);
+	fmt->format = *__imx378_get_pad_format(imx378, cfg, fmt->pad,
+					       fmt->which);
+	mutex_unlock(&imx378->mutex);
+
+	return 0;
+}
+
+static struct v4l2_rect *
+__imx378_get_pad_crop(struct imx378 *imx378, struct v4l2_subdev_pad_config *cfg,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&imx378->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx378->crop;
+	default:
+		return NULL;
+	}
+}
+
+static int imx378_min_interval(struct imx378 *imx378,
+			       struct v4l2_fract *fival)
+{
+	fival->numerator = IMX378_LINE_LENGTH * (imx378->fmt.height);
+	fival->denominator = IMX378_DEFAULT_LINK_FREQ;
+
+	return 0;
+}
+
+static int imx378_max_interval(struct v4l2_fract *fival)
+{
+	fival->numerator = IMX378_LINE_LENGTH * 0xffff;
+	fival->denominator = IMX378_DEFAULT_LINK_FREQ;
+
+	return 0;
+}
+
+#define FRACT_CMP(a, OP, b)	\
+	((u64)(a).numerator * (b).denominator OP \
+	 (u64)(b).numerator * (a).denominator)
+static int imx378_clamp_interval(struct imx378 *imx378,
+				 struct v4l2_fract *fival)
+{
+	struct v4l2_fract interval;
+	int ret;
+
+	ret = imx378_min_interval(imx378, &interval);
+	if (ret)
+		return ret;
+	if (FRACT_CMP(*fival, <, interval))
+		*fival = interval;
+
+	ret = imx378_max_interval(&interval);
+	if (ret)
+		return ret;
+	if (FRACT_CMP(*fival, >, interval))
+		*fival = interval;
+
+	return 0;
+}
+
+static int imx378_g_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_frame_interval *fival)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+
+	fival->interval = imx378->fival;
+
+	return 0;
+}
+
+static int imx378_s_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_frame_interval *fival)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+	u64 max_exposure;
+
+	if (fival->interval.denominator == 0)
+		fival->interval = (struct v4l2_fract) IMX378_DEFAULT_FIVAL;
+
+	imx378_clamp_interval(imx378, &fival->interval);
+
+	imx378->fival = fival->interval;
+
+	/* Update exposure limits */
+	max_exposure = (IMX378_DEFAULT_LINK_FREQ /
+			((imx378->fival.denominator / imx378->fival.numerator)
+			* IMX378_LINE_LENGTH)) - 20;
+
+	__v4l2_ctrl_modify_range(imx378->exposure, imx378->exposure->minimum,
+				 max_exposure, imx378->exposure->step,
+				 max_exposure);
+
+	return 0;
+}
+
+static int
+imx378_enum_frame_interval(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+	int ret;
+
+	if (fie->index != 0)
+		return -EINVAL;
+
+	if (fie->width > IMX378_MAX_BOUNDS_WIDTH ||
+	    fie->width < IMX378_MIN_WIDTH)
+		return -EINVAL;
+
+	if (fie->height > IMX378_MAX_BOUNDS_HEIGHT ||
+	    fie->height < IMX378_MIN_HEIGHT)
+		return -EINVAL;
+
+	mutex_lock(&imx378->mutex);
+	if (fie->code != imx378_get_format_code(imx378)) {
+		mutex_unlock(&imx378->mutex);
+		return -EINVAL;
+	}
+	mutex_unlock(&imx378->mutex);
+
+	ret = imx378_min_interval(imx378, &fie->min_interval);
+	if (ret)
+		return ret;
+
+	ret = imx378_max_interval(&fie->max_interval);
+	if (ret)
+		return ret;
+
+	fie->interval = (struct v4l2_fract) IMX378_DEFAULT_FIVAL;
+
+	return 0;
+}
+
+static int imx378_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+	struct v4l2_mbus_framefmt *__fmt;
+	struct v4l2_rect *__crop;
+	struct v4l2_subdev_frame_interval fival = { };
+
+	mutex_lock(&imx378->mutex);
+
+	if (imx378->streaming && fmt->which != V4L2_SUBDEV_FORMAT_TRY)
+		return -EBUSY;
+
+	__crop = __imx378_get_pad_crop(imx378, cfg, fmt->pad, fmt->which);
+
+	v4l_bound_align_image(&fmt->format.width, IMX378_MIN_WIDTH,
+			      IMX378_MAX_BOUNDS_WIDTH, ilog2(4),
+			      &fmt->format.height, IMX378_MIN_HEIGHT,
+			      IMX378_MAX_BOUNDS_HEIGHT, ilog2(8), 0);
+
+	__crop->width = fmt->format.width;
+	__crop->height = fmt->format.height;
+
+	v4l_bound_align_image(&__crop->left, 0,
+			      IMX378_MAX_BOUNDS_WIDTH - __crop->width, ilog2(4),
+			      &__crop->top, 0,
+			      IMX378_MAX_BOUNDS_HEIGHT - __crop->height,
+			      ilog2(8), 0);
+
+	__fmt = __imx378_get_pad_format(imx378, cfg, fmt->pad, fmt->which);
+
+	__fmt->width = __crop->width;
+	__fmt->height = __crop->height;
+
+	if (fmt->format.code && fmt->which != V4L2_SUBDEV_FORMAT_TRY)
+		imx378_set_flip_mode(imx378, fmt->format.code);
+
+	__fmt->code = imx378_get_format_code(imx378);
+
+	__fmt->field = V4L2_FIELD_NONE;
+	__fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	__fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->format.colorspace);
+	__fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+			      __fmt->colorspace, __fmt->ycbcr_enc);
+	__fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(__fmt->colorspace);
+
+	fmt->format = *__fmt;
+
+	/* Frame interval depends on the format so, update it accordingly */
+	if (fmt->which != V4L2_SUBDEV_FORMAT_TRY) {
+		fival.interval = imx378->fival;
+		imx378_s_frame_interval(sd, &fival);
+	}
+
+	mutex_unlock(&imx378->mutex);
+
+	return 0;
+}
+
+static int imx378_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *s)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r = imx378->crop;
+		return 0;
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		s->r.width = IMX378_MAX_DEFAULT_WIDTH;
+		s->r.height = IMX378_MAX_DEFAULT_HEIGHT;
+		s->r.left = 0;
+		s->r.top = 0;
+		return 0;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.width = IMX378_MAX_BOUNDS_WIDTH;
+		s->r.height = IMX378_MAX_BOUNDS_HEIGHT;
+		s->r.left = 0;
+		s->r.top = 0;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int imx378_set_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *s)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+	int ret;
+
+	if (s->target == V4L2_SEL_TGT_COMPOSE)
+		return 0;
+
+	if (s->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	mutex_lock(&imx378->mutex);
+
+	s->r.width = imx378->crop.width;
+	s->r.height = imx378->crop.height;
+
+	v4l_bound_align_image(&s->r.left, 0,
+			      IMX378_MAX_BOUNDS_WIDTH - s->r.width, ilog2(4),
+			      &s->r.top, 0,
+			      IMX378_MAX_BOUNDS_HEIGHT - s->r.height, ilog2(8),
+			      0);
+
+	imx378->crop.left = s->r.left;
+	imx378->crop.top = s->r.top;
+
+	if (imx378->streaming) {
+		ret = imx378_set_img_size(imx378);
+		if (ret < 0) {
+			dev_err(imx378->dev, "could not set image size\n");
+			mutex_unlock(&imx378->mutex);
+			return ret;
+		}
+	}
+
+	mutex_unlock(&imx378->mutex);
+	return 0;
+}
+
+static int imx378_set_exposure(struct imx378 *imx378)
+{
+	int ret;
+
+	/* Set group hold */
+	ret = regmap_write(imx378->regmap, 0x104, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = imx378_write_reg16(imx378, 0x202, imx378->exposure->val);
+	if (ret < 0)
+		return ret;
+
+	/* Release group hold */
+	return regmap_write(imx378->regmap, 0x104, 0);
+}
+
+static int imx378_set_analogue_gain(struct imx378 *imx378)
+{
+	int ret;
+
+	/* Set group hold */
+	ret = regmap_write(imx378->regmap, 0x104, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = imx378_write_reg16(imx378, 0x204, imx378->analogue_gain->val);
+	if (ret < 0)
+		return ret;
+
+	/* Release group hold */
+	return regmap_write(imx378->regmap, 0x104, 0);
+}
+
+static int imx378_set_digital_gain_global(struct imx378 *imx378)
+{
+	int ret;
+
+	/* Set group hold */
+	ret = regmap_write(imx378->regmap, 0x104, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Digital gain control mode all color */
+	ret = regmap_write(imx378->regmap, 0x3ff9, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set digital gain globally */
+	ret = imx378_write_reg16(imx378, 0x20e, imx378->digital_gain->val);
+	if (ret < 0)
+		return ret;
+
+	/* Release group hold */
+	return regmap_write(imx378->regmap, 0x104, 0);
+}
+
+static int imx378_set_digital_gain_by_color(struct imx378 *imx378)
+{
+	int ret;
+
+	/* Set group hold */
+	ret = regmap_write(imx378->regmap, 0x104, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Digital gain control mode by color */
+	ret = regmap_write(imx378->regmap, 0x3ff9, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Digital gain R */
+	ret = imx378_write_reg16(imx378, 0x210, imx378->red_balance->val);
+	if (ret < 0)
+		return ret;
+
+	/* Digital gain B */
+	ret = imx378_write_reg16(imx378, 0x212, imx378->blue_balance->val);
+	if (ret < 0)
+		return ret;
+
+	/* Digital gain GR */
+	ret = imx378_write_reg16(imx378, 0x20e, imx378->green_balance->val);
+	if (ret < 0)
+		return ret;
+
+	/* Digital gain GB */
+	ret = imx378_write_reg16(imx378, 0x214, imx378->green_balance->val);
+	if (ret < 0)
+		return ret;
+
+	/* Release group hold */
+	return regmap_write(imx378->regmap, 0x104, 0);
+}
+
+static int imx378_g_temperature(struct imx378 *imx378, s32 *temperature)
+{
+	unsigned int aux;
+	int ret;
+
+	if (imx378->streaming) {
+		ret = regmap_read(imx378->regmap, 0x13a, &aux);
+		if (ret < 0)
+			return ret;
+
+		if (aux >= 0xec)
+			*temperature = (aux - 0xec - 20) * 1000;
+		else
+			*temperature = (aux * 1000);
+	}
+
+	dev_err(imx378->dev,
+	"Sensor is powered off, returning invalid temperature\n");
+
+	return 0;
+}
+
+static int imx378_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx378 *imx378 = container_of(ctrl->handler,
+					     struct imx378, ctrls);
+	int ret;
+
+	/*
+	 * Applying V4L2 control value only happens
+	 * when power is up for streaming
+	 */
+	if (!pm_runtime_get_if_in_use(imx378->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEMPERATURE:
+		ret = imx378_g_temperature(imx378, &ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(imx378->dev);
+
+	return ret;
+}
+
+static int imx378_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx378 *imx378 = container_of(ctrl->handler,
+					     struct imx378, ctrls);
+	int ret;
+
+	/*
+	 * Applying V4L2 control value only happens
+	 * when power is up for streaming
+	 */
+	if (!pm_runtime_get_if_in_use(imx378->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE_ABSOLUTE:
+		ret = imx378_set_exposure(imx378);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = imx378_set_analogue_gain(imx378);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = imx378_set_digital_gain_global(imx378);
+		break;
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+	case IMX378_CID_GREEN_BALANCE:
+		ret = imx378_set_digital_gain_by_color(imx378);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(imx378->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops imx378_ctrl_ops = {
+	.g_volatile_ctrl = imx378_g_volatile_ctrl,
+	.s_ctrl = imx378_set_ctrl,
+};
+
+#define MAX_CMD 4
+static int imx378_write_table(struct imx378 *imx378,
+				const struct reg_8 table[])
+{
+	u8 vals[MAX_CMD];
+	int i, ret;
+
+	for (table = table; table->addr != IMX378_TABLE_END ; table++) {
+		if (table->addr == IMX378_TABLE_WAIT_MS) {
+			usleep_range(table->val * 1000,
+				     table->val * 1000 + 500);
+			continue;
+		}
+
+		for (i = 0; i < MAX_CMD; i++) {
+			if (table[i].addr != (table[0].addr + i))
+				break;
+			vals[i] = table[i].val;
+		}
+
+		ret = regmap_bulk_write(imx378->regmap, table->addr, vals, i);
+		usleep_range(80, 120);
+
+		if (ret) {
+			dev_err(imx378->dev, "write_table error: %d\n", ret);
+			return ret;
+		}
+
+		table += i - 1;
+	}
+
+	return 0;
+}
+
+static int imx378_start_streaming(struct imx378 *imx378)
+{
+	int ret;
+
+	ret = imx378_write_table(imx378, mode_table_common);
+	if (ret < 0) {
+		dev_err(imx378->dev, "could not send common table %d\n", ret);
+		goto error;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(&imx378->ctrls);
+	if (ret < 0) {
+		dev_err(imx378->dev, "could not sync v4l2 controls\n");
+		goto error;
+	}
+
+	ret = imx378_set_img_size(imx378);
+	if (ret < 0) {
+		dev_err(imx378->dev, "could not set image size\n");
+		goto error;
+	}
+
+	/* set orientation */
+	ret = regmap_write(imx378->regmap, 0x101,
+			   imx378->hflip->val | imx378->vflip->val << 1);
+	if (ret < 0)
+		goto error;
+
+	/* set temperature control */
+	ret = regmap_write(imx378->regmap, 0x138, 1);
+	if (ret < 0)
+		goto error;
+
+	ret = regmap_write(imx378->regmap, 0x100, 1);
+	if (ret < 0) {
+		dev_err(imx378->dev, "could not send start table %d\n", ret);
+		goto error;
+	}
+
+	usleep_range(4000, 6000);
+
+	return 0;
+
+error:
+	mutex_unlock(&imx378->mutex);
+	return ret;
+}
+
+static int imx378_stop_streaming(struct imx378 *imx378)
+{
+	int ret;
+
+	ret = regmap_write(imx378->regmap, 0x100, 0);
+	if (ret < 0)
+		dev_err(imx378->dev, "could not send stop table %d\n",	ret);
+
+	return ret;
+}
+
+static int imx378_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct imx378 *imx378 = to_imx378(sd);
+	int ret;
+
+	mutex_lock(&imx378->mutex);
+
+	if (imx378->streaming == enable) {
+		mutex_unlock(&imx378->mutex);
+		return 0;
+	}
+
+	if (enable) {
+		ret = pm_runtime_get_sync(imx378->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(imx378->dev);
+			goto err_unlock;
+		}
+
+		ret = imx378_start_streaming(imx378);
+		if (ret < 0)
+			goto err_rpm_put;
+	} else {
+		ret = imx378_stop_streaming(imx378);
+		if (ret < 0)
+			goto err_rpm_put;
+		pm_runtime_put(imx378->dev);
+	}
+
+	imx378->streaming = enable;
+
+	mutex_unlock(&imx378->mutex);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(imx378->dev);
+err_unlock:
+	mutex_unlock(&imx378->mutex);
+
+	return ret;
+}
+
+static int imx378_entity_init_cfg(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = { };
+	struct v4l2_subdev_frame_interval fival = { };
+
+	if (!cfg) {
+		fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY :
+				  V4L2_SUBDEV_FORMAT_ACTIVE;
+		fmt.format.width = IMX378_MAX_BOUNDS_WIDTH;
+		fmt.format.height = IMX378_MAX_BOUNDS_HEIGHT;
+
+		imx378_set_fmt(sd, cfg, &fmt);
+
+		fival.interval = (struct v4l2_fract) IMX378_DEFAULT_FIVAL;
+		imx378_s_frame_interval(sd, &fival);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops imx378_video_ops = {
+	.s_stream = imx378_s_stream,
+	.g_frame_interval = imx378_g_frame_interval,
+	.s_frame_interval = imx378_s_frame_interval,
+};
+
+static const struct v4l2_subdev_pad_ops imx378_subdev_pad_ops = {
+	.enum_mbus_code = imx378_enum_mbus_code,
+	.enum_frame_size = imx378_enum_frame_size,
+	.enum_frame_interval = imx378_enum_frame_interval,
+	.get_fmt = imx378_get_fmt,
+	.set_fmt = imx378_set_fmt,
+	.get_selection = imx378_get_selection,
+	.set_selection = imx378_set_selection,
+	.init_cfg = imx378_entity_init_cfg,
+};
+
+static const struct v4l2_subdev_ops imx378_subdev_ops = {
+	.core = &imx378_core_ops,
+	.video = &imx378_video_ops,
+	.pad = &imx378_subdev_pad_ops,
+};
+
+static const struct regmap_config sensor_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int imx378_get_regulators(struct device *dev, struct imx378 *imx378)
+{
+	unsigned int i;
+
+	for (i = 0; i < IMX378_NUM_SUPPLIES; i++)
+		imx378->supplies[i].supply = imx378_supply_name[i];
+
+	return devm_regulator_bulk_get(dev, IMX378_NUM_SUPPLIES,
+				       imx378->supplies);
+}
+
+struct v4l2_ctrl
+*imx378_ctrl_new_str_custom(struct v4l2_ctrl_handler *hdl, u32 id, char *name,
+			    s64 min, s64 max, u64 step, s64 def)
+{
+	static struct v4l2_ctrl_config ctrl = {
+		.ops = &imx378_ctrl_ops,
+		.type = V4L2_CTRL_TYPE_STRING,
+	};
+
+	ctrl.id = id;
+	ctrl.name = name;
+	ctrl.min = min;
+	ctrl.max = max;
+	ctrl.step = step;
+	ctrl.def = def;
+
+	return v4l2_ctrl_new_custom(hdl, &ctrl, NULL);
+}
+
+struct v4l2_ctrl
+*imx378_ctrl_new_int_custom(struct v4l2_ctrl_handler *hdl, u32 id, char *name,
+			    s64 min, s64 max, u64 step, s64 def)
+{
+	static struct v4l2_ctrl_config ctrl = {
+		.ops = &imx378_ctrl_ops,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+	};
+
+	ctrl.id = id;
+	ctrl.name = name;
+	ctrl.min = min;
+	ctrl.max = max;
+	ctrl.step = step;
+	ctrl.def = def;
+
+	return v4l2_ctrl_new_custom(hdl, &ctrl, NULL);
+}
+
+static int imx378_init_controls(struct imx378 *imx378)
+{
+	static const s64 link_freq[] = {
+		IMX378_DEFAULT_LINK_FREQ,
+	};
+	int ret;
+
+	mutex_init(&imx378->mutex);
+	imx378->ctrls.lock = &imx378->mutex;
+
+	v4l2_ctrl_handler_init(&imx378->ctrls, 12);
+
+	imx378->pixel_rate = v4l2_ctrl_new_std(&imx378->ctrls, NULL,
+					       V4L2_CID_PIXEL_RATE, 0,
+					       IMX378_DEFAULT_PIXEL_RATE, 1,
+					       IMX378_DEFAULT_PIXEL_RATE);
+
+	imx378->link_freq = v4l2_ctrl_new_int_menu(&imx378->ctrls, NULL,
+						   V4L2_CID_LINK_FREQ,
+						   ARRAY_SIZE(link_freq) - 1,
+						   0, link_freq);
+	if (imx378->link_freq)
+		imx378->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx378->exposure = v4l2_ctrl_new_std(&imx378->ctrls, &imx378_ctrl_ops,
+					     V4L2_CID_EXPOSURE_ABSOLUTE,
+					     0x8, 0xffff, 1, 0xc70);
+
+	imx378->hflip = v4l2_ctrl_new_std(&imx378->ctrls, &imx378_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx378->hflip)
+		imx378->hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx378->vflip = v4l2_ctrl_new_std(&imx378->ctrls, &imx378_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx378->vflip)
+		imx378->vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx378->analogue_gain = v4l2_ctrl_new_std(&imx378->ctrls,
+						  &imx378_ctrl_ops,
+						  V4L2_CID_ANALOGUE_GAIN,
+						  0, 978, 1, 0);
+
+	imx378->digital_gain = v4l2_ctrl_new_std(&imx378->ctrls,
+					&imx378_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+					0x100, 0xfff, 1, 0x100);
+
+	imx378->red_balance = v4l2_ctrl_new_std(&imx378->ctrls,
+					&imx378_ctrl_ops, V4L2_CID_RED_BALANCE,
+					0x100, 0xfff, 1, 0x221);
+
+	imx378->blue_balance = v4l2_ctrl_new_std(&imx378->ctrls,
+					&imx378_ctrl_ops, V4L2_CID_BLUE_BALANCE,
+					0x100, 0xfff, 1, 0x1ee);
+
+	imx378->green_balance = imx378_ctrl_new_int_custom(&imx378->ctrls,
+					IMX378_CID_GREEN_BALANCE,
+					"Green Balance",
+					0x100, 0xfff, 1, 0x100);
+	if (imx378->green_balance)
+		imx378->green_balance->flags = V4L2_CTRL_FLAG_SLIDER;
+
+	imx378->temperature = v4l2_ctrl_new_std(&imx378->ctrls,
+					&imx378_ctrl_ops, V4L2_CID_TEMPERATURE,
+					-200000, 800000, 1, 250000);
+	if (imx378->temperature)
+		imx378->temperature->name = "Sensor Temperature";
+
+	ret = imx378->ctrls.error;
+	if (ret) {
+		dev_err(imx378->dev, "%s control init failed (%d)\n",
+				__func__, ret);
+		goto error;
+	}
+
+	imx378->sd.ctrl_handler = &imx378->ctrls;
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(&imx378->ctrls);
+	return ret;
+}
+
+static int imx378_parse_fwnode(struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned int i;
+	int ret;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	if (ret) {
+		dev_err(dev, "parsing endpoint node failed\n");
+		goto done;
+	}
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
+		if (bus_cfg.link_frequencies[i] == IMX378_DEFAULT_LINK_FREQ)
+			break;
+
+	if (i == bus_cfg.nr_of_link_frequencies) {
+		dev_err(dev, "link-frequencies %d not supported, Please review your DT\n",
+			IMX378_DEFAULT_LINK_FREQ);
+		ret = -EINVAL;
+		goto done;
+	}
+
+done:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	fwnode_handle_put(endpoint);
+	return ret;
+}
+
+static int __maybe_unused imx378_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx378 *imx378 = to_imx378(sd);
+
+	if (imx378->streaming)
+		imx378_stop_streaming(imx378);
+
+	return 0;
+}
+
+static int __maybe_unused imx378_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx378 *imx378 = to_imx378(sd);
+	int ret;
+
+	if (imx378->streaming) {
+		ret = imx378_start_streaming(imx378);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	imx378_stop_streaming(imx378);
+	imx378->streaming = 0;
+	return ret;
+}
+
+static int imx378_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct imx378 *imx378;
+	int ret;
+
+	ret = imx378_parse_fwnode(dev);
+	if (ret)
+		return ret;
+
+	imx378 = devm_kzalloc(dev, sizeof(*imx378), GFP_KERNEL);
+	if (!imx378)
+		return -ENOMEM;
+
+	imx378->dev = dev;
+
+	imx378->xclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(imx378->xclk)) {
+		dev_err(dev, "could not get xclk");
+		return PTR_ERR(imx378->xclk);
+	}
+
+	ret = clk_set_rate(imx378->xclk, IMX378_DEFAULT_CLK_FREQ);
+	if (ret) {
+		dev_err(dev, "could not set xclk frequency\n");
+		return ret;
+	}
+
+	ret = imx378_get_regulators(dev, imx378);
+	if (ret < 0) {
+		dev_err(dev, "could not get regulators\n");
+		return ret;
+	}
+
+	imx378->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(imx378->enable_gpio)) {
+		dev_err(dev, "could get enable gpio\n");
+		return PTR_ERR(imx378->enable_gpio);
+	}
+
+	imx378->regmap = devm_regmap_init_i2c(client, &sensor_regmap_config);
+	if (IS_ERR(imx378->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(imx378->regmap);
+	}
+
+	v4l2_i2c_subdev_init(&imx378->sd, client, &imx378_subdev_ops);
+
+	imx378_power_on(imx378->dev);
+
+	pm_runtime_set_active(imx378->dev);
+	pm_runtime_enable(imx378->dev);
+	pm_runtime_idle(imx378->dev);
+
+	ret = imx378_init_controls(imx378);
+	if (ret) {
+		dev_err(dev, "failed to init controls: %d", ret);
+		goto error_probe;
+	}
+
+	imx378->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx378->pad.flags = MEDIA_PAD_FL_SOURCE;
+	imx378->sd.dev = &client->dev;
+	imx378->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ret = media_entity_pads_init(&imx378->sd.entity, 1, &imx378->pad);
+	if (ret < 0) {
+		dev_err(dev, "could not register media entity\n");
+		goto free_ctrl;
+	}
+
+	imx378_entity_init_cfg(&imx378->sd, NULL);
+
+	ret = v4l2_async_register_subdev_sensor_common(&imx378->sd);
+	if (ret < 0) {
+		dev_err(dev, "could not register v4l2 device\n");
+		goto free_entity;
+	}
+
+	ret = v4l2_device_register_subdev(&imx378->v4l2_dev, &imx378->sd);
+	if (ret < 0) {
+		dev_err(dev, "could not register v4l2 sd\n");
+		goto free_entity;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(&imx378->v4l2_dev);
+	if (ret) {
+		dev_err(dev, "imx378 subdev nodes registration failed (err=%d)\n",
+		ret);
+		return ret;
+	}
+
+	return 0;
+
+free_entity:
+	media_entity_cleanup(&imx378->sd.entity);
+free_ctrl:
+	v4l2_ctrl_handler_free(&imx378->ctrls);
+error_probe:
+	mutex_destroy(&imx378->mutex);
+	pm_runtime_disable(imx378->dev);
+
+	return ret;
+}
+
+static int imx378_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx378 *imx378 = to_imx378(sd);
+
+	v4l2_async_unregister_subdev(&imx378->sd);
+	media_entity_cleanup(&imx378->sd.entity);
+	v4l2_ctrl_handler_free(&imx378->ctrls);
+
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+
+	mutex_destroy(&imx378->mutex);
+
+	return 0;
+}
+
+static const struct of_device_id imx378_of_match[] = {
+	{ .compatible = "sony,imx378" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, imx378_of_match);
+
+static const struct i2c_device_id imx378_id[] = {
+	{"imx378", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, imx378_id);
+
+static const struct dev_pm_ops imx378_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(imx378_suspend, imx378_resume)
+	SET_RUNTIME_PM_OPS(imx378_power_off, imx378_power_on, NULL)
+};
+
+static struct i2c_driver imx378_i2c_driver = {
+	.driver = {
+		.of_match_table = imx378_of_match,
+		.pm = &imx378_pm_ops,
+		.name  = "imx378",
+	},
+	.probe_new  = imx378_probe,
+	.remove = imx378_remove,
+	.id_table = imx378_id,
+};
+
+module_i2c_driver(imx378_i2c_driver);
+
+MODULE_DESCRIPTION("Sony IMX378 Camera driver");
+MODULE_AUTHOR("Daniel Gomez <daniel@qtec.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

