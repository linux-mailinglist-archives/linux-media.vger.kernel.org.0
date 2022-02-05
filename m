Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE404AAB3B
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 19:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381185AbiBESzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Feb 2022 13:55:05 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:36681 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381125AbiBESy4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Feb 2022 13:54:56 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2834024000B;
        Sat,  5 Feb 2022 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1644087295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yZbExE7s70QyWMm/C1lwgwbBFFIYaXrNCG+pGKP/wWs=;
        b=Byt1ItA5+bFvsIs6D1CN5abuyEA0o/drKMRFQ2Uw3hyWTMvmWw3aCnMm5XN3P0eyi3faqt
        ZyLuAPsArvxohdNToOTJl6KICXsdunQBcSbilDsGQrrQ3oJpZ0gog9oWkSznaVc4q4NX96
        paP1o0z6UjXaLzydrVt0qGLtCYJpsd6vMDp/EMsWsCBxcz0YWlJ8aLfoCx2ZMA+mbkOy1A
        Mgfcp2Dp2HNtvrVCyBZIVTjj2f7ygH9Fdf0OXHMNqFRbAOgVGodBijp9th8nikO+S08D6q
        QZaJv9A7JcOy7EMnAh8y+2eTEfA0HrKkQE/K9/HZ2NJlyAb0Thm9PjPK4MCg3Q==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 09/66] media: sunxi: Add support for the A31 MIPI CSI-2 controller
Date:   Sat,  5 Feb 2022 19:53:32 +0100
Message-Id: <20220205185429.2278860-10-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
found on Allwinner SoCs such as the A31 and V3/V3s.

It is a standalone block, connected to the CSI controller on one side
and to the MIPI D-PHY block on the other. It has a dedicated address
space, interrupt line and clock.

It is represented as a V4L2 subdev to the CSI controller and takes a
MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
media controller API.

Only 8-bit and 10-bit Bayer formats are currently supported.
While up to 4 internal channels to the CSI controller exist, only one
is currently supported by this implementation.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/platform/sunxi/Kconfig          |   1 +
 drivers/media/platform/sunxi/Makefile         |   1 +
 .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
 .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 746 ++++++++++++++++++
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |  52 ++
 .../sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h     |  82 ++
 7 files changed, 898 insertions(+)
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h

diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
index 7151cc249afa..9684e07454ad 100644
--- a/drivers/media/platform/sunxi/Kconfig
+++ b/drivers/media/platform/sunxi/Kconfig
@@ -2,3 +2,4 @@
 
 source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
 source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
+source "drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig"
diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
index fc537c9f5ca9..887a7cae8fca 100644
--- a/drivers/media/platform/sunxi/Makefile
+++ b/drivers/media/platform/sunxi/Makefile
@@ -2,5 +2,6 @@
 
 obj-y		+= sun4i-csi/
 obj-y		+= sun6i-csi/
+obj-y		+= sun6i-mipi-csi2/
 obj-y		+= sun8i-di/
 obj-y		+= sun8i-rotate/
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
new file mode 100644
index 000000000000..47f1bb0779a8
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_SUN6I_MIPI_CSI2
+	tristate "Allwinner A31 MIPI CSI-2 Controller Driver"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on PM && COMMON_CLK && VIDEO_V4L2
+	select REGMAP_MMIO
+	select PHY_SUN6I_MIPI_DPHY
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	   Support for the Allwinner A31 MIPI CSI-2 Controller.
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
new file mode 100644
index 000000000000..14e4e03818b5
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+sun6i-mipi-csi2-y += sun6i_mipi_csi2.o
+
+obj-$(CONFIG_VIDEO_SUN6I_MIPI_CSI2) += sun6i-mipi-csi2.o
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
new file mode 100644
index 000000000000..55ebb512ec21
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -0,0 +1,746 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020-2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "sun6i_mipi_csi2.h"
+#include "sun6i_mipi_csi2_reg.h"
+
+/* Format */
+
+static const struct sun6i_mipi_csi2_format sun6i_mipi_csi2_formats[] = {
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW8,
+		.bpp		= 8,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW8,
+		.bpp		= 8,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW8,
+		.bpp		= 8,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW8,
+		.bpp		= 8,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW10,
+		.bpp		= 10,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW10,
+		.bpp		= 10,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW10,
+		.bpp		= 10,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type	= MIPI_CSI2_DATA_TYPE_RAW10,
+		.bpp		= 10,
+	},
+};
+
+static const struct sun6i_mipi_csi2_format *
+sun6i_mipi_csi2_format_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_mipi_csi2_formats); i++)
+		if (sun6i_mipi_csi2_formats[i].mbus_code == mbus_code)
+			return &sun6i_mipi_csi2_formats[i];
+
+	return NULL;
+}
+
+/* Controller */
+
+static void sun6i_mipi_csi2_enable(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	struct regmap *regmap = csi2_dev->regmap;
+
+	regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
+			   SUN6I_MIPI_CSI2_CTL_EN, SUN6I_MIPI_CSI2_CTL_EN);
+}
+
+static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	struct regmap *regmap = csi2_dev->regmap;
+
+	regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
+			   SUN6I_MIPI_CSI2_CTL_EN, 0);
+}
+
+static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	struct regmap *regmap = csi2_dev->regmap;
+	unsigned int lanes_count =
+		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
+	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	const struct sun6i_mipi_csi2_format *format;
+	struct device *dev = csi2_dev->dev;
+	u32 version = 0;
+
+	format = sun6i_mipi_csi2_format_find(mbus_format->code);
+	if (WARN_ON(!format))
+		return;
+
+	/*
+	 * The enable flow in the Allwinner BSP is a bit different: the enable
+	 * and reset bits are set together before starting the CSI controller.
+	 *
+	 * In mainline we enable the CSI controller first (due to subdev logic).
+	 * One reliable way to make this work is to deassert reset, configure
+	 * registers and enable the controller when everything's ready.
+	 *
+	 * However, setting the version enable bit and removing it afterwards
+	 * appears necessary for capture to work reliably, while replacing it
+	 * with a delay doesn't do the trick.
+	 */
+	regmap_write(regmap, SUN6I_MIPI_CSI2_CTL_REG,
+		     SUN6I_MIPI_CSI2_CTL_RESET_N |
+		     SUN6I_MIPI_CSI2_CTL_VERSION_EN |
+		     SUN6I_MIPI_CSI2_CTL_UNPK_EN);
+
+	regmap_read(regmap, SUN6I_MIPI_CSI2_VERSION_REG, &version);
+
+	regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
+			   SUN6I_MIPI_CSI2_CTL_VERSION_EN, 0);
+
+	dev_dbg(dev, "A31 MIPI CSI-2 version: %04x\n", version);
+
+	regmap_write(regmap, SUN6I_MIPI_CSI2_CFG_REG,
+		     SUN6I_MIPI_CSI2_CFG_CHANNEL_MODE(1) |
+		     SUN6I_MIPI_CSI2_CFG_LANE_COUNT(lanes_count));
+
+	/*
+	 * Only a single virtual channel (index 0) is currently supported.
+	 * While the registers do mention multiple physical channels being
+	 * available (which can be configured to match a specific virtual
+	 * channel or data type), it's unclear whether channels > 0 are actually
+	 * connected and available and the reference source code only makes use
+	 * of channel 0.
+	 *
+	 * Using extra channels would also require matching channels to be
+	 * available on the CSI (and ISP) side, which is also unsure although
+	 * some CSI implementations are said to support multiple channels for
+	 * BT656 time-sharing.
+	 *
+	 * We still configure virtual channel numbers to ensure that virtual
+	 * channel 0 only goes to channel 0.
+	 */
+
+	regmap_write(regmap, SUN6I_MIPI_CSI2_VCDT_RX_REG,
+		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(3, 3) |
+		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(2, 2) |
+		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(1, 1) |
+		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(0, 0) |
+		     SUN6I_MIPI_CSI2_VCDT_RX_CH_DT(0, format->data_type));
+
+	regmap_write(regmap, SUN6I_MIPI_CSI2_CH_INT_PD_REG,
+		     SUN6I_MIPI_CSI2_CH_INT_PD_CLEAR);
+}
+
+/* V4L2 Subdev */
+
+static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
+	union phy_configure_opts dphy_opts = { 0 };
+	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
+	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	const struct sun6i_mipi_csi2_format *format;
+	struct phy *dphy = csi2_dev->dphy;
+	struct device *dev = csi2_dev->dev;
+	struct v4l2_ctrl *ctrl;
+	unsigned int lanes_count =
+		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
+	unsigned long pixel_rate;
+	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
+	int ret = 0;
+
+	if (!source_subdev)
+		return -ENODEV;
+
+	if (!on) {
+		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		goto disable;
+	}
+
+	/* Runtime PM */
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	/* Sensor Pixel Rate */
+
+	ctrl = v4l2_ctrl_find(source_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		dev_err(dev, "missing sensor pixel rate\n");
+		ret = -ENODEV;
+		goto error_pm;
+	}
+
+	pixel_rate = (unsigned long)v4l2_ctrl_g_ctrl_int64(ctrl);
+	if (!pixel_rate) {
+		dev_err(dev, "missing (zero) sensor pixel rate\n");
+		ret = -ENODEV;
+		goto error_pm;
+	}
+
+	/* D-PHY */
+
+	if (!lanes_count) {
+		dev_err(dev, "missing (zero) MIPI CSI-2 lanes count\n");
+		ret = -ENODEV;
+		goto error_pm;
+	}
+
+	format = sun6i_mipi_csi2_format_find(mbus_format->code);
+	if (WARN_ON(!format)) {
+		ret = -ENODEV;
+		goto error_pm;
+	}
+
+	phy_mipi_dphy_get_default_config(pixel_rate, format->bpp, lanes_count,
+					 dphy_cfg);
+
+	/*
+	 * Note that our hardware is using DDR, which is not taken in account by
+	 * phy_mipi_dphy_get_default_config when calculating hs_clk_rate from
+	 * the pixel rate, lanes count and bpp.
+	 *
+	 * The resulting clock rate is basically the symbol rate over the whole
+	 * link. The actual clock rate is calculated with division by two since
+	 * DDR samples both on rising and falling edges.
+	 */
+
+	dev_dbg(dev, "A31 MIPI CSI-2 config:\n");
+	dev_dbg(dev, "%ld pixels/s, %u bits/pixel, %u lanes, %lu Hz clock\n",
+		pixel_rate, format->bpp, lanes_count,
+		dphy_cfg->hs_clk_rate / 2);
+
+	ret = phy_reset(dphy);
+	if (ret) {
+		dev_err(dev, "failed to reset MIPI D-PHY\n");
+		goto error_pm;
+	}
+
+	ret = phy_configure(dphy, &dphy_opts);
+	if (ret) {
+		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		goto error_pm;
+	}
+
+	/* Controller */
+
+	sun6i_mipi_csi2_configure(csi2_dev);
+	sun6i_mipi_csi2_enable(csi2_dev);
+
+	/* D-PHY */
+
+	ret = phy_power_on(dphy);
+	if (ret) {
+		dev_err(dev, "failed to power on MIPI D-PHY\n");
+		goto error_pm;
+	}
+
+	/* Source */
+
+	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD)
+		goto disable;
+
+	return 0;
+
+disable:
+	phy_power_off(dphy);
+	sun6i_mipi_csi2_disable(csi2_dev);
+
+error_pm:
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops sun6i_mipi_csi2_video_ops = {
+	.s_stream	= sun6i_mipi_csi2_s_stream,
+};
+
+static void
+sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
+{
+	if (!sun6i_mipi_csi2_format_find(mbus_format->code))
+		mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
+
+	mbus_format->field = V4L2_FIELD_NONE;
+	mbus_format->colorspace = V4L2_COLORSPACE_RAW;
+	mbus_format->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int sun6i_mipi_csi2_init_cfg(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state)
+{
+	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
+	struct v4l2_mbus_framefmt *mbus_format =
+		v4l2_subdev_get_try_format(subdev, state, pad);
+
+	mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
+	mbus_format->width = 640;
+	mbus_format->height = 480;
+
+	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+
+	return 0;
+}
+
+static int
+sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >= ARRAY_SIZE(sun6i_mipi_csi2_formats))
+		return -EINVAL;
+
+	code_enum->code = sun6i_mipi_csi2_formats[code_enum->index].mbus_code;
+
+	return 0;
+}
+
+static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_format *format)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_format = &format->format;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
+							   format->pad);
+	else
+		*mbus_format = csi2_dev->bridge.mbus_format;
+
+	return 0;
+}
+
+static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_format *format)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_format = &format->format;
+
+	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+			*mbus_format;
+	else
+		csi2_dev->bridge.mbus_format = *mbus_format;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
+	.init_cfg	= sun6i_mipi_csi2_init_cfg,
+	.enum_mbus_code	= sun6i_mipi_csi2_enum_mbus_code,
+	.get_fmt	= sun6i_mipi_csi2_get_fmt,
+	.set_fmt	= sun6i_mipi_csi2_set_fmt,
+};
+
+static const struct v4l2_subdev_ops sun6i_mipi_csi2_subdev_ops = {
+	.video	= &sun6i_mipi_csi2_video_ops,
+	.pad	= &sun6i_mipi_csi2_pad_ops,
+};
+
+/* Media Entity */
+
+static const struct media_entity_operations sun6i_mipi_csi2_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+};
+
+/* V4L2 Async */
+
+static int
+sun6i_mipi_csi2_notifier_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *remote_subdev,
+			       struct v4l2_async_subdev *async_subdev)
+{
+	struct v4l2_subdev *subdev = notifier->sd;
+	struct sun6i_mipi_csi2_device *csi2_dev =
+		container_of(notifier, struct sun6i_mipi_csi2_device,
+			     bridge.notifier);
+	struct media_entity *sink_entity = &subdev->entity;
+	struct media_entity *source_entity = &remote_subdev->entity;
+	struct device *dev = csi2_dev->dev;
+	int sink_pad_index = 0;
+	int source_pad_index;
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(source_entity, remote_subdev->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(dev, "missing source pad in external entity %s\n",
+			source_entity->name);
+		return -EINVAL;
+	}
+
+	source_pad_index = ret;
+
+	dev_dbg(dev, "creating %s:%u -> %s:%u link\n", source_entity->name,
+		source_pad_index, sink_entity->name, sink_pad_index);
+
+	ret = media_create_pad_link(source_entity, source_pad_index,
+				    sink_entity, sink_pad_index,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(dev, "failed to create %s:%u -> %s:%u link\n",
+			source_entity->name, source_pad_index,
+			sink_entity->name, sink_pad_index);
+		return ret;
+	}
+
+	csi2_dev->bridge.source_subdev = remote_subdev;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations
+sun6i_mipi_csi2_notifier_ops = {
+	.bound	= sun6i_mipi_csi2_notifier_bound,
+};
+
+/* Bridge */
+
+static int
+sun6i_mipi_csi2_bridge_source_setup(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	struct v4l2_async_notifier *notifier = &csi2_dev->bridge.notifier;
+	struct v4l2_fwnode_endpoint *endpoint = &csi2_dev->bridge.endpoint;
+	struct v4l2_async_subdev *subdev_async;
+	struct fwnode_handle *handle;
+	struct device *dev = csi2_dev->dev;
+	int ret;
+
+	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						 FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!handle)
+		return -ENODEV;
+
+	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
+
+	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	if (ret)
+		goto complete;
+
+	subdev_async = v4l2_async_nf_add_fwnode_remote(notifier, handle,
+		struct v4l2_async_subdev);
+	if (IS_ERR(subdev_async))
+		ret = PTR_ERR(subdev_async);
+
+complete:
+	fwnode_handle_put(handle);
+
+	return ret;
+}
+
+static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	struct v4l2_subdev *subdev = &csi2_dev->bridge.subdev;
+	struct v4l2_async_notifier *notifier = &csi2_dev->bridge.notifier;
+	struct media_pad *pads = csi2_dev->bridge.pads;
+	struct device *dev = csi2_dev->dev;
+	int ret;
+
+	/* V4L2 Subdev */
+
+	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
+	strscpy(subdev->name, SUN6I_MIPI_CSI2_NAME, sizeof(subdev->name));
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	subdev->owner = THIS_MODULE;
+	subdev->dev = dev;
+
+	v4l2_set_subdevdata(subdev, csi2_dev);
+
+	/* Media Entity */
+
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &sun6i_mipi_csi2_entity_ops;
+
+	/* Media Pads */
+
+	pads[SUN6I_MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[SUN6I_MIPI_CSI2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&subdev->entity, SUN6I_MIPI_CSI2_PAD_COUNT,
+				     pads);
+	if (ret)
+		return ret;
+
+	/* V4L2 Async */
+
+	v4l2_async_nf_init(notifier);
+	notifier->ops = &sun6i_mipi_csi2_notifier_ops;
+
+	ret = sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
+	if (ret)
+		goto error_v4l2_notifier_cleanup;
+
+	ret = v4l2_async_subdev_nf_register(subdev, notifier);
+	if (ret < 0)
+		goto error_v4l2_notifier_cleanup;
+
+	/* V4L2 Subdev */
+
+	ret = v4l2_async_register_subdev(subdev);
+	if (ret < 0)
+		goto error_v4l2_notifier_unregister;
+
+	return 0;
+
+error_v4l2_notifier_unregister:
+	v4l2_async_nf_unregister(notifier);
+
+error_v4l2_notifier_cleanup:
+	v4l2_async_nf_cleanup(notifier);
+
+	media_entity_cleanup(&subdev->entity);
+
+	return ret;
+}
+
+static void
+sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	struct v4l2_subdev *subdev = &csi2_dev->bridge.subdev;
+	struct v4l2_async_notifier *notifier = &csi2_dev->bridge.notifier;
+
+	v4l2_async_unregister_subdev(subdev);
+	v4l2_async_nf_unregister(notifier);
+	v4l2_async_nf_cleanup(notifier);
+	media_entity_cleanup(&subdev->entity);
+}
+
+/* Platform */
+
+static int sun6i_mipi_csi2_suspend(struct device *dev)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(csi2_dev->clk_mod);
+	clk_disable_unprepare(csi2_dev->clk_bus);
+	reset_control_assert(csi2_dev->reset);
+
+	return 0;
+}
+
+static int sun6i_mipi_csi2_resume(struct device *dev)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(csi2_dev->reset);
+	if (ret) {
+		dev_err(dev, "failed to deassert reset\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(csi2_dev->clk_bus);
+	if (ret) {
+		dev_err(dev, "failed to enable bus clock\n");
+		goto error_reset;
+	}
+
+	ret = clk_prepare_enable(csi2_dev->clk_mod);
+	if (ret) {
+		dev_err(dev, "failed to enable module clock\n");
+		goto error_clk_bus;
+	}
+
+	return 0;
+
+error_clk_bus:
+	clk_disable_unprepare(csi2_dev->clk_bus);
+
+error_reset:
+	reset_control_assert(csi2_dev->reset);
+
+	return ret;
+}
+
+static const struct dev_pm_ops sun6i_mipi_csi2_pm_ops = {
+	SET_RUNTIME_PM_OPS(sun6i_mipi_csi2_suspend, sun6i_mipi_csi2_resume,
+			   NULL)
+};
+
+static const struct regmap_config sun6i_mipi_csi2_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register	= 0x400,
+};
+
+static int
+sun6i_mipi_csi2_resources_setup(struct sun6i_mipi_csi2_device *csi2_dev,
+				struct platform_device *platform_dev)
+{
+	struct device *dev = csi2_dev->dev;
+	struct resource *res;
+	void __iomem *io_base;
+	int ret;
+
+	/* Registers */
+
+	res = platform_get_resource(platform_dev, IORESOURCE_MEM, 0);
+	io_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
+
+	csi2_dev->regmap = devm_regmap_init_mmio(dev, io_base,
+						 &sun6i_mipi_csi2_regmap_config);
+	if (IS_ERR(csi2_dev->regmap)) {
+		dev_err(dev, "failed to init register map\n");
+		return PTR_ERR(csi2_dev->regmap);
+	}
+
+	/* Clocks */
+
+	csi2_dev->clk_bus = devm_clk_get(dev, "bus");
+	if (IS_ERR(csi2_dev->clk_bus)) {
+		dev_err(dev, "failed to acquire bus clock\n");
+		return PTR_ERR(csi2_dev->clk_bus);
+	}
+
+	csi2_dev->clk_mod = devm_clk_get(dev, "mod");
+	if (IS_ERR(csi2_dev->clk_mod)) {
+		dev_err(dev, "failed to acquire mod clock\n");
+		return PTR_ERR(csi2_dev->clk_mod);
+	}
+
+	ret = clk_set_rate_exclusive(csi2_dev->clk_mod, 297000000);
+	if (ret) {
+		dev_err(dev, "failed to set mod clock rate\n");
+		return ret;
+	}
+
+	/* Reset */
+
+	csi2_dev->reset = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(csi2_dev->reset)) {
+		dev_err(dev, "failed to get reset controller\n");
+		return PTR_ERR(csi2_dev->reset);
+	}
+
+	/* D-PHY */
+
+	csi2_dev->dphy = devm_phy_get(dev, "dphy");
+	if (IS_ERR(csi2_dev->dphy)) {
+		dev_err(dev, "failed to get MIPI D-PHY\n");
+		return PTR_ERR(csi2_dev->dphy);
+	}
+
+	ret = phy_init(csi2_dev->dphy);
+	if (ret) {
+		dev_err(dev, "failed to initialize MIPI D-PHY\n");
+		return ret;
+	}
+
+	/* Runtime PM */
+
+	pm_runtime_enable(dev);
+	pm_runtime_set_suspended(dev);
+
+	return 0;
+}
+
+static void
+sun6i_mipi_csi2_resources_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
+{
+	pm_runtime_disable(csi2_dev->dev);
+	phy_exit(csi2_dev->dphy);
+	clk_rate_exclusive_put(csi2_dev->clk_mod);
+}
+
+static int sun6i_mipi_csi2_probe(struct platform_device *platform_dev)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev;
+	struct device *dev = &platform_dev->dev;
+	int ret;
+
+	csi2_dev = devm_kzalloc(dev, sizeof(*csi2_dev), GFP_KERNEL);
+	if (!csi2_dev)
+		return -ENOMEM;
+
+	csi2_dev->dev = dev;
+	platform_set_drvdata(platform_dev, csi2_dev);
+
+	ret = sun6i_mipi_csi2_resources_setup(csi2_dev, platform_dev);
+	if (ret)
+		return ret;
+
+	ret = sun6i_mipi_csi2_bridge_setup(csi2_dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int sun6i_mipi_csi2_remove(struct platform_device *platform_dev)
+{
+	struct sun6i_mipi_csi2_device *csi2_dev =
+		platform_get_drvdata(platform_dev);
+
+	sun6i_mipi_csi2_bridge_cleanup(csi2_dev);
+	sun6i_mipi_csi2_resources_cleanup(csi2_dev);
+
+	return 0;
+}
+
+static const struct of_device_id sun6i_mipi_csi2_of_match[] = {
+	{ .compatible = "allwinner,sun6i-a31-mipi-csi2" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sun6i_mipi_csi2_of_match);
+
+static struct platform_driver sun6i_mipi_csi2_platform_driver = {
+	.probe = sun6i_mipi_csi2_probe,
+	.remove = sun6i_mipi_csi2_remove,
+	.driver = {
+		.name = SUN6I_MIPI_CSI2_NAME,
+		.of_match_table = of_match_ptr(sun6i_mipi_csi2_of_match),
+		.pm = &sun6i_mipi_csi2_pm_ops,
+	},
+};
+module_platform_driver(sun6i_mipi_csi2_platform_driver);
+
+MODULE_DESCRIPTION("Allwinner A31 MIPI CSI-2 Controller Driver");
+MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
new file mode 100644
index 000000000000..25a8a0d0dfad
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020-2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_MIPI_CSI2_H_
+#define _SUN6I_MIPI_CSI2_H_
+
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define SUN6I_MIPI_CSI2_NAME	"sun6i-mipi-csi2"
+
+enum sun6i_mipi_csi2_pad {
+	SUN6I_MIPI_CSI2_PAD_SINK	= 0,
+	SUN6I_MIPI_CSI2_PAD_SOURCE	= 1,
+	SUN6I_MIPI_CSI2_PAD_COUNT	= 2,
+};
+
+struct sun6i_mipi_csi2_format {
+	u32	mbus_code;
+	u8	data_type;
+	u32	bpp;
+};
+
+struct sun6i_mipi_csi2_bridge {
+	struct v4l2_subdev		subdev;
+	struct media_pad		pads[SUN6I_MIPI_CSI2_PAD_COUNT];
+	struct v4l2_fwnode_endpoint	endpoint;
+	struct v4l2_async_notifier	notifier;
+	struct v4l2_mbus_framefmt	mbus_format;
+
+	struct v4l2_subdev		*source_subdev;
+};
+
+struct sun6i_mipi_csi2_device {
+	struct device			*dev;
+
+	struct regmap			*regmap;
+	struct clk			*clk_bus;
+	struct clk			*clk_mod;
+	struct reset_control		*reset;
+	struct phy			*dphy;
+
+	struct sun6i_mipi_csi2_bridge	bridge;
+};
+
+#endif
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h
new file mode 100644
index 000000000000..aafda934f5ef
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020-2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_MIPI_CSI2_REG_H_
+#define _SUN6I_MIPI_CSI2_REG_H_
+
+#define SUN6I_MIPI_CSI2_CTL_REG				0x0
+#define SUN6I_MIPI_CSI2_CTL_RESET_N			BIT(31)
+#define SUN6I_MIPI_CSI2_CTL_VERSION_EN			BIT(30)
+#define SUN6I_MIPI_CSI2_CTL_UNPK_EN			BIT(1)
+#define SUN6I_MIPI_CSI2_CTL_EN				BIT(0)
+
+#define SUN6I_MIPI_CSI2_CFG_REG				0x4
+#define SUN6I_MIPI_CSI2_CFG_CHANNEL_MODE(v)		((((v) - 1) << 8) & \
+							 GENMASK(9, 8))
+#define SUN6I_MIPI_CSI2_CFG_LANE_COUNT(v)		(((v) - 1) & GENMASK(1, 0))
+
+#define SUN6I_MIPI_CSI2_VCDT_RX_REG			0x8
+#define SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(ch, vc)		(((vc) & GENMASK(1, 0)) << \
+							 ((ch) * 8 + 6))
+#define SUN6I_MIPI_CSI2_VCDT_RX_CH_DT(ch, t)		(((t) & GENMASK(5, 0)) << \
+							 ((ch) * 8))
+#define SUN6I_MIPI_CSI2_RX_PKT_NUM_REG			0xc
+
+#define SUN6I_MIPI_CSI2_VERSION_REG			0x3c
+
+#define SUN6I_MIPI_CSI2_CH_CFG_REG			0x40
+#define SUN6I_MIPI_CSI2_CH_INT_EN_REG			0x50
+#define SUN6I_MIPI_CSI2_CH_INT_EN_EOT_ERR		BIT(29)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_CHKSUM_ERR		BIT(28)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_ECC_WRN		BIT(27)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_ECC_ERR		BIT(26)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_LINE_SYNC_ERR		BIT(25)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_FRAME_SYNC_ERR	BIT(24)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_EMB_DATA		BIT(18)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_PF			BIT(17)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_PH_UPDATE		BIT(16)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_LINE_START_SYNC	BIT(11)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_LINE_END_SYNC		BIT(10)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_FRAME_START_SYNC	BIT(9)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_FRAME_END_SYNC	BIT(8)
+#define SUN6I_MIPI_CSI2_CH_INT_EN_FIFO_OVER		BIT(0)
+
+#define SUN6I_MIPI_CSI2_CH_INT_PD_REG			0x58
+#define SUN6I_MIPI_CSI2_CH_INT_PD_CLEAR			0xff
+#define SUN6I_MIPI_CSI2_CH_INT_PD_EOT_ERR		BIT(29)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_CHKSUM_ERR		BIT(28)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_ECC_WRN		BIT(27)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_ECC_ERR		BIT(26)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_LINE_SYNC_ERR		BIT(25)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_FRAME_SYNC_ERR	BIT(24)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_EMB_DATA		BIT(18)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_PF			BIT(17)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_PH_UPDATE		BIT(16)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_LINE_START_SYNC	BIT(11)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_LINE_END_SYNC		BIT(10)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_FRAME_START_SYNC	BIT(9)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_FRAME_END_SYNC	BIT(8)
+#define SUN6I_MIPI_CSI2_CH_INT_PD_FIFO_OVER		BIT(0)
+
+#define SUN6I_MIPI_CSI2_CH_DT_TRIGGER_REG		0x60
+#define SUN6I_MIPI_CSI2_CH_CUR_PH_REG			0x70
+#define SUN6I_MIPI_CSI2_CH_ECC_REG			0x74
+#define SUN6I_MIPI_CSI2_CH_CKS_REG			0x78
+#define SUN6I_MIPI_CSI2_CH_FRAME_NUM_REG		0x7c
+#define SUN6I_MIPI_CSI2_CH_LINE_NUM_REG			0x80
+
+#define SUN6I_MIPI_CSI2_CH_OFFSET			0x100
+
+#define SUN6I_MIPI_CSI2_CH_REG(reg, ch) \
+	(SUN6I_MIPI_CSI2_CH_OFFSET * (ch) + (reg))
+
+enum mipi_csi2_data_type {
+	MIPI_CSI2_DATA_TYPE_RAW8	= 0x2a,
+	MIPI_CSI2_DATA_TYPE_RAW10	= 0x2b,
+	MIPI_CSI2_DATA_TYPE_RAW12	= 0x2c,
+};
+
+#endif
-- 
2.34.1

