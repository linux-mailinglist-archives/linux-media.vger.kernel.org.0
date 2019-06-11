Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 620B53D6B3
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407501AbfFKTVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 15:21:19 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:37624 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404789AbfFKTVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:17 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5421FC0181;
        Tue, 11 Jun 2019 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560280877; bh=KhhiRqXkf5ctF86vIkedbkfMFhI6srPmGkJCZf93fmU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KU20dEt4fA4nepxkIlnXsDKoQUpJlBMWp4R1xCPJvzrWkvqHbgEBIjSRPudPpkLZx
         G5EFbWRbywfQhkniEb3a35iHTvhQ/drI0DNFTt/ml6HomkkPqh3wjej4PG/2gpbfUn
         33ODGZcDzyCXKGtga4O+ZNrjNBPI6Ep7NlWx/Nl6XqFEkUrlHtllxBnZoF/ZTV14KO
         KwVqOyMyXjr9Zy/Qye2CHsi9xdnpc9D+UxwAubVBZSsPf9CoisfKZi/sVUlQ4V6tuo
         IIGkSp3c2/yzuo4MvmZlid2IPBzUpFX8LZDzSFN7qV18bMI2LBRtqaP8iy7+Ifwcv3
         52xAhNJlilygw==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id C5569A0060;
        Tue, 11 Jun 2019 19:21:14 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id 9CE5E3F89A;
        Tue, 11 Jun 2019 21:21:14 +0200 (CEST)
From:   Luis Oliveira <Luis.Oliveira@synopsys.com>
To:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 2/6] media: platform: dwc: Add MIPI CSI-2 controller driver
Date:   Tue, 11 Jun 2019 21:20:51 +0200
Message-Id: <1560280855-18085-3-git-send-email-luis.oliveira@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the Synopsys MIPI CSI-2 controller driver. This
controller driver is divided in platform functions and core functions.
This way it serves as platform for future DesignWare drivers.

Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
v3-v4
- fix v4l2_fwnode_endpoint bad initialization @eugen
- removed extra lines and fixed coding style issues

 MAINTAINERS                               |   8 +
 drivers/media/platform/Kconfig            |   1 +
 drivers/media/platform/Makefile           |   2 +
 drivers/media/platform/dwc/Kconfig        |  19 +
 drivers/media/platform/dwc/Makefile       |   9 +
 drivers/media/platform/dwc/dw-csi-plat.c  | 475 +++++++++++++++++++++++
 drivers/media/platform/dwc/dw-csi-plat.h  |  97 +++++
 drivers/media/platform/dwc/dw-csi-sysfs.c | 624 ++++++++++++++++++++++++++++++
 drivers/media/platform/dwc/dw-mipi-csi.c  | 569 +++++++++++++++++++++++++++
 drivers/media/platform/dwc/dw-mipi-csi.h  | 287 ++++++++++++++
 include/media/dwc/dw-mipi-csi-pltfrm.h    | 104 +++++
 11 files changed, 2195 insertions(+)
 create mode 100644 drivers/media/platform/dwc/Kconfig
 create mode 100644 drivers/media/platform/dwc/Makefile
 create mode 100644 drivers/media/platform/dwc/dw-csi-plat.c
 create mode 100644 drivers/media/platform/dwc/dw-csi-plat.h
 create mode 100644 drivers/media/platform/dwc/dw-csi-sysfs.c
 create mode 100644 drivers/media/platform/dwc/dw-mipi-csi.c
 create mode 100644 drivers/media/platform/dwc/dw-mipi-csi.h
 create mode 100644 include/media/dwc/dw-mipi-csi-pltfrm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 16a97ba..6ffe4fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15187,6 +15187,14 @@ S:	Maintained
 F:	drivers/dma/dwi-axi-dmac/
 F:	Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
 
+SYNOPSYS DESIGNWARE MIPI DPHY CSI-2 HOST DRIVER
+M:	Luis Oliveira <luis.oliveira@synopsys.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/platform/dwc
+F:	Documentation/devicetree/bindings/media/snps,dw-csi.txt
+
 SYNOPSYS DESIGNWARE DMAC DRIVER
 M:	Viresh Kumar <vireshk@kernel.org>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 8a19654..b6fb139 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -147,6 +147,7 @@ source "drivers/media/platform/xilinx/Kconfig"
 source "drivers/media/platform/rcar-vin/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
+source "drivers/media/platform/dwc/Kconfig"
 
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd92..4807caf 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -101,3 +101,5 @@ obj-y					+= meson/
 obj-y					+= cros-ec-cec/
 
 obj-$(CONFIG_VIDEO_SUN6I_CSI)		+= sunxi/sun6i-csi/
+
+obj-y					+= dwc/
diff --git a/drivers/media/platform/dwc/Kconfig b/drivers/media/platform/dwc/Kconfig
new file mode 100644
index 0000000..508ac21
--- /dev/null
+++ b/drivers/media/platform/dwc/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+#  Synopsys DWC Platform drivers
+#	Drivers here are currently for MIPI CSI-2 support
+
+config DWC_MIPI_CSI2_HOST
+	tristate "Synopsys DesignWare CSI-2 Host Controller support"
+	select VIDEO_DEV
+	select VIDEO_V4L2
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This selects the DesignWare MIPI CSI-2 host controller support. This
+	  controller gives access to control a CSI-2 receiver acting as a V4L2
+	  subdevice.
+
+	  If you have a controller with this interface, say Y.
+
+	   If unsure, say N.
diff --git a/drivers/media/platform/dwc/Makefile b/drivers/media/platform/dwc/Makefile
new file mode 100644
index 0000000..057f137
--- /dev/null
+++ b/drivers/media/platform/dwc/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for Synopsys DWC Platform drivers
+#
+dw-csi-objs := dw-csi-plat.o dw-mipi-csi.o
+ifeq ($(CONFIG_DWC_MIPI_TC_DPHY_GEN3),y)
+	dw-csi-objs += dw-csi-sysfs.o
+endif
+obj-$(CONFIG_DWC_MIPI_CSI2_HOST) += dw-csi.o
diff --git a/drivers/media/platform/dwc/dw-csi-plat.c b/drivers/media/platform/dwc/dw-csi-plat.c
new file mode 100644
index 0000000..9828d55
--- /dev/null
+++ b/drivers/media/platform/dwc/dw-csi-plat.c
@@ -0,0 +1,475 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Synopsys DesignWare MIPI CSI-2 Host controller driver.
+ * Platform driver
+ *
+ * Author: Luis Oliveira <luis.oliveira@synopsys.com>
+ */
+
+#include <media/dwc/dw-dphy-data.h>
+
+#include "dw-csi-plat.h"
+
+const struct mipi_dt csi_dt[] = {
+	{
+		.hex = CSI_2_YUV420_8,
+		.name = "YUV420_8bits",
+	}, {
+		.hex = CSI_2_YUV420_10,
+		.name = "YUV420_10bits",
+	}, {
+		.hex = CSI_2_YUV420_8_LEG,
+		.name = "YUV420_8bits_LEGACY",
+	}, {
+		.hex = CSI_2_YUV420_8_SHIFT,
+		.name = "YUV420_8bits_SHIFT",
+	}, {
+		.hex = CSI_2_YUV420_10_SHIFT,
+		.name = "YUV420_10bits_SHIFT",
+	}, {
+		.hex = CSI_2_YUV422_8,
+		.name = "YUV442_8bits",
+	}, {
+		.hex = CSI_2_YUV422_10,
+		.name = "YUV442_10bits",
+	}, {
+		.hex = CSI_2_RGB444,
+		.name = "RGB444",
+	}, {
+		.hex = CSI_2_RGB555,
+		.name = "RGB555",
+	}, {
+		.hex = CSI_2_RGB565,
+		.name = "RGB565",
+	}, {
+		.hex = CSI_2_RGB666,
+		.name = "RGB666",
+	}, {
+		.hex = CSI_2_RGB888,
+		.name = "RGB888",
+	}, {
+		.hex = CSI_2_RAW6,
+		.name = "RAW6",
+	}, {
+		.hex = CSI_2_RAW7,
+		.name = "RAW7",
+	}, {
+		.hex = CSI_2_RAW8,
+		.name = "RAW8",
+	}, {
+		.hex = CSI_2_RAW10,
+		.name = "RAW10",
+	}, {
+		.hex = CSI_2_RAW12,
+		.name = "RAW12",
+	}, {
+		.hex = CSI_2_RAW14,
+		.name = "RAW14",
+	}, {
+		.hex = CSI_2_RAW16,
+		.name = "RAW16",
+	},
+};
+
+static struct mipi_fmt *
+find_dw_mipi_csi_format(struct v4l2_mbus_framefmt *mf)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dw_mipi_csi_formats); i++)
+		if (mf->code == dw_mipi_csi_formats[i].mbus_code)
+			return &dw_mipi_csi_formats[i];
+
+	return NULL;
+}
+
+static int dw_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(dw_mipi_csi_formats))
+		return -EINVAL;
+
+	if (code->index != 0)
+		return -EINVAL;
+
+	code->code = dw_mipi_csi_formats[code->index].mbus_code;
+	return 0;
+}
+
+static struct mipi_fmt *
+dw_mipi_csi_try_format(struct v4l2_mbus_framefmt *mf)
+{
+	struct mipi_fmt *fmt;
+
+	fmt = find_dw_mipi_csi_format(mf);
+	if (!fmt)
+		fmt = &dw_mipi_csi_formats[0];
+
+	mf->code = fmt->mbus_code;
+
+	return fmt;
+}
+
+static struct v4l2_mbus_framefmt *
+dw_mipi_csi_get_format(struct dw_csi *dev, struct v4l2_subdev_pad_config *cfg,
+		       enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return cfg ? v4l2_subdev_get_try_format(&dev->sd,
+							cfg,
+							0) : NULL;
+	dev_dbg(dev->dev,
+		"%s got v4l2_mbus_pixelcode. 0x%x\n", __func__,
+		dev->format.code);
+	dev_dbg(dev->dev,
+		"%s got width. 0x%x\n", __func__,
+		dev->format.width);
+	dev_dbg(dev->dev,
+		"%s got height. 0x%x\n", __func__,
+		dev->format.height);
+	return &dev->format;
+}
+
+static int
+dw_mipi_csi_set_fmt(struct v4l2_subdev *sd,
+		    struct v4l2_subdev_pad_config *cfg,
+		    struct v4l2_subdev_format *fmt)
+{
+	struct dw_csi *dev = sd_to_mipi_csi_dev(sd);
+	struct mipi_fmt *dev_fmt;
+	struct v4l2_mbus_framefmt *mf = dw_mipi_csi_get_format(dev, cfg,
+							       fmt->which);
+	int i;
+
+	dev_fmt = dw_mipi_csi_try_format(&fmt->format);
+
+	if (dev_fmt) {
+		*mf = fmt->format;
+		if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+			dev->fmt = dev_fmt;
+		dev->fmt->mbus_code = mf->code;
+		dw_mipi_csi_set_ipi_fmt(dev);
+	}
+
+	if (fmt->format.width > 0 && fmt->format.height > 0) {
+		dw_mipi_csi_fill_timings(dev, fmt);
+	} else {
+		dev_vdbg(dev->dev, "%s unacceptable values 0x%x.\n",
+			 __func__, fmt->format.width);
+		dev_vdbg(dev->dev, "%s unacceptable values 0x%x.\n",
+			 __func__, fmt->format.height);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(csi_dt); i++)
+		if (csi_dt[i].hex == dev->ipi_dt) {
+			dev_vdbg(dev->dev, "Using data type %s\n",
+				 csi_dt[i].name);
+		}
+	return 0;
+}
+
+static int
+dw_mipi_csi_get_fmt(struct v4l2_subdev *sd,
+		    struct v4l2_subdev_pad_config *cfg,
+		    struct v4l2_subdev_format *fmt)
+{
+	struct dw_csi *dev = sd_to_mipi_csi_dev(sd);
+	struct v4l2_mbus_framefmt *mf;
+
+	mf = dw_mipi_csi_get_format(dev, cfg, fmt->which);
+	if (!mf)
+		return -EINVAL;
+
+	mutex_lock(&dev->lock);
+	fmt->format = *mf;
+	mutex_unlock(&dev->lock);
+
+	return 0;
+}
+
+static int
+dw_mipi_csi_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct dw_csi *dev = sd_to_mipi_csi_dev(sd);
+
+	dev_vdbg(dev->dev, "%s: on=%d\n", __func__, on);
+
+	if (on) {
+		dw_mipi_csi_hw_stdby(dev);
+		dw_mipi_csi_start(dev);
+	} else {
+		phy_power_off(dev->phy);
+		dw_mipi_csi_mask_irq_power_off(dev);
+		/* reset data type */
+		dev->ipi_dt = 0x0;
+	}
+	return 0;
+}
+
+static int
+dw_mipi_csi_log_status(struct v4l2_subdev *sd)
+{
+	struct dw_csi *dev = sd_to_mipi_csi_dev(sd);
+
+	dw_mipi_csi_dump(dev);
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_VIDEO_ADV_DEBUG)
+static int
+dw_mipi_csi_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
+{
+	struct dw_csi *dev = sd_to_mipi_csi_dev(sd);
+
+	dev_vdbg(dev->dev, "%s: reg=%llu\n", __func__, reg->reg);
+	reg->val = dw_mipi_csi_read(dev, reg->reg);
+
+	return 0;
+}
+#endif
+static int dw_mipi_csi_init_cfg(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_mbus_framefmt *format =
+	    v4l2_subdev_get_try_format(sd, cfg, 0);
+
+	format->colorspace = V4L2_COLORSPACE_SRGB;
+	format->code = MEDIA_BUS_FMT_RGB888_1X24;
+	format->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static struct v4l2_subdev_core_ops dw_mipi_csi_core_ops = {
+	.s_power = dw_mipi_csi_s_power,
+	.log_status = dw_mipi_csi_log_status,
+#if IS_ENABLED(CONFIG_VIDEO_ADV_DEBUG)
+	.g_register = dw_mipi_csi_g_register,
+#endif
+};
+
+static struct v4l2_subdev_pad_ops dw_mipi_csi_pad_ops = {
+	.init_cfg = dw_mipi_csi_init_cfg,
+	.enum_mbus_code = dw_mipi_csi_enum_mbus_code,
+	.get_fmt = dw_mipi_csi_get_fmt,
+	.set_fmt = dw_mipi_csi_set_fmt,
+};
+
+static struct v4l2_subdev_ops dw_mipi_csi_subdev_ops = {
+	.core = &dw_mipi_csi_core_ops,
+	.pad = &dw_mipi_csi_pad_ops,
+};
+
+static irqreturn_t dw_mipi_csi_irq1(int irq, void *dev_id)
+{
+	struct dw_csi *csi_dev = dev_id;
+
+	dw_mipi_csi_irq_handler(csi_dev);
+
+	return IRQ_HANDLED;
+}
+
+static int
+dw_mipi_csi_parse_dt(struct platform_device *pdev, struct dw_csi *dev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
+	int ret = 0;
+
+	if (of_property_read_u32(node, "snps,output-type",
+				 &dev->hw.output))
+		dev->hw.output = 2;
+
+	node = of_graph_get_next_endpoint(node, NULL);
+	if (!node) {
+		dev_err(&pdev->dev, "No port node at %pOF\n",
+			pdev->dev.of_node);
+		return -EINVAL;
+	}
+	/* Get port node and validate MIPI-CSI channel id. */
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &ep);
+	if (ret)
+		goto err;
+
+	dev->index = ep.base.port - 1;
+	if (dev->index >= CSI_MAX_ENTITIES) {
+		ret = -ENXIO;
+		goto err;
+	}
+	dev->hw.num_lanes = ep.bus.mipi_csi2.num_data_lanes;
+err:
+	of_node_put(node);
+	return ret;
+}
+
+static const struct of_device_id dw_mipi_csi_of_match[];
+
+static int dw_csi_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id = NULL;
+	struct device *dev = &pdev->dev;
+	struct resource *res = NULL;
+	struct dw_csi *csi;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	dev_vdbg(dev, "Probing started\n");
+
+	/* Resource allocation */
+	csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
+	if (!csi)
+		return -ENOMEM;
+
+	mutex_init(&csi->lock);
+	spin_lock_init(&csi->slock);
+	csi->dev = dev;
+
+	of_id = of_match_node(dw_mipi_csi_of_match, dev->of_node);
+	if (!of_id)
+		return -EINVAL;
+
+	ret = dw_mipi_csi_parse_dt(pdev, csi);
+	if (ret < 0)
+		return ret;
+
+	csi->phy = devm_of_phy_get(dev, dev->of_node, NULL);
+	if (IS_ERR(csi->phy)) {
+		dev_err(dev, "No DPHY available\n");
+		return PTR_ERR(csi->phy);
+	}
+	/* Registers mapping */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	csi->base_address = devm_ioremap_resource(dev, res);
+	if (IS_ERR(csi->base_address)) {
+		dev_err(dev, "Base address not set.\n");
+		return PTR_ERR(csi->base_address);
+	}
+
+	csi->ctrl_irq_number = platform_get_irq(pdev, 0);
+	if (csi->ctrl_irq_number < 0) {
+		dev_err(dev, "irq number %d not set.\n", csi->ctrl_irq_number);
+		ret = csi->ctrl_irq_number;
+		goto end;
+	}
+
+	csi->rst = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(csi->rst)) {
+		dev_err(dev, "error getting reset control %d\n", ret);
+		return PTR_ERR(csi->rst);
+	}
+
+	ret = devm_request_irq(dev, csi->ctrl_irq_number,
+			       dw_mipi_csi_irq1, IRQF_SHARED,
+			       dev_name(dev), csi);
+	if (ret) {
+		dev_err(dev, "irq csi %s failed\n", of_id->name);
+
+		goto end;
+	}
+
+	sd = &csi->sd;
+	v4l2_subdev_init(sd, &dw_mipi_csi_subdev_ops);
+	csi->sd.owner = THIS_MODULE;
+
+	snprintf(sd->name, sizeof(sd->name), "%s.%d",
+		 "dw-csi", csi->index);
+
+	csi->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi->fmt = &dw_mipi_csi_formats[0];
+	csi->format.code = dw_mipi_csi_formats[0].mbus_code;
+
+	sd->entity.function = MEDIA_ENT_F_IO_V4L;
+	csi->pads[CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	csi->pads[CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&csi->sd.entity,
+				     CSI_PADS_NUM, csi->pads);
+
+	dev_vdbg(dev, "v4l2.name: %s\n", csi->v4l2_dev.name);
+
+	if (ret < 0) {
+		dev_err(dev, "media entity init failed\n");
+		goto end;
+	}
+
+	v4l2_set_subdevdata(&csi->sd, pdev);
+	platform_set_drvdata(pdev, &csi->sd);
+	dev_set_drvdata(dev, sd);
+
+	if (csi->rst)
+		reset_control_deassert(csi->rst);
+#if IS_ENABLED(CONFIG_DWC_MIPI_TC_DPHY_GEN3)
+	dw_csi_create_capabilities_sysfs(pdev);
+#endif
+	dw_mipi_csi_get_version(csi);
+	dw_mipi_csi_specific_mappings(csi);
+	dw_mipi_csi_mask_irq_power_off(csi);
+
+	dev_info(dev, "DW MIPI CSI-2 Host registered successfully HW v%u.%u\n",
+		 csi->hw_version_major, csi->hw_version_minor);
+
+	phy_init(csi->phy);
+
+	return 0;
+
+end:
+	media_entity_cleanup(&csi->sd.entity);
+	v4l2_device_unregister(csi->vdev.v4l2_dev);
+
+	return ret;
+}
+
+/**
+ * @short Exit routine - Exit point of the driver
+ * @param[in] pdev pointer to the platform device structure
+ * @return 0 on success
+ */
+static int dw_csi_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *mipi_csi = sd_to_mipi_csi_dev(sd);
+
+	dev_dbg(&pdev->dev, "Removing MIPI CSI-2 module\n");
+
+	if (mipi_csi->rst)
+		reset_control_assert(mipi_csi->rst);
+	media_entity_cleanup(&mipi_csi->sd.entity);
+
+	return 0;
+}
+
+/**
+ * @short of_device_id structure
+ */
+static const struct of_device_id dw_mipi_csi_of_match[] = {
+	{ .compatible = "snps,dw-csi" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dw_mipi_csi_of_match);
+
+/**
+ * @short Platform driver structure
+ */
+static struct platform_driver dw_mipi_csi_driver = {
+	.remove = dw_csi_remove,
+	.probe = dw_csi_probe,
+	.driver = {
+		.name = "dw-csi",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(dw_mipi_csi_of_match),
+	},
+};
+
+module_platform_driver(dw_mipi_csi_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Luis Oliveira <luis.oliveira@synopsys.com>");
+MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Host Platform driver");
diff --git a/drivers/media/platform/dwc/dw-csi-plat.h b/drivers/media/platform/dwc/dw-csi-plat.h
new file mode 100644
index 0000000..e322592
--- /dev/null
+++ b/drivers/media/platform/dwc/dw-csi-plat.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 Synopsys, Inc.
+ *
+ * Synopsys DesignWare MIPI CSI-2 Host controller driver.
+ * Supported bus formats
+ *
+ * Author: Luis Oliveira <Luis.Oliveira@synopsys.com>
+ */
+
+#ifndef _DW_CSI_PLAT_H__
+#define _DW_CSI_PLAT_H__
+
+#include "dw-mipi-csi.h"
+
+/* Video formats supported by the MIPI CSI-2 */
+struct mipi_fmt dw_mipi_csi_formats[] = {
+	{
+		/* RAW 8 */
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+	}, {
+		/* RAW 10 */
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+	}, {
+		/* RAW 12 */
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+	}, {
+		/* RAW 14 */
+		.mbus_code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.depth = 14,
+	}, {
+		/* RAW 16 */
+		.mbus_code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.depth = 16,
+	}, {
+		/* RGB 666 */
+		.mbus_code = MEDIA_BUS_FMT_RGB666_1X18,
+		.depth = 18,
+	}, {
+		/* RGB 565 */
+		.mbus_code = MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.depth = 16,
+	}, {
+		/* BGR 565 */
+		.mbus_code = MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.depth = 16,
+	}, {
+		/* RGB 555 */
+		.mbus_code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
+		.depth = 16,
+	}, {
+		/* BGR 555 */
+		.mbus_code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
+		.depth = 16,
+	}, {
+		/* RGB 444 */
+		.mbus_code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE,
+		.depth = 16,
+	}, {
+		/* RGB 444 */
+		.mbus_code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE,
+		.depth = 16,
+	}, {
+		/* RGB 888 */
+		.mbus_code = MEDIA_BUS_FMT_RGB888_2X12_LE,
+		.depth = 24,
+	}, {
+		/* BGR 888 */
+		.mbus_code = MEDIA_BUS_FMT_RGB888_2X12_BE,
+		.depth = 24,
+	}, {
+		/* BGR 888 */
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+	}, {
+		/* YUV 422 8-bit */
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+	}, {
+		/* YUV 422 10-bit */
+		.mbus_code = MEDIA_BUS_FMT_VYUY10_2X10,
+		.depth = 20,
+	}, {
+		/* YUV 420 8-bit LEGACY */
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+	}, {
+		/* YUV 420 10-bit */
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+	},
+};
+
+#endif	/* _DW_CSI_PLAT_H__ */
diff --git a/drivers/media/platform/dwc/dw-csi-sysfs.c b/drivers/media/platform/dwc/dw-csi-sysfs.c
new file mode 100644
index 0000000..e8d2bb9
--- /dev/null
+++ b/drivers/media/platform/dwc/dw-csi-sysfs.c
@@ -0,0 +1,624 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Synopsys DesignWare MIPI CSI-2 Host controller driver.
+ * SysFS components for the platform driver
+ *
+ * Author: Luis Oliveira <Luis.Oliveira@synopsys.com>
+ */
+
+#include "dw-mipi-csi.h"
+
+static ssize_t core_version_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "v.%d.%d*\n", csi_dev->hw_version_major,
+		 csi_dev->hw_version_minor);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t n_lanes_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	int ret;
+	unsigned long lanes;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 10, &lanes);
+	if (ret < 0)
+		return ret;
+
+	if (lanes > 8) {
+		dev_err(dev, "Invalid number of lanes %lu\n", lanes);
+		return count;
+	}
+
+	dev_info(dev, "Lanes %lu\n", lanes);
+	csi_dev->hw.num_lanes = lanes;
+
+	return count;
+}
+
+static ssize_t n_lanes_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%d\n", csi_dev->hw.num_lanes);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t core_reset_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	/* Reset Controller and DPHY */
+	phy_reset(csi_dev->phy);
+	dw_mipi_csi_reset(csi_dev);
+
+	snprintf(buffer, 10, "Reset\n");
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t data_type_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	int ret;
+	unsigned long dt;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &dt);
+	if (ret < 0)
+		return ret;
+
+	if (dt < 0x18 || dt > 0x2F) {
+		dev_err(dev, "Invalid data type %lx\n", dt);
+		return count;
+	}
+
+	dev_info(dev, "Data type 0x%lx\n", dt);
+	csi_dev->ipi_dt = dt;
+
+	return count;
+}
+
+static ssize_t data_type_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->ipi_dt);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t hsa_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long hsa;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &hsa);
+	if (ret < 0)
+		return ret;
+
+	if (hsa > 0xFFF) {
+		dev_err(dev, "Invalid HSA time %lx\n", hsa);
+		return count;
+	}
+
+	dev_info(dev, "HSA time 0x%lx\n", hsa);
+	csi_dev->hw.hsa = hsa;
+
+	return count;
+}
+
+static ssize_t hsa_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->hw.hsa);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t hbp_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long hbp;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &hbp);
+	if (ret < 0)
+		return ret;
+
+	if (hbp > 0xFFF) {
+		dev_err(dev, "Invalid HBP time %lx\n", hbp);
+		return count;
+	}
+
+	dev_info(dev, "HBP time 0x%lx\n", hbp);
+	csi_dev->hw.hbp = hbp;
+
+	return count;
+}
+
+static ssize_t hbp_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->hw.hbp);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t hsd_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long hsd;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &hsd);
+	if (ret < 0)
+		return ret;
+
+	if (hsd > 0xFF) {
+		dev_err(dev, "Invalid HSD time %lx\n", hsd);
+		return count;
+	}
+
+	dev_info(dev, "HSD time 0x%lx\n", hsd);
+	csi_dev->hw.hsd = hsd;
+
+	return count;
+}
+
+static ssize_t hsd_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->hw.hsd);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t vsa_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long vsa;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &vsa);
+	if (ret < 0)
+		return ret;
+
+	if (vsa > 0x3FF) {
+		dev_err(dev, "Invalid VSA period %lx\n", vsa);
+		return count;
+	}
+
+	dev_info(dev, "VSA period 0x%lx\n", vsa);
+	csi_dev->hw.vsa = vsa;
+
+	return count;
+}
+
+static ssize_t vsa_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->hw.vsa);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t vbp_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long vbp;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &vbp);
+	if (ret < 0)
+		return ret;
+
+	if (vbp > 0x2FF) {
+		dev_err(dev, "Invalid VBP period %lx\n", vbp);
+		return count;
+	}
+
+	dev_info(dev, "VBP period 0x%lx\n", vbp);
+	csi_dev->hw.vbp = vbp;
+
+	return count;
+}
+
+static ssize_t vbp_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->hw.vbp);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t vfp_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long vfp;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 16, &vfp);
+	if (ret < 0)
+		return ret;
+
+	if (vfp > 0x3ff) {
+		dev_err(dev, "Invalid VFP period %lx\n", vfp);
+		return count;
+	}
+
+	dev_info(dev, "VFP period 0x%lx\n", vfp);
+	csi_dev->hw.vfp = vfp;
+
+	return count;
+}
+
+static ssize_t vfp_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%x\n", csi_dev->hw.vfp);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t virtual_channel_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	int ret;
+	unsigned long virtual_ch;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 10, &virtual_ch);
+	if (ret < 0)
+		return ret;
+
+	if ((signed int)virtual_ch < 0 || (signed int)virtual_ch > 8) {
+		dev_err(dev, "Invalid Virtual Channel %lu\n", virtual_ch);
+		return count;
+	}
+
+	dev_info(dev, "Virtual Channel %lu\n", virtual_ch);
+	csi_dev->hw.virtual_ch = virtual_ch;
+
+	return count;
+}
+
+static ssize_t virtual_channel_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%d\n", csi_dev->hw.virtual_ch);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t ipi_color_mode_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	int ret;
+	unsigned long ipi_color_mode;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 10, &ipi_color_mode);
+	if (ret < 0)
+		return ret;
+
+	if ((signed int)ipi_color_mode < 0 || (signed int)ipi_color_mode > 1) {
+		dev_err(dev,
+			"Wrong Color Mode %lu, (48 bits -> 0 or 16 bits -> 1\n",
+			ipi_color_mode);
+		return count;
+	}
+
+	dev_info(dev, "IPI Color mode %lu\n", ipi_color_mode);
+	csi_dev->hw.ipi_color_mode = ipi_color_mode;
+
+	return count;
+}
+
+static ssize_t ipi_color_mode_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%d\n", csi_dev->hw.ipi_color_mode);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t ipi_auto_flush_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	int ret;
+	unsigned long ipi_auto_flush;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 10, &ipi_auto_flush);
+	if (ret < 0)
+		return ret;
+
+	if ((signed int)ipi_auto_flush < 0 || (signed int)ipi_auto_flush > 1) {
+		dev_err(dev,
+			"Invalid Auto Flush Mode %lu, (No -> 0 or Yes -> 1\n",
+			ipi_auto_flush);
+		return count;
+	}
+
+	dev_info(dev, "IPI Auto Flush %lu\n", ipi_auto_flush);
+	csi_dev->hw.ipi_auto_flush = ipi_auto_flush;
+
+	return count;
+}
+
+static ssize_t ipi_auto_flush_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%d\n", csi_dev->hw.ipi_auto_flush);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t ipi_timings_mode_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	int ret;
+	unsigned long ipi_mode;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 10, &ipi_mode);
+	if (ret < 0)
+		return ret;
+
+	if ((signed int)ipi_mode < 0 || (signed int)ipi_mode > 1) {
+		dev_err(dev,
+			"Invalid Timing Source %lu (Camera:0|Controller:1)\n",
+			ipi_mode);
+		return count;
+	}
+
+	dev_info(dev, "IPI Color mode %lu\n", ipi_mode);
+	csi_dev->hw.ipi_mode = ipi_mode;
+
+	return count;
+}
+
+static ssize_t ipi_timings_mode_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%d\n", csi_dev->hw.ipi_mode);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static ssize_t output_type_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	int ret;
+	unsigned long output;
+
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	ret = kstrtoul(buf, 10, &output);
+	if (ret < 0)
+		return ret;
+
+	if ((signed int)output < 0 || (signed int)output > 1) {
+		dev_err(dev,
+			"Invalid Core output %lu to be used \
+			(IPI-> 0 or IDI->1 or BOTH- 2\n",
+			output);
+		return count;
+	}
+
+	dev_info(dev, "IPI Color mode %lu\n", output);
+	csi_dev->hw.output = output;
+
+	return count;
+}
+
+static ssize_t output_type_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
+
+	char buffer[10];
+
+	snprintf(buffer, 10, "%d\n", csi_dev->hw.output);
+
+	return strlcpy(buf, buffer, PAGE_SIZE);
+}
+
+static DEVICE_ATTR_RO(core_version);
+static DEVICE_ATTR_RO(core_reset);
+static DEVICE_ATTR_RW(n_lanes);
+static DEVICE_ATTR_RW(data_type);
+static DEVICE_ATTR_RW(hsa);
+static DEVICE_ATTR_RW(hbp);
+static DEVICE_ATTR_RW(hsd);
+static DEVICE_ATTR_RW(vsa);
+static DEVICE_ATTR_RW(vbp);
+static DEVICE_ATTR_RW(vfp);
+static DEVICE_ATTR_RW(virtual_channel);
+static DEVICE_ATTR_RW(ipi_color_mode);
+static DEVICE_ATTR_RW(ipi_auto_flush);
+static DEVICE_ATTR_RW(ipi_timings_mode);
+static DEVICE_ATTR_RW(output_type);
+
+int dw_csi_create_capabilities_sysfs(struct platform_device *pdev)
+{
+	device_create_file(&pdev->dev, &dev_attr_core_version);
+	device_create_file(&pdev->dev, &dev_attr_core_reset);
+	device_create_file(&pdev->dev, &dev_attr_n_lanes);
+	device_create_file(&pdev->dev, &dev_attr_data_type);
+	device_create_file(&pdev->dev, &dev_attr_hsa);
+	device_create_file(&pdev->dev, &dev_attr_hbp);
+	device_create_file(&pdev->dev, &dev_attr_hsd);
+	device_create_file(&pdev->dev, &dev_attr_vsa);
+	device_create_file(&pdev->dev, &dev_attr_vbp);
+	device_create_file(&pdev->dev, &dev_attr_vfp);
+	device_create_file(&pdev->dev, &dev_attr_virtual_channel);
+	device_create_file(&pdev->dev, &dev_attr_ipi_color_mode);
+	device_create_file(&pdev->dev, &dev_attr_ipi_auto_flush);
+	device_create_file(&pdev->dev, &dev_attr_ipi_timings_mode);
+	device_create_file(&pdev->dev, &dev_attr_output_type);
+
+	return 0;
+}
diff --git a/drivers/media/platform/dwc/dw-mipi-csi.c b/drivers/media/platform/dwc/dw-mipi-csi.c
new file mode 100644
index 0000000..d01418d
--- /dev/null
+++ b/drivers/media/platform/dwc/dw-mipi-csi.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Synopsys DesignWare MIPI CSI-2 Host controller driver
+ * Core MIPI CSI-2 functions
+ *
+ * Author: Luis Oliveira <Luis.Oliveira@synopsys.com>
+ */
+
+#include "dw-mipi-csi.h"
+
+static struct R_CSI2 reg = {
+	.VERSION = 0x00,
+	.N_LANES = 0x04,
+	.CTRL_RESETN = 0x08,
+	.INTERRUPT = 0x0C,
+	.DATA_IDS_1 = 0x10,
+	.DATA_IDS_2 = 0x14,
+	.IPI_MODE = 0x80,
+	.IPI_VCID = 0x84,
+	.IPI_DATA_TYPE = 0x88,
+	.IPI_MEM_FLUSH = 0x8C,
+	.IPI_HSA_TIME = 0x90,
+	.IPI_HBP_TIME = 0x94,
+	.IPI_HSD_TIME = 0x98,
+	.IPI_HLINE_TIME = 0x9C,
+	.IPI_SOFTRSTN = 0xA0,
+	.IPI_ADV_FEATURES = 0xAC,
+	.IPI_VSA_LINES = 0xB0,
+	.IPI_VBP_LINES = 0xB4,
+	.IPI_VFP_LINES = 0xB8,
+	.IPI_VACTIVE_LINES = 0xBC,
+	.INT_PHY_FATAL = 0xe0,
+	.MASK_INT_PHY_FATAL = 0xe4,
+	.FORCE_INT_PHY_FATAL = 0xe8,
+	.INT_PKT_FATAL = 0xf0,
+	.MASK_INT_PKT_FATAL = 0xf4,
+	.FORCE_INT_PKT_FATAL = 0xf8,
+	.INT_PHY = 0x110,
+	.MASK_INT_PHY = 0x114,
+	.FORCE_INT_PHY = 0x118,
+	.INT_LINE = 0x130,
+	.MASK_INT_LINE = 0x134,
+	.FORCE_INT_LINE = 0x138,
+	.INT_IPI = 0x140,
+	.MASK_INT_IPI = 0x144,
+	.FORCE_INT_IPI = 0x148,
+};
+
+struct interrupt_type csi_int = {
+	.PHY_FATAL = BIT(0),
+	.PKT_FATAL = BIT(1),
+	.PHY = BIT(16),
+};
+
+#define dw_print(VAR) \
+	dev_info(csi_dev->dev, "%s: 0x%x: %X\n", "#VAR#",\
+	VAR, dw_mipi_csi_read(csi_dev, VAR))
+
+void dw_mipi_csi_write_part(struct dw_csi *dev, u32 address, u32 data,
+			    u8 shift, u8 width)
+{
+	u32 mask = (1 << width) - 1;
+	u32 temp = dw_mipi_csi_read(dev, address);
+
+	temp &= ~(mask << shift);
+	temp |= (data & mask) << shift;
+	dw_mipi_csi_write(dev, address, temp);
+}
+
+void dw_mipi_csi_reset(struct dw_csi *csi_dev)
+{
+	dw_mipi_csi_write(csi_dev, reg.CTRL_RESETN, 0);
+	usleep_range(100, 200);
+	dw_mipi_csi_write(csi_dev, reg.CTRL_RESETN, 1);
+}
+
+int dw_mipi_csi_mask_irq_power_off(struct dw_csi *csi_dev)
+{
+	if (csi_dev->hw_version_major == 1) {
+		/* set only one lane (lane 0) as active (ON) */
+		dw_mipi_csi_write(csi_dev, reg.N_LANES, 0);
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_PHY_FATAL, 0);
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_PKT_FATAL, 0);
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_PHY, 0);
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_LINE, 0);
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_IPI, 0);
+
+		/* only for version 1.30 */
+		if (csi_dev->hw_version_minor == 30)
+			dw_mipi_csi_write(csi_dev,
+					  reg.MASK_INT_FRAME_FATAL, 0);
+
+		dw_mipi_csi_write(csi_dev, reg.CTRL_RESETN, 0);
+
+		/* only for version 1.40 */
+		if (csi_dev->hw_version_minor == 40) {
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_BNDRY_FRAME_FATAL, 0);
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_SEQ_FRAME_FATAL, 0);
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_CRC_FRAME_FATAL, 0);
+			dw_mipi_csi_write(csi_dev, reg.MSK_PLD_CRC_FATAL, 0);
+			dw_mipi_csi_write(csi_dev, reg.MSK_DATA_ID, 0);
+			dw_mipi_csi_write(csi_dev, reg.MSK_ECC_CORRECT, 0);
+		}
+	}
+
+	return 0;
+}
+
+int dw_mipi_csi_hw_stdby(struct dw_csi *csi_dev)
+{
+	if (csi_dev->hw_version_major == 1) {
+		/* set only one lane (lane 0) as active (ON) */
+		dw_mipi_csi_reset(csi_dev);
+		dw_mipi_csi_write(csi_dev, reg.N_LANES, 0);
+		phy_init(csi_dev->phy);
+
+		/* only for version 1.30 */
+		if (csi_dev->hw_version_minor == 30)
+			dw_mipi_csi_write(csi_dev,
+					  reg.MASK_INT_FRAME_FATAL,
+					  GENMASK(31, 0));
+
+		/* common */
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_PHY_FATAL,
+				  GENMASK(8, 0));
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_PKT_FATAL,
+				  GENMASK(1, 0));
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_PHY, GENMASK(23, 0));
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_LINE, GENMASK(23, 0));
+		dw_mipi_csi_write(csi_dev, reg.MASK_INT_IPI, GENMASK(5, 0));
+
+		/* only for version 1.40 */
+		if (csi_dev->hw_version_minor == 40) {
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_BNDRY_FRAME_FATAL,
+					  GENMASK(31, 0));
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_SEQ_FRAME_FATAL,
+					  GENMASK(31, 0));
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_CRC_FRAME_FATAL,
+					  GENMASK(31, 0));
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_PLD_CRC_FATAL,
+					  GENMASK(31, 0));
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_DATA_ID, GENMASK(31, 0));
+			dw_mipi_csi_write(csi_dev,
+					  reg.MSK_ECC_CORRECT, GENMASK(31, 0));
+		}
+	}
+	return 0;
+}
+
+void dw_mipi_csi_set_ipi_fmt(struct dw_csi *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+
+	if (csi_dev->ipi_dt) {
+		dw_mipi_csi_write(csi_dev, reg.IPI_DATA_TYPE, csi_dev->ipi_dt);
+		switch (csi_dev->ipi_dt) {
+		case CSI_2_YUV420_8:
+		case CSI_2_YUV420_8_LEG:
+		case CSI_2_YUV420_8_SHIFT:
+		break;
+		case CSI_2_YUV420_10:
+		case CSI_2_YUV420_10_SHIFT:
+		break;
+		}
+	} else {
+		switch (csi_dev->fmt->mbus_code) {
+		/* RGB 666 */
+		case MEDIA_BUS_FMT_RGB666_1X18:
+		csi_dev->ipi_dt =  CSI_2_RGB666;
+		break;
+		/* RGB 565 */
+		case MEDIA_BUS_FMT_RGB565_2X8_BE:
+		case MEDIA_BUS_FMT_RGB565_2X8_LE:
+		csi_dev->ipi_dt = CSI_2_RGB565;
+		break;
+		/* RGB 555 */
+		case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
+		case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
+		csi_dev->ipi_dt = CSI_2_RGB555;
+		break;
+		/* RGB 444 */
+		case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
+		case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
+		csi_dev->ipi_dt = CSI_2_RGB444;
+		break;
+		/* RGB 888 */
+		break;
+		case MEDIA_BUS_FMT_RGB888_2X12_LE:
+		case MEDIA_BUS_FMT_RGB888_2X12_BE:
+		csi_dev->ipi_dt = CSI_2_RGB888;
+		break;
+		/* RAW 10 */
+		case MEDIA_BUS_FMT_SBGGR10_1X10:
+		case MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE:
+		csi_dev->ipi_dt = CSI_2_RAW10;
+		break;
+		/* RAW 12 */
+		case MEDIA_BUS_FMT_SBGGR12_1X12:
+		csi_dev->ipi_dt = CSI_2_RAW12;
+		break;
+		/* RAW 14 */
+		case MEDIA_BUS_FMT_SBGGR14_1X14:
+		csi_dev->ipi_dt = CSI_2_RAW14;
+		break;
+		/* RAW 16 */
+		case MEDIA_BUS_FMT_SBGGR16_1X16:
+		csi_dev->ipi_dt = CSI_2_RAW16;
+		break;
+		/* RAW 8 */
+		case MEDIA_BUS_FMT_SBGGR8_1X8:
+		csi_dev->ipi_dt = CSI_2_RAW8;
+		break;
+		/* YUV 422 8-bit */
+		case MEDIA_BUS_FMT_YVYU8_2X8:
+		csi_dev->ipi_dt = CSI_2_RAW8;
+		break;
+		/* YUV 422 10-bit */
+		case MEDIA_BUS_FMT_VYUY8_1X16:
+		csi_dev->ipi_dt = CSI_2_YUV422_8;
+		break;
+		/* YUV 420 8-bit LEGACY */
+		case MEDIA_BUS_FMT_Y8_1X8:
+		csi_dev->ipi_dt = CSI_2_RAW8;
+		break;
+		/* YUV 420 10-bit */
+		case MEDIA_BUS_FMT_Y10_1X10:
+		csi_dev->ipi_dt = CSI_2_RAW8;
+		break;
+		default:
+		break;
+		}
+		dw_mipi_csi_write(csi_dev, reg.IPI_DATA_TYPE, csi_dev->ipi_dt);
+	}
+	dev_info(dev, "Selected IPI Data Type 0x%X\n", csi_dev->ipi_dt);
+}
+
+void dw_mipi_csi_fill_timings(struct dw_csi *dev,
+			      struct v4l2_subdev_format *fmt)
+{
+	/* expected values */
+	dev->hw.virtual_ch = 0;
+	dev->hw.ipi_color_mode = COLOR48;
+	dev->hw.ipi_auto_flush = 1;
+	dev->hw.ipi_mode = CAMERA_TIMING;
+	dev->hw.ipi_cut_through = CTINACTIVE;
+	dev->hw.ipi_adv_features = LINE_EVENT_SELECTION(EVSELAUTO);
+	dev->hw.htotal = fmt->format.width + dev->hw.hsa +
+			 dev->hw.hbp + dev->hw.hsd;
+	dev->hw.vactive = fmt->format.height;
+	dev->hw.output = 2;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		dev_dbg(dev->dev, "*********** timings *********\n");
+		dev_dbg(dev->dev, "Horizontal Sync Active: %d\n", dev->hw.hsa);
+		dev_dbg(dev->dev, "Horizontal Back Porch: %d\n", dev->hw.hbp);
+		dev_dbg(dev->dev, "Horizontal Width: %d\n", fmt->format.width);
+		dev_dbg(dev->dev, "Horizontal Total: %d\n", dev->hw.htotal);
+		dev_dbg(dev->dev, "Vertical Sync Active: %d\n", dev->hw.vsa);
+		dev_dbg(dev->dev, "Vertical Back Porch: %d\n", dev->hw.vbp);
+		dev_dbg(dev->dev, "Vertical Front Porch: %d\n", dev->hw.vfp);
+		dev_dbg(dev->dev, "Vertical Active: %d\n", dev->hw.vactive);
+	}
+}
+
+void dw_mipi_csi_start(struct dw_csi *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+
+	dw_mipi_csi_write(csi_dev, reg.N_LANES, (csi_dev->hw.num_lanes - 1));
+	dev_info(dev, "number of lanes: %d\n", csi_dev->hw.num_lanes);
+
+	/* IPI Related Configuration */
+	if (csi_dev->hw.output == IPI_OUT || csi_dev->hw.output == BOTH_OUT) {
+		if (csi_dev->hw_version_major >= 1) {
+			if (csi_dev->hw_version_minor >= 20)
+				dw_mipi_csi_write(csi_dev,
+						  reg.IPI_ADV_FEATURES,
+						  csi_dev->hw.ipi_adv_features);
+			if (csi_dev->hw_version_minor >= 30)
+				dw_mipi_csi_write(csi_dev,
+						  reg.IPI_SOFTRSTN, 0x1);
+		}
+		/*  address | data, | shift | width */
+		dw_mipi_csi_write_part(csi_dev, reg.IPI_MODE, 1, 24, 1);
+		dw_mipi_csi_write_part(csi_dev,
+				       reg.IPI_MODE,
+				       csi_dev->hw.ipi_mode,
+				       0, 1);
+		if (csi_dev->hw.ipi_mode == CAMERA_TIMING) {
+			dw_mipi_csi_write(csi_dev,
+					  reg.IPI_ADV_FEATURES,
+					  LINE_EVENT_SELECTION(EVSELPROG) |
+					  EN_VIDEO |
+					  EN_LINE_START |
+					  EN_NULL |
+					  EN_BLANKING |
+					  EN_EMBEDDED);
+		}
+		dw_mipi_csi_write_part(csi_dev,
+				       reg.IPI_MODE,
+				       csi_dev->hw.ipi_color_mode,
+				       8, 1);
+		dw_mipi_csi_write_part(csi_dev,
+				       reg.IPI_MODE,
+				       csi_dev->hw.ipi_cut_through,
+				       16, 1);
+		dw_mipi_csi_write_part(csi_dev,
+				       reg.IPI_VCID,
+				       csi_dev->hw.virtual_ch,
+				       0, 2);
+		dw_mipi_csi_write_part(csi_dev,
+				       reg.IPI_MEM_FLUSH,
+				       csi_dev->hw.ipi_auto_flush,
+				       8, 1);
+
+		dev_vdbg(dev, "*********** config *********\n");
+		dev_vdbg(dev, "IPI enable: %s\n",
+			 csi_dev->hw.output ? "YES" : "NO");
+		dev_vdbg(dev, "video mode transmission type: %s timming\n",
+			 csi_dev->hw.ipi_mode ? "controller" : "camera");
+		dev_vdbg(dev, "Color Mode: %s\n",
+			 csi_dev->hw.ipi_color_mode ? "16 bits" : "48 bits");
+		dev_vdbg(dev, "Cut Through Mode: %s\n",
+			 csi_dev->hw.ipi_cut_through ? "enable" : "disable");
+		dev_vdbg(dev, "Virtual Channel: %d\n",
+			 csi_dev->hw.virtual_ch);
+		dev_vdbg(dev, "Auto-flush: %d\n",
+			 csi_dev->hw.ipi_auto_flush);
+		dw_mipi_csi_write(csi_dev, reg.IPI_SOFTRSTN, 1);
+
+		if (csi_dev->hw.ipi_mode == AUTO_TIMING)
+			phy_power_on(csi_dev->phy);
+
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_HSA_TIME, csi_dev->hw.hsa);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_HBP_TIME, csi_dev->hw.hbp);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_HSD_TIME, csi_dev->hw.hsd);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_HLINE_TIME, csi_dev->hw.htotal);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_VSA_LINES, csi_dev->hw.vsa);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_VBP_LINES, csi_dev->hw.vbp);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_VFP_LINES, csi_dev->hw.vfp);
+		dw_mipi_csi_write(csi_dev,
+				  reg.IPI_VACTIVE_LINES, csi_dev->hw.vactive);
+	}
+	phy_power_on(csi_dev->phy);
+}
+
+int dw_mipi_csi_irq_handler(struct dw_csi *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+	u32 global_int_status, i_sts;
+	unsigned long flags;
+
+	spin_lock_irqsave(&csi_dev->slock, flags);
+	global_int_status = dw_mipi_csi_read(csi_dev, reg.INTERRUPT);
+
+	if (global_int_status & csi_int.PHY_FATAL) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_PHY_FATAL);
+		dev_err_ratelimited(dev, "int %08X: PHY FATAL: %08X\n",
+				    reg.INT_PHY_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.PKT_FATAL) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_PKT_FATAL);
+		dev_err_ratelimited(dev, "int %08X: PKT FATAL: %08X\n",
+				    reg.INT_PKT_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.FRAME_FATAL &&
+	    csi_dev->hw_version_major == 1 &&
+	    csi_dev->hw_version_minor == 30) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_FRAME_FATAL);
+		dev_err_ratelimited(dev, "int %08X: FRAME FATAL: %08X\n",
+				    reg.INT_FRAME_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.PHY) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_PHY);
+		dev_err_ratelimited(dev, "int %08X: PHY: %08X\n",
+				    reg.INT_PHY, i_sts);
+	}
+
+	if (global_int_status & csi_int.PKT &&
+	    csi_dev->hw_version_major == 1 &&
+	    csi_dev->hw_version_minor <= 30) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_PKT);
+		dev_err_ratelimited(dev, "int %08X: PKT: %08X\n",
+				    reg.INT_PKT, i_sts);
+	}
+
+	if (global_int_status & csi_int.LINE) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_LINE);
+		dev_err_ratelimited(dev, "int %08X: LINE: %08X\n",
+				    reg.INT_LINE, i_sts);
+	}
+
+	if (global_int_status & csi_int.IPI) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.INT_IPI);
+		dev_err_ratelimited(dev, "int %08X: IPI: %08X\n",
+				    reg.INT_IPI, i_sts);
+	}
+
+	if (global_int_status & csi_int.BNDRY_FRAME_FATAL) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.ST_BNDRY_FRAME_FATAL);
+		dev_err_ratelimited(dev,
+				    "int %08X: ST_BNDRY_FRAME_FATAL: %08X\n",
+				    reg.ST_BNDRY_FRAME_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.SEQ_FRAME_FATAL) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.ST_SEQ_FRAME_FATAL);
+		dev_err_ratelimited(dev,
+				    "int %08X: ST_SEQ_FRAME_FATAL: %08X\n",
+				    reg.ST_SEQ_FRAME_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.CRC_FRAME_FATAL) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.ST_CRC_FRAME_FATAL);
+		dev_err_ratelimited(dev,
+				    "int %08X: ST_CRC_FRAME_FATAL: %08X\n",
+				    reg.ST_CRC_FRAME_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.PLD_CRC_FATAL) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.ST_PLD_CRC_FATAL);
+		dev_err_ratelimited(dev,
+				    "int %08X: ST_PLD_CRC_FATAL: %08X\n",
+				    reg.ST_PLD_CRC_FATAL, i_sts);
+	}
+
+	if (global_int_status & csi_int.DATA_ID) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.ST_DATA_ID);
+		dev_err_ratelimited(dev, "int %08X: ST_DATA_ID: %08X\n",
+				    reg.ST_DATA_ID, i_sts);
+	}
+
+	if (global_int_status & csi_int.ECC_CORRECTED) {
+		i_sts = dw_mipi_csi_read(csi_dev, reg.ST_ECC_CORRECT);
+		dev_err_ratelimited(dev, "int %08X: ST_ECC_CORRECT: %08X\n",
+				    reg.ST_ECC_CORRECT, i_sts);
+	}
+
+	spin_unlock_irqrestore(&csi_dev->slock, flags);
+
+	return 1;
+}
+
+void dw_mipi_csi_get_version(struct dw_csi *csi_dev)
+{
+	u32 hw_version;
+
+	hw_version = dw_mipi_csi_read(csi_dev, reg.VERSION);
+	csi_dev->hw_version_major = (u8)((hw_version >> 24) - '0');
+	csi_dev->hw_version_minor = (u8)((hw_version >> 16) - '0');
+	csi_dev->hw_version_minor = csi_dev->hw_version_minor * 10;
+	csi_dev->hw_version_minor += (u8)((hw_version >> 8) - '0');
+}
+
+int dw_mipi_csi_specific_mappings(struct dw_csi *csi_dev)
+{
+	struct device *dev = csi_dev->dev;
+
+	if (csi_dev->hw_version_major == 1) {
+		if (csi_dev->hw_version_minor == 30) {
+			/*
+			 * Hardware registers that were
+			 * exclusive to version < 1.40
+			 */
+			reg.INT_FRAME_FATAL = 0x100;
+			reg.MASK_INT_FRAME_FATAL = 0x104;
+			reg.FORCE_INT_FRAME_FATAL = 0x108;
+			reg.INT_PKT = 0x120;
+			reg.MASK_INT_PKT = 0x124;
+			reg.FORCE_INT_PKT = 0x128;
+
+			/* interrupt source present until this release */
+			csi_int.PKT = BIT(17);
+			csi_int.LINE = BIT(18);
+			csi_int.IPI = BIT(19);
+			csi_int.FRAME_FATAL = BIT(2);
+
+		} else if (csi_dev->hw_version_minor == 40) {
+			/*
+			 * HW registers that were added
+			 * to version 1.40
+			 */
+			reg.ST_BNDRY_FRAME_FATAL = 0x280;
+			reg.MSK_BNDRY_FRAME_FATAL = 0x284;
+			reg.FORCE_BNDRY_FRAME_FATAL = 0x288;
+			reg.ST_SEQ_FRAME_FATAL = 0x290;
+			reg.MSK_SEQ_FRAME_FATAL	= 0x294;
+			reg.FORCE_SEQ_FRAME_FATAL = 0x298;
+			reg.ST_CRC_FRAME_FATAL = 0x2a0;
+			reg.MSK_CRC_FRAME_FATAL	= 0x2a4;
+			reg.FORCE_CRC_FRAME_FATAL = 0x2a8;
+			reg.ST_PLD_CRC_FATAL = 0x2b0;
+			reg.MSK_PLD_CRC_FATAL = 0x2b4;
+			reg.FORCE_PLD_CRC_FATAL = 0x2b8;
+			reg.ST_DATA_ID = 0x2c0;
+			reg.MSK_DATA_ID = 0x2c4;
+			reg.FORCE_DATA_ID = 0x2c8;
+			reg.ST_ECC_CORRECT = 0x2d0;
+			reg.MSK_ECC_CORRECT = 0x2d4;
+			reg.FORCE_ECC_CORRECT = 0x2d8;
+			reg.DATA_IDS_VC_1 = 0x0;
+			reg.DATA_IDS_VC_2 = 0x0;
+			reg.VC_EXTENSION = 0x0;
+
+			/* interrupts map were changed */
+			csi_int.LINE = BIT(17);
+			csi_int.IPI = BIT(18);
+			csi_int.BNDRY_FRAME_FATAL = BIT(2);
+			csi_int.SEQ_FRAME_FATAL	= BIT(3);
+			csi_int.CRC_FRAME_FATAL = BIT(4);
+			csi_int.PLD_CRC_FATAL = BIT(5);
+			csi_int.DATA_ID = BIT(6);
+			csi_int.ECC_CORRECTED = BIT(7);
+
+		} else {
+			dev_info(dev, "Version minor not supported.");
+		}
+	} else {
+		dev_info(dev, "Version major not supported.");
+	}
+	return 0;
+}
+
+void dw_mipi_csi_dump(struct dw_csi *csi_dev)
+{
+	dw_print(reg.VERSION);
+	dw_print(reg.N_LANES);
+	dw_print(reg.CTRL_RESETN);
+	dw_print(reg.INTERRUPT);
+	dw_print(reg.DATA_IDS_1);
+	dw_print(reg.DATA_IDS_2);
+	dw_print(reg.IPI_MODE);
+	dw_print(reg.IPI_VCID);
+	dw_print(reg.IPI_DATA_TYPE);
+	dw_print(reg.IPI_MEM_FLUSH);
+	dw_print(reg.IPI_HSA_TIME);
+	dw_print(reg.IPI_HBP_TIME);
+	dw_print(reg.IPI_HSD_TIME);
+	dw_print(reg.IPI_HLINE_TIME);
+	dw_print(reg.IPI_SOFTRSTN);
+	dw_print(reg.IPI_ADV_FEATURES);
+	dw_print(reg.IPI_VSA_LINES);
+	dw_print(reg.IPI_VBP_LINES);
+	dw_print(reg.IPI_VFP_LINES);
+	dw_print(reg.IPI_VACTIVE_LINES);
+	dw_print(reg.IPI_DATA_TYPE);
+	dw_print(reg.VERSION);
+	dw_print(reg.IPI_ADV_FEATURES);
+}
diff --git a/drivers/media/platform/dwc/dw-mipi-csi.h b/drivers/media/platform/dwc/dw-mipi-csi.h
new file mode 100644
index 0000000..6df3688
--- /dev/null
+++ b/drivers/media/platform/dwc/dw-mipi-csi.h
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Synopsys DesignWare MIPI CSI-2 Host controller driver
+ *
+ * Author: Luis Oliveira <Luis.Oliveira@synopsys.com>
+ */
+
+#ifndef _DW_MIPI_CSI_H__
+#define _DW_MIPI_CSI_H__
+
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/phy/phy.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/ratelimit.h>
+#include <linux/reset.h>
+#include <linux/videodev2.h>
+#include <linux/wait.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/dwc/dw-mipi-csi-pltfrm.h>
+
+/* Advanced features */
+#define IPI_DT_OVERWRITE BIT(0)
+#define DATA_TYPE_OVERWRITE(dt) (((dt) & GENMASK(5, 0)) << 8)
+#define LINE_EVENT_SELECTION(n) ((n) << 16)
+
+enum line_event {
+	EVSELAUTO = 0,
+	EVSELPROG = 1,
+};
+
+#define EN_VIDEO BIT(17)
+#define EN_LINE_START BIT(18)
+#define EN_NULL BIT(19)
+#define EN_BLANKING BIT(20)
+#define EN_EMBEDDED BIT(21)
+#define IPI_SYNC_EVENT_MODE(n) ((n) << 24)
+
+enum sync_event {
+	SYNCEVFSN = 0,
+	SYNCEVFS = 1,
+};
+
+/* DW MIPI CSI-2 register addresses*/
+
+struct R_CSI2 {
+	u16 VERSION;
+	u16 N_LANES;
+	u16 CTRL_RESETN;
+	u16 INTERRUPT;
+	u16 DATA_IDS_1;
+	u16 DATA_IDS_2;
+	u16 DATA_IDS_VC_1;
+	u16 DATA_IDS_VC_2;
+	u16 IPI_MODE;
+	u16 IPI_VCID;
+	u16 IPI_DATA_TYPE;
+	u16 IPI_MEM_FLUSH;
+	u16 IPI_HSA_TIME;
+	u16 IPI_HBP_TIME;
+	u16 IPI_HSD_TIME;
+	u16 IPI_HLINE_TIME;
+	u16 IPI_SOFTRSTN;
+	u16 IPI_ADV_FEATURES;
+	u16 IPI_VSA_LINES;
+	u16 IPI_VBP_LINES;
+	u16 IPI_VFP_LINES;
+	u16 IPI_VACTIVE_LINES;
+	u16 VC_EXTENSION;
+	u16 INT_PHY_FATAL;
+	u16 MASK_INT_PHY_FATAL;
+	u16 FORCE_INT_PHY_FATAL;
+	u16 INT_PKT_FATAL;
+	u16 MASK_INT_PKT_FATAL;
+	u16 FORCE_INT_PKT_FATAL;
+	u16 INT_FRAME_FATAL;
+	u16 MASK_INT_FRAME_FATAL;
+	u16 FORCE_INT_FRAME_FATAL;
+	u16 INT_PHY;
+	u16 MASK_INT_PHY;
+	u16 FORCE_INT_PHY;
+	u16 INT_PKT;
+	u16 MASK_INT_PKT;
+	u16 FORCE_INT_PKT;
+	u16 INT_LINE;
+	u16 MASK_INT_LINE;
+	u16 FORCE_INT_LINE;
+	u16 INT_IPI;
+	u16 MASK_INT_IPI;
+	u16 FORCE_INT_IPI;
+	u16 ST_BNDRY_FRAME_FATAL;
+	u16 MSK_BNDRY_FRAME_FATAL;
+	u16 FORCE_BNDRY_FRAME_FATAL;
+	u16 ST_SEQ_FRAME_FATAL;
+	u16 MSK_SEQ_FRAME_FATAL;
+	u16 FORCE_SEQ_FRAME_FATAL;
+	u16 ST_CRC_FRAME_FATAL;
+	u16 MSK_CRC_FRAME_FATAL;
+	u16 FORCE_CRC_FRAME_FATAL;
+	u16 ST_PLD_CRC_FATAL;
+	u16 MSK_PLD_CRC_FATAL;
+	u16 FORCE_PLD_CRC_FATAL;
+	u16 ST_DATA_ID;
+	u16 MSK_DATA_ID;
+	u16 FORCE_DATA_ID;
+	u16 ST_ECC_CORRECT;
+	u16 MSK_ECC_CORRECT;
+	u16 FORCE_ECC_CORRECT;
+};
+
+/* Interrupt Masks */
+struct interrupt_type {
+	u32 PHY_FATAL;
+	u32 PKT_FATAL;
+	u32 FRAME_FATAL;
+	u32 PHY;
+	u32 PKT;
+	u32 LINE;
+	u32 IPI;
+	u32 BNDRY_FRAME_FATAL;
+	u32 SEQ_FRAME_FATAL;
+	u32 CRC_FRAME_FATAL;
+	u32 PLD_CRC_FATAL;
+	u32 DATA_ID;
+	u32 ECC_CORRECTED;
+};
+
+/* IPI Data Types */
+enum data_type {
+	CSI_2_YUV420_8 = 0x18,
+	CSI_2_YUV420_10 = 0x19,
+	CSI_2_YUV420_8_LEG = 0x1A,
+	CSI_2_YUV420_8_SHIFT = 0x1C,
+	CSI_2_YUV420_10_SHIFT = 0x1D,
+	CSI_2_YUV422_8 = 0x1E,
+	CSI_2_YUV422_10 = 0x1F,
+	CSI_2_RGB444 = 0x20,
+	CSI_2_RGB555 = 0x21,
+	CSI_2_RGB565 = 0x22,
+	CSI_2_RGB666 = 0x23,
+	CSI_2_RGB888 = 0x24,
+	CSI_2_RAW6 = 0x28,
+	CSI_2_RAW7 = 0x29,
+	CSI_2_RAW8 = 0x2A,
+	CSI_2_RAW10 = 0x2B,
+	CSI_2_RAW12 = 0x2C,
+	CSI_2_RAW14 = 0x2D,
+	CSI_2_RAW16 = 0x2E,
+	CSI_2_RAW20 = 0x2F,
+	USER_DEFINED_1 = 0x30,
+	USER_DEFINED_2 = 0x31,
+	USER_DEFINED_3 = 0x32,
+	USER_DEFINED_4 = 0x33,
+	USER_DEFINED_5 = 0x34,
+	USER_DEFINED_6 = 0x35,
+	USER_DEFINED_7 = 0x36,
+	USER_DEFINED_8 = 0x37,
+};
+
+/* DWC MIPI CSI-2 output types */
+enum output {
+	IPI_OUT = 0,
+	IDI_OUT = 1,
+	BOTH_OUT = 2
+};
+
+/* IPI color components */
+enum color_mode {
+	COLOR48 = 0,
+	COLOR16 = 1
+};
+
+/* IPI cut through */
+enum cut_through {
+	CTINACTIVE = 0,
+	CTACTIVE = 1
+};
+
+/* IPI output types */
+enum ipi_output {
+	CAMERA_TIMING = 0,
+	AUTO_TIMING = 1
+};
+
+/* Format template */
+struct mipi_fmt {
+	u32 mbus_code;
+	u8 depth;
+};
+
+struct mipi_dt {
+	u32 hex;
+	char *name;
+};
+
+/* CSI specific configuration */
+struct csi_data {
+	u32 num_lanes;
+	u32 dphy_freq;
+	u32 pclk;
+	u32 fps;
+	u32 bpp;
+	u32 output;
+	u32 ipi_mode;
+	u32 ipi_adv_features;
+	u32 ipi_cut_through;
+	u32 ipi_color_mode;
+	u32 ipi_auto_flush;
+	u32 virtual_ch;
+	u32 hsa;
+	u32 hbp;
+	u32 hsd;
+	u32 htotal;
+	u32 vsa;
+	u32 vbp;
+	u32 vfp;
+	u32 vactive;
+};
+
+/* Structure to embed device driver information */
+struct dw_csi {
+	struct v4l2_subdev sd;
+	struct video_device vdev;
+	struct v4l2_device v4l2_dev;
+	struct device *dev;
+	struct media_pad pads[CSI_PADS_NUM];
+	struct mipi_fmt *fmt;
+	struct v4l2_mbus_framefmt format;
+	void __iomem *base_address;
+	void __iomem *demo;
+	void __iomem *csc;
+	int ctrl_irq_number;
+	int demosaic_irq;
+	struct csi_data hw;
+	struct reset_control *rst;
+	struct phy *phy;
+	struct dw_csih_pdata *config;
+	struct mutex lock; /* protect resources sharing */
+	spinlock_t slock; /* interrupt handling lock */
+	u8 ipi_dt;
+	u8 index;
+	u8 hw_version_major;
+	u16 hw_version_minor;
+};
+
+static inline struct dw_csi *sd_to_mipi_csi_dev(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct dw_csi, sd);
+}
+
+void dw_mipi_csi_reset(struct dw_csi *csi_dev);
+int dw_mipi_csi_mask_irq_power_off(struct dw_csi *csi_dev);
+int dw_mipi_csi_hw_stdby(struct dw_csi *csi_dev);
+void dw_mipi_csi_set_ipi_fmt(struct dw_csi *csi_dev);
+void dw_mipi_csi_start(struct dw_csi *csi_dev);
+int dw_mipi_csi_irq_handler(struct dw_csi *csi_dev);
+void dw_mipi_csi_get_version(struct dw_csi *csi_dev);
+int dw_mipi_csi_specific_mappings(struct dw_csi *csi_dev);
+void dw_mipi_csi_fill_timings(struct dw_csi *dev,
+			      struct v4l2_subdev_format *fmt);
+void dw_mipi_csi_dump(struct dw_csi *csi_dev);
+
+#if IS_ENABLED(CONFIG_DWC_MIPI_TC_DPHY_GEN3)
+int dw_csi_create_capabilities_sysfs(struct platform_device *pdev);
+#endif
+
+static inline void dw_mipi_csi_write(struct dw_csi *dev,
+				     u32 address, u32 data)
+{
+	writel(data, dev->base_address + address);
+}
+
+static inline u32 dw_mipi_csi_read(struct dw_csi *dev, u32 address)
+{
+	return readl(dev->base_address + address);
+}
+
+#endif /*_DW_MIPI_CSI_H__ */
diff --git a/include/media/dwc/dw-mipi-csi-pltfrm.h b/include/media/dwc/dw-mipi-csi-pltfrm.h
new file mode 100644
index 0000000..948db4e
--- /dev/null
+++ b/include/media/dwc/dw-mipi-csi-pltfrm.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Synopsys DesignWare MIPI CSI-2 Host media entities
+ *
+ * Author: Luis Oliveira <Luis.Oliveira@synopsys.com>
+ */
+
+#ifndef __DW_MIPI_CSI_PLTFRM_INCLUDES_H_
+#define __DW_MIPI_CSI_PLTFRM_INCLUDES_H_
+
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
+
+#define MAX_WIDTH	3280
+#define MAX_HEIGHT	1852
+
+/* The subdevices' group IDs. */
+#define GRP_ID_SENSOR		(10)
+#define GRP_ID_CSI		(20)
+#define GRP_ID_VIF		(30)
+#define GRP_ID_VIDEODEV		(40)
+
+#define CSI_MAX_ENTITIES	(2)
+#define VIF_MAX_ENTITIES	(2)
+#define PLAT_MAX_SENSORS	(2)
+
+struct pdata_names {
+	char *name;
+};
+
+enum video_dev_pads {
+	VIDEO_DEV_SD_PAD_SINK_VIF1,
+	VIDEO_DEV_SD_PAD_SINK_VIF2,
+	VIDEO_DEV_SD_PAD_SOURCE_DMA,
+	VIDEO_DEV_SD_PADS_NUM,
+};
+
+enum vif_pads {
+	VIF_PAD_SINK_CSI,
+	VIF_PAD_SOURCE_DMA,
+	VIF_PADS_NUM,
+};
+
+enum mipi_csi_pads {
+	CSI_PAD_SINK,
+	CSI_PAD_SOURCE,
+	CSI_PADS_NUM,
+};
+
+struct plat_csi_source_info {
+	u16 flags;
+	u16 mux_id;
+};
+
+struct plat_csi_fmt {
+	char *name;
+	u32 mbus_code;
+	u32 fourcc;
+	u8 depth;
+};
+
+struct plat_csi_media_pipeline;
+
+/*
+ * Media pipeline operations to be called from within a video node,  i.e. the
+ * last entity within the pipeline. Implemented by related media device driver.
+ */
+struct plat_csi_media_pipeline_ops {
+	int (*prepare)(struct plat_csi_media_pipeline *p,
+		       struct media_entity *me);
+	int (*unprepare)(struct plat_csi_media_pipeline *p);
+	int (*open)(struct plat_csi_media_pipeline *p, struct media_entity *me,
+		    bool resume);
+	int (*close)(struct plat_csi_media_pipeline *p);
+	int (*set_stream)(struct plat_csi_media_pipeline *p, bool state);
+	int (*set_format)(struct plat_csi_media_pipeline *p,
+			  struct v4l2_subdev_format *fmt);
+};
+
+struct plat_csi_video_entity {
+	struct video_device vdev;
+	struct plat_csi_media_pipeline *pipe;
+};
+
+struct plat_csi_media_pipeline {
+	struct media_pipeline mp;
+	const struct plat_csi_media_pipeline_ops *ops;
+};
+
+static inline struct plat_csi_video_entity
+*vdev_to_plat_csi_video_entity(struct video_device *vdev)
+{
+	return container_of(vdev, struct plat_csi_video_entity, vdev);
+}
+
+#define plat_csi_pipeline_call(ent, op, args...)			  \
+	(!(ent) ? -ENOENT : (((ent)->pipe->ops && (ent)->pipe->ops->op) ? \
+	(ent)->pipe->ops->op(((ent)->pipe), ##args) : -ENOIOCTLCMD))	  \
+
+#endif /* __DW_MIPI_CSI_PLTFRM_INCLUDES_H_ */
-- 
2.7.4

