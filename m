Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E55E52D7
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 19:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731127AbfJYR7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 13:59:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44865 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbfJYR7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 13:59:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id q16so1382172pll.11
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2019 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MrqPthDj/gbHOdTo01H42pqw2nOgu+0PlOvg23rriaI=;
        b=bHGfUoTP+fXF0fCAmaZIVNWmX7OBr2gn+fhRdT63MI6UNJHefLDRureZkwxch4MPiM
         fdlQDw4qLfdNT+WWh9DEZqMPiQhvm/xUG/W0mBV2gWGQJ4mniITGLudT1Qib61OM/wDE
         to7YvHnT921URncEfZKW645mqJlNQ8ZVeENDc7l84QnWT5Uxsm9X1jXpNwtIttw19qiB
         F8Jjp037AdvjKUwHG8aqVTzj5hgZOGrG5mq/Xy6YNXgCWL+R1Nmgfjsh5OmpY96VqmL+
         235/Epb7/Ks8zCyZtdjXxHXs5VQenO0Zf7GAvi3Mu5zY8yukb15zkrqdNV88+VAro9qv
         oTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MrqPthDj/gbHOdTo01H42pqw2nOgu+0PlOvg23rriaI=;
        b=JZ2nIbBpWa56FgORdS7a5ZPiYEK1Q93lIv30USCn6DnHMEZE6P7GgAu6yQNAuFQhy/
         jvkgrbnx5uk73AD5195zRGcwT0Fn3f4ykS762Fiw7SZKN1YqUGcEsRAz1hpUDHFFBX2g
         mhoMtcEu3ttz4okp5ZV6FctGkA9crJYVTeed2WKg61xVs0atBFNiTk+NAkTx61D6RU9y
         RkzoGeCdkz2c952U25xr6UbX7axWqFPBF5I+urnalVMb2r6HWvA/zM5J2ePucyC9Zpla
         dyFCJ1CIQ31/Y+AMmSjIeMDj4eqfeIqvIQt9oAf6kcvoypPtlZng1o0ZWctXMlzxvbOu
         MFGA==
X-Gm-Message-State: APjAAAVYPD/nuj/uf9XpkXZzPNMKFrE9ceqhJKJKBaoayRlm6VlCnpDt
        fAwLrNpzp66Lj2SNk52lHM8V
X-Google-Smtp-Source: APXvYqyzir25SExTodn7jGygVjyZWihB0L5ux6lTWUyjJY9IO6yhTk3C97EIMIidPkym06dphto+4w==
X-Received: by 2002:a17:902:36a:: with SMTP id 97mr5360064pld.83.1572026372651;
        Fri, 25 Oct 2019 10:59:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7108:7f86:4131:5b00:9fc5:5eaa])
        by smtp.gmail.com with ESMTPSA id r13sm3430303pfg.3.2019.10.25.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:59:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/2] media: i2c: Add IMX296 CMOS image sensor driver
Date:   Fri, 25 Oct 2019 23:29:08 +0530
Message-Id: <20191025175908.14260-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add driver for Sony IMX296 CMOS image sensor driver. The driver only
supports I2C interface for programming and MIPI CSI-2 for sensor output.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS                |   8 +
 drivers/media/i2c/Kconfig  |  11 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/imx296.c | 733 +++++++++++++++++++++++++++++++++++++
 4 files changed, 753 insertions(+)
 create mode 100644 drivers/media/i2c/imx296.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 55199ef7fa74..5b7332d121d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15140,6 +15140,14 @@ S:	Maintained
 F:	drivers/media/i2c/imx274.c
 F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
 
+SONY IMX296 SENSOR DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/imx296.c
+F:	Documentation/devicetree/bindings/media/i2c/imx296.txt
+
 SONY IMX319 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7eee1812bba3..930db46fa2b8 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -598,6 +598,17 @@ config VIDEO_IMX274
 	  This is a V4L2 sensor driver for the Sony IMX274
 	  CMOS image sensor.
 
+config VIDEO_IMX296
+	tristate "Sony IMX296 sensor support"
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX296 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx296.
+
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index beb170b002dc..ed0c02bda450 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_VIDEO_TC358743)	+= tc358743.o
 obj-$(CONFIG_VIDEO_IMX214)	+= imx214.o
 obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
 obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
+obj-$(CONFIG_VIDEO_IMX296)	+= imx296.o
 obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
new file mode 100644
index 000000000000..98fff0a93277
--- /dev/null
+++ b/drivers/media/i2c/imx296.c
@@ -0,0 +1,733 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sony IMX296 CMOS Image Sensor Driver
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
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define IMX296_STANDBY 0x3000
+#define IMX296_REGHOLD 0x3008
+#define IMX296_XMSTA 0x300a
+#define IMX296_GAIN_LOW 0x3204
+#define IMX296_GAIN_HIGH 0x3205
+
+#define IMX296_DEFAULT_FORMAT MEDIA_BUS_FMT_SRGGB10_1X10
+
+static const char * const imx296_supply_name[] = {
+	"vdda",
+	"vddd",
+	"vddo",
+};
+
+#define IMX296_NUM_SUPPLIES ARRAY_SIZE(imx296_supply_name)
+
+struct imx296_regval {
+	u16 reg;
+	u8 val;
+};
+
+struct imx296_mode {
+	u32 width;
+	u32 height;
+	u32 pixel_rate;
+
+	const struct imx296_regval *data;
+	u32 data_size;
+};
+
+struct imx296 {
+	struct device *dev;
+	struct clk *mclk;
+	struct regmap *regmap;
+
+	struct v4l2_subdev sd;
+	struct v4l2_fwnode_endpoint ep;
+	struct media_pad pad;
+	struct v4l2_mbus_framefmt current_format;
+	const struct imx296_mode *current_mode;
+
+	struct regulator_bulk_data supplies[IMX296_NUM_SUPPLIES];
+	struct gpio_desc *rst_gpio;
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *pixel_rate;
+
+	struct mutex lock;
+};
+
+static const struct regmap_config imx296_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static const struct imx296_regval imx296_global_init_settings[] = {
+	{ 0x3a00, 0x80 },
+	{ 0x3005, 0xf0 },
+	{ 0x350b, 0x0f },
+	{ 0x300d, 0x00 },
+	{ 0x400e, 0x58 },
+	{ 0x3010, 0x5e },
+	{ 0x3011, 0x04 },
+	{ 0x3014, 0x4c },
+	{ 0x4014, 0x1c },
+	{ 0x3015, 0x04 },
+	{ 0x3516, 0x77 },
+	{ 0x321a, 0x00 },
+	{ 0x3226, 0x02 },
+	{ 0x3832, 0xf5 },
+	{ 0x3833, 0x00 },
+	{ 0x3541, 0x72 },
+	{ 0x4041, 0x2a },
+	{ 0x3d48, 0xa3 },
+	{ 0x3d49, 0x00 },
+	{ 0x3d4a, 0x85 },
+	{ 0x3d4b, 0x00 },
+	{ 0x3256, 0x01 },
+	{ 0x3758, 0xa3 },
+	{ 0x3759, 0x00 },
+	{ 0x375a, 0x85 },
+	{ 0x375b, 0x00 },
+	{ 0x3165, 0x00 },
+	{ 0x3169, 0x10 },
+	{ 0x316a, 0x02 },
+	{ 0x4174, 0x00 },
+	{ 0x3079, 0x08 },
+	{ 0x3090, 0x04 },
+	{ 0x3094, 0x04 },
+	{ 0x3098, 0x04 },
+	{ 0x309e, 0x04 },
+	{ 0x30a0, 0x04 },
+	{ 0x30a1, 0x3c },
+	{ 0x38a2, 0xf6 },
+	{ 0x40a2, 0x06 },
+	{ 0x38a3, 0x00 },
+	{ 0x30a4, 0x5f },
+	{ 0x30a8, 0x91 },
+	{ 0x30ac, 0x28 },
+	{ 0x30af, 0x09 },
+	{ 0x40c1, 0xf6 },
+	{ 0x40c7, 0x0f },
+	{ 0x31c8, 0xf3 },
+	{ 0x40c8, 0x00 },
+	{ 0x31d0, 0xf4 },
+	{ 0x30df, 0x00 },
+};
+
+static const struct imx296_regval imx296_1440_1088_settings[] = {
+	{ 0x300d, 0x00 },
+	{ 0x3010, 0xcb },
+	{ 0x3011, 0x08 },
+	{ 0x3014, 0x4c },
+	{ 0x3015, 0x04 },
+	{ 0x3300, 0x03 },
+	{ 0x3310, 0x08 },
+	{ 0x3311, 0x00 },
+	{ 0x3312, 0x00 },
+	{ 0x3313, 0x00 },
+	{ 0x3314, 0xa0 },
+	{ 0x3315, 0x05 },
+	{ 0x3316, 0x40 },
+	{ 0x3317, 0x04 },
+
+	{ 0x3204, 0x00 },
+	{ 0x3205, 0x00 },
+	{ 0x3212, 0x08 },
+	{ 0x3254, 0x3c },
+	{ 0x3255, 0x00 },
+	{ 0x3089, 0x80 },
+	{ 0x308a, 0x0b },
+	{ 0x308b, 0x80 },
+	{ 0x308c, 0x08 },
+	{ 0x418c, 0x74 },
+	{ 0x308d, 0x0e },
+	{ 0x308e, 0x00 },
+	{ 0x308f, 0x00 },
+};
+
+/* Mode configs */
+static const struct imx296_mode imx296_modes[] = {
+	{
+		.width = 1440,
+		.height = 1088,
+		.data = imx296_1440_1088_settings,
+		.data_size = ARRAY_SIZE(imx296_1440_1088_settings),
+		.pixel_rate = 80000000,
+	},
+};
+
+static inline struct imx296 *to_imx296(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct imx296, sd);
+}
+
+static inline int imx296_read_reg(struct imx296 *imx296, u16 addr, u8 *value)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(imx296->regmap, addr, &regval);
+	if (ret) {
+		dev_err(imx296->dev, "I2C read failed for addr: %x\n", addr);
+		return ret;
+	}
+
+	*value = regval & 0xff;
+
+	return 0;
+}
+
+static int imx296_write_reg(struct imx296 *imx296, u16 addr, u8 value)
+{
+	int ret;
+
+	ret = regmap_write(imx296->regmap, addr, value);
+	if (ret) {
+		dev_err(imx296->dev, "I2C write failed for addr: %x\n", addr);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int imx296_set_register_array(struct imx296 *imx296,
+				     const struct imx296_regval *settings,
+				     unsigned int num_settings)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_settings; ++i, ++settings) {
+		ret = imx296_write_reg(imx296, settings->reg, settings->val);
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
+static int imx296_write_buffered_reg(struct imx296 *imx296, u16 address_low,
+				     u8 nr_regs, u32 value)
+{
+	unsigned int i;
+	int ret;
+
+	ret = imx296_write_reg(imx296, IMX296_REGHOLD, 0x01);
+	if (ret) {
+		dev_err(imx296->dev, "Error setting hold register\n");
+		return ret;
+	}
+
+	for (i = 0; i < nr_regs; i++) {
+		ret = imx296_write_reg(imx296, address_low + i,
+				       (u8)(value >> (i * 8)));
+		if (ret) {
+			dev_err(imx296->dev, "Error writing buffered registers\n");
+			return ret;
+		}
+	}
+
+	ret = imx296_write_reg(imx296, IMX296_REGHOLD, 0x00);
+	if (ret) {
+		dev_err(imx296->dev, "Error setting hold register\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int imx296_set_gain(struct imx296 *imx296, u32 value)
+{
+	int ret;
+
+	ret = imx296_write_buffered_reg(imx296, IMX296_GAIN_HIGH, 1,
+					(u8)((value >> 8) & 0xFF));
+	if (ret < 0)
+		return ret;
+
+	ret = imx296_write_buffered_reg(imx296, IMX296_GAIN_HIGH, 1,
+					(u8)((value) & 0xFF));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/* Stop streaming */
+static int imx296_stop_streaming(struct imx296 *imx296)
+{
+	int ret;
+
+	ret = imx296_write_reg(imx296, IMX296_STANDBY, 0x01);
+	if (ret < 0)
+		return ret;
+
+	msleep(30);
+
+	return imx296_write_reg(imx296, IMX296_XMSTA, 0x01);
+}
+
+static int imx296_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx296 *imx296 = container_of(ctrl->handler,
+					     struct imx296, ctrls);
+	int ret = 0;
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(imx296->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_GAIN:
+		ret = imx296_set_gain(imx296, ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(imx296->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops imx296_ctrl_ops = {
+	.s_ctrl = imx296_set_ctrl,
+};
+
+static int imx296_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	code->code = IMX296_DEFAULT_FORMAT;
+
+	return 0;
+}
+
+static int imx296_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct imx296 *imx296 = to_imx296(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+
+	mutex_lock(&imx296->lock);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		framefmt = v4l2_subdev_get_try_format(&imx296->sd, cfg,
+						      fmt->pad);
+	else
+		framefmt = &imx296->current_format;
+
+	fmt->format = *framefmt;
+
+	mutex_unlock(&imx296->lock);
+
+	return 0;
+}
+
+static int imx296_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct imx296 *imx296 = to_imx296(sd);
+	const struct imx296_mode *mode;
+	struct v4l2_mbus_framefmt *format;
+	int ret = 0;
+
+	mutex_lock(&imx296->lock);
+
+	mode = v4l2_find_nearest_size(imx296_modes,
+				      ARRAY_SIZE(imx296_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+
+	fmt->format.code = IMX296_DEFAULT_FORMAT;
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+	} else {
+		format = &imx296->current_format;
+		__v4l2_ctrl_s_ctrl_int64(imx296->pixel_rate, mode->pixel_rate);
+
+		imx296->current_mode = mode;
+	}
+
+	*format = fmt->format;
+
+	mutex_unlock(&imx296->lock);
+
+	return ret;
+}
+
+static int imx296_entity_init_cfg(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = { 0 };
+
+	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.width = 1440;
+	fmt.format.height = 1088;
+
+	imx296_set_fmt(subdev, cfg, &fmt);
+
+	return 0;
+}
+
+/* Start streaming */
+static int imx296_start_streaming(struct imx296 *imx296)
+{
+	int ret;
+
+	/* Set init register settings */
+	ret = imx296_set_register_array(imx296, imx296_global_init_settings,
+				ARRAY_SIZE(imx296_global_init_settings));
+	if (ret < 0) {
+		dev_err(imx296->dev, "Could not set init registers\n");
+		return ret;
+	}
+
+	/* Apply default values of current mode */
+	ret = imx296_set_register_array(imx296, imx296->current_mode->data,
+					imx296->current_mode->data_size);
+	if (ret < 0) {
+		dev_err(imx296->dev, "Could not set current mode\n");
+		return ret;
+	}
+
+	/* Apply customized values from user */
+	ret = v4l2_ctrl_handler_setup(imx296->sd.ctrl_handler);
+	if (ret) {
+		dev_err(imx296->dev, "Could not sync v4l2 controls\n");
+		return ret;
+	}
+
+	ret = imx296_write_reg(imx296, IMX296_STANDBY, 0x00);
+	if (ret < 0)
+		return ret;
+
+	msleep(30);
+
+	/* Start streaming */
+	return imx296_write_reg(imx296, IMX296_XMSTA, 0x00);
+}
+
+static int imx296_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct imx296 *imx296 = to_imx296(sd);
+	int ret;
+
+	if (enable) {
+		ret = pm_runtime_get_sync(imx296->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(imx296->dev);
+			return ret;
+		}
+
+		ret = imx296_start_streaming(imx296);
+		if (ret) {
+			dev_err(imx296->dev, "Start stream failed\n");
+			pm_runtime_put(imx296->dev);
+			return ret;
+		}
+	} else {
+		imx296_stop_streaming(imx296);
+		pm_runtime_put(imx296->dev);
+	}
+
+	return 0;
+}
+
+static int imx296_get_regulators(struct device *dev, struct imx296 *imx296)
+{
+	unsigned int i;
+
+	for (i = 0; i < IMX296_NUM_SUPPLIES; i++)
+		imx296->supplies[i].supply = imx296_supply_name[i];
+
+	return devm_regulator_bulk_get(dev, IMX296_NUM_SUPPLIES,
+				       imx296->supplies);
+}
+
+static int imx296_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx296 *imx296 = to_imx296(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(IMX296_NUM_SUPPLIES, imx296->supplies);
+	if (ret) {
+		dev_err(imx296->dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
+	usleep_range(1, 2);
+
+	gpiod_set_value_cansleep(imx296->rst_gpio, 1);
+
+	usleep_range(1, 2);
+
+	ret = clk_prepare_enable(imx296->mclk);
+	if (ret) {
+		dev_err(imx296->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	usleep_range(30000, 31000);
+
+	return 0;
+}
+
+static int imx296_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx296 *imx296 = to_imx296(sd);
+
+	clk_disable_unprepare(imx296->mclk);
+	gpiod_set_value_cansleep(imx296->rst_gpio, 0);
+	regulator_bulk_disable(IMX296_NUM_SUPPLIES, imx296->supplies);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx296_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx296_power_on, imx296_power_off, NULL)
+};
+
+static const struct v4l2_subdev_video_ops imx296_video_ops = {
+	.s_stream = imx296_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops imx296_pad_ops = {
+	.init_cfg = imx296_entity_init_cfg,
+	.enum_mbus_code = imx296_enum_mbus_code,
+	.get_fmt = imx296_get_fmt,
+	.set_fmt = imx296_set_fmt,
+};
+
+static const struct v4l2_subdev_ops imx296_subdev_ops = {
+	.video = &imx296_video_ops,
+	.pad = &imx296_pad_ops,
+};
+
+static const struct media_entity_operations imx296_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int imx296_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	struct imx296 *imx296;
+	u32 mclk_freq;
+	int ret;
+
+	imx296 = devm_kzalloc(dev, sizeof(*imx296), GFP_KERNEL);
+	if (!imx296)
+		return -ENOMEM;
+
+	imx296->dev = dev;
+	imx296->regmap = devm_regmap_init_i2c(client, &imx296_regmap_config);
+	if (IS_ERR(imx296->regmap)) {
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
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &imx296->ep);
+	fwnode_handle_put(endpoint);
+	if (ret) {
+		dev_err(dev, "Parsing endpoint node failed\n");
+		goto free_err;
+	}
+
+	/* Only CSI2 is supported for now */
+	if (imx296->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Unsupported bus type, should be CSI2\n");
+		ret = -EINVAL;
+		goto free_err;
+	}
+
+	/* Set default mode to max resolution */
+	imx296->current_mode = &imx296_modes[0];
+
+	/* get system clock (mclk) */
+	imx296->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(imx296->mclk)) {
+		dev_err(dev, "Could not get mclk");
+		ret = PTR_ERR(imx296->mclk);
+		goto free_err;
+	}
+
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &mclk_freq);
+	if (ret) {
+		dev_err(dev, "Could not get mclk frequency\n");
+		goto free_err;
+	}
+
+	/* external clock must be 37.125 MHz */
+	if (mclk_freq != 37125000) {
+		dev_err(dev, "External clock frequency %u is not supported\n",
+			mclk_freq);
+		ret = -EINVAL;
+		goto free_err;
+	}
+
+	ret = clk_set_rate(imx296->mclk, mclk_freq);
+	if (ret) {
+		dev_err(dev, "Could not set mclk frequency\n");
+		goto free_err;
+	}
+
+	ret = imx296_get_regulators(dev, imx296);
+	if (ret < 0) {
+		dev_err(dev, "Cannot get regulators\n");
+		goto free_err;
+	}
+
+	imx296->rst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(imx296->rst_gpio)) {
+		dev_err(dev, "Cannot get reset gpio\n");
+		ret = PTR_ERR(imx296->rst_gpio);
+		goto free_err;
+	}
+
+	mutex_init(&imx296->lock);
+
+	v4l2_ctrl_handler_init(&imx296->ctrls, 3);
+
+	v4l2_ctrl_new_std(&imx296->ctrls, &imx296_ctrl_ops,
+			  V4L2_CID_GAIN, 0, 72, 1, 0);
+
+	imx296->pixel_rate = v4l2_ctrl_new_std(&imx296->ctrls, &imx296_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE, 1,
+					       INT_MAX, 1,
+					       imx296_modes[0].pixel_rate);
+
+	imx296->sd.ctrl_handler = &imx296->ctrls;
+
+	if (imx296->ctrls.error) {
+		dev_err(dev, "Control initialization error %d\n",
+			imx296->ctrls.error);
+		ret = imx296->ctrls.error;
+		goto free_ctrl;
+	}
+
+	v4l2_i2c_subdev_init(&imx296->sd, client, &imx296_subdev_ops);
+	imx296->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx296->sd.dev = &client->dev;
+	imx296->sd.entity.ops = &imx296_subdev_entity_ops;
+	imx296->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	imx296->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&imx296->sd.entity, 1, &imx296->pad);
+	if (ret < 0) {
+		dev_err(dev, "Could not register media entity\n");
+		goto free_ctrl;
+	}
+
+	ret = v4l2_async_register_subdev(&imx296->sd);
+	if (ret < 0) {
+		dev_err(dev, "Could not register v4l2 device\n");
+		goto free_entity;
+	}
+
+	/* Power on the device to match runtime PM state below */
+	ret = imx296_power_on(dev);
+	if (ret < 0) {
+		dev_err(dev, "Could not power on the device\n");
+		goto free_entity;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	v4l2_fwnode_endpoint_free(&imx296->ep);
+
+	return 0;
+
+free_entity:
+	media_entity_cleanup(&imx296->sd.entity);
+free_ctrl:
+	v4l2_ctrl_handler_free(&imx296->ctrls);
+	mutex_destroy(&imx296->lock);
+free_err:
+	v4l2_fwnode_endpoint_free(&imx296->ep);
+
+	return ret;
+}
+
+static int imx296_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx296 *imx296 = to_imx296(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+
+	mutex_destroy(&imx296->lock);
+
+	pm_runtime_disable(imx296->dev);
+	if (!pm_runtime_status_suspended(imx296->dev))
+		imx296_power_off(imx296->dev);
+	pm_runtime_set_suspended(imx296->dev);
+
+	return 0;
+}
+
+static const struct of_device_id imx296_of_match[] = {
+	{ .compatible = "sony,imx296" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx296_of_match);
+
+static struct i2c_driver imx296_i2c_driver = {
+	.probe_new  = imx296_probe,
+	.remove = imx296_remove,
+	.driver = {
+		.name  = "imx296",
+		.pm = &imx296_pm_ops,
+		.of_match_table = of_match_ptr(imx296_of_match),
+	},
+};
+
+module_i2c_driver(imx296_i2c_driver);
+
+MODULE_DESCRIPTION("Sony IMX296 CMOS Image Sensor Driver");
+MODULE_AUTHOR("FRAMOS GmbH");
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

