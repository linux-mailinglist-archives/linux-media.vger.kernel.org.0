Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F816407146
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 20:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhIJSoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 14:44:03 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:33733 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbhIJSnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 14:43:53 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id CB574240002;
        Fri, 10 Sep 2021 18:42:38 +0000 (UTC)
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
Subject: [PATCH 16/22] media: sunxi: Introduce a rewritten sun6i-csi driver
Date:   Fri, 10 Sep 2021 20:41:41 +0200
Message-Id: <20210910184147.336618-17-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While adapting the sun6i-csi driver for MIPI CSI-2 support was
possible, it became clear that adding support for the ISP required
very heavy changes to the driver which were quite hard to break down
into a series of subsequent changes.

The first major difficulty comes from the lack of v4l2 subdev that
acts a bridge, separate from the video node representing the DMA
engine. To support the ISP, only parts of the hardware must be
configured (excluding aspects related to the DMA output), which made
the separation a hard requirement.

Another significant difficulty was the specific dance that is required
to have both the ISP and CSI device be part of the same media device.
Because the ISP and CSI are two different hardware blocks, they have
two distinct drivers that will each try to register their own v4l2
and media devices, resulting in two distinct pipelines. When the ISP
is in use, we actually want the CSI driver to register with the ISP's
v4l2 and media devices while keeping the ability to register its own
when the ISP is not in use. This is done by:
1. Having the CSI driver check whether the ISP is available, using
   sun6i_csi_isp_detect();
2. If not, it can register when its own async subdevs are ready, using
   sun6i_csi_v4l2_complete();
3. If so, it will register its bridge as an async subdev which will
   be picked-up by the ISP driver (from the fwnode graph link);
4. When the subdev becomes bound to the ISP's v4l2 device, we can
   then access that device (and the associated media device) to
   complete registration of the capture video node, using
   sun6i_csi_isp_complete();

Besides the logic rework, other issues were identified and resolved:
- The sync mechanism for buffer flipping was based on the frame done
  interrupt, which is too late (next frame is already being processed).
  This lead to requiring 3 buffers to start and writing two addresses
  when starting. Using vsync as a sync point seems to be the correct
  approach and allows using only two buffers without tearing;
- Using devm_regmap_init_mmio_clk was incorrect since the reset also
  comes into play;
- Some register definitions were inverted compared to their actual
  effect (which was inherited from the Allwinner documentation and
  code): comments were added where relevant;
- The deprecated v4l2_async_notifier_parse_fwnode_endpoints() helper
  is no longer used by the driver;

Compared to the previous driver, various cosmetic differences can be
noted, especially to the register descriptions.

Note that the logic for parallel interface support was reproduced
from the original driver but only a simple parallel case could
be tested. MIPI CSI-2 on the other hand was thoroughly tested.

Finally it appears that using the ISP will flip an internal switch
in the hardware that makes the CSI DMA engine unavailable until the
next reboot. No solution for this issue is known at this point and
it was confirmed by Allwinner that there is no software way to flip
the switch back. It is unclear whether this can be detected from
the CSI driver itself, in order to return or print an error.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../media/platform/sunxi/sun6i-csi/Kconfig    |   12 +
 .../media/platform/sunxi/sun6i-csi/Makefile   |    4 +
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  463 +++++++
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |   61 +
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  895 ++++++++++++++
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   64 +
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 1094 +++++++++++++++++
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   73 ++
 .../platform/sunxi/sun6i-csi/sun6i_csi_reg.h  |  182 +++
 9 files changed, 2848 insertions(+)
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h

diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
new file mode 100644
index 000000000000..586e3fb3a80d
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_SUN6I_CSI
+	tristate "Allwinner V3s Camera Sensor Interface driver"
+	depends on VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
+	depends on ARCH_SUNXI || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	select V4L2_FWNODE
+	help
+	   Support for the Allwinner Camera Sensor Interface Controller on V3s.
diff --git a/drivers/media/platform/sunxi/sun6i-csi/Makefile b/drivers/media/platform/sunxi/sun6i-csi/Makefile
new file mode 100644
index 000000000000..87e7a715140a
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+sun6i-csi-y += sun6i_csi.o sun6i_csi_bridge.o sun6i_csi_capture.o
+
+obj-$(CONFIG_VIDEO_SUN6I_CSI) += sun6i-csi.o
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
new file mode 100644
index 000000000000..f99846762abf
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2011-2018 Magewell Electronics Co., Ltd. (Nanjing)
+ * Author: Yong Deng <yong.deng@magewell.com>
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mc.h>
+
+#include "sun6i_csi.h"
+#include "sun6i_csi_bridge.h"
+#include "sun6i_csi_capture.h"
+#include "sun6i_csi_reg.h"
+
+/* ISP */
+
+int sun6i_csi_isp_complete(struct sun6i_csi_device *csi_dev,
+			   struct v4l2_device *v4l2_dev)
+{
+	if (csi_dev->v4l2_dev && csi_dev->v4l2_dev != v4l2_dev)
+		return -EINVAL;
+
+	csi_dev->v4l2_dev = v4l2_dev;
+	csi_dev->media_dev = v4l2_dev->mdev;
+
+	return sun6i_csi_capture_setup(csi_dev);
+}
+
+static bool sun6i_csi_isp_detect(struct sun6i_csi_device *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+	struct fwnode_handle *handle = NULL;
+
+	/* ISP is not available if disabled in kernel config. */
+	if (!IS_ENABLED(CONFIG_VIDEO_SUN6I_ISP))
+		return 0;
+
+	/*
+	 * ISP is not available if not connected via fwnode graph.
+	 * This weill also check that the remote parent node is available.
+	 */
+	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+						 SUN6I_CSI_PORT_ISP, 0,
+						 FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!handle)
+		return 0;
+
+	fwnode_handle_put(handle);
+
+	dev_info(dev, "ISP link is available\n");
+	csi_dev->isp_available = true;
+
+	return 0;
+}
+
+/* Media */
+
+static const struct media_device_ops sun6i_csi_media_ops = {
+	.link_notify = v4l2_pipeline_link_notify,
+};
+
+/* V4L2 */
+
+int sun6i_csi_v4l2_complete(struct sun6i_csi_device *csi_dev)
+{
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	int ret;
+
+	ret = v4l2_device_register_subdev_nodes(v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = sun6i_csi_capture_setup(csi_dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
+	struct device *dev = csi_dev->dev;
+	struct v4l2_device *v4l2_dev = &v4l2->v4l2_dev;
+	struct v4l2_ctrl_handler *ctrl_handler = &v4l2->ctrl_handler;
+	struct media_device *media_dev = &v4l2->media_dev;
+	int ret;
+
+	/* Media Device */
+
+	media_dev->dev = dev;
+
+	strscpy(media_dev->model, SUN6I_CSI_DESCRIPTION,
+		sizeof(media_dev->model));
+	media_dev->ops = &sun6i_csi_media_ops;
+	media_dev->hw_revision = 0;
+	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
+		 "platform:%s", dev_name(dev));
+
+	media_device_init(media_dev);
+
+	ret = media_device_register(media_dev);
+	if (ret) {
+		dev_err(dev, "failed to register media device: %d\n", ret);
+		goto error_media;
+	}
+
+	/* V4L2 Control Handler */
+
+	ret = v4l2_ctrl_handler_init(ctrl_handler, 0);
+	if (ret) {
+		dev_err(dev, "failed to init v4l2 control handler: %d\n", ret);
+		goto error_media;
+	}
+
+	/* V4L2 Device */
+
+	v4l2_dev->mdev = media_dev;
+	v4l2_dev->ctrl_handler = ctrl_handler;
+
+	ret = v4l2_device_register(dev, v4l2_dev);
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 device: %d\n", ret);
+		goto error_v4l2_ctrl;
+	}
+
+	csi_dev->v4l2_dev = v4l2_dev;
+	csi_dev->media_dev = media_dev;
+
+	return 0;
+
+error_v4l2_ctrl:
+	v4l2_ctrl_handler_free(ctrl_handler);
+
+error_media:
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+static void sun6i_csi_v4l2_cleanup(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_v4l2 *v4l2 = &csi_dev->v4l2;
+	struct v4l2_device *v4l2_dev = &v4l2->v4l2_dev;
+	struct v4l2_ctrl_handler *ctrl_handler = &v4l2->ctrl_handler;
+	struct media_device *media_dev = &v4l2->media_dev;
+
+	v4l2_device_unregister(v4l2_dev);
+	v4l2_ctrl_handler_free(ctrl_handler);
+
+	media_device_unregister(media_dev);
+	media_device_cleanup(media_dev);
+}
+
+/* Platform */
+
+static irqreturn_t sun6i_csi_isr(int irq, void *private)
+{
+	struct sun6i_csi_device *csi_dev = private;
+	bool capture_streaming = csi_dev->capture.state.streaming;
+	struct regmap *regmap = csi_dev->regmap;
+	u32 status = 0, enable = 0;
+
+	regmap_read(regmap, SUN6I_CSI_CH_INT_STA_REG, &status);
+	regmap_read(regmap, SUN6I_CSI_CH_INT_EN_REG, &enable);
+
+	if (!status)
+		return IRQ_NONE;
+	else if (!(status & enable) || !capture_streaming)
+		goto complete;
+
+	if ((status & SUN6I_CSI_CH_INT_STA_FIFO0_OF) ||
+	    (status & SUN6I_CSI_CH_INT_STA_FIFO1_OF) ||
+	    (status & SUN6I_CSI_CH_INT_STA_FIFO2_OF) ||
+	    (status & SUN6I_CSI_CH_INT_STA_HB_OF)) {
+		regmap_write(regmap, SUN6I_CSI_CH_INT_STA_REG, status);
+
+		regmap_update_bits(regmap, SUN6I_CSI_EN_REG,
+				   SUN6I_CSI_EN_CSI_EN, 0);
+		regmap_update_bits(regmap, SUN6I_CSI_EN_REG,
+				   SUN6I_CSI_EN_CSI_EN, SUN6I_CSI_EN_CSI_EN);
+		return IRQ_HANDLED;
+	}
+
+	if (status & SUN6I_CSI_CH_INT_STA_FD)
+		sun6i_csi_capture_frame_done(csi_dev);
+
+	if (status & SUN6I_CSI_CH_INT_STA_VS)
+		sun6i_csi_capture_sync(csi_dev);
+
+complete:
+	regmap_write(regmap, SUN6I_CSI_CH_INT_STA_REG, status);
+
+	return IRQ_HANDLED;
+}
+
+static int sun6i_csi_suspend(struct device *dev)
+{
+	struct sun6i_csi_device *csi_dev = dev_get_drvdata(dev);
+
+	reset_control_assert(csi_dev->reset);
+	clk_disable_unprepare(csi_dev->clk_ram);
+	clk_disable_unprepare(csi_dev->clk_mod);
+	clk_disable_unprepare(csi_dev->clk_bus);
+
+	return 0;
+}
+
+static int sun6i_csi_resume(struct device *dev)
+{
+	struct sun6i_csi_device *csi_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(csi_dev->reset);
+	if (ret) {
+		dev_err(dev, "failed to deassert reset\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(csi_dev->clk_bus);
+	if (ret) {
+		dev_err(dev, "failed to enable bus clock\n");
+		goto error_reset;
+	}
+
+	ret = clk_prepare_enable(csi_dev->clk_mod);
+	if (ret) {
+		dev_err(dev, "failed to enable module clock\n");
+		goto error_clk_bus;
+	}
+
+	ret = clk_prepare_enable(csi_dev->clk_ram);
+	if (ret) {
+		dev_err(dev, "failed to enable ram clock\n");
+		goto error_clk_mod;
+	}
+
+	return 0;
+
+error_clk_mod:
+	clk_disable_unprepare(csi_dev->clk_mod);
+
+error_clk_bus:
+	clk_disable_unprepare(csi_dev->clk_bus);
+
+error_reset:
+	reset_control_assert(csi_dev->reset);
+
+	return ret;
+}
+
+static const struct dev_pm_ops sun6i_csi_pm_ops = {
+	SET_RUNTIME_PM_OPS(sun6i_csi_suspend, sun6i_csi_resume, NULL)
+};
+
+static const struct regmap_config sun6i_csi_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register	= 0x9c,
+};
+
+static int sun6i_csi_resources_setup(struct sun6i_csi_device *csi_dev,
+				     struct platform_device *platform_dev)
+{
+	struct device *dev = csi_dev->dev;
+	struct resource *res;
+	unsigned long clk_mod_rate;
+	void __iomem *io_base;
+	int irq;
+	int ret;
+
+	/* Registers */
+
+	res = platform_get_resource(platform_dev, IORESOURCE_MEM, 0);
+	io_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(io_base))
+		return PTR_ERR(io_base);
+
+	csi_dev->regmap = devm_regmap_init_mmio(dev, io_base,
+						&sun6i_csi_regmap_config);
+	if (IS_ERR(csi_dev->regmap)) {
+		dev_err(dev, "failed to init register map\n");
+		return PTR_ERR(csi_dev->regmap);
+	}
+
+	/* Clocks */
+
+	csi_dev->clk_bus = devm_clk_get(dev, "bus");
+	if (IS_ERR(csi_dev->clk_bus)) {
+		dev_err(dev, "failed to acquire bus clock\n");
+		return PTR_ERR(csi_dev->clk_bus);
+	}
+
+	csi_dev->clk_mod = devm_clk_get(dev, "mod");
+	if (IS_ERR(csi_dev->clk_mod)) {
+		dev_err(dev, "failed to acquire module clock\n");
+		return PTR_ERR(csi_dev->clk_mod);
+	}
+
+	csi_dev->clk_ram = devm_clk_get(dev, "ram");
+	if (IS_ERR(csi_dev->clk_ram)) {
+		dev_err(dev, "failed to acquire ram clock\n");
+		return PTR_ERR(csi_dev->clk_ram);
+	}
+
+	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-csi"))
+		clk_mod_rate = 300000000;
+	else
+		clk_mod_rate = 297000000;
+
+	ret = clk_set_rate_exclusive(csi_dev->clk_mod, clk_mod_rate);
+	if (ret) {
+		dev_err(dev, "failed to set mod clock rate\n");
+		return ret;
+	}
+
+	/* Reset */
+
+	csi_dev->reset = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(csi_dev->reset)) {
+		dev_err(dev, "failed to acquire reset\n");
+		ret = PTR_ERR(csi_dev->reset);
+		goto error_clk_rate_exclusive;
+	}
+
+	/* Interrupt */
+
+	irq = platform_get_irq(platform_dev, 0);
+	if (irq < 0) {
+		dev_err(dev, "failed to get interrupt\n");
+		ret = -ENXIO;
+		goto error_clk_rate_exclusive;
+	}
+
+	ret = devm_request_irq(dev, irq, sun6i_csi_isr, IRQF_SHARED,
+			       SUN6I_CSI_NAME, csi_dev);
+	if (ret) {
+		dev_err(dev, "failed to request interrupt\n");
+		goto error_clk_rate_exclusive;
+	}
+
+	/* Runtime PM */
+
+	pm_runtime_enable(dev);
+	pm_runtime_set_suspended(dev);
+
+	return 0;
+
+error_clk_rate_exclusive:
+	clk_rate_exclusive_put(csi_dev->clk_mod);
+
+	return ret;
+}
+
+static void sun6i_csi_resources_cleanup(struct sun6i_csi_device *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+
+	pm_runtime_disable(dev);
+	clk_rate_exclusive_put(csi_dev->clk_mod);
+}
+
+static int sun6i_csi_probe(struct platform_device *platform_dev)
+{
+	struct sun6i_csi_device *csi_dev;
+	struct device *dev = &platform_dev->dev;
+	int ret;
+
+	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
+	if (!csi_dev)
+		return -ENOMEM;
+
+	csi_dev->dev = dev;
+	platform_set_drvdata(platform_dev, csi_dev);
+
+	ret = sun6i_csi_resources_setup(csi_dev, platform_dev);
+	if (ret)
+		return ret;
+
+	ret = sun6i_csi_isp_detect(csi_dev);
+	if (ret)
+		goto error_resources;
+
+	/*
+	 * Register our own v4l2 and media devices when there is no ISP around.
+	 * Otherwise the ISP will use async subdev registration with our bridge,
+	 * which will provide v4l2 and media devices that are used to register
+	 * the video interface.
+	 */
+	if (!csi_dev->isp_available) {
+		ret = sun6i_csi_v4l2_setup(csi_dev);
+		if (ret)
+			goto error_resources;
+	}
+
+	ret = sun6i_csi_bridge_setup(csi_dev);
+	if (ret)
+		goto error_v4l2;
+
+	return 0;
+
+error_v4l2:
+	if (!csi_dev->isp_available)
+		sun6i_csi_v4l2_cleanup(csi_dev);
+
+error_resources:
+	sun6i_csi_resources_cleanup(csi_dev);
+
+	return ret;
+}
+
+static int sun6i_csi_remove(struct platform_device *platform_dev)
+{
+	struct sun6i_csi_device *csi_dev = platform_get_drvdata(platform_dev);
+
+	sun6i_csi_bridge_cleanup(csi_dev);
+	sun6i_csi_capture_cleanup(csi_dev);
+
+	if (!csi_dev->isp_available)
+		sun6i_csi_v4l2_cleanup(csi_dev);
+
+	return 0;
+}
+
+static const struct of_device_id sun6i_csi_of_match[] = {
+	{ .compatible = "allwinner,sun6i-a31-csi", },
+	{ .compatible = "allwinner,sun8i-a83t-csi", },
+	{ .compatible = "allwinner,sun8i-h3-csi", },
+	{ .compatible = "allwinner,sun8i-v3s-csi", },
+	{ .compatible = "allwinner,sun50i-a64-csi", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sun6i_csi_of_match);
+
+static struct platform_driver sun6i_csi_platform_driver = {
+	.probe = sun6i_csi_probe,
+	.remove = sun6i_csi_remove,
+	.driver = {
+		.name = SUN6I_CSI_NAME,
+		.of_match_table = of_match_ptr(sun6i_csi_of_match),
+		.pm = &sun6i_csi_pm_ops,
+	},
+};
+module_platform_driver(sun6i_csi_platform_driver);
+
+MODULE_DESCRIPTION("Allwinner A31 Camera Sensor Interface driver");
+MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
+MODULE_AUTHOR("Yong Deng <yong.deng@magewell.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
new file mode 100644
index 000000000000..74f7ba63c598
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_CSI_H_
+#define _SUN6I_CSI_H_
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "sun6i_csi_bridge.h"
+#include "sun6i_csi_capture.h"
+
+#define SUN6I_CSI_NAME		"sun6i-csi"
+#define SUN6I_CSI_DESCRIPTION	"Allwinner A31 Video Capture"
+
+enum sun6i_csi_port {
+	SUN6I_CSI_PORT_PARALLEL		= 0,
+	SUN6I_CSI_PORT_MIPI_CSI2	= 1,
+	SUN6I_CSI_PORT_ISP		= 2,
+};
+
+struct sun6i_csi_buffer {
+	struct vb2_v4l2_buffer	v4l2_buffer;
+	struct list_head	list;
+};
+
+struct sun6i_csi_v4l2 {
+	struct v4l2_device		v4l2_dev;
+	struct v4l2_ctrl_handler	ctrl_handler;
+	struct media_device		media_dev;
+};
+
+struct sun6i_csi_device {
+	struct device			*dev;
+	struct v4l2_device		*v4l2_dev;
+	struct media_device		*media_dev;
+
+	struct clk			*clk_bus;
+	struct clk			*clk_mod;
+	struct clk			*clk_ram;
+	struct regmap			*regmap;
+	struct reset_control		*reset;
+
+	int				planar_offset[3];
+
+	bool				isp_available;
+
+	struct sun6i_csi_v4l2		v4l2;
+	struct sun6i_csi_bridge		bridge;
+	struct sun6i_csi_capture	capture;
+};
+
+int sun6i_csi_isp_complete(struct sun6i_csi_device *csi_dev,
+			   struct v4l2_device *v4l2_dev);
+int sun6i_csi_v4l2_complete(struct sun6i_csi_device *csi_dev);
+
+#endif
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
new file mode 100644
index 000000000000..7c63696d7fef
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -0,0 +1,895 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2011-2018 Magewell Electronics Co., Ltd. (Nanjing)
+ * Author: Yong Deng <yong.deng@magewell.com>
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "sun6i_csi.h"
+#include "sun6i_csi_bridge.h"
+#include "sun6i_csi_capture.h"
+#include "sun6i_csi_reg.h"
+
+/* Helpers */
+
+void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
+				 unsigned int *width, unsigned int *height)
+{
+	if (width)
+		*width = csi_dev->bridge.mbus_format.width;
+	if (height)
+		*height = csi_dev->bridge.mbus_format.height;
+}
+
+void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
+			     u32 *mbus_code, u32 *field)
+{
+	if (mbus_code)
+		*mbus_code = csi_dev->bridge.mbus_format.code;
+	if (field)
+		*field = csi_dev->bridge.mbus_format.field;
+}
+
+/* Format */
+
+static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
+	/* Bayer */
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	/* RGB */
+	{
+		.mbus_code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+	/* YUV422 */
+	{
+		.mbus_code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_YUYV8_1X16,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_YVYU8_1X16,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
+	},
+	{
+		.mbus_code		= MEDIA_BUS_FMT_VYUY8_1X16,
+		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
+		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
+		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
+	},
+	/* Compressed */
+	{
+		.mbus_code		= MEDIA_BUS_FMT_JPEG_1X8,
+		.input_format		= SUN6I_CSI_INPUT_FMT_RAW,
+	},
+};
+
+const struct sun6i_csi_bridge_format *
+sun6i_csi_bridge_format_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_bridge_formats); i++)
+		if (sun6i_csi_bridge_formats[i].mbus_code == mbus_code)
+			return &sun6i_csi_bridge_formats[i];
+
+	return NULL;
+}
+
+/* Bridge */
+
+static void sun6i_csi_bridge_irq_enable(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+
+	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG,
+		     SUN6I_CSI_CH_INT_EN_VS |
+		     SUN6I_CSI_CH_INT_EN_HB_OF |
+		     SUN6I_CSI_CH_INT_EN_FIFO2_OF |
+		     SUN6I_CSI_CH_INT_EN_FIFO1_OF |
+		     SUN6I_CSI_CH_INT_EN_FIFO0_OF |
+		     SUN6I_CSI_CH_INT_EN_FD |
+		     SUN6I_CSI_CH_INT_EN_CD);
+}
+
+static void sun6i_csi_bridge_irq_disable(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+
+	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG, 0);
+}
+
+static void sun6i_csi_bridge_irq_clear(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+
+	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG, 0);
+	regmap_write(regmap, SUN6I_CSI_CH_INT_STA_REG,
+		     SUN6I_CSI_CH_INT_STA_CLEAR);
+}
+
+static void sun6i_csi_bridge_enable(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+
+	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN,
+			   SUN6I_CSI_EN_CSI_EN);
+
+	/* Capture */
+
+	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, SUN6I_CSI_CAP_VCAP_ON,
+			   SUN6I_CSI_CAP_VCAP_ON);
+}
+
+static void sun6i_csi_bridge_disable(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+
+	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, SUN6I_CSI_CAP_VCAP_ON, 0);
+	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN, 0);
+}
+
+static void
+sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
+{
+	struct v4l2_fwnode_endpoint *endpoint =
+		&csi_dev->bridge.source->endpoint;
+	unsigned char bus_width = endpoint->bus.parallel.bus_width;
+	unsigned int flags = endpoint->bus.parallel.flags;
+	struct regmap *regmap = csi_dev->regmap;
+	struct device *dev = csi_dev->dev;
+	u32 value = SUN6I_CSI_IF_CFG_IF_CSI;
+	u32 field;
+
+	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+
+	if (field == V4L2_FIELD_INTERLACED ||
+	    field == V4L2_FIELD_INTERLACED_TB ||
+	    field == V4L2_FIELD_INTERLACED_BT) {
+		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_INTERLACED |
+			 SUN6I_CSI_IF_CFG_FIELD_DT_PCLK_SHIFT(1) |
+			 SUN6I_CSI_IF_CFG_FIELD_DT_FIELD_VSYNC;
+	} else {
+		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_PROGRESSIVE;
+	}
+
+	switch (endpoint->bus_type) {
+	case V4L2_MBUS_PARALLEL:
+		if (bus_width == 16)
+			value |= SUN6I_CSI_IF_CFG_IF_CSI_YUV_COMBINED;
+		else
+			value |= SUN6I_CSI_IF_CFG_IF_CSI_YUV_RAW;
+
+		if (flags & V4L2_MBUS_FIELD_EVEN_LOW)
+			value |= SUN6I_CSI_IF_CFG_FIELD_NEGATIVE;
+		else
+			value |= SUN6I_CSI_IF_CFG_FIELD_POSITIVE;
+
+		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+			value |= SUN6I_CSI_IF_CFG_VREF_POL_NEGATIVE;
+		else
+			value |= SUN6I_CSI_IF_CFG_VREF_POL_POSITIVE;
+
+		if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+			value |= SUN6I_CSI_IF_CFG_HREF_POL_NEGATIVE;
+		else
+			value |= SUN6I_CSI_IF_CFG_HREF_POL_POSITIVE;
+
+		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+			value |= SUN6I_CSI_IF_CFG_CLK_POL_RISING;
+		else
+			value |= SUN6I_CSI_IF_CFG_CLK_POL_FALLING;
+		break;
+	case V4L2_MBUS_BT656:
+		if (bus_width == 16)
+			value |= SUN6I_CSI_IF_CFG_IF_CSI_BT1120;
+		else
+			value |= SUN6I_CSI_IF_CFG_IF_CSI_BT656;
+
+		if (flags & V4L2_MBUS_FIELD_EVEN_LOW)
+			value |= SUN6I_CSI_IF_CFG_FIELD_NEGATIVE;
+		else
+			value |= SUN6I_CSI_IF_CFG_FIELD_POSITIVE;
+
+		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
+			value |= SUN6I_CSI_IF_CFG_CLK_POL_RISING;
+		else
+			value |= SUN6I_CSI_IF_CFG_CLK_POL_FALLING;
+		break;
+	default:
+		dev_warn(dev, "unsupported bus type: %d\n", endpoint->bus_type);
+	}
+
+	switch (bus_width) {
+	case 8:
+		value |= SUN6I_CSI_IF_CFG_DATA_WIDTH_8;
+		break;
+	case 10:
+		value |= SUN6I_CSI_IF_CFG_DATA_WIDTH_10;
+		break;
+	case 12:
+		value |= SUN6I_CSI_IF_CFG_DATA_WIDTH_12;
+		break;
+	default:
+		dev_warn(dev, "unsupported bus width: %u\n", bus_width);
+		break;
+	}
+
+	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
+}
+
+static void
+sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
+	u32 field;
+
+	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+
+	if (field == V4L2_FIELD_INTERLACED ||
+	    field == V4L2_FIELD_INTERLACED_TB ||
+	    field == V4L2_FIELD_INTERLACED_BT)
+		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_INTERLACED;
+	else
+		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_PROGRESSIVE;
+
+	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
+}
+
+static void
+sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
+{
+	bool capture_streaming = csi_dev->capture.state.streaming;
+	const struct sun6i_csi_bridge_format *bridge_format;
+	const struct sun6i_csi_capture_format *capture_format;
+	struct regmap *regmap = csi_dev->regmap;
+	u8 input_format, output_format, input_yuv_seq;
+	u32 mbus_code, pixelformat, field;
+	bool interlaced = false;
+	u32 value = 0;
+
+	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
+	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	if (WARN_ON(!bridge_format))
+		return;
+
+	if (field == V4L2_FIELD_INTERLACED ||
+	    field == V4L2_FIELD_INTERLACED_TB ||
+	    field == V4L2_FIELD_INTERLACED_BT)
+		interlaced = true;
+
+	input_format = bridge_format->input_format;
+	input_yuv_seq = bridge_format->input_yuv_seq;
+
+	if (capture_streaming) {
+		sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
+		capture_format = sun6i_csi_capture_format_find(pixelformat);
+		if (WARN_ON(!capture_format))
+			return;
+
+		if (capture_format->input_format_raw)
+			input_format = SUN6I_CSI_INPUT_FMT_RAW;
+
+		if (capture_format->input_yuv_seq_invert)
+			input_yuv_seq = bridge_format->input_yuv_seq_invert;
+
+		if (interlaced)
+			output_format = capture_format->output_format_field;
+		else
+			output_format = capture_format->output_format_frame;
+
+		value |= SUN6I_CSI_CH_CFG_OUTPUT_FMT(output_format);
+	}
+
+	value |= SUN6I_CSI_CH_CFG_INPUT_FMT(input_format);
+	value |= SUN6I_CSI_CH_CFG_INPUT_YUV_SEQ(input_yuv_seq);
+
+	if (field == V4L2_FIELD_TOP)
+		value |= SUN6I_CSI_CH_CFG_FIELD_SEL_FIELD0;
+	else if (field == V4L2_FIELD_BOTTOM)
+		value |= SUN6I_CSI_CH_CFG_FIELD_SEL_FIELD1;
+	else
+		value |= SUN6I_CSI_CH_CFG_FIELD_SEL_EITHER;
+
+	regmap_write(regmap, SUN6I_CSI_CH_CFG_REG, value);
+}
+
+static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev)
+{
+	if (csi_dev->bridge.source == &csi_dev->bridge.source_parallel)
+		sun6i_csi_bridge_configure_parallel(csi_dev);
+	else if (csi_dev->bridge.source == &csi_dev->bridge.source_mipi_csi2)
+		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
+
+	sun6i_csi_bridge_configure_format(csi_dev);
+}
+
+/* V4L2 Subdev */
+
+static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	bool capture_streaming = csi_dev->capture.state.streaming;
+	struct device *dev = csi_dev->dev;
+	struct v4l2_subdev *source_subdev;
+	int ret;
+
+	/* Source */
+
+	if (!csi_dev->bridge.source)
+		return -ENODEV;
+
+	source_subdev = csi_dev->bridge.source->subdev;
+
+	if (!on) {
+		if (capture_streaming)
+			sun6i_csi_bridge_irq_disable(csi_dev);
+
+		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		goto disable;
+	}
+
+	/* PM */
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	/* Clear */
+
+	sun6i_csi_bridge_irq_clear(csi_dev);
+
+	/* Configure */
+
+	sun6i_csi_bridge_configure(csi_dev);
+
+	if (capture_streaming)
+		sun6i_csi_capture_configure(csi_dev);
+
+	/* State Update */
+
+	/* Assign the first buffer for capture. */
+	if (capture_streaming)
+		sun6i_csi_capture_state_update(csi_dev);
+
+	/* Enable */
+
+	if (capture_streaming)
+		sun6i_csi_bridge_irq_enable(csi_dev);
+
+	sun6i_csi_bridge_enable(csi_dev);
+
+	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD) {
+		if (capture_streaming)
+			sun6i_csi_bridge_irq_disable(csi_dev);
+
+		goto disable;
+	}
+
+	return 0;
+
+disable:
+	sun6i_csi_bridge_disable(csi_dev);
+
+	csi_dev->bridge.source = NULL;
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops sun6i_csi_bridge_video_ops = {
+	.s_stream	= sun6i_csi_bridge_s_stream,
+};
+
+static void
+sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
+{
+	if (!sun6i_csi_bridge_format_find(mbus_format->code))
+		mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
+
+	mbus_format->field = V4L2_FIELD_NONE;
+	mbus_format->colorspace = V4L2_COLORSPACE_RAW;
+	mbus_format->quantization = V4L2_QUANTIZATION_DEFAULT;
+	mbus_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *state)
+{
+	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
+	struct v4l2_mbus_framefmt *mbus_format =
+		v4l2_subdev_get_try_format(subdev, state, pad);
+
+	mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
+	mbus_format->width = 640;
+	mbus_format->height = 480;
+
+	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+
+	return 0;
+}
+
+static int
+sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >= ARRAY_SIZE(sun6i_csi_bridge_formats))
+		return -EINVAL;
+
+	code_enum->code = sun6i_csi_bridge_formats[code_enum->index].mbus_code;
+
+	return 0;
+}
+
+static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_format = &format->format;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
+							   format->pad);
+	else
+		*mbus_format = csi_dev->bridge.mbus_format;
+
+	return 0;
+}
+
+static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	struct v4l2_mbus_framefmt *mbus_format = &format->format;
+
+	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+			*mbus_format;
+	else
+		csi_dev->bridge.mbus_format = *mbus_format;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
+	.init_cfg	= sun6i_csi_bridge_init_cfg,
+	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
+	.get_fmt	= sun6i_csi_bridge_get_fmt,
+	.set_fmt	= sun6i_csi_bridge_set_fmt,
+};
+
+const struct v4l2_subdev_ops sun6i_csi_bridge_subdev_ops = {
+	.video	= &sun6i_csi_bridge_video_ops,
+	.pad	= &sun6i_csi_bridge_pad_ops,
+};
+
+/* Media Entity */
+
+static int sun6i_csi_bridge_link_validate(struct media_link *link)
+{
+	struct v4l2_subdev *subdev =
+		media_entity_to_v4l2_subdev(link->sink->entity);
+	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
+	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
+	struct device *dev = csi_dev->dev;
+	struct v4l2_subdev *source_subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	int ret;
+
+	/* Only support one enabled source at a time. */
+	if (bridge->source) {
+		dev_err(dev, "more than one source is connected to bridge\n");
+		return -EBUSY;
+	}
+
+	ret = v4l2_subdev_link_validate(link);
+	if (ret)
+		return ret;
+
+	if (source_subdev == bridge->source_parallel.subdev)
+		bridge->source = &bridge->source_parallel;
+	else if (source_subdev == bridge->source_mipi_csi2.subdev)
+		bridge->source = &bridge->source_mipi_csi2;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct media_entity_operations sun6i_csi_bridge_entity_ops = {
+	.link_validate	= sun6i_csi_bridge_link_validate,
+};
+
+/* V4L2 Async */
+
+static int sun6i_csi_bridge_link(struct sun6i_csi_device *csi_dev,
+				 int sink_pad_index,
+				 struct v4l2_subdev *remote_subdev,
+				 bool enabled)
+{
+	struct device *dev = csi_dev->dev;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+	struct media_entity *sink_entity = &subdev->entity;
+	struct media_entity *source_entity = &remote_subdev->entity;
+	int source_pad_index;
+	int ret;
+
+	/* Get the first remote source pad. */
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
+				    enabled ? MEDIA_LNK_FL_ENABLED : 0);
+	if (ret < 0) {
+		dev_err(dev, "failed to create %s:%u -> %s:%u link\n",
+			source_entity->name, source_pad_index,
+			sink_entity->name, sink_pad_index);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int
+sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *remote_subdev,
+				struct v4l2_async_subdev *async_subdev)
+{
+	struct sun6i_csi_device *csi_dev =
+		container_of(notifier, struct sun6i_csi_device,
+			     bridge.notifier);
+	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
+	struct sun6i_csi_bridge_source *source = NULL;
+	struct fwnode_handle *fwnode = dev_fwnode(csi_dev->dev);
+	struct fwnode_handle *handle = NULL;
+	bool enabled;
+	int ret;
+
+	while ((handle = fwnode_graph_get_next_endpoint(fwnode, handle))) {
+		struct fwnode_endpoint endpoint = { 0 };
+		struct fwnode_handle *remote_fwnode;
+
+		remote_fwnode = fwnode_graph_get_remote_port_parent(handle);
+		if (!remote_fwnode)
+			continue;
+
+		if (remote_fwnode != remote_subdev->fwnode)
+			goto next;
+
+		ret = fwnode_graph_parse_endpoint(handle, &endpoint);
+		if (ret < 0)
+			goto next;
+
+		switch (endpoint.port) {
+		case SUN6I_CSI_PORT_PARALLEL:
+			source = &bridge->source_parallel;
+			enabled = true;
+			break;
+		case SUN6I_CSI_PORT_MIPI_CSI2:
+			source = &bridge->source_mipi_csi2;
+			enabled = !bridge->source_parallel.expected;
+			break;
+		default:
+			break;
+		}
+
+next:
+		fwnode_handle_put(remote_fwnode);
+	}
+
+	if (!source)
+		return -EINVAL;
+
+	source->subdev = remote_subdev;
+
+	if (csi_dev->isp_available) {
+		ret = sun6i_csi_isp_complete(csi_dev, remote_subdev->v4l2_dev);
+		if (ret)
+			return ret;
+	}
+
+	return sun6i_csi_bridge_link(csi_dev, SUN6I_CSI_BRIDGE_PAD_SINK,
+				     remote_subdev, enabled);
+}
+
+static int
+sun6i_csi_bridge_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct sun6i_csi_device *csi_dev =
+		container_of(notifier, struct sun6i_csi_device,
+			     bridge.notifier);
+
+	if (csi_dev->isp_available)
+		return 0;
+
+	return sun6i_csi_v4l2_complete(csi_dev);
+}
+
+static const struct v4l2_async_notifier_operations
+sun6i_csi_bridge_notifier_ops = {
+	.bound		= sun6i_csi_bridge_notifier_bound,
+	.complete	= sun6i_csi_bridge_notifier_complete,
+};
+
+/* Bridge */
+
+static int sun6i_csi_bridge_source_setup(struct sun6i_csi_device *csi_dev,
+					 struct sun6i_csi_bridge_source *source,
+					 u32 port,
+					 enum v4l2_mbus_type *bus_types)
+{
+	struct device *dev = csi_dev->dev;
+	struct v4l2_async_notifier *notifier = &csi_dev->bridge.notifier;
+	struct v4l2_fwnode_endpoint *endpoint = &source->endpoint;
+	struct v4l2_async_subdev *async_subdev;
+	struct fwnode_handle *handle;
+	int ret;
+
+	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), port, 0, 0);
+	if (!handle)
+		return -ENODEV;
+
+	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	if (ret)
+		goto complete;
+
+	if (bus_types) {
+		bool valid = false;
+		unsigned int i;
+
+		for (i = 0; bus_types[i] != V4L2_MBUS_INVALID; i++) {
+			if (endpoint->bus_type == bus_types[i]) {
+				valid = true;
+				break;
+			}
+		}
+
+		if (!valid) {
+			dev_err(dev, "unsupported bus type for port %d\n",
+				port);
+			ret = -EINVAL;
+			goto complete;
+		}
+	}
+
+	async_subdev = v4l2_async_notifier_add_fwnode_remote_subdev(notifier,
+		handle, struct v4l2_async_subdev);
+	if (IS_ERR(async_subdev)) {
+		ret = PTR_ERR(async_subdev);
+		goto complete;
+	}
+
+	source->expected = true;
+
+complete:
+	fwnode_handle_put(handle);
+
+	return ret;
+}
+
+int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	struct v4l2_subdev *subdev = &bridge->subdev;
+	struct v4l2_async_notifier *notifier = &bridge->notifier;
+	struct media_pad *pads = bridge->pads;
+	enum v4l2_mbus_type parallel_mbus_types[] = {
+		V4L2_MBUS_PARALLEL,
+		V4L2_MBUS_BT656,
+		V4L2_MBUS_INVALID
+	};
+	int ret;
+
+	/* V4L2 Subdev */
+
+	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
+	strscpy(subdev->name, SUN6I_CSI_BRIDGE_NAME, sizeof(subdev->name));
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	subdev->owner = THIS_MODULE;
+	subdev->dev = dev;
+
+	v4l2_set_subdevdata(subdev, csi_dev);
+
+	/* Media Entity */
+
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->entity.ops = &sun6i_csi_bridge_entity_ops;
+
+	/* Media Pads */
+
+	pads[SUN6I_CSI_BRIDGE_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[SUN6I_CSI_BRIDGE_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+						  MEDIA_PAD_FL_MUST_CONNECT;
+
+	ret = media_entity_pads_init(&subdev->entity,
+				     SUN6I_CSI_BRIDGE_PAD_COUNT, pads);
+	if (ret < 0)
+		return ret;
+
+	/* V4L2 Subdev */
+
+	if (csi_dev->isp_available)
+		ret = v4l2_async_register_subdev(subdev);
+	else
+		ret = v4l2_device_register_subdev(v4l2_dev, subdev);
+
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
+		goto error_media_entity;
+	}
+
+	/* V4L2 Async */
+
+	v4l2_async_notifier_init(notifier);
+	notifier->ops = &sun6i_csi_bridge_notifier_ops;
+
+	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_parallel,
+				      SUN6I_CSI_PORT_PARALLEL,
+				      parallel_mbus_types);
+	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_mipi_csi2,
+				      SUN6I_CSI_PORT_MIPI_CSI2, NULL);
+
+	if (csi_dev->isp_available)
+		ret = v4l2_async_subdev_notifier_register(subdev, notifier);
+	else
+		ret = v4l2_async_notifier_register(v4l2_dev, notifier);
+
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
+			ret);
+		goto error_v4l2_async_notifier;
+	}
+
+	return 0;
+
+error_v4l2_async_notifier:
+	v4l2_async_notifier_cleanup(notifier);
+
+	if (csi_dev->isp_available)
+		v4l2_async_unregister_subdev(subdev);
+	else
+		v4l2_device_unregister_subdev(subdev);
+
+error_media_entity:
+	media_entity_cleanup(&subdev->entity);
+
+	return ret;
+}
+
+void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
+{
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+	struct v4l2_async_notifier *notifier = &csi_dev->bridge.notifier;
+
+	v4l2_async_notifier_unregister(notifier);
+	v4l2_async_notifier_cleanup(notifier);
+
+	if (csi_dev->isp_available)
+		v4l2_async_unregister_subdev(subdev);
+	else
+		v4l2_device_unregister_subdev(subdev);
+
+	media_entity_cleanup(&subdev->entity);
+}
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
new file mode 100644
index 000000000000..e59c40611872
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_CSI_BRIDGE_H_
+#define _SUN6I_CSI_BRIDGE_H_
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define SUN6I_CSI_BRIDGE_NAME	"sun6i-csi-bridge"
+
+enum sun6i_csi_bridge_pad {
+	SUN6I_CSI_BRIDGE_PAD_SINK	= 0,
+	SUN6I_CSI_BRIDGE_PAD_SOURCE	= 1,
+	SUN6I_CSI_BRIDGE_PAD_COUNT	= 2,
+};
+
+struct sun6i_csi_device;
+
+struct sun6i_csi_bridge_format {
+	u32	mbus_code;
+	u8	input_format;
+	u8	input_yuv_seq;
+	u8	input_yuv_seq_invert;
+};
+
+struct sun6i_csi_bridge_source {
+	struct v4l2_subdev		*subdev;
+	struct v4l2_fwnode_endpoint	endpoint;
+	bool				expected;
+};
+
+struct sun6i_csi_bridge {
+	struct v4l2_subdev		subdev;
+	struct v4l2_async_notifier	notifier;
+	struct media_pad		pads[2];
+	struct v4l2_mbus_framefmt	mbus_format;
+
+	struct sun6i_csi_bridge_source	source_parallel;
+	struct sun6i_csi_bridge_source	source_mipi_csi2;
+	struct sun6i_csi_bridge_source	*source;
+};
+
+/* Helpers */
+
+void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
+				 unsigned int *width, unsigned int *height);
+void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
+			     u32 *mbus_code, u32 *field);
+
+/* Format */
+
+const struct sun6i_csi_bridge_format *
+sun6i_csi_bridge_format_find(u32 mbus_code);
+
+/* Bridge */
+
+int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev);
+void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev);
+
+#endif
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
new file mode 100644
index 000000000000..2ce6f62ba196
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -0,0 +1,1094 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2011-2018 Magewell Electronics Co., Ltd. (Nanjing)
+ * Author: Yong Deng <yong.deng@magewell.com>
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "sun6i_csi.h"
+#include "sun6i_csi_bridge.h"
+#include "sun6i_csi_capture.h"
+#include "sun6i_csi_reg.h"
+
+/* Helpers */
+
+void sun6i_csi_capture_dimensions(struct sun6i_csi_device *csi_dev,
+				  unsigned int *width, unsigned int *height)
+{
+	if (width)
+		*width = csi_dev->capture.format.fmt.pix.width;
+	if (height)
+		*height = csi_dev->capture.format.fmt.pix.height;
+}
+
+void sun6i_csi_capture_format(struct sun6i_csi_device *csi_dev,
+			      u32 *pixelformat, u32 *field)
+{
+	if (pixelformat)
+		*pixelformat = csi_dev->capture.format.fmt.pix.pixelformat;
+
+	if (field)
+		*field = csi_dev->capture.format.fmt.pix.field;
+}
+
+/* Format */
+
+static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
+	/* Bayer */
+	{
+		.pixelformat		= V4L2_PIX_FMT_SBGGR8,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SGBRG8,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SGRBG8,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SRGGB8,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SBGGR10,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SGBRG10,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SGRBG10,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SRGGB10,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SBGGR12,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SGBRG12,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SGRBG12,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_SRGGB12,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
+	},
+	/* RGB */
+	{
+		.pixelformat		= V4L2_PIX_FMT_RGB565,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_RGB565X,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
+	},
+	/* YUV422 */
+	{
+		.pixelformat		= V4L2_PIX_FMT_YUYV,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.input_format_raw	= true,
+		.hsize_len_factor	= 2,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_YVYU,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.input_format_raw	= true,
+		.hsize_len_factor	= 2,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_UYVY,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.input_format_raw	= true,
+		.hsize_len_factor	= 2,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_VYUY,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+		.input_format_raw	= true,
+		.hsize_len_factor	= 2,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_NV16,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_NV61,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
+		.input_yuv_seq_invert	= true,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_YUV422P,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
+	},
+	/* YUV420 */
+	{
+		.pixelformat		= V4L2_PIX_FMT_HM12,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_NV12,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_NV21,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
+		.input_yuv_seq_invert	= true,
+	},
+
+	{
+		.pixelformat		= V4L2_PIX_FMT_YUV420,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
+	},
+	{
+		.pixelformat		= V4L2_PIX_FMT_YVU420,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
+		.input_yuv_seq_invert	= true,
+	},
+	/* Compressed */
+	{
+		.pixelformat		= V4L2_PIX_FMT_JPEG,
+		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
+		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
+	},
+};
+
+const
+struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++)
+		if (sun6i_csi_capture_formats[i].pixelformat == pixelformat)
+			return &sun6i_csi_capture_formats[i];
+
+	return NULL;
+}
+
+/* RAW formats need and exact match between pixel and mbus formats. */
+static const
+struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matchs[] = {
+	/* YUV420 */
+	{
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
+	},
+	/* RGB */
+	{
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_RGB565X,
+		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_BE,
+	},
+	/* Bayer */
+	{
+		.pixelformat	= V4L2_PIX_FMT_SBGGR8,
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SGBRG8,
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SGRBG8,
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SRGGB8,
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SBGGR10,
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SGBRG10,
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SGRBG10,
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SRGGB10,
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SBGGR12,
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SGBRG12,
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SGRBG12,
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_SRGGB12,
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+	},
+	/* Compressed */
+	{
+		.pixelformat	= V4L2_PIX_FMT_JPEG,
+		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
+	},
+};
+
+static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matchs); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matchs[i];
+
+		if (match->pixelformat == pixelformat &&
+		    match->mbus_code == mbus_code)
+			return true;
+	}
+
+	return false;
+}
+
+/* Capture */
+
+void sun6i_csi_capture_buffer_configure(struct sun6i_csi_device *csi_dev,
+					struct sun6i_csi_buffer *csi_buffer)
+{
+	struct regmap *regmap = csi_dev->regmap;
+	const struct v4l2_format_info *info;
+	struct vb2_buffer *vb2_buffer;
+	unsigned int width, height;
+	dma_addr_t address;
+	u32 pixelformat;
+
+	vb2_buffer = &csi_buffer->v4l2_buffer.vb2_buf;
+	address = vb2_dma_contig_plane_dma_addr(vb2_buffer, 0);
+
+	regmap_write(regmap, SUN6I_CSI_CH_FIFO0_ADDR_REG,
+		     SUN6I_CSI_ADDR_VALUE(address));
+
+	sun6i_csi_capture_dimensions(csi_dev, &width, &height);
+	sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
+
+	info = v4l2_format_info(pixelformat);
+	/* Unsupported formats are single-plane, so we can stop here. */
+	if (!info)
+		return;
+
+	if (info->comp_planes > 1) {
+		address += info->bpp[0] * width * height;
+
+		regmap_write(regmap, SUN6I_CSI_CH_FIFO1_ADDR_REG,
+			     SUN6I_CSI_ADDR_VALUE(address));
+	}
+
+	if (info->comp_planes > 2) {
+		address += info->bpp[1] * DIV_ROUND_UP(width, info->hdiv) *
+			   DIV_ROUND_UP(height, info->vdiv);
+
+		regmap_write(regmap, SUN6I_CSI_CH_FIFO2_ADDR_REG,
+			     SUN6I_CSI_ADDR_VALUE(address));
+	}
+}
+
+void sun6i_csi_capture_configure(struct sun6i_csi_device *csi_dev)
+{
+	struct regmap *regmap = csi_dev->regmap;
+	const struct sun6i_csi_capture_format *format;
+	const struct v4l2_format_info *info;
+	unsigned int width, height;
+	u32 hsize_len, vsize_len;
+	u32 luma_line, chroma_line = 0;
+	u32 pixelformat;
+
+	sun6i_csi_capture_dimensions(csi_dev, &width, &height);
+	sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
+	format = sun6i_csi_capture_format_find(pixelformat);
+
+	if (WARN_ON(!format))
+		return;
+
+	hsize_len = width;
+	vsize_len = height;
+
+	/*
+	 * When using 8-bit raw input/output (for packed YUV), we need to adapt
+	 * the width to account for the difference in bpp when it's not 8-bit.
+	 */
+	if (format->hsize_len_factor)
+		hsize_len *= format->hsize_len_factor;
+
+	regmap_write(regmap, SUN6I_CSI_CH_HSIZE_REG,
+		     SUN6I_CSI_CH_HSIZE_LEN(hsize_len) |
+		     SUN6I_CSI_CH_HSIZE_START(0));
+
+	regmap_write(regmap, SUN6I_CSI_CH_VSIZE_REG,
+		     SUN6I_CSI_CH_VSIZE_LEN(vsize_len) |
+		     SUN6I_CSI_CH_VSIZE_START(0));
+
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_RGB565X:
+		luma_line = width * 2;
+		break;
+	case V4L2_PIX_FMT_HM12:
+		luma_line = width;
+		chroma_line = width;
+		break;
+	case V4L2_PIX_FMT_JPEG:
+		luma_line = width;
+		break;
+	default:
+		info = v4l2_format_info(pixelformat);
+		if (WARN_ON(!info))
+			return;
+
+		luma_line = width * info->bpp[0];
+
+		if (info->comp_planes > 1)
+			chroma_line = width * info->bpp[1] / info->hdiv;
+		break;
+	}
+
+	regmap_write(regmap, SUN6I_CSI_CH_BUF_LEN_REG,
+		     SUN6I_CSI_CH_BUF_LEN_CHROMA_LINE(chroma_line) |
+		     SUN6I_CSI_CH_BUF_LEN_LUMA_LINE(luma_line));
+}
+
+/* State */
+
+void sun6i_csi_capture_state_cleanup(struct sun6i_csi_device *csi_dev,
+				     bool error)
+{
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct sun6i_csi_buffer **csi_buffer_states[] = {
+		&state->pending, &state->current, &state->complete,
+	};
+	struct sun6i_csi_buffer *csi_buffer;
+	struct vb2_buffer *vb2_buffer;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&state->lock, flags);
+
+	for (i = 0; i < ARRAY_SIZE(csi_buffer_states); i++) {
+		csi_buffer = *csi_buffer_states[i];
+		if (!csi_buffer)
+			continue;
+
+		vb2_buffer = &csi_buffer->v4l2_buffer.vb2_buf;
+		vb2_buffer_done(vb2_buffer, error ? VB2_BUF_STATE_ERROR :
+				VB2_BUF_STATE_QUEUED);
+
+		*csi_buffer_states[i] = NULL;
+	}
+
+	list_for_each_entry(csi_buffer, &state->queue, list) {
+		vb2_buffer = &csi_buffer->v4l2_buffer.vb2_buf;
+		vb2_buffer_done(vb2_buffer, error ? VB2_BUF_STATE_ERROR :
+				VB2_BUF_STATE_QUEUED);
+	}
+
+	INIT_LIST_HEAD(&state->queue);
+
+	spin_unlock_irqrestore(&state->lock, flags);
+}
+
+void sun6i_csi_capture_state_update(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct sun6i_csi_buffer *csi_buffer;
+	unsigned long flags;
+
+	spin_lock_irqsave(&state->lock, flags);
+
+	if (list_empty(&state->queue))
+		goto complete;
+
+	if (state->pending)
+		goto complete;
+
+	csi_buffer = list_first_entry(&state->queue, struct sun6i_csi_buffer,
+				      list);
+
+	sun6i_csi_capture_buffer_configure(csi_dev, csi_buffer);
+
+	list_del(&csi_buffer->list);
+
+	state->pending = csi_buffer;
+
+complete:
+	spin_unlock_irqrestore(&state->lock, flags);
+}
+
+void sun6i_csi_capture_state_complete(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	unsigned long flags;
+
+	spin_lock_irqsave(&state->lock, flags);
+
+	if (!state->pending)
+		goto complete;
+
+	state->complete = state->current;
+	state->current = state->pending;
+	state->pending = NULL;
+
+	if (state->complete) {
+		struct sun6i_csi_buffer *csi_buffer = state->complete;
+		struct vb2_buffer *vb2_buffer =
+			&csi_buffer->v4l2_buffer.vb2_buf;
+
+		vb2_buffer->timestamp = ktime_get_ns();
+		csi_buffer->v4l2_buffer.sequence = state->sequence;
+
+		vb2_buffer_done(vb2_buffer, VB2_BUF_STATE_DONE);
+
+		state->complete = NULL;
+	}
+
+complete:
+	spin_unlock_irqrestore(&state->lock, flags);
+}
+
+void sun6i_csi_capture_frame_done(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	unsigned long flags;
+
+	spin_lock_irqsave(&state->lock, flags);
+	state->sequence++;
+	spin_unlock_irqrestore(&state->lock, flags);
+}
+
+void sun6i_csi_capture_sync(struct sun6i_csi_device *csi_dev)
+{
+	sun6i_csi_capture_state_complete(csi_dev);
+	sun6i_csi_capture_state_update(csi_dev);
+}
+
+/* Queue */
+
+static int sun6i_csi_capture_queue_setup(struct vb2_queue *queue,
+					 unsigned int *buffers_count,
+					 unsigned int *planes_count,
+					 unsigned int sizes[],
+					 struct device *alloc_devs[])
+{
+	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
+	unsigned long size = csi_dev->capture.format.fmt.pix.sizeimage;
+
+	if (*planes_count)
+		return sizes[0] < size ? -EINVAL : 0;
+
+	*planes_count = 1;
+	sizes[0] = size;
+
+	return 0;
+}
+
+static int sun6i_csi_capture_buffer_prepare(struct vb2_buffer *buffer)
+{
+	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(buffer->vb2_queue);
+	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	unsigned long size = csi_dev->capture.format.fmt.pix.sizeimage;
+
+	if (vb2_plane_size(buffer, 0) < size) {
+		v4l2_err(v4l2_dev, "buffer too small (%lu < %lu)\n",
+			 vb2_plane_size(buffer, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(buffer, 0, size);
+
+	return 0;
+}
+
+static void sun6i_csi_capture_buffer_queue(struct vb2_buffer *buffer)
+{
+	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(buffer->vb2_queue);
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct vb2_v4l2_buffer *v4l2_buffer = to_vb2_v4l2_buffer(buffer);
+	struct sun6i_csi_buffer *csi_buffer =
+		container_of(v4l2_buffer, struct sun6i_csi_buffer, v4l2_buffer);
+	unsigned long flags;
+
+	spin_lock_irqsave(&state->lock, flags);
+	list_add_tail(&csi_buffer->list, &state->queue);
+	spin_unlock_irqrestore(&state->lock, flags);
+}
+
+static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
+					     unsigned int count)
+{
+	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+	struct device *dev = csi_dev->dev;
+	int ret;
+
+	ret = media_pipeline_start(&video_dev->entity, &video_dev->pipe);
+	if (ret < 0)
+		goto error_state;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto error_media_pipeline;
+
+	state->streaming = true;
+
+	ret = v4l2_subdev_call(subdev, video, s_stream, 1);
+	if (ret && ret != -ENOIOCTLCMD)
+		goto error_streaming;
+
+	return 0;
+
+error_streaming:
+	state->streaming = false;
+
+	pm_runtime_put(dev);
+
+error_media_pipeline:
+	media_pipeline_stop(&video_dev->entity);
+
+error_state:
+	sun6i_csi_capture_state_cleanup(csi_dev, false);
+
+	csi_dev->bridge.source = NULL;
+
+	return ret;
+}
+
+static void sun6i_csi_capture_stop_streaming(struct vb2_queue *queue)
+{
+	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+
+	v4l2_subdev_call(subdev, video, s_stream, 0);
+
+	state->streaming = false;
+
+	pm_runtime_put(csi_dev->dev);
+
+	media_pipeline_stop(&video_dev->entity);
+
+	sun6i_csi_capture_state_cleanup(csi_dev, true);
+}
+
+static const struct vb2_ops sun6i_csi_capture_queue_ops = {
+	.queue_setup		= sun6i_csi_capture_queue_setup,
+	.buf_prepare		= sun6i_csi_capture_buffer_prepare,
+	.buf_queue		= sun6i_csi_capture_buffer_queue,
+	.start_streaming	= sun6i_csi_capture_start_streaming,
+	.stop_streaming		= sun6i_csi_capture_stop_streaming,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+/* V4L2 Device */
+
+static void sun6i_csi_capture_format_prepare(struct v4l2_format *format)
+{
+	struct v4l2_pix_format *pix_format = &format->fmt.pix;
+	unsigned int width = pix_format->width;
+	unsigned int height = pix_format->height;
+
+	if (!sun6i_csi_capture_format_find(pix_format->pixelformat))
+		pix_format->pixelformat =
+			sun6i_csi_capture_formats[0].pixelformat;
+
+	switch (pix_format->pixelformat) {
+	case V4L2_PIX_FMT_HM12:
+		pix_format->bytesperline = width * 12 / 8;
+		pix_format->sizeimage = pix_format->bytesperline * height;
+		break;
+	case V4L2_PIX_FMT_JPEG:
+		pix_format->bytesperline = width;
+		pix_format->sizeimage = pix_format->bytesperline * height;
+		break;
+	default:
+		v4l2_fill_pixfmt(pix_format, pix_format->pixelformat,
+				 width, height);
+		break;
+	}
+
+	if (pix_format->field == V4L2_FIELD_ANY)
+		pix_format->field = V4L2_FIELD_NONE;
+
+	pix_format->colorspace = V4L2_COLORSPACE_RAW;
+	pix_format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix_format->quantization = V4L2_QUANTIZATION_DEFAULT;
+	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int sun6i_csi_capture_querycap(struct file *file, void *private,
+				      struct v4l2_capability *capability)
+{
+	struct sun6i_csi_device *csi_dev = video_drvdata(file);
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+
+	strscpy(capability->driver, SUN6I_CSI_NAME, sizeof(capability->driver));
+	strscpy(capability->card, video_dev->name, sizeof(capability->card));
+	snprintf(capability->bus_info, sizeof(capability->bus_info),
+		 "platform:%s", dev_name(csi_dev->dev));
+
+	return 0;
+}
+
+static int sun6i_csi_capture_enum_fmt(struct file *file, void *private,
+				      struct v4l2_fmtdesc *fmtdesc)
+{
+	u32 index = fmtdesc->index;
+
+	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+		return -EINVAL;
+
+	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+
+	return 0;
+}
+
+static int sun6i_csi_capture_g_fmt(struct file *file, void *private,
+				   struct v4l2_format *format)
+{
+	struct sun6i_csi_device *csi_dev = video_drvdata(file);
+
+	*format = csi_dev->capture.format;
+
+	return 0;
+}
+
+static int sun6i_csi_capture_s_fmt(struct file *file, void *private,
+				   struct v4l2_format *format)
+{
+	struct sun6i_csi_device *csi_dev = video_drvdata(file);
+
+	if (vb2_is_busy(&csi_dev->capture.queue))
+		return -EBUSY;
+
+	sun6i_csi_capture_format_prepare(format);
+
+	csi_dev->capture.format = *format;
+
+	return 0;
+}
+
+static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
+				     struct v4l2_format *format)
+{
+	sun6i_csi_capture_format_prepare(format);
+
+	return 0;
+}
+
+static int sun6i_csi_capture_enum_input(struct file *file, void *private,
+					struct v4l2_input *input)
+{
+	if (input->index != 0)
+		return -EINVAL;
+
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+	strscpy(input->name, "Camera", sizeof(input->name));
+
+	return 0;
+}
+
+static int sun6i_csi_capture_g_input(struct file *file, void *fh,
+				     unsigned int *index)
+{
+	*index = 0;
+
+	return 0;
+}
+
+static int sun6i_csi_capture_s_input(struct file *file, void *fh,
+				     unsigned int index)
+{
+	if (index != 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
+	.vidioc_querycap		= sun6i_csi_capture_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
+	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
+	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
+
+	.vidioc_enum_input		= sun6i_csi_capture_enum_input,
+	.vidioc_s_input			= sun6i_csi_capture_s_input,
+	.vidioc_g_input			= sun6i_csi_capture_g_input,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_log_status		= v4l2_ctrl_log_status,
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+static int sun6i_csi_capture_open(struct file *file)
+{
+	struct sun6i_csi_device *csi_dev = video_drvdata(file);
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+	struct mutex *lock = &csi_dev->capture.lock;
+	int ret;
+
+	if (mutex_lock_interruptible(lock))
+		return -ERESTARTSYS;
+
+	ret = v4l2_pipeline_pm_get(&video_dev->entity);
+	if (ret < 0)
+		goto error_mutex;
+
+	ret = v4l2_fh_open(file);
+	if (ret < 0)
+		goto error_pipeline;
+
+	mutex_unlock(lock);
+
+	return 0;
+
+error_pipeline:
+	v4l2_pipeline_pm_put(&video_dev->entity);
+
+error_mutex:
+	mutex_unlock(lock);
+
+	return ret;
+}
+
+static int sun6i_csi_capture_release(struct file *file)
+{
+	struct sun6i_csi_device *csi_dev = video_drvdata(file);
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+	struct mutex *lock = &csi_dev->capture.lock;
+
+	mutex_lock(lock);
+
+	_vb2_fop_release(file, NULL);
+	v4l2_pipeline_pm_put(&video_dev->entity);
+
+	mutex_unlock(lock);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations sun6i_csi_capture_fops = {
+	.owner		= THIS_MODULE,
+	.open		= sun6i_csi_capture_open,
+	.release	= sun6i_csi_capture_release,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= vb2_fop_mmap,
+	.poll		= vb2_fop_poll
+};
+
+/* Media Entity */
+
+static int sun6i_csi_capture_link_validate(struct media_link *link)
+{
+	struct video_device *video_dev =
+		media_entity_to_video_device(link->sink->entity);
+	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	const struct sun6i_csi_capture_format *capture_format;
+	const struct sun6i_csi_bridge_format *bridge_format;
+	unsigned int capture_width, capture_height;
+	unsigned int bridge_width, bridge_height;
+	const struct v4l2_format_info *format_info;
+	u32 pixelformat, capture_field;
+	u32 mbus_code, bridge_field;
+	bool match;
+
+	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
+
+	sun6i_csi_capture_format(csi_dev, &pixelformat, &capture_field);
+	capture_format = sun6i_csi_capture_format_find(pixelformat);
+	if (WARN_ON(!capture_format))
+		return -EINVAL;
+
+	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
+
+	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
+	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	if (WARN_ON(!bridge_format))
+		return -EINVAL;
+
+	/* No cropping/scaling is supported. */
+	if (capture_width != bridge_width || capture_height != bridge_height) {
+		v4l2_err(v4l2_dev,
+			 "invalid input/output dimensions: %ux%u/%ux%u\n",
+			 bridge_width, bridge_height, capture_width,
+			 capture_height);
+		return -EINVAL;
+	}
+
+	format_info = v4l2_format_info(pixelformat);
+	/* Some formats are not listed. */
+	if (!format_info)
+		return 0;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		goto invalid;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_RGB &&
+	    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_RAW)
+		goto invalid;
+
+	if (format_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		if (bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    bridge_format->input_format != SUN6I_CSI_INPUT_FMT_YUV422)
+			goto invalid;
+
+		/* YUV420 input can't produce YUV422 output. */
+		if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_YUV420 &&
+		    format_info->vdiv == 1)
+			goto invalid;
+	}
+
+	/* With raw input mode, we need a 1:1 match between input and output. */
+	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
+	    capture_format->input_format_raw) {
+		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		if (!match)
+			goto invalid;
+	}
+
+	return 0;
+
+invalid:
+	v4l2_err(v4l2_dev, "invalid input/output format combination\n");
+	return -EINVAL;
+}
+
+static const struct media_entity_operations sun6i_csi_capture_entity_ops = {
+	.link_validate = sun6i_csi_capture_link_validate
+};
+
+/* Capture */
+
+int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
+	struct v4l2_format *format = &csi_dev->capture.format;
+	struct v4l2_pix_format *pix_format = &format->fmt.pix;
+	struct media_pad *pad = &csi_dev->capture.pad;
+	struct vb2_queue *queue = &csi_dev->capture.queue;
+	struct mutex *lock = &csi_dev->capture.lock;
+	int ret;
+
+	/* This may happen with multiple bridge notifier bound calls. */
+	if (state->setup)
+		return 0;
+
+	mutex_init(lock);
+
+	/* State */
+
+	INIT_LIST_HEAD(&state->queue);
+	spin_lock_init(&state->lock);
+
+	/* Media Entity */
+
+	video_dev->entity.ops = &sun6i_csi_capture_entity_ops;
+
+	/* Media Pad */
+
+	pad->flags = MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&video_dev->entity, 1, pad);
+	if (ret < 0)
+		goto error_mutex;
+
+	/* Queue */
+
+	queue->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	queue->io_modes = VB2_MMAP | VB2_DMABUF;
+	queue->buf_struct_size = sizeof(struct sun6i_csi_buffer);
+	queue->ops = &sun6i_csi_capture_queue_ops;
+	queue->mem_ops = &vb2_dma_contig_memops;
+	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	queue->lock = lock;
+	queue->dev = csi_dev->dev;
+	queue->drv_priv = csi_dev;
+
+	queue->min_buffers_needed = 2;
+
+	ret = vb2_queue_init(queue);
+	if (ret) {
+		v4l2_err(v4l2_dev, "failed to initialize vb2 queue: %d\n", ret);
+		goto error_media_entity;
+	}
+
+	/* V4L2 Format */
+
+	format->type = queue->type;
+	pix_format->pixelformat = sun6i_csi_capture_formats[0].pixelformat;
+	pix_format->width = 640;
+	pix_format->height = 480;
+
+	sun6i_csi_capture_format_prepare(format);
+
+	/* Video Device */
+
+	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
+		sizeof(video_dev->name));
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				 V4L2_CAP_STREAMING;
+	video_dev->vfl_dir = VFL_DIR_RX;
+	video_dev->release = video_device_release_empty;
+	video_dev->fops = &sun6i_csi_capture_fops;
+	video_dev->ioctl_ops = &sun6i_csi_capture_ioctl_ops;
+	video_dev->v4l2_dev = v4l2_dev;
+	video_dev->queue = queue;
+	video_dev->lock = lock;
+
+	video_set_drvdata(video_dev, csi_dev);
+
+	ret = video_register_device(video_dev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		v4l2_err(v4l2_dev, "failed to register video device: %d\n",
+			 ret);
+		goto error_media_entity;
+	}
+
+	v4l2_info(v4l2_dev, "device %s registered as %s\n", video_dev->name,
+		  video_device_node_name(video_dev));
+
+	/* Media Pad Link */
+
+	ret = media_create_pad_link(&subdev->entity, 1, &video_dev->entity, 0,
+				    csi_dev->isp_available ? 0 :
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret < 0) {
+		v4l2_err(v4l2_dev, "failed to create %s:%u -> %s:%u link\n",
+			 subdev->entity.name, 1, video_dev->entity.name, 0);
+		goto error_video_device;
+	}
+
+	state->setup = true;
+
+	return 0;
+
+error_video_device:
+	vb2_video_unregister_device(video_dev);
+
+error_media_entity:
+	media_entity_cleanup(&video_dev->entity);
+
+error_mutex:
+	mutex_destroy(lock);
+
+	return ret;
+}
+
+void sun6i_csi_capture_cleanup(struct sun6i_csi_device *csi_dev)
+{
+	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
+	struct video_device *video_dev = &csi_dev->capture.video_dev;
+	struct mutex *lock = &csi_dev->capture.lock;
+
+	/* This may happen if async registration failed to complete. */
+	if (!state->setup)
+		return;
+
+	vb2_video_unregister_device(video_dev);
+	media_entity_cleanup(&video_dev->entity);
+	mutex_destroy(lock);
+}
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
new file mode 100644
index 000000000000..74545df2e536
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_CSI_VIDEO_H_
+#define _SUN6I_CSI_VIDEO_H_
+
+#include <media/v4l2-device.h>
+
+#define SUN6I_CSI_CAPTURE_NAME	"sun6i-csi-capture"
+
+struct sun6i_csi_device;
+
+struct sun6i_csi_capture_format {
+	u32	pixelformat;
+	u8	output_format_field;
+	u8	output_format_frame;
+	bool	input_yuv_seq_invert;
+	bool	input_format_raw;
+	u32	hsize_len_factor;
+};
+
+struct sun6i_csi_capture_format_match {
+	u32	pixelformat;
+	u32	mbus_code;
+};
+
+#undef current
+struct sun6i_csi_capture_state {
+	struct list_head		queue;
+	spinlock_t			lock; /* Queue and buffers lock. */
+
+	struct sun6i_csi_buffer		*pending;
+	struct sun6i_csi_buffer		*current;
+	struct sun6i_csi_buffer		*complete;
+
+	unsigned int			sequence;
+	bool				streaming;
+	bool				setup;
+};
+
+struct sun6i_csi_capture {
+	struct video_device		video_dev;
+	struct vb2_queue		queue;
+	struct mutex			lock; /* Queue lock. */
+	struct media_pad		pad;
+
+	struct v4l2_format		format;
+
+	struct sun6i_csi_capture_state	state;
+};
+
+void sun6i_csi_capture_dimensions(struct sun6i_csi_device *csi_dev,
+				  unsigned int *width, unsigned int *height);
+void sun6i_csi_capture_format(struct sun6i_csi_device *csi_dev,
+			      u32 *pixelformat, u32 *field);
+
+const
+struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat);
+
+void sun6i_csi_capture_configure(struct sun6i_csi_device *csi_dev);
+
+void sun6i_csi_capture_sync(struct sun6i_csi_device *csi_dev);
+void sun6i_csi_capture_frame_done(struct sun6i_csi_device *csi_dev);
+void sun6i_csi_capture_state_cleanup(struct sun6i_csi_device *csi_dev,
+				     bool error);
+void sun6i_csi_capture_state_update(struct sun6i_csi_device *csi_dev);
+int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev);
+void sun6i_csi_capture_cleanup(struct sun6i_csi_device *csi_dev);
+
+#endif
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
new file mode 100644
index 000000000000..eac2a38bab65
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
@@ -0,0 +1,182 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#ifndef _SUN6I_CSI_REG_H_
+#define _SUN6I_CSI_REG_H_
+
+#include <linux/kernel.h>
+
+#define SUN6I_CSI_ADDR_VALUE(a)			((a) >> 2)
+
+#define SUN6I_CSI_EN_REG			0x0
+#define SUN6I_CSI_EN_VER_EN			BIT(30)
+#define SUN6I_CSI_EN_PTN_CYCLE(v)		(((v) << 16) & GENMASK(23, 16))
+#define SUN6I_CSI_EN_SRAM_PWDN			BIT(8)
+#define SUN6I_CSI_EN_PTN_START			BIT(4)
+#define SUN6I_CSI_EN_CLK_CNT_SPL_VSYNC		BIT(3)
+#define SUN6I_CSI_EN_CLK_CNT_EN			BIT(2)
+#define SUN6I_CSI_EN_PTN_GEN_EN			BIT(1)
+#define SUN6I_CSI_EN_CSI_EN			BIT(0)
+
+/* Note that Allwinner manuals and code invert positive/negative definitions. */
+
+#define SUN6I_CSI_IF_CFG_REG			0x4
+#define SUN6I_CSI_IF_CFG_FIELD_DT_PCLK_SHIFT(v)	(((v) << 24) & GENMASK(27, 24))
+#define SUN6I_CSI_IF_CFG_SRC_TYPE_PROGRESSIVE	(0 << 21)
+#define SUN6I_CSI_IF_CFG_SRC_TYPE_INTERLACED	(1 << 21)
+#define SUN6I_CSI_IF_CFG_FPS_DS			BIT(20)
+#define SUN6I_CSI_IF_CFG_FIELD_POSITIVE		(0 << 19)
+#define SUN6I_CSI_IF_CFG_FIELD_NEGATIVE		(1 << 19)
+#define SUN6I_CSI_IF_CFG_VREF_POL_POSITIVE	(0 << 18)
+#define SUN6I_CSI_IF_CFG_VREF_POL_NEGATIVE	(1 << 18)
+#define SUN6I_CSI_IF_CFG_HREF_POL_POSITIVE	(0 << 17)
+#define SUN6I_CSI_IF_CFG_HREF_POL_NEGATIVE	(1 << 17)
+#define SUN6I_CSI_IF_CFG_CLK_POL_FALLING	(0 << 16)
+#define SUN6I_CSI_IF_CFG_CLK_POL_RISING		(1 << 16)
+#define SUN6I_CSI_IF_CFG_FIELD_DT_FIELD_VSYNC	(0 << 14)
+#define SUN6I_CSI_IF_CFG_FIELD_DT_FIELD		(1 << 14)
+#define SUN6I_CSI_IF_CFG_FIELD_DT_VSYNC		(2 << 14)
+#define SUN6I_CSI_IF_CFG_DATA_WIDTH_8		(0 << 8)
+#define SUN6I_CSI_IF_CFG_DATA_WIDTH_10		(1 << 8)
+#define SUN6I_CSI_IF_CFG_DATA_WIDTH_12		(2 << 8)
+#define SUN6I_CSI_IF_CFG_DATA_WIDTH_8_PLUS_2	(3 << 8)
+#define SUN6I_CSI_IF_CFG_DATA_WIDTH_2_TIMES_8	(4 << 8)
+#define SUN6I_CSI_IF_CFG_IF_CSI			(0 << 7)
+#define SUN6I_CSI_IF_CFG_IF_MIPI		(1 << 7)
+#define SUN6I_CSI_IF_CFG_IF_CSI_YUV_RAW		(0 << 0)
+#define SUN6I_CSI_IF_CFG_IF_CSI_YUV_COMBINED	(1 << 0)
+#define SUN6I_CSI_IF_CFG_IF_CSI_BT656		(4 << 0)
+#define SUN6I_CSI_IF_CFG_IF_CSI_BT1120		(5 << 0)
+
+#define SUN6I_CSI_CAP_REG			0x8
+#define SUN6I_CSI_CAP_MASK(v)			(((v) << 2) & GENMASK(5, 2))
+#define SUN6I_CSI_CAP_VCAP_ON			BIT(1)
+#define SUN6I_CSI_CAP_SCAP_ON			BIT(0)
+
+#define SUN6I_CSI_SYNC_CNT_REG			0xc
+#define SUN6I_CSI_FIFO_THRS_REG			0x10
+#define SUN6I_CSI_BT656_HEAD_CFG_REG		0x14
+
+#define SUN6I_CSI_PTN_LEN_REG			0x30
+#define SUN6I_CSI_PTN_ADDR_REG			0x34
+#define SUN6I_CSI_VER_REG			0x3c
+
+#define SUN6I_CSI_CH_CFG_REG			0x44
+#define SUN6I_CSI_CH_CFG_PAD_VAL(v)		(((v) << 24) & GENMASK(31, 24))
+#define SUN6I_CSI_CH_CFG_INPUT_FMT(v)		(((v) << 20) & GENMASK(23, 20))
+#define SUN6I_CSI_CH_CFG_OUTPUT_FMT(v)		(((v) << 16) & GENMASK(19, 16))
+#define SUN6I_CSI_CH_CFG_VFLIP_EN		BIT(13)
+#define SUN6I_CSI_CH_CFG_HFLIP_EN		BIT(12)
+#define SUN6I_CSI_CH_CFG_FIELD_SEL_FIELD0	(0 << 10)
+#define SUN6I_CSI_CH_CFG_FIELD_SEL_FIELD1	(1 << 10)
+#define SUN6I_CSI_CH_CFG_FIELD_SEL_EITHER	(2 << 10)
+#define SUN6I_CSI_CH_CFG_INPUT_YUV_SEQ(v)	(((v) << 8) & GENMASK(9, 8))
+
+#define SUN6I_CSI_INPUT_FMT_RAW			0
+#define SUN6I_CSI_INPUT_FMT_YUV422		3
+#define SUN6I_CSI_INPUT_FMT_YUV420		4
+
+/* Note that Allwinner manuals and code invert frame/field definitions. */
+
+/* RAW */
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8	0
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10	1
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12	2
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565	4
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_RGB888	5
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_PRGB888	6
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8	8
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10	9
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12	10
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565	12
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_RGB888	13
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_PRGB888	14
+
+/* YUV */
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P	0
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P	1
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P	2
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P	3
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP	4
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP	5
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP	6
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP	7
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422MB	8
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB	9
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB	10
+#define SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422MB	11
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP_10	12
+#define SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP_10	13
+
+/* YUV Planar */
+#define SUN6I_CSI_INPUT_YUV_SEQ_YUYV		0
+#define SUN6I_CSI_INPUT_YUV_SEQ_YVYU		1
+#define SUN6I_CSI_INPUT_YUV_SEQ_UYVY		2
+#define SUN6I_CSI_INPUT_YUV_SEQ_VYUY		3
+
+/* YUV Semi-planar */
+#define SUN6I_CSI_INPUT_YUV_SEQ_UV		0
+#define SUN6I_CSI_INPUT_YUV_SEQ_VU		1
+
+#define SUN6I_CSI_CH_SCALE_REG			0x4c
+#define SUN6I_CSI_CH_SCALE_QUART_EN		BIT(0)
+
+#define SUN6I_CSI_CH_FIFO0_ADDR_REG		0x50
+#define SUN6I_CSI_CH_FIFO1_ADDR_REG		0x58
+#define SUN6I_CSI_CH_FIFO2_ADDR_REG		0x60
+
+#define SUN6I_CSI_CH_STA_REG			0x6c
+#define SUN6I_CSI_CH_STA_FIELD			BIT(2)
+#define SUN6I_CSI_CH_STA_VCAP			BIT(1)
+#define SUN6I_CSI_CH_STA_SCAP			BIT(0)
+
+#define SUN6I_CSI_CH_INT_EN_REG			0x70
+#define SUN6I_CSI_CH_INT_EN_VS			BIT(7)
+#define SUN6I_CSI_CH_INT_EN_HB_OF		BIT(6)
+#define SUN6I_CSI_CH_INT_EN_MUL_ERR		BIT(5)
+#define SUN6I_CSI_CH_INT_EN_FIFO2_OF		BIT(4)
+#define SUN6I_CSI_CH_INT_EN_FIFO1_OF		BIT(3)
+#define SUN6I_CSI_CH_INT_EN_FIFO0_OF		BIT(2)
+#define SUN6I_CSI_CH_INT_EN_FD			BIT(1)
+#define SUN6I_CSI_CH_INT_EN_CD			BIT(0)
+
+#define SUN6I_CSI_CH_INT_STA_REG		0x74
+#define SUN6I_CSI_CH_INT_STA_CLEAR		0xff
+#define SUN6I_CSI_CH_INT_STA_VS			BIT(7)
+#define SUN6I_CSI_CH_INT_STA_HB_OF		BIT(6)
+#define SUN6I_CSI_CH_INT_STA_MUL_ERR		BIT(5)
+#define SUN6I_CSI_CH_INT_STA_FIFO2_OF		BIT(4)
+#define SUN6I_CSI_CH_INT_STA_FIFO1_OF		BIT(3)
+#define SUN6I_CSI_CH_INT_STA_FIFO0_OF		BIT(2)
+#define SUN6I_CSI_CH_INT_STA_FD			BIT(1)
+#define SUN6I_CSI_CH_INT_STA_CD			BIT(0)
+
+#define SUN6I_CSI_CH_FLD1_VSIZE_REG		0x78
+#define SUN6I_CSI_CH_FLD1_VSIZE_VER_LEN(v)	(((v) << 16) & GENMASK(28, 16))
+#define SUN6I_CSI_CH_FLD1_VSIZE_VER_START(v)	((v) & GENMASK(12, 0))
+
+#define SUN6I_CSI_CH_HSIZE_REG			0x80
+#define SUN6I_CSI_CH_HSIZE_LEN(v)		(((v) << 16) & GENMASK(28, 16))
+#define SUN6I_CSI_CH_HSIZE_START(v)		((v) & GENMASK(12, 0))
+
+#define SUN6I_CSI_CH_VSIZE_REG			0x84
+#define SUN6I_CSI_CH_VSIZE_LEN(v)		(((v) << 16) & GENMASK(28, 16))
+#define SUN6I_CSI_CH_VSIZE_START(v)		((v) & GENMASK(12, 0))
+
+#define SUN6I_CSI_CH_BUF_LEN_REG		0x88
+#define SUN6I_CSI_CH_BUF_LEN_CHROMA_LINE(v)	(((v) << 16) & GENMASK(29, 16))
+#define SUN6I_CSI_CH_BUF_LEN_LUMA_LINE(v)	((v) & GENMASK(13, 0))
+
+#define SUN6I_CSI_CH_FLIP_SIZE_REG		0x8c
+#define SUN6I_CSI_CH_FLIP_SIZE_VER_LEN(v)	(((v) << 16) & GENMASK(28, 16))
+#define SUN6I_CSI_CH_FLIP_SIZE_VALID_LEN(v)	((v) & GENMASK(12, 0))
+
+#define SUN6I_CSI_CH_FRM_CLK_CNT_REG		0x90
+#define SUN6I_CSI_CH_ACC_ITNL_CLK_CNT_REG	0x94
+#define SUN6I_CSI_CH_FIFO_STAT_REG		0x98
+#define SUN6I_CSI_CH_PCLK_STAT_REG		0x9c
+
+#endif
-- 
2.32.0

