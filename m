Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC3283251
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 15:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731630AbfHFNKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 09:10:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42503 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731163AbfHFNKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 09:10:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so37912171plb.9
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2019 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L2iqcdBrtKXZV1z16aL6T2mI/xu5ZMMn3ArnIOa3pVE=;
        b=h5xiY548NN9eNlgv3jJLRpeTtnU8G3lpYme+58DFl7wu64bv54BbgtUHjb7jRl6BNj
         7Q5NwAnfZiqBPgBStfgewBOjdwFEeqXEsLns/JMvEHnC6xAfqatWeILgWwSA41KN+WVQ
         WaEIK6MHAN2JYLPgOiINpFqv7RNK/Qu4vcnXQiUtDTtQUN+iRz/Ag7/3KktFxnXhuVS2
         +gZy8PaAWit79A0XPApzHzZoTcl69Zqa9cqsWBUqdmEnYnfSwCDhngrm5B8aFHC/Ox++
         2jJQ7LGQQzqo9j9zRsVD2pFyan8zobDaBm3brcdgqeFhCwbeAkkY/44SsouO/q3F7iea
         9Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L2iqcdBrtKXZV1z16aL6T2mI/xu5ZMMn3ArnIOa3pVE=;
        b=qnK7QD9WFErkQ/Hl2GlBW2Axl/DsIsQVuMDTbpOStx3COYw4QNCgyt9TRtjDINn2qe
         /TUxpsSb2SJ3zrQVjCJphjZes/K+0w6As6FhvcRxQ5pu2/Cq++fIhglDjUusequnDqQ3
         iGvVBCK1nE2jTbeBbljKzx0ATTo8EnAg70iMDcOEN88kpC+c1CsEjFBybcb3rlr8Kkor
         WDTqNxdVMweKeqNyg9BUpjkp7JzqdNyqPe9qgi0NOqd+qdwAlK24NFJ+JP97DAE4p2eN
         moJf3GQz0zjrlPF06wkp7z1xWb9D08gncCd+is37Q+GtRJEJ+r7WO1rhupkJ5tKB41fT
         /Qzw==
X-Gm-Message-State: APjAAAXHJszPou/LlWlPciw6/qcjjpmGnOD38ij7NlwO2ZVcvVGrAj0l
        eNOUL+nvUeryGER23Cnv+Gd8
X-Google-Smtp-Source: APXvYqxsfRq/Aiyxog9Nyd/h0dOQcWmvtwwEPLyRGbDe7qfudJ51wAmWHRE5WJfpqjXoUvgTwIT+jA==
X-Received: by 2002:a17:902:29a7:: with SMTP id h36mr3206904plb.158.1565097001085;
        Tue, 06 Aug 2019 06:10:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7180:928a:153d:caa0:477e:f9fd])
        by smtp.gmail.com with ESMTPSA id v8sm73715371pgs.82.2019.08.06.06.09.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 06:10:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Date:   Tue,  6 Aug 2019 18:39:37 +0530
Message-Id: <20190806130938.19916-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add driver for Sony IMX290 CMOS image sensor driver. The driver only
supports I2C interface for programming and MIPI CSI-2 for sensor output.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/Kconfig  |  11 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/imx290.c | 845 +++++++++++++++++++++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 drivers/media/i2c/imx290.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index cb8db944aa41..256edd289abe 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -594,6 +594,17 @@ config VIDEO_IMX274
 	  This is a V4L2 sensor driver for the Sony IMX274
 	  CMOS image sensor.
 
+config VIDEO_IMX290
+	tristate "Sony IMX290 sensor support"
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CAMERA_SUPPORT
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX290 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx290.
+
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d8ad9dad495d..490e59070407 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_VIDEO_TC358743)	+= tc358743.o
 obj-$(CONFIG_VIDEO_IMX214)	+= imx214.o
 obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
 obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
+obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
 obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
new file mode 100644
index 000000000000..8c50fbd51ca5
--- /dev/null
+++ b/drivers/media/i2c/imx290.c
@@ -0,0 +1,845 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sony IMX290 CMOS Image Sensor Driver
+ *
+ * Copyright (C) 2019 FRAMOS GmbH.
+ *
+ * Copyright (C) 2019 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define IMX290_STANDBY 0x3000
+#define IMX290_REGHOLD 0x3001
+#define IMX290_XMSTA 0x3002
+#define IMX290_GAIN 0x3014
+
+static const char * const imx290_supply_name[] = {
+	"vdda",
+	"vddd",
+	"vdddo",
+};
+
+#define IMX290_NUM_SUPPLIES ARRAY_SIZE(imx290_supply_name)
+
+struct imx290_regval {
+	u16 reg;
+	u8 val;
+};
+
+struct imx290_mode {
+	u32 width;
+	u32 height;
+	u32 pixel_rate;
+	u32 link_freq_index;
+
+	const struct imx290_regval *data;
+	u32 data_size;
+};
+
+struct imx290 {
+	struct device *dev;
+	struct clk *xclk;
+	struct regmap *regmap;
+
+	struct v4l2_subdev sd;
+	struct v4l2_fwnode_endpoint ep;
+	struct media_pad pad;
+	struct v4l2_mbus_framefmt current_format;
+	const struct imx290_mode *current_mode;
+
+	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
+	struct gpio_desc *rst_gpio;
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+
+	struct mutex lock;
+};
+
+struct imx290_pixfmt {
+	u32 code;
+	u32 colorspace;
+};
+
+static const struct imx290_pixfmt imx290_formats[] = {
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_COLORSPACE_SRGB, },
+};
+
+static struct regmap_config imx290_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static const struct imx290_regval imx290_global_init_settings[] = {
+	{ 0x3007, 0x00 },
+	{ 0x3009, 0x00 },
+	{ 0x3018, 0x65 },
+	{ 0x3019, 0x04 },
+	{ 0x301a, 0x00 },
+	{ 0x3443, 0x03 },
+	{ 0x3444, 0x20 },
+	{ 0x3445, 0x25 },
+	{ 0x3407, 0x03 },
+	{ 0x303a, 0x0c },
+	{ 0x3040, 0x00 },
+	{ 0x3041, 0x00 },
+	{ 0x303c, 0x00 },
+	{ 0x303d, 0x00 },
+	{ 0x3042, 0x9c },
+	{ 0x3043, 0x07 },
+	{ 0x303e, 0x49 },
+	{ 0x303f, 0x04 },
+	{ 0x304b, 0x0a },
+	{ 0x300f, 0x00 },
+	{ 0x3010, 0x21 },
+	{ 0x3012, 0x64 },
+	{ 0x3016, 0x09 },
+	{ 0x3070, 0x02 },
+	{ 0x3071, 0x11 },
+	{ 0x309b, 0x10 },
+	{ 0x309c, 0x22 },
+	{ 0x30a2, 0x02 },
+	{ 0x30a6, 0x20 },
+	{ 0x30a8, 0x20 },
+	{ 0x30aa, 0x20 },
+	{ 0x30ac, 0x20 },
+	{ 0x30b0, 0x43 },
+	{ 0x3119, 0x9e },
+	{ 0x311c, 0x1e },
+	{ 0x311e, 0x08 },
+	{ 0x3128, 0x05 },
+	{ 0x313d, 0x83 },
+	{ 0x3150, 0x03 },
+	{ 0x317e, 0x00 },
+	{ 0x32b8, 0x50 },
+	{ 0x32b9, 0x10 },
+	{ 0x32ba, 0x00 },
+	{ 0x32bb, 0x04 },
+	{ 0x32c8, 0x50 },
+	{ 0x32c9, 0x10 },
+	{ 0x32ca, 0x00 },
+	{ 0x32cb, 0x04 },
+	{ 0x332c, 0xd3 },
+	{ 0x332d, 0x10 },
+	{ 0x332e, 0x0d },
+	{ 0x3358, 0x06 },
+	{ 0x3359, 0xe1 },
+	{ 0x335a, 0x11 },
+	{ 0x3360, 0x1e },
+	{ 0x3361, 0x61 },
+	{ 0x3362, 0x10 },
+	{ 0x33b0, 0x50 },
+	{ 0x33b2, 0x1a },
+	{ 0x33b3, 0x04 },
+};
+
+static const struct imx290_regval imx290_1080p_settings[] = {
+	/* mode settings */
+	{ 0x3007, 0x00 },
+	{ 0x303a, 0x0c },
+	{ 0x3414, 0x0a },
+	{ 0x3472, 0x80 },
+	{ 0x3473, 0x07 },
+	{ 0x3418, 0x38 },
+	{ 0x3419, 0x04 },
+	{ 0x3012, 0x64 },
+	{ 0x3013, 0x00 },
+	{ 0x305c, 0x18 },
+	{ 0x305d, 0x03 },
+	{ 0x305e, 0x20 },
+	{ 0x305f, 0x01 },
+	{ 0x315e, 0x1a },
+	{ 0x3164, 0x1a },
+	{ 0x3480, 0x49 },
+	/* data rate settings */
+	{ 0x3009, 0x01 },
+	{ 0x3405, 0x10 },
+	{ 0x3446, 0x57 },
+	{ 0x3447, 0x00 },
+	{ 0x3448, 0x37 },
+	{ 0x3449, 0x00 },
+	{ 0x344a, 0x1f },
+	{ 0x344b, 0x00 },
+	{ 0x344c, 0x1f },
+	{ 0x344d, 0x00 },
+	{ 0x344e, 0x1f },
+	{ 0x344f, 0x00 },
+	{ 0x3450, 0x77 },
+	{ 0x3451, 0x00 },
+	{ 0x3452, 0x1f },
+	{ 0x3453, 0x00 },
+	{ 0x3454, 0x17 },
+	{ 0x3455, 0x00 },
+	{ 0x301c, 0x98 },
+	{ 0x301d, 0x08 },
+};
+
+static const struct imx290_regval imx290_720p_settings[] = {
+	/* mode settings */
+	{ 0x3007, 0x10 },
+	{ 0x303a, 0x06 },
+	{ 0x3414, 0x04 },
+	{ 0x3472, 0x00 },
+	{ 0x3473, 0x05 },
+	{ 0x3418, 0xd0 },
+	{ 0x3419, 0x02 },
+	{ 0x3012, 0x64 },
+	{ 0x3013, 0x00 },
+	{ 0x305c, 0x20 },
+	{ 0x305d, 0x00 },
+	{ 0x305e, 0x20 },
+	{ 0x305f, 0x01 },
+	{ 0x315e, 0x1a },
+	{ 0x3164, 0x1a },
+	{ 0x3480, 0x49 },
+	/* data rate settings */
+	{ 0x3009, 0x01 },
+	{ 0x3405, 0x10 },
+	{ 0x3446, 0x4f },
+	{ 0x3447, 0x00 },
+	{ 0x3448, 0x2f },
+	{ 0x3449, 0x00 },
+	{ 0x344a, 0x17 },
+	{ 0x344b, 0x00 },
+	{ 0x344c, 0x17 },
+	{ 0x344d, 0x00 },
+	{ 0x344e, 0x17 },
+	{ 0x344f, 0x00 },
+	{ 0x3450, 0x57 },
+	{ 0x3451, 0x00 },
+	{ 0x3452, 0x17 },
+	{ 0x3453, 0x00 },
+	{ 0x3454, 0x17 },
+	{ 0x3455, 0x00 },
+	{ 0x301c, 0xe4 },
+	{ 0x301d, 0x0c },
+};
+
+static const struct imx290_regval imx290_10bit_settings[] = {
+	{ 0x3005, 0x00},
+	{ 0x3046, 0x00},
+	{ 0x3129, 0x1d},
+	{ 0x317c, 0x12},
+	{ 0x31ec, 0x37},
+	{ 0x3441, 0x0a},
+	{ 0x3442, 0x0a},
+	{ 0x300a, 0x3c},
+	{ 0x300b, 0x00},
+};
+
+/* supported link frequencies */
+static const s64 imx290_link_freq[] = {
+	445500000,
+};
+
+/* Mode configs */
+static const struct imx290_mode imx290_modes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+		.data = imx290_1080p_settings,
+		.data_size = ARRAY_SIZE(imx290_1080p_settings),
+		.pixel_rate = 178200000,
+		.link_freq_index = 0,
+	},
+	{
+		.width = 1280,
+		.height = 720,
+		.data = imx290_720p_settings,
+		.data_size = ARRAY_SIZE(imx290_720p_settings),
+		.pixel_rate = 178200000,
+		.link_freq_index = 0,
+	},
+};
+
+static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct imx290, sd);
+}
+
+static inline int imx290_read_reg(struct imx290 *imx290, u16 addr, u8 *value)
+{
+	u32 regval;
+	int ret;
+
+	ret = regmap_read(imx290->regmap, addr, &regval);
+	if (ret) {
+		dev_err(imx290->dev, "I2C read failed for addr: %x\n", addr);
+		return ret;
+	}
+
+	*value = regval & 0xFF;
+
+	return 0;
+}
+
+static int imx290_write_reg(struct imx290 *imx290, u16 addr, u8 value)
+{
+	int ret;
+
+	ret = regmap_write(imx290->regmap, addr, value);
+	if (ret) {
+		dev_err(imx290->dev, "I2C write failed for addr: %x\n", addr);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int imx290_set_register_array(struct imx290 *imx290,
+				     const struct imx290_regval *settings,
+				     unsigned int num_settings)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_settings; ++i, ++settings) {
+		ret = imx290_write_reg(imx290, settings->reg, settings->val);
+		if (ret < 0)
+			return ret;
+
+		/* Settle time is 10ms for all registers */
+		msleep(10);
+	}
+
+	return 0;
+}
+
+static int imx290_write_buffered_reg(struct imx290 *imx290, u16 address_low,
+				     u8 nr_regs, u32 value)
+{
+	int ret, i;
+	u8 val = 0;
+
+	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x01);
+	if (ret) {
+		dev_err(imx290->dev, "Error setting hold register\n");
+		return ret;
+	}
+
+	for (i = 0; i < nr_regs; i++) {
+		imx290_read_reg(imx290, address_low + i, &val);
+		ret = imx290_write_reg(imx290, address_low + i,
+				       (u8)(value >> (i * 8)));
+		if (ret) {
+			dev_err(imx290->dev, "Error writing buffered registers\n");
+			return ret;
+		}
+		imx290_read_reg(imx290, address_low + i, &val);
+	}
+
+	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x00);
+	if (ret) {
+		dev_err(imx290->dev, "Error setting hold register\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int imx290_set_gain(struct imx290 *imx290, u32 value)
+{
+	int ret;
+
+	u32 adjusted_value = (value * 10) / 3;
+
+	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, adjusted_value);
+	if (ret)
+		dev_err(imx290->dev, "Unable to write gain\n");
+
+	return ret;
+}
+
+static int imx290_set_power_on(struct imx290 *imx290)
+{
+	int ret;
+
+	ret = clk_prepare_enable(imx290->xclk);
+	if (ret) {
+		dev_err(imx290->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(IMX290_NUM_SUPPLIES,
+				    imx290->supplies);
+	if (ret) {
+		dev_err(imx290->dev, "Failed to enable regulators\n");
+		goto xclk_off;
+	}
+
+	usleep_range(1, 2);
+	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
+	usleep_range(30000, 31000);
+
+	return 0;
+
+xclk_off:
+	clk_disable_unprepare(imx290->xclk);
+	return ret;
+}
+
+/* Stop streaming */
+static int imx290_stop_streaming(struct imx290 *imx290)
+{
+	int ret;
+
+	ret = imx290_write_reg(imx290, IMX290_STANDBY, 0x01);
+	if (ret < 0)
+		return ret;
+
+	msleep(30);
+
+	return imx290_write_reg(imx290, IMX290_XMSTA, 0x01);
+}
+
+static void imx290_set_power_off(struct imx290 *imx290)
+{
+	clk_disable_unprepare(imx290->xclk);
+	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
+	regulator_bulk_disable(IMX290_NUM_SUPPLIES, imx290->supplies);
+}
+
+static int imx290_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct imx290 *imx290 = to_imx290(sd);
+	int ret = 0;
+
+	mutex_lock(&imx290->lock);
+
+	if (on) {
+		ret = imx290_set_power_on(imx290);
+		if (ret < 0)
+			goto exit;
+
+		ret = imx290_set_register_array(imx290,
+				imx290_global_init_settings,
+				ARRAY_SIZE(imx290_global_init_settings));
+		if (ret < 0) {
+			dev_err(imx290->dev,
+				"Could not set init registers\n");
+			imx290_set_power_off(imx290);
+			goto exit;
+		}
+
+		imx290_stop_streaming(imx290);
+	} else {
+		imx290_set_power_off(imx290);
+	}
+
+exit:
+	mutex_unlock(&imx290->lock);
+
+	return ret;
+}
+
+static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx290 *imx290 = container_of(ctrl->handler,
+					     struct imx290, ctrls);
+	int ret = 0;
+
+	mutex_lock(&imx290->lock);
+
+	switch (ctrl->id) {
+	case V4L2_CID_GAIN:
+		ret = imx290_set_gain(imx290, ctrl->val);
+		break;
+	default:
+		dev_info(imx290->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
+			 ctrl->id, ctrl->val);
+		break;
+	}
+
+	mutex_unlock(&imx290->lock);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
+	.s_ctrl = imx290_set_ctrl,
+};
+
+static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(imx290_formats))
+		return -EINVAL;
+
+	code->code = imx290_formats[code->index].code;
+
+	return 0;
+}
+
+static int imx290_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct imx290 *imx290 = to_imx290(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		framefmt = v4l2_subdev_get_try_format(&imx290->sd, cfg,
+						      fmt->pad);
+	else
+		framefmt = &imx290->current_format;
+
+	fmt->format = *framefmt;
+
+	return 0;
+}
+
+static int imx290_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+		      struct v4l2_subdev_format *fmt)
+{
+	struct imx290 *imx290 = to_imx290(sd);
+	const struct imx290_mode *mode;
+	struct v4l2_mbus_framefmt *format;
+	int i, ret = 0;
+
+	mode = v4l2_find_nearest_size(imx290_modes,
+				      ARRAY_SIZE(imx290_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+
+	for (i = 0; i < ARRAY_SIZE(imx290_formats); i++)
+		if (imx290_formats[i].code == fmt->format.code)
+			break;
+
+	if (i >= ARRAY_SIZE(imx290_formats))
+		i = 0;
+
+	fmt->format.code = imx290_formats[i].code;
+	fmt->format.colorspace = imx290_formats[i].colorspace;
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+	} else {
+		format = &imx290->current_format;
+		__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
+		__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, mode->pixel_rate);
+
+		imx290->current_mode = mode;
+	}
+
+	*format = fmt->format;
+
+	return ret;
+}
+
+static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = { 0 };
+
+	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.width = 1920;
+	fmt.format.height = 1080;
+
+	imx290_set_fmt(subdev, cfg, &fmt);
+
+	return 0;
+}
+
+static int imx290_write_current_format(struct imx290 *imx290,
+				       struct v4l2_mbus_framefmt *format)
+{
+	int ret;
+
+	switch (format->code) {
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		ret = imx290_set_register_array(imx290, imx290_10bit_settings,
+					ARRAY_SIZE(imx290_10bit_settings));
+		if (ret < 0) {
+			dev_err(imx290->dev, "Could not set format registers\n");
+			return ret;
+		}
+		break;
+	default:
+		dev_err(imx290->dev, "Unknown pixel format\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Start streaming */
+static int imx290_start_streaming(struct imx290 *imx290)
+{
+	int ret;
+
+	/* Set current frame format */
+	ret = imx290_write_current_format(imx290, &imx290->current_format);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set frame format\n");
+		return ret;
+	}
+
+	/* Apply default values of current mode */
+	ret = imx290_set_register_array(imx290, imx290->current_mode->data,
+					imx290->current_mode->data_size);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set current mode\n");
+		return ret;
+	}
+
+	/* Apply customized values from user */
+	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
+	if (ret) {
+		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
+		return ret;
+	}
+
+	ret = imx290_write_reg(imx290, IMX290_STANDBY, 0x00);
+	if (ret < 0)
+		return ret;
+
+	msleep(30);
+
+	/* Start streaming */
+	return imx290_write_reg(imx290, IMX290_XMSTA, 0x00);
+}
+
+static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct imx290 *imx290 = to_imx290(sd);
+	int ret = 0;
+
+	if (enable)
+		ret = imx290_start_streaming(imx290);
+	else
+		imx290_stop_streaming(imx290);
+
+	return ret;
+}
+
+static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
+{
+	unsigned int i;
+
+	for (i = 0; i < IMX290_NUM_SUPPLIES; i++)
+		imx290->supplies[i].supply = imx290_supply_name[i];
+
+	return devm_regulator_bulk_get(dev, IMX290_NUM_SUPPLIES,
+				       imx290->supplies);
+}
+
+static const struct v4l2_subdev_core_ops imx290_subdev_core_ops = {
+	.s_power = imx290_s_power,
+};
+
+static const struct v4l2_subdev_video_ops imx290_video_ops = {
+	.s_stream = imx290_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
+	.init_cfg = imx290_entity_init_cfg,
+	.enum_mbus_code = imx290_enum_mbus_code,
+	.get_fmt = imx290_get_fmt,
+	.set_fmt = imx290_set_fmt,
+};
+
+static const struct v4l2_subdev_ops imx290_subdev_ops = {
+	.core = &imx290_subdev_core_ops,
+	.video = &imx290_video_ops,
+	.pad = &imx290_pad_ops,
+};
+
+static const struct media_entity_operations imx290_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int imx290_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	struct imx290 *imx290;
+	u32 xclk_freq;
+	int ret;
+
+	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
+	if (!imx290)
+		return -ENOMEM;
+
+	imx290->dev = dev;
+	imx290->regmap = devm_regmap_init_i2c(client, &imx290_regmap_config);
+	if (IS_ERR(imx290->regmap)) {
+		dev_err(dev, "Unable to initialize I2C\n");
+		return -ENODEV;
+	}
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "Endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(endpoint, &imx290->ep);
+	fwnode_handle_put(endpoint);
+	if (ret < 0) {
+		dev_err(dev, "Parsing endpoint node failed\n");
+		return ret;
+	}
+
+	/* Only CSI2 is supported for now */
+	if (imx290->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Unsupported bus type, should be CSI2\n");
+		return -EINVAL;
+	}
+
+	/* Set default mode to max resolution */
+	imx290->current_mode = &imx290_modes[0];
+
+	/* get system clock (xclk) */
+	imx290->xclk = devm_clk_get(dev, "xclk");
+	if (IS_ERR(imx290->xclk)) {
+		dev_err(dev, "Could not get xclk");
+		return PTR_ERR(imx290->xclk);
+	}
+
+	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
+	if (ret) {
+		dev_err(dev, "Could not get xclk frequency\n");
+		return ret;
+	}
+
+	/* external clock must be 37.125 MHz */
+	if (xclk_freq != 37125000) {
+		dev_err(dev, "External clock frequency %u is not supported\n",
+			xclk_freq);
+		return -EINVAL;
+	}
+
+	ret = clk_set_rate(imx290->xclk, xclk_freq);
+	if (ret) {
+		dev_err(dev, "Could not set xclk frequency\n");
+		return ret;
+	}
+
+	ret = imx290_get_regulators(dev, imx290);
+	if (ret < 0) {
+		dev_err(dev, "Cannot get regulators\n");
+		return ret;
+	}
+
+	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(imx290->rst_gpio)) {
+		dev_err(dev, "Cannot get reset gpio\n");
+		return PTR_ERR(imx290->rst_gpio);
+	}
+
+	mutex_init(&imx290->lock);
+
+	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
+
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+			  V4L2_CID_GAIN, 0, 72, 1, 0);
+	imx290->link_freq = v4l2_ctrl_new_int_menu(&imx290->ctrls,
+					&imx290_ctrl_ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(imx290_link_freq) - 1,
+					0, imx290_link_freq);
+	if (imx290->link_freq)
+		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE, 1,
+					       INT_MAX, 1,
+					       imx290_modes[0].pixel_rate);
+
+	imx290->sd.ctrl_handler = &imx290->ctrls;
+
+	if (imx290->ctrls.error) {
+		dev_err(dev, "Control initialization error %d\n",
+			imx290->ctrls.error);
+		ret = imx290->ctrls.error;
+		goto free_ctrl;
+	}
+
+	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
+	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx290->sd.dev = &client->dev;
+	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
+	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
+	if (ret < 0) {
+		dev_err(dev, "Could not register media entity\n");
+		goto free_ctrl;
+	}
+
+	ret = v4l2_async_register_subdev(&imx290->sd);
+	if (ret < 0) {
+		dev_err(dev, "Could not register v4l2 device\n");
+		goto free_entity;
+	}
+
+	return 0;
+
+free_entity:
+	media_entity_cleanup(&imx290->sd.entity);
+free_ctrl:
+	v4l2_ctrl_handler_free(&imx290->ctrls);
+	mutex_destroy(&imx290->lock);
+
+	return ret;
+}
+
+static int imx290_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx290 *imx290 = to_imx290(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+
+	imx290_set_power_off(imx290);
+	mutex_destroy(&imx290->lock);
+
+	return 0;
+}
+
+static const struct of_device_id imx290_of_match[] = {
+	{ .compatible = "sony,imx290" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx290_of_match);
+
+static struct i2c_driver imx290_i2c_driver = {
+	.probe  = imx290_probe,
+	.remove = imx290_remove,
+	.driver = {
+		.name  = "imx290",
+		.of_match_table = of_match_ptr(imx290_of_match),
+	},
+};
+
+module_i2c_driver(imx290_i2c_driver);
+
+MODULE_DESCRIPTION("Sony IMX290 CMOS Image Sensor Driver");
+MODULE_AUTHOR("FRAMOS GmbH");
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

