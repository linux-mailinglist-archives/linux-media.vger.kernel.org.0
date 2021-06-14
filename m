Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8793A6CC5
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 19:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbhFNRLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 13:11:19 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48]:34656 "EHLO
        mail-ej1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbhFNRLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 13:11:19 -0400
Received: by mail-ej1-f48.google.com with SMTP id g8so17861787ejx.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVYaFLJ1JijE6Fjm7WCXrs69wXrDaUlgYEe+hEwRMM4=;
        b=PzsRQ0GDMkJFR2TAJCF5xjbWDyMapxiFkgU8dG0UzFXWkxU5WVL3XCXE08BNmrfyTs
         T9ocL9me+eHQB5u2uVFOxLrSuFpLQUXvlTnIcOc+FAjFZbv7B/9AxWEFGB9mn4sJcUql
         hScAFk9kFOLyD+gF7SuJQoo7TNeOeO0y4xi3LhRtwhmXIF5AfjyejVFzEGrBoZcWcnsf
         +AcIt6+sbKFeX476EOw2hZEWXd8vtKAVosAxrnD50GYXScCpzYKJmdT72YJQUVgV1YRe
         +SHRyxdELDdAnx4BnlvIKcCOMLFoQ31+Q9mLZ88Y4CW22yJLJGM4fO9b6utjc9DPPVkw
         iMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVYaFLJ1JijE6Fjm7WCXrs69wXrDaUlgYEe+hEwRMM4=;
        b=HsYG5gSyG5vCYIO2fHskadgg2rBT2DO6z5ymn+7qwUYZ+Rsgm7xTk7mPX8IRgRXfxF
         WfM5J9iNbiT2eUF8S7LivpWfroecLSPra92RHfVftHmVNqjJX9kZUy32QravqDaAIhtU
         R/kbg2ynAACbyM07o0G9mIbb2Yg0FYFLijTX1SD6+DRy03igOdEleM38hjInkCUwcXy1
         1bdNpRcDAuGbRGkGCoVqN8CCTuMeDC2fD8NWqTROPedj56n13pFedThzTLuZk4FbkAs4
         nihtdU33gNmitzzev2EKOowDDii6Mno6EPM/P14w+uoNfc0BOu28dBCCDVBnDrjm03Iz
         nwKw==
X-Gm-Message-State: AOAM531iGpUaw0F0hlk99Tyzj0gnpme+2c889t+RmwTdtjv5331ZVTYy
        DPwOicF0Inuv9j6AZSmoppPmcw==
X-Google-Smtp-Source: ABdhPJwTLvIiAFQ/SaofXdVSaRb4K9a4Xc35eJSHRF++4nyomkOkeNPEbcrCdoMnJ53tauI+Is3g7w==
X-Received: by 2002:a17:907:2057:: with SMTP id pg23mr16031916ejb.113.1623690495237;
        Mon, 14 Jun 2021 10:08:15 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id s2sm5542140edt.53.2021.06.14.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 10:08:14 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
Date:   Mon, 14 Jun 2021 19:06:06 +0200
Message-Id: <20210614170606.1619868-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add basic support for Maxim MAX96712 quad GMSL2 deserializers. The
driver is capable of powering on the device and configuring the MIPI
CSI-2 bus in a DPHY 4-lane configuration as well as operating the
internal VTG (Video Timing Generator) and VPG (Video Pattern Generator).

Using these features the driver is able to act as a 1080p @ 30 fps V4L2
video source. Producing either a checkerboard or gradient pattern on the
CSI-2 bus, selectable thru a V4L2 control.

While the driver is useful as-is and have been used to prove the correct
operation of the MAX96712 itself and "downstream" devices using the
MAX96712 as a video source there are a lot of features missing. Most
notably the ability to operate the GMSL bus.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS                               |   6 +
 drivers/staging/media/Kconfig             |   2 +
 drivers/staging/media/Makefile            |   1 +
 drivers/staging/media/max96712/Kconfig    |  13 +
 drivers/staging/media/max96712/Makefile   |   2 +
 drivers/staging/media/max96712/max96712.c | 429 ++++++++++++++++++++++
 6 files changed, 453 insertions(+)
 create mode 100644 drivers/staging/media/max96712/Kconfig
 create mode 100644 drivers/staging/media/max96712/Makefile
 create mode 100644 drivers/staging/media/max96712/max96712.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e1bbb39a68e0eb3..813d55e5e06de88b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11093,6 +11093,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 F:	drivers/media/i2c/max9286.c
 
+MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/staging/media/max96712/max96712.c
+
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e3aaae920847cf26..b81cfa74edb7fd7d 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -26,6 +26,8 @@ source "drivers/staging/media/hantro/Kconfig"
 
 source "drivers/staging/media/imx/Kconfig"
 
+source "drivers/staging/media/max96712/Kconfig"
+
 source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/omap4iss/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 5b5afc5b03a02a41..7e2c86e3695dc4b9 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
+obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
new file mode 100644
index 0000000000000000..258d47644cbd8459
--- /dev/null
+++ b/drivers/staging/media/max96712/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_MAX96712
+	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
+	depends on I2C
+	depends on OF_GPIO
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	help
+	  This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called max96712.
diff --git a/drivers/staging/media/max96712/Makefile b/drivers/staging/media/max96712/Makefile
new file mode 100644
index 0000000000000000..70c1974ce3f05fe4
--- /dev/null
+++ b/drivers/staging/media/max96712/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_MAX96712) += max96712.o
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
new file mode 100644
index 0000000000000000..6a993e8ee9259fda
--- /dev/null
+++ b/drivers/staging/media/max96712/max96712.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim MAX9286 Quad GMSL2 Deserializer Driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation
+ * Copyright (C) 2021 Niklas Söderlund
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define MAX96712_ID 0x20
+
+#define MAX96712_DPLL_FREQ 1000
+
+enum max96712_pattern {
+	MAX96712_PATTERN_CHECKERBOARD = 0,
+	MAX96712_PATTERN_GRADIENT,
+};
+
+struct max96712_priv {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct gpio_desc *gpiod_pwdn;
+
+	struct v4l2_fwnode_bus_mipi_csi2 mipi;
+
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_pad pads[1];
+
+	enum max96712_pattern pattern;
+};
+
+static int max96712_read(struct max96712_priv *priv, int reg)
+{
+	int ret, val;
+
+	ret = regmap_read(priv->regmap, reg, &val);
+	if (ret) {
+		dev_err(&priv->client->dev, "read 0x%04x failed\n", reg);
+		return ret;
+	}
+
+	return val;
+}
+
+static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
+{
+	int ret;
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret)
+		dev_err(&priv->client->dev, "write 0x%04x failed\n", reg);
+
+	return ret;
+}
+
+static int max96712_update_bits(struct max96712_priv *priv, unsigned int reg,
+				u8 mask, u8 val)
+{
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	if (ret)
+		dev_err(&priv->client->dev, "update 0x%04x failed\n", reg);
+
+	return ret;
+}
+
+static int max96712_write_bulk(struct max96712_priv *priv, unsigned int reg,
+			       const void *val, size_t val_count)
+{
+	int ret;
+
+	ret = regmap_bulk_write(priv->regmap, reg, val, val_count);
+	if (ret)
+		dev_err(&priv->client->dev, "bulk write 0x%04x failed\n", reg);
+
+	return ret;
+}
+
+static int max96712_write_bulk_value(struct max96712_priv *priv,
+				     unsigned int reg, unsigned int val,
+				     size_t val_count)
+{
+	unsigned int i;
+	u8 values[4];
+
+	for (i = 1; i <= val_count; i++)
+		values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;
+
+	return max96712_write_bulk(priv, reg, &values, val_count);
+}
+
+static void max96712_reset(struct max96712_priv *priv)
+{
+	max96712_update_bits(priv, 0x13, 0x40, 0x40);
+	mdelay(10);
+}
+
+static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
+{
+	if (enable) {
+		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
+		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
+	} else {
+		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
+		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
+	}
+}
+
+static void max96712_mipi_configure(struct max96712_priv *priv)
+{
+	unsigned int i;
+	u8 phy5 = 0;
+
+	max96712_mipi_enable(priv, false);
+
+	/* Select 2x4 mode. */
+	max96712_write(priv, 0x8a0, 0x04);
+
+	/* Configure a 4-lane DPHY using PHY0 and PHY1. */
+	/* TODO: Add support for 2-lane and 1-lane configurations. */
+	/* TODO: Add support CPHY mode. */
+	max96712_write(priv, 0x94a, 0xc0);
+
+	/* Configure lane mapping for PHY0 and PHY1. */
+	/* TODO: Add support for lane swapping. */
+	max96712_write(priv, 0x8a3, 0xe4);
+
+	/* Configure lane polarity for PHY0 and PHY1. */
+	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
+		if (priv->mipi.lane_polarities[i])
+			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
+	max96712_write(priv, 0x8a5, phy5);
+
+	/* Set link frequency for PHY0 and PHY1. */
+	max96712_update_bits(priv, 0x415, 0x3f,
+			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
+	max96712_update_bits(priv, 0x418, 0x3f,
+			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
+
+	/* Enable PHY0 and PHY1 */
+	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
+}
+
+static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
+{
+	const u32 h_active = 1920;
+	const u32 h_fp = 88;
+	const u32 h_sw = 44;
+	const u32 h_bp = 148;
+	const u32 h_tot = h_active + h_fp + h_sw + h_bp;
+
+	const u32 v_active = 1080;
+	const u32 v_fp = 4;
+	const u32 v_sw = 5;
+	const u32 v_bp = 36;
+	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
+
+	if (!enable) {
+		max96712_write(priv, 0x1051, 0x00);
+		return;
+	}
+
+	/* PCLK 75MHz. */
+	max96712_write(priv, 0x0009, 0x01);
+
+	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
+	max96712_write_bulk_value(priv, 0x1052, 0, 3);
+	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
+	max96712_write_bulk_value(priv, 0x1058,
+				  (v_active + v_fp + + v_bp) * h_tot, 3);
+	max96712_write_bulk_value(priv, 0x105b, 0, 3);
+	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
+	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
+	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
+	max96712_write_bulk_value(priv, 0x1064,
+				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
+	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
+	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
+	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
+
+	/* Generate VS, HS and DE in free-running mode. */
+	max96712_write(priv, 0x1050, 0xfb);
+
+	/* Configure Video Pattern Generator. */
+	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
+		/* Set checkerboard pattern size. */
+		max96712_write(priv, 0x1074, 0x3c);
+		max96712_write(priv, 0x1075, 0x3c);
+		max96712_write(priv, 0x1076, 0x3c);
+
+		/* Set checkerboard pattern colors. */
+		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
+		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
+
+		/* Generate checkerboard pattern. */
+		max96712_write(priv, 0x1051, 0x10);
+	} else {
+		/* Set gradient increment. */
+		max96712_write(priv, 0x106d, 0x10);
+
+		/* Generate gradient pattern. */
+		max96712_write(priv, 0x1051, 0x20);
+	}
+}
+
+static int max96712_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
+
+	if (enable) {
+		max96712_pattern_enable(priv, true);
+		max96712_mipi_enable(priv, true);
+	} else {
+		max96712_mipi_enable(priv, false);
+		max96712_pattern_enable(priv, false);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops max96712_video_ops = {
+	.s_stream = max96712_s_stream,
+};
+
+static int max96712_get_pad_format(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_format *format)
+{
+	format->format.width = 1920;
+	format->format.height = 1080;
+	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
+	format->format.field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
+	.get_fmt = max96712_get_pad_format,
+};
+
+static struct v4l2_subdev_ops max96712_subdev_ops = {
+	.video = &max96712_video_ops,
+	.pad = &max96712_pad_ops,
+};
+
+static const char * const max96712_test_pattern[] = {
+	"Checkerboard",
+	"Gradient",
+};
+
+static int max96712_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct max96712_priv *priv =
+		container_of(ctrl->handler, struct max96712_priv, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		priv->pattern = ctrl->val ?
+			MAX96712_PATTERN_GRADIENT :
+			MAX96712_PATTERN_CHECKERBOARD;
+		break;
+	}
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
+	.s_ctrl = max96712_s_ctrl,
+};
+
+static int max96712_v4l2_register(struct max96712_priv *priv)
+{
+	long pixel_rate;
+	int ret;
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);
+
+	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
+	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
+			  pixel_rate, pixel_rate, 1, pixel_rate);
+
+	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(max96712_test_pattern) - 1,
+				     0, 0, max96712_test_pattern);
+
+	priv->sd.ctrl_handler = &priv->ctrl_handler;
+	ret = priv->ctrl_handler.error;
+	if (ret)
+		return ret;
+
+	priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
+	if (ret)
+		return ret;
+
+	v4l2_set_subdevdata(&priv->sd, priv);
+
+	ret = v4l2_async_register_subdev(&priv->sd);
+	if (ret < 0)
+		dev_err(&priv->client->dev, "Unable to register subdevice\n");
+
+	return ret;
+}
+
+static int max96712_parse_dt(struct max96712_priv *priv)
+{
+	struct fwnode_handle *ep;
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
+					     0, 0);
+	if (!ep) {
+		dev_err(&priv->client->dev, "Not connected to subdevice\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
+		return -EINVAL;
+	}
+
+	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != 4) {
+		dev_err(&priv->client->dev, "Only 4 data lanes supported\n");
+		return -EINVAL;
+	}
+
+	priv->mipi = v4l2_ep.bus.mipi_csi2;
+
+	return 0;
+}
+
+static const struct regmap_config max96712_i2c_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0x1f00,
+};
+
+static int max96712_probe(struct i2c_client *client)
+{
+	struct max96712_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_pwdn))
+		return PTR_ERR(priv->gpiod_pwdn);
+
+	gpiod_set_consumer_name(priv->gpiod_pwdn, "max96712-pwdn");
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
+
+	if (priv->gpiod_pwdn)
+		usleep_range(4000, 5000);
+
+	if (max96712_read(priv, 0x4a) != MAX96712_ID)
+		return -ENODEV;
+
+	max96712_reset(priv);
+
+	ret = max96712_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	max96712_mipi_configure(priv);
+
+	return max96712_v4l2_register(priv);
+}
+
+static int max96712_remove(struct i2c_client *client)
+{
+	struct max96712_priv *priv = i2c_get_clientdata(client);
+
+	v4l2_async_unregister_subdev(&priv->sd);
+
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
+
+	return 0;
+}
+
+static const struct of_device_id max96712_of_table[] = {
+	{ .compatible = "maxim,max96712" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, max96712_of_table);
+
+static struct i2c_driver max96712_i2c_driver = {
+	.driver	= {
+		.name = "max96712",
+		.of_match_table	= of_match_ptr(max96712_of_table),
+	},
+	.probe_new = max96712_probe,
+	.remove = max96712_remove,
+};
+
+module_i2c_driver(max96712_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim MAX96712 Quad GMSL2 Deserializer Driver");
+MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
+MODULE_LICENSE("GPL");
-- 
2.32.0

