Return-Path: <linux-media+bounces-1955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7080A508
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41481281BE1
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE7C1DFF9;
	Fri,  8 Dec 2023 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gw1qvo6o"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D04CA9;
	Fri,  8 Dec 2023 06:02:43 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66AB066073BE;
	Fri,  8 Dec 2023 14:02:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702044162;
	bh=qTgIN2hi/5JG88Uo9HOO8R33J8vMowN2sxE3q52KHZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gw1qvo6ozdXVRx9dSza3/p3SVgm61/U6u/Yqf2SUCKXqj7mCZrG/EvxsgOwjg0Ui/
	 bUBFiyBL0ut+s3twOpVbInOUtMKWRNLLUzWUGG3294E7Q4ozN7HdvxhNWyT/ZQuqzX
	 aiIaMOwaOftxXdxqBGDhKqnFW9rSQiczoICHNQ5Ai3CEDuoHRc/M/i5ZmVrhQz0cdm
	 yRh5zFc9syw9LIpn8jTXLsLRFL2MpMT2hEYmp7ItI1GVK3fmunDjQiKt5nfxM4yv+g
	 GQfkv/B8lkb1o7LEDkYJH5tQhrO7T7qVRxdBuwgGfU5frkq+r4t/Jf0a/kvRzvkhXI
	 ZgXUvzrVIpRxQ==
From: Julien Massot <julien.massot@collabora.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 4/4] media: i2c: add MAX96717 driver
Date: Fri,  8 Dec 2023 15:02:17 +0100
Message-ID: <20231208140217.457609-5-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208140217.457609-1-julien.massot@collabora.com>
References: <20231208140217.457609-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver handle the MAX96717 serializer in tunnel mode.
All incoming CSI traffic will be tunneled through the GMSL2
link.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 MAINTAINERS                  |    6 +
 drivers/media/i2c/Kconfig    |   13 +
 drivers/media/i2c/Makefile   |    1 +
 drivers/media/i2c/max96717.c | 1003 ++++++++++++++++++++++++++++++++++
 4 files changed, 1023 insertions(+)
 create mode 100644 drivers/media/i2c/max96717.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1010e7db32f2..232f74998b57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13022,6 +13022,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/max96714.c
 
+MAX96717 GMSL2 SERIALIZER DRIVER
+M:	Julien Massot <julien.massot@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/i2c/max96717.c
+
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6e2819a9ba96..87858169c39a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1511,6 +1511,19 @@ config VIDEO_MAX96714
 	  Device driver for the Maxim MAX96714
 	  GMSL2 Deserializer.
 
+config VIDEO_MAX96717
+	tristate "Maxim MAX96717 GMSL2 Serializer support"
+	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
+	select I2C_MUX
+	select MEDIA_CONTROLLER
+	select GPIOLIB
+	select REGMAP_I2C
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Device driver for the Maxim MAX96717
+	  GMSL2 Serializer.
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c6e23d3fdc22..4362b905edfd 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_VIDEO_M52790) += m52790.o
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
+obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
new file mode 100644
index 000000000000..13c70fbe42cc
--- /dev/null
+++ b/drivers/media/i2c/max96717.c
@@ -0,0 +1,1003 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim GMSL2 Serializer Driver
+ *
+ * Copyright (C) 2023 Collabora Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/fwnode.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define MAX96717F_DEVICE_ID 0xc8
+#define MAX96717_PORTS      2
+#define MAX96717_PAD_SINK   0
+#define MAX96717_PAD_SOURCE 1
+
+#define MAX96717_DEFAULT_CLKOUT_RATE	24000000UL
+
+/* DEV */
+#define REG3 0x3
+#define MAX96717_RCLKSEL GENMASK(1, 0)
+#define RCLKSEL_REF_PLL 0x3
+#define MAX96717_REG6 0x6
+#define RCLKEN BIT(5)
+#define MAX96717_DEV_ID 0xd
+#define MAX96717_DEV_REV 0xe
+#define MAX96717_DEV_REV_MASK GENMASK(3, 0)
+
+/* VID_TX Z */
+#define MAX96717_VIDEO_TX2 0x112
+#define MAX96717_VIDEO_PCLKDET BIT(7)
+
+/* GPIO */
+#define MAX96717_GPIO_BASE        0x2be
+#define MAX96717_NUM_GPIO         11
+#define MAX96717_GPIO_REG_A(gpio) (MAX96717_GPIO_BASE + gpio * 3)
+#define MAX96717_GPIO_OUT         BIT(4)
+#define MAX96717_GPIO_IN          BIT(3)
+#define MAX96717_GPIO_RX_EN       BIT(2)
+#define MAX96717_GPIO_TX_EN       BIT(1)
+#define MAX96717_GPIO_OUT_DIS     BIT(0)
+
+/* FRONTTOP */
+/* MAX96717 only have CSI port 'B' */
+#define MAX96717_FRONTOP0 0x308
+#define MAX96717_START_PORT_B BIT(5)
+
+/* MIPI_RX */
+#define MAX96717_MIPI_RX1 0x331
+#define MAX96717_MIPI_LANES_CNT GENMASK(5, 4)
+#define MAX96717_MIPI_RX2 0x332 /* phy1 Lanes map */
+#define MAX96717_PHY2_LANES_MAP GENMASK(7, 4)
+#define MAX96717_MIPI_RX3 0x333 /* phy2 Lanes map */
+#define MAX96717_PHY1_LANES_MAP GENMASK(3, 0)
+#define MAX96717_MIPI_RX4 0x334 /* phy1 lane polarities */
+#define MAX96717_PHY1_LANES_POL GENMASK(6, 4)
+#define MAX96717_MIPI_RX5 0x335 /* phy2 lane polarities */
+#define MAX96717_PHY2_LANES_POL GENMASK(2, 0)
+
+/* MIPI_RX_EXT */
+#define MAX96717_MIPI_RX_EXT11 0x383
+#define MAX96717_TUN_MODE BIT(7)
+
+/* REF_VTG */
+#define REF_VTG0 0x3f0
+#define REFGEN_PREDEF_EN BIT(6)
+#define REFGEN_PREDEF_FREQ_MASK GENMASK(5, 4)
+#define REFGEN_PREDEF_FREQ_ALT BIT(3)
+#define REFGEN_RST BIT(1)
+#define REFGEN_EN BIT(0)
+
+/* MISC */
+#define PIO_SLEW_1 0x570
+
+struct max96717_hw_data {
+	const char *model;
+	u8 device_id;
+};
+
+static const struct max96717_hw_data max96717f_data = {
+	.model = "max96717f",
+	.device_id = MAX96717F_DEVICE_ID,
+};
+
+struct max96717_priv {
+	const struct max96717_hw_data *data;
+	struct i2c_client             *client;
+	struct regmap                 *regmap;
+	struct i2c_mux_core           *mux;
+	struct v4l2_fwnode_endpoint   vep;
+	struct v4l2_subdev            sd;
+	struct media_pad              pads[MAX96717_PORTS];
+	struct v4l2_async_notifier    notifier;
+	struct v4l2_subdev            *source_sd;
+	u16                           source_sd_pad;
+	u64			      enabled_source_streams;
+	u8                            pll_predef_index;
+	struct clk_hw                 clk_hw;
+	struct gpio_chip              gpio_chip;
+};
+
+static struct regmap_config max96717_regmap_config = {
+	.name = "max96717",
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0xFFFF,
+};
+
+static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct max96717_priv, sd);
+}
+
+static inline struct max96717_priv *clk_hw_to_max96717(struct clk_hw *hw)
+{
+	return container_of(hw, struct max96717_priv, clk_hw);
+}
+
+static int max96717_read(struct max96717_priv *priv, u16 reg, u8 *val)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v;
+	int ret;
+
+	ret = regmap_read(priv->regmap, reg, &v);
+	if (ret) {
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+	}
+
+	*val = v;
+
+	return ret;
+}
+
+static int max96717_write(struct max96717_priv *priv, u16 reg, u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret)
+		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	return ret;
+}
+
+static int max96717_update_bits(struct max96717_priv *priv, u16 reg, u8 mask,
+				u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	if (ret)
+		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	return ret;
+}
+
+static int max96717_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
+{
+	return 0;
+}
+
+static int max96717_i2c_mux_init(struct max96717_priv *priv)
+{
+	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
+				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
+				  max96717_i2c_mux_select, NULL);
+	if (!priv->mux)
+		return -ENOMEM;
+
+	return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
+}
+
+static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
+{
+	return max96717_update_bits(priv, MAX96717_FRONTOP0,
+				    MAX96717_START_PORT_B,
+				    start ? MAX96717_START_PORT_B : 0);
+}
+
+static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
+				 unsigned int offset)
+{
+	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
+	u8 val;
+	int ret;
+
+	ret = max96717_read(priv, MAX96717_GPIO_REG_A(offset), &val);
+	if (ret)
+		return ret;
+
+	if (val & MAX96717_GPIO_OUT_DIS)
+		return !!(val & MAX96717_GPIO_IN);
+	else
+		return !!(val & MAX96717_GPIO_OUT);
+}
+
+static void max96717_gpiochip_set(struct gpio_chip *gpiochip,
+				  unsigned int offset, int value)
+{
+	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
+
+	max96717_update_bits(priv, MAX96717_GPIO_REG_A(offset),
+			     MAX96717_GPIO_OUT, MAX96717_GPIO_OUT);
+}
+
+static int max96717_gpio_get_direction(struct gpio_chip *gpiochip,
+				       unsigned int offset)
+{
+	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
+	u8 val;
+	int ret;
+
+	ret = max96717_read(priv, MAX96717_GPIO_REG_A(offset), &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & MAX96717_GPIO_OUT_DIS);
+}
+
+static int max96717_gpio_direction_out(struct gpio_chip *gpiochip,
+				       unsigned int offset, int value)
+{
+	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
+
+	return max96717_update_bits(priv, MAX96717_GPIO_REG_A(offset),
+				    MAX96717_GPIO_OUT_DIS | MAX96717_GPIO_OUT,
+				    value ? MAX96717_GPIO_OUT : 0);
+}
+
+static int max96717_gpio_direction_in(struct gpio_chip *gpiochip,
+				      unsigned int offset)
+{
+	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
+
+	return max96717_update_bits(priv, MAX96717_GPIO_REG_A(offset),
+				    MAX96717_GPIO_OUT_DIS,
+				    MAX96717_GPIO_OUT_DIS);
+}
+
+static int max96717_gpiochip_probe(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct gpio_chip *gc = &priv->gpio_chip;
+	int ret, i;
+
+	gc->label = dev_name(dev);
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->ngpio = MAX96717_NUM_GPIO;
+	gc->base = -1;
+	gc->can_sleep = true;
+	gc->get_direction = max96717_gpio_get_direction;
+	gc->direction_input = max96717_gpio_direction_in;
+	gc->direction_output = max96717_gpio_direction_out;
+	gc->set = max96717_gpiochip_set;
+	gc->get = max96717_gpiochip_get;
+	gc->of_gpio_n_cells = 2;
+
+	/* Disable GPIO forwarding */
+	for (i = 0; i < gc->ngpio; i++)
+		max96717_update_bits(priv, MAX96717_GPIO_REG_A(i),
+				     MAX96717_GPIO_RX_EN | MAX96717_GPIO_TX_EN,
+				     0);
+
+	ret = devm_gpiochip_add_data(dev, gc, priv);
+	if (ret) {
+		dev_err(dev, "Unable to create gpio_chip\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int _max96717_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 1280,
+		.height = 1080,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.field = V4L2_FIELD_NONE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96717_set_routing(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				enum v4l2_subdev_format_whence which,
+				struct v4l2_subdev_krouting *routing)
+{
+	struct max96717_priv *priv = sd_to_max96717(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
+		return -EBUSY;
+
+	return _max96717_set_routing(sd, state, routing);
+}
+
+static int max96717_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *format)
+{
+	struct max96717_priv *priv = sd_to_max96717(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	int ret;
+	u64 stream_source_mask;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    priv->enabled_source_streams)
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (format->pad == MAX96717_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	/* Set sink format */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+	*fmt = format->format;
+
+	stream_source_mask = BIT(format->stream);
+	ret = v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
+					      MAX96717_PAD_SINK,
+					      &stream_source_mask);
+	return 0;
+}
+
+static int max96717_init_cfg(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = MAX96717_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = MAX96717_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _max96717_set_routing(sd, state, &routing);
+}
+
+static bool max96717_pipe_pclkdet(struct max96717_priv *priv)
+{
+	u8 val;
+
+	max96717_read(priv, MAX96717_VIDEO_TX2, &val);
+
+	return val & MAX96717_VIDEO_PCLKDET;
+}
+
+static int max96717_log_status(struct v4l2_subdev *sd)
+{
+	struct max96717_priv *priv = sd_to_max96717(sd);
+	struct device *dev = &priv->client->dev;
+
+	dev_info(dev, "Serializer: %s\n", priv->data->model);
+	dev_info(dev, "Pipe: pclkdet:%d\n", max96717_pipe_pclkdet(priv));
+
+	return 0;
+}
+
+static int max96717_enable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct max96717_priv *priv = sd_to_max96717(sd);
+	struct device *dev = &priv->client->dev;
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       MAX96717_PAD_SOURCE,
+						       MAX96717_PAD_SINK,
+						       &streams_mask);
+
+	if (!priv->enabled_source_streams)
+		max96717_start_csi(priv, true);
+
+	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
+					 sink_streams);
+	if (ret) {
+		dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
+			sink_streams);
+		goto stop_csi;
+	}
+
+	priv->enabled_source_streams |= streams_mask;
+
+	return 0;
+
+stop_csi:
+	if (!priv->enabled_source_streams)
+		max96717_start_csi(priv, false);
+	return ret;
+
+}
+
+static int max96717_disable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	struct max96717_priv *priv = sd_to_max96717(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       MAX96717_PAD_SOURCE,
+						       MAX96717_PAD_SINK,
+						       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
+					  sink_streams);
+	if (ret)
+		return ret;
+
+	priv->enabled_source_streams &= ~streams_mask;
+
+	if (!priv->enabled_source_streams)
+		max96717_start_csi(priv, false);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
+	.enable_streams = max96717_enable_streams,
+	.disable_streams = max96717_disable_streams,
+	.set_routing = max96717_set_routing,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = max96717_set_fmt,
+	.init_cfg = max96717_init_cfg,
+};
+
+static const struct v4l2_subdev_core_ops max96717_subdev_core_ops = {
+	.log_status = max96717_log_status,
+};
+
+static const struct v4l2_subdev_ops max96717_subdev_ops = {
+	.core = &max96717_subdev_core_ops,
+	.pad = &max96717_pad_ops,
+};
+
+static const struct media_entity_operations max96717_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int max96717_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *source_subdev,
+				 struct v4l2_async_connection *asd)
+{
+	struct max96717_priv *priv = sd_to_max96717(notifier->sd);
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
+					  source_subdev->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(dev, "Failed to find pad for %s\n",
+			source_subdev->name);
+		return ret;
+	}
+
+	priv->source_sd = source_subdev;
+	priv->source_sd_pad = ret;
+
+	ret = media_create_pad_link(&source_subdev->entity, priv->source_sd_pad,
+				    &priv->sd.entity, 0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
+			source_subdev->name, priv->source_sd_pad,
+			priv->sd.name);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations max96717_notify_ops = {
+	.bound = max96717_notify_bound,
+};
+
+static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct v4l2_async_connection *asd;
+	struct fwnode_handle *ep_fwnode;
+	int ret;
+
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						    MAX96717_PAD_SINK, 0, 0);
+	if (!ep_fwnode) {
+		dev_err(dev, "No graph endpoint\n");
+		return -ENODEV;
+	}
+
+	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
+
+	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep_fwnode,
+					      struct v4l2_async_connection);
+
+	fwnode_handle_put(ep_fwnode);
+
+	if (IS_ERR(asd)) {
+		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		v4l2_async_nf_cleanup(&priv->notifier);
+		return PTR_ERR(asd);
+	}
+
+	priv->notifier.ops = &max96717_notify_ops;
+
+	ret = v4l2_async_nf_register(&priv->notifier);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev_notifier");
+		v4l2_async_nf_cleanup(&priv->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max96717_v4l2_notifier_unregister(struct max96717_priv *priv)
+{
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+}
+
+static int max96717_subdev_init(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96717_subdev_ops);
+
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->sd.entity.ops = &max96717_entity_ops;
+
+	priv->pads[0].flags = MEDIA_PAD_FL_SINK;
+	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init pads\n");
+
+	ret = v4l2_subdev_init_finalize(&priv->sd);
+	if (ret) {
+		dev_err_probe(dev, ret,
+			      "v4l2 subdev init finalized failed\n");
+		goto err_fwnode_put;
+	}
+	ret = max96717_v4l2_notifier_register(priv);
+	if (ret) {
+		dev_err_probe(dev, ret,
+			      "v4l2 subdev notifier register failed\n");
+		goto err_free_state;
+	}
+
+	ret = v4l2_async_register_subdev(&priv->sd);
+	if (ret) {
+		dev_err_probe(dev, ret, "v4l2_async_register_subdev error\n");
+		goto err_unreg_notif;
+	}
+
+	return 0;
+
+err_unreg_notif:
+	max96717_v4l2_notifier_unregister(priv);
+err_free_state:
+	v4l2_subdev_cleanup(&priv->sd);
+err_fwnode_put:
+	fwnode_handle_put(priv->sd.fwnode);
+	media_entity_cleanup(&priv->sd.entity);
+
+	return ret;
+}
+
+static void max96717_subdev_uninit(struct max96717_priv *priv)
+{
+	v4l2_async_unregister_subdev(&priv->sd);
+	max96717_v4l2_notifier_unregister(priv);
+	v4l2_subdev_cleanup(&priv->sd);
+	fwnode_handle_put(priv->sd.fwnode);
+	media_entity_cleanup(&priv->sd.entity);
+}
+
+struct max96717_pll_predef_freq {
+	unsigned long freq;
+	bool is_alt;
+	u8 val;
+};
+
+static const struct max96717_pll_predef_freq max96717_predef_freqs[] = {
+	{ 13500000, true,  0 }, { 19200000, false, 0 },
+	{ 24000000, true,  1 }, { 27000000, false, 1 },
+	{ 37125000, false, 2 }, { 74250000, false, 3 },
+};
+
+static unsigned long
+max96717_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct max96717_priv *priv = clk_hw_to_max96717(hw);
+
+	return max96717_predef_freqs[priv->pll_predef_index].freq;
+}
+
+static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
+						 unsigned long rate)
+{
+	u8 i, idx;
+	unsigned long diff_new, diff_old;
+
+	diff_old = U32_MAX;
+	idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
+		diff_new = abs(rate - max96717_predef_freqs[i].freq);
+		if (diff_new < diff_old) {
+			diff_old = diff_new;
+			idx = i;
+		}
+	}
+
+	return idx;
+}
+
+static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	struct max96717_priv *priv = clk_hw_to_max96717(hw);
+	struct device *dev = &priv->client->dev;
+	u8 idx;
+
+	idx = max96717_clk_find_best_index(priv, rate);
+
+	if (rate != max96717_predef_freqs[idx].freq) {
+		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
+			 rate, max96717_predef_freqs[idx].freq);
+	}
+
+	return max96717_predef_freqs[idx].freq;
+}
+
+static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct max96717_priv *priv = clk_hw_to_max96717(hw);
+	int ret;
+	u8 val, idx;
+
+	idx = max96717_clk_find_best_index(priv, rate);
+
+	val = FIELD_PREP(REFGEN_PREDEF_FREQ_MASK,
+			 max96717_predef_freqs[idx].val);
+
+	if (max96717_predef_freqs[idx].is_alt)
+		val |= REFGEN_PREDEF_FREQ_ALT;
+
+	val |= REFGEN_RST | REFGEN_PREDEF_EN;
+
+	ret = max96717_write(priv, REF_VTG0, val);
+	if (ret)
+		return ret;
+
+	ret = max96717_update_bits(priv, REF_VTG0,
+				   REFGEN_RST | REFGEN_EN, REFGEN_EN);
+	if (ret)
+		return ret;
+
+	priv->pll_predef_index = idx;
+
+	return 0;
+}
+
+static int max96717_clk_prepare(struct clk_hw *hw)
+{
+	struct max96717_priv *priv = clk_hw_to_max96717(hw);
+
+	return max96717_update_bits(priv, MAX96717_REG6, RCLKEN, RCLKEN);
+}
+
+static void max96717_clk_unprepare(struct clk_hw *hw)
+{
+	struct max96717_priv *priv = clk_hw_to_max96717(hw);
+
+	max96717_update_bits(priv, MAX96717_REG6, RCLKEN, 0);
+}
+
+static const struct clk_ops max96717_clk_ops = {
+	.prepare     = max96717_clk_prepare,
+	.unprepare   = max96717_clk_unprepare,
+	.set_rate    = max96717_clk_set_rate,
+	.recalc_rate = max96717_clk_recalc_rate,
+	.round_rate  = max96717_clk_round_rate,
+};
+
+static int max96717_register_clkout(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	const struct clk_init_data init = {
+		.name = kasprintf(GFP_KERNEL, "%s.%s.clk_out",
+				  priv->data->model,
+				  dev_name(dev)),
+		.ops = &max96717_clk_ops,
+	};
+
+	if (!init.name)
+		return -ENOMEM;
+
+	/* RCLKSEL Reference PLL output */
+	ret = regmap_update_bits(priv->regmap, REG3, MAX96717_RCLKSEL,
+				 RCLKSEL_REF_PLL);
+	if (ret)
+		goto free_init_name;
+
+	/* MFP4 fastest slew rate */
+	ret = regmap_update_bits(priv->regmap, PIO_SLEW_1, BIT(5) | BIT(4), 0);
+	if (ret)
+		goto free_init_name;
+
+	priv->clk_hw.init = &init;
+
+	/* Initialize to 24 MHz */
+	ret = max96717_clk_set_rate(&priv->clk_hw,
+				    MAX96717_DEFAULT_CLKOUT_RATE, 0);
+	if (ret < 0)
+		goto free_init_name;
+
+	ret = devm_clk_hw_register(dev, &priv->clk_hw);
+	kfree(init.name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register clock HW\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &priv->clk_hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Cannot add OF clock provider\n");
+
+	return 0;
+
+free_init_name:
+	kfree(init.name);
+	return ret;
+}
+
+static int max96717_init_csi_lanes(struct max96717_priv *priv)
+{
+	struct v4l2_mbus_config_mipi_csi2 *mipi = &priv->vep.bus.mipi_csi2;
+	unsigned long lanes_used = 0;
+	u8 nlanes, lane, val = 0;
+	int ret;
+
+	nlanes = mipi->num_data_lanes;
+
+	max96717_update_bits(priv, MAX96717_MIPI_RX1, MAX96717_MIPI_LANES_CNT,
+			     FIELD_PREP(MAX96717_MIPI_LANES_CNT, nlanes - 1));
+	if (ret)
+		return ret;
+
+	for (lane = 0; lane < nlanes + 1; lane++) {
+		if (!mipi->lane_polarities[lane])
+			continue;
+		/* Clock lane */
+		if (lane == 0)
+			val |= BIT(2);
+		else if (lane < 3)
+			val |= BIT(lane - 1);
+		else
+			val |= BIT(lane);
+	}
+
+	max96717_update_bits(priv, MAX96717_MIPI_RX5, MAX96717_PHY2_LANES_POL,
+			     FIELD_PREP(MAX96717_PHY2_LANES_POL, val));
+
+	max96717_update_bits(priv, MAX96717_MIPI_RX4, MAX96717_PHY1_LANES_POL,
+			     FIELD_PREP(MAX96717_PHY1_LANES_POL, val >> 3));
+
+	val = 0;
+	for (lane = 0; lane < nlanes; lane++) {
+		val |= (mipi->data_lanes[lane] - 1) << (lane*2);
+		lanes_used |= BIT(mipi->data_lanes[lane] - 1);
+	}
+
+	/* Unused lanes need to be mapped as well to not have
+	 * the same lanes mapped twice.
+	 */
+	for (; lane < 4; lane++) {
+		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
+
+		val |= idx << (lane*2);
+		lanes_used |= BIT(idx);
+	}
+
+	max96717_update_bits(priv, MAX96717_MIPI_RX3,
+			     MAX96717_PHY1_LANES_MAP,
+			     FIELD_PREP(MAX96717_PHY1_LANES_MAP, val));
+
+	max96717_update_bits(priv, MAX96717_MIPI_RX2,
+			     MAX96717_PHY2_LANES_MAP,
+			     FIELD_PREP(MAX96717_PHY2_LANES_MAP, val >> 4));
+
+	return 0;
+}
+
+static int max96717_hw_init(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	u8 val;
+	int ret;
+
+	ret = max96717_read(priv, MAX96717_DEV_ID, &val);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Fail to read the device id\n");
+
+	if (val != priv->data->device_id)
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "Unsupported device id expected %x got %x\n",
+				     priv->data->device_id, val);
+
+	ret = max96717_read(priv, MAX96717_DEV_REV, &val);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Fail to read device revision");
+
+	dev_dbg(dev, "Found %x (rev %lx)\n", priv->data->device_id,
+		val & MAX96717_DEV_REV_MASK);
+
+	ret = max96717_read(priv, MAX96717_MIPI_RX_EXT11, &val);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Fail to read mipi rx extension");
+
+	if (!(val & MAX96717_TUN_MODE))
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "Only supporting tunnel mode");
+
+	return max96717_init_csi_lanes(priv);
+}
+
+static int max96717_parse_dt(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct fwnode_handle *ep_fwnode;
+	unsigned char num_data_lanes;
+	int ret;
+
+	priv->vep.bus_type = V4L2_MBUS_CSI2_DPHY;
+
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						    MAX96717_PAD_SINK, 0, 0);
+	if (!ep_fwnode)
+		return dev_err_probe(dev, -ENOENT, "no endpoint found\n");
+
+	ret = v4l2_fwnode_endpoint_parse(ep_fwnode, &priv->vep);
+
+	fwnode_handle_put(ep_fwnode);
+
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to parse sink endpoint");
+
+	num_data_lanes = priv->vep.bus.mipi_csi2.num_data_lanes;
+	if (num_data_lanes < 1 || num_data_lanes > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid data lanes should be 1 to 4\n");
+
+	return 0;
+}
+
+static int max96717_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max96717_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+
+	priv->data = of_device_get_match_data(&client->dev);
+
+	i2c_set_clientdata(client, priv);
+
+	priv->regmap = devm_regmap_init_i2c(client, &max96717_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		ret = PTR_ERR(priv->regmap);
+		return dev_err_probe(dev, ret, "Failed to init regmap\n");
+	}
+
+	ret = max96717_parse_dt(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse the dt\n");
+
+	ret = max96717_hw_init(priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize the hardware\n");
+
+	ret = max96717_gpiochip_probe(priv);
+	if (ret) {
+		dev_err(&client->dev, "Failed to init gpiochip\n");
+		return ret;
+	}
+
+	ret = max96717_register_clkout(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register clkout\n");
+
+	ret = max96717_subdev_init(priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize v4l2 subdev\n");
+
+	ret = max96717_i2c_mux_init(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add remote i2c adapter\n");
+		goto err_subdev_uninit;
+	}
+
+	return 0;
+
+err_subdev_uninit:
+	max96717_subdev_uninit(priv);
+	return ret;
+}
+
+static void max96717_remove(struct i2c_client *client)
+{
+	struct max96717_priv *priv = i2c_get_clientdata(client);
+
+	max96717_subdev_uninit(priv);
+	i2c_mux_del_adapters(priv->mux);
+}
+
+static const struct of_device_id max96717_of_ids[] = {
+	{ .compatible = "maxim,max96717f", .data = &max96717f_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max96717_of_ids);
+
+static struct i2c_driver max96717_i2c_driver = {
+	.driver	= {
+		.name		= "max96717",
+		.of_match_table	= max96717_of_ids,
+	},
+	.probe		= max96717_probe,
+	.remove		= max96717_remove,
+};
+
+module_i2c_driver(max96717_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim GMSL2 MAX96717 Serializer Driver");
+MODULE_AUTHOR("Julien Massot <julien.massot@collabora.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


