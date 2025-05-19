Return-Path: <linux-media+bounces-32824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447ABABC178
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAD744A06DC
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB08C285404;
	Mon, 19 May 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bgYFS6ln"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB4284B46;
	Mon, 19 May 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666693; cv=none; b=sk50lIXQ63acAZTEwIKGaiOeNgPj4YGzk7AnuWy5K35IzcAEPCHXFEa+0TbBoLBJS6ht2sHnOKxb/wE80yKpE4tqeUoSTXt34DK5D2lvsRzEAVayRzb4BG5qTkaxf5by0OcrqLfVz1oRSDYFWgNfSTPT4zQmg+w03Tt9ev5UpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666693; c=relaxed/simple;
	bh=rBzzmPL35zSc/BDyfiaGVwXbvbaG42x3MGcn7Pdlk2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ktqNeIaR88rEFUWkIYJc6vZonBRONtfZAPytU4RNTRlLfjShSR6AneGKYXWo0jFQVppUzN/lnN/npzAXkmlWtgzSu9Gvf9gK7HffOvB7OJINL/PxbGekOHo16F3pzilMssgr/5jEJ5fGsoCJ6n3DCG7WiB6+K9yaUr1c+qYMadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bgYFS6ln; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4C2211A0;
	Mon, 19 May 2025 16:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747666666;
	bh=rBzzmPL35zSc/BDyfiaGVwXbvbaG42x3MGcn7Pdlk2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bgYFS6lnRf6V89xaQ8FgP4XMneuM/lFFQvAQS2fhsf+LW9YT73lBEmF/Yi9bpql9j
	 OI0UttEfx7/Km7sugKg8ZdOLOoWgFzUv1gf4QmStC5zzWR+itp8pZX0f04lWpCopV2
	 pO+Cy4jAVLSQh6qG6OkumgKa8IIrt3uQlOtNNbOU=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/3] media: platform: Add Renesas Input Video Control block driver
Date: Mon, 19 May 2025 15:57:53 +0100
Message-Id: <20250519145754.454005-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519145754.454005-1-dan.scally@ideasonboard.com>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the Input Video Control block in an RZ/V2H SoC which
feeds data into the Arm Mali-C55 ISP.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/renesas/Kconfig        |   2 +
 drivers/media/platform/renesas/Makefile       |   1 +
 .../media/platform/renesas/rzv2h-ivc/Kconfig  |  11 +
 .../media/platform/renesas/rzv2h-ivc/Makefile |   7 +
 .../renesas/rzv2h-ivc/rzv2h-ivc-dev.c         | 239 ++++++
 .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      | 376 ++++++++++
 .../renesas/rzv2h-ivc/rzv2h-ivc-video.c       | 703 ++++++++++++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc.h    | 141 ++++
 8 files changed, 1480 insertions(+)
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Kconfig
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Makefile
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h

diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
index c7fc718a30a5..b09c026c129e 100644
--- a/drivers/media/platform/renesas/Kconfig
+++ b/drivers/media/platform/renesas/Kconfig
@@ -58,6 +58,8 @@ config VIDEO_SH_VOU
 
 source "drivers/media/platform/renesas/rcar-vin/Kconfig"
 source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
+source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
+
 
 # Mem2mem drivers
 
diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
index 50774a20330c..f29c8ade0e4e 100644
--- a/drivers/media/platform/renesas/Makefile
+++ b/drivers/media/platform/renesas/Makefile
@@ -5,6 +5,7 @@
 
 obj-y += rcar-vin/
 obj-y += rzg2l-cru/
+obj-y += rzv2h-ivc/
 obj-y += vsp1/
 
 obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
new file mode 100644
index 000000000000..0702f9fbf699
--- /dev/null
+++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_RZV2H_IVC
+	tristate "Renesas RZ/V2H Input Video Control block driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for the Video Input Block found in the RZ/V2H SoC. Enable this
+	  to support the block, and by extension the Arm Mali-C55 ISP to which
+	  it feeds data.
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Makefile b/drivers/media/platform/renesas/rzv2h-ivc/Makefile
new file mode 100644
index 000000000000..17dfd3a165bc
--- /dev/null
+++ b/drivers/media/platform/renesas/rzv2h-ivc/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+rzv2h-ivc-y := rzv2h-ivc-dev.o \
+	       rzv2h-ivc-subdev.o \
+	       rzv2h-ivc-video.o
+
+obj-$(CONFIG_VIDEO_RZV2H_IVC) += rzv2h-ivc.o
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
new file mode 100644
index 000000000000..a9b0c6b39d14
--- /dev/null
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H Input Video Control Block driver
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
+#include <linux/reset.h>
+
+#include "rzv2h-ivc.h"
+
+inline void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val)
+{
+	writel(val, ivc->base + addr);
+}
+
+void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
+			   u32 mask, u32 val)
+{
+	u32 orig, new;
+
+	orig = readl(ivc->base + addr);
+
+	new = orig & ~mask;
+	new |= val & mask;
+
+	if (new != orig)
+		writel(new, ivc->base + addr);
+}
+
+static int rzv2h_ivc_get_hardware_resources(struct rzv2h_ivc *ivc,
+					    struct platform_device *pdev)
+{
+	const char * const reset_names[RZV2H_IVC_NUM_RESETS] = {
+		"presetn",
+		"vin_aresetn",
+		"sresetn",
+	};
+	const char * const clk_names[RZV2H_IVC_NUM_CLOCKS] = {
+		"pclk",
+		"vin_aclk",
+		"sclk",
+	};
+	struct resource *res;
+	int ret;
+
+	ivc->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(ivc->base))
+		return dev_err_probe(ivc->dev, PTR_ERR(ivc->base),
+				     "failed to map IO memory\n");
+
+	for (unsigned int i; i < ARRAY_SIZE(clk_names); i++)
+		ivc->clks[i].id = clk_names[i];
+
+	ret = devm_clk_bulk_get(ivc->dev, ARRAY_SIZE(clk_names), ivc->clks);
+	if (ret)
+		return dev_err_probe(ivc->dev, ret, "failed to acquire clks\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(reset_names); i++)
+		ivc->resets[i].id = reset_names[i];
+
+	ret = devm_reset_control_bulk_get_optional_shared(
+		ivc->dev, ARRAY_SIZE(reset_names), ivc->resets);
+	if (ret)
+		return dev_err_probe(ivc->dev, ret, "failed to acquire resets\n");
+
+	return 0;
+}
+
+static void rzv2h_ivc_global_config(struct rzv2h_ivc *ivc)
+{
+	/* Currently we only support single-exposure input */
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PLNUM, RZV2H_IVC_ONE_EXPOSURE);
+
+	/*
+	 * Datasheet says we should disable the interrupts before changing mode
+	 * to avoid spurious IFP interrupt.
+	 */
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_INT_EN, 0x0);
+
+	/*
+	 * RZ/V2H documentation says software controlled configuration is not
+	 * supported, and currently neither is multi-context mode. That being so
+	 * we just set single context sw-hw mode.
+	 */
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_CONTEXT,
+			RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG);
+
+	/*
+	 * We enable the frame end interrupt so that we know when we should send
+	 * follow-up frames.
+	 */
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_INT_EN, RZV2H_IVC_VVAL_IFPE);
+}
+
+static irqreturn_t rzv2h_ivc_isr(int irq, void *context)
+{
+	struct device *dev = context;
+	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
+
+	guard(spinlock)(&ivc->spinlock);
+	--ivc->vvalid_ifp;
+	wake_up_all(&ivc->buffers.wq);
+
+	return IRQ_HANDLED;
+}
+
+static int rzv2h_ivc_runtime_resume(struct device *dev)
+{
+	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = request_threaded_irq(ivc->irqnum, NULL, rzv2h_ivc_isr,
+				   IRQF_ONESHOT, dev_driver_string(dev), dev);
+	if (ret) {
+		dev_err(dev, "failed to request irq\n");
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(ivc->clks), ivc->clks);
+	if (ret) {
+		dev_err(ivc->dev, "failed to enable clocks\n");
+		goto err_free_irqnum;
+	}
+
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(ivc->resets), ivc->resets);
+	if (ret) {
+		dev_err(ivc->dev, "failed to deassert resets\n");
+		goto err_disable_clks;
+	}
+
+	rzv2h_ivc_global_config(ivc);
+
+	return 0;
+
+err_disable_clks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
+err_free_irqnum:
+	free_irq(ivc->irqnum, dev);
+
+	return ret;
+}
+
+static int rzv2h_ivc_runtime_suspend(struct device *dev)
+{
+	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
+
+	reset_control_bulk_assert(ARRAY_SIZE(ivc->resets), ivc->resets);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
+	free_irq(ivc->irqnum, dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rzv2h_ivc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(rzv2h_ivc_runtime_suspend, rzv2h_ivc_runtime_resume,
+			   NULL)
+};
+
+static int rzv2h_ivc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzv2h_ivc *ivc;
+	int ret;
+
+	ivc = devm_kzalloc(dev, sizeof(*ivc), GFP_KERNEL);
+	if (!ivc)
+		return -ENOMEM;
+
+	ivc->dev = dev;
+	platform_set_drvdata(pdev, ivc);
+	mutex_init(&ivc->lock);
+	spin_lock_init(&ivc->spinlock);
+
+	ret = rzv2h_ivc_get_hardware_resources(ivc, pdev);
+	if (ret)
+		return ret;
+
+	ret = rzv2h_ivc_initialise_subdevice(ivc);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+
+	spin_lock(&ivc->spinlock);
+	ivc->vvalid_ifp = 2;
+	spin_unlock(&ivc->spinlock);
+
+	ivc->irqnum = platform_get_irq(pdev, 0);
+	if (ivc->irqnum < 0) {
+		dev_err(dev, "failed to get interrupt\n");
+		goto err_pm_runtime_disable;
+	}
+
+	return 0;
+
+err_pm_runtime_disable:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static void rzv2h_ivc_remove(struct platform_device *pdev)
+{
+}
+
+static const struct of_device_id rzv2h_ivc_of_match[] = {
+	{ .compatible = "renesas,r9a09g057-ivc", },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, rzv2h_ivc_of_match);
+
+static struct platform_driver rzv2h_ivc_driver = {
+	.driver = {
+		.name = "rzv2h-ivc",
+		.of_match_table = rzv2h_ivc_of_match,
+		.pm = &rzv2h_ivc_pm_ops,
+	},
+	.probe = rzv2h_ivc_probe,
+	.remove = rzv2h_ivc_remove,
+};
+
+module_platform_driver(rzv2h_ivc_driver);
+
+MODULE_AUTHOR("Daniel Scally <dan.scally@ideasonboard.com>");
+MODULE_DESCRIPTION("Renesas RZ/V2H Input Video Control Block driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
new file mode 100644
index 000000000000..479a71fab7ea
--- /dev/null
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H Input Video Control Block driver
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/media.h>
+#include <linux/media-bus-format.h>
+#include <linux/v4l2-mediabus.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "rzv2h-ivc.h"
+
+#define RZV2H_IVC_N_INPUTS_PER_OUTPUT		6
+
+/*
+ * We support 8/10/12/14/16/20 bit input in any bayer order, but the output
+ * format is fixed at 20-bits with the same order as the input.
+ */
+static const struct {
+	u32 inputs[RZV2H_IVC_N_INPUTS_PER_OUTPUT];
+	u32 output;
+} rzv2h_ivc_formats[] = {
+	{
+		.inputs = {
+			MEDIA_BUS_FMT_SBGGR8_1X8,
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SBGGR12_1X12,
+			MEDIA_BUS_FMT_SBGGR14_1X14,
+			MEDIA_BUS_FMT_SBGGR16_1X16,
+			MEDIA_BUS_FMT_SBGGR20_1X20,
+		},
+		.output = MEDIA_BUS_FMT_SBGGR20_1X20
+	},
+	{
+		.inputs = {
+			MEDIA_BUS_FMT_SGBRG8_1X8,
+			MEDIA_BUS_FMT_SGBRG10_1X10,
+			MEDIA_BUS_FMT_SGBRG12_1X12,
+			MEDIA_BUS_FMT_SGBRG14_1X14,
+			MEDIA_BUS_FMT_SGBRG16_1X16,
+			MEDIA_BUS_FMT_SGBRG20_1X20,
+		},
+		.output = MEDIA_BUS_FMT_SGBRG20_1X20
+	},
+	{
+		.inputs = {
+			MEDIA_BUS_FMT_SGRBG8_1X8,
+			MEDIA_BUS_FMT_SGRBG10_1X10,
+			MEDIA_BUS_FMT_SGRBG12_1X12,
+			MEDIA_BUS_FMT_SGRBG14_1X14,
+			MEDIA_BUS_FMT_SGRBG16_1X16,
+			MEDIA_BUS_FMT_SGRBG20_1X20,
+		},
+		.output = MEDIA_BUS_FMT_SGRBG20_1X20
+	},
+	{
+		.inputs = {
+			MEDIA_BUS_FMT_SRGGB8_1X8,
+			MEDIA_BUS_FMT_SRGGB10_1X10,
+			MEDIA_BUS_FMT_SRGGB12_1X12,
+			MEDIA_BUS_FMT_SRGGB14_1X14,
+			MEDIA_BUS_FMT_SRGGB16_1X16,
+			MEDIA_BUS_FMT_SRGGB20_1X20,
+		},
+		.output = MEDIA_BUS_FMT_SRGGB20_1X20
+	},
+};
+
+static u32 rzv2h_ivc_get_mbus_output_from_input(u32 mbus_code)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++) {
+		for (j = 0; j < RZV2H_IVC_N_INPUTS_PER_OUTPUT; j++) {
+			if (rzv2h_ivc_formats[i].inputs[j] == mbus_code)
+				return rzv2h_ivc_formats[i].output;
+		}
+	}
+
+	return 0;
+}
+
+static int rzv2h_ivc_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	unsigned int order_index;
+	unsigned int index;
+
+	/*
+	 * On the source pad, only the 20-bit format corresponding to the sink
+	 * pad format's bayer order is supported.
+	 */
+	if (code->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD) {
+		if (code->index)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state,
+						   RZV2H_IVC_SUBDEV_SINK_PAD);
+		code->code = fmt->code;
+	} else {
+		if (code->index >= ARRAY_SIZE(rzv2h_ivc_formats) *
+				   RZV2H_IVC_N_INPUTS_PER_OUTPUT)
+			return -EINVAL;
+
+		order_index = code->index / RZV2H_IVC_N_INPUTS_PER_OUTPUT;
+		index = code->index % RZV2H_IVC_N_INPUTS_PER_OUTPUT;
+
+		code->code = rzv2h_ivc_formats[order_index].inputs[index];
+	}
+
+	return 0;
+}
+
+static int rzv2h_ivc_enum_frame_size(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	if (fse->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD) {
+		fmt = v4l2_subdev_state_get_format(state,
+						   RZV2H_IVC_SUBDEV_SINK_PAD);
+
+		if (fse->code != fmt->code)
+			return -EINVAL;
+
+		fse->min_width = fmt->width;
+		fse->max_width = fmt->width;
+		fse->min_height = fmt->height;
+		fse->max_height = fmt->height;
+	} else {
+		if (!rzv2h_ivc_get_mbus_output_from_input(fse->code))
+			return -EINVAL;
+
+		fse->min_width = RZV2H_IVC_MIN_WIDTH;
+		fse->max_width = RZV2H_IVC_MAX_WIDTH;
+		fse->min_height = RZV2H_IVC_MIN_HEIGHT;
+		fse->max_height = RZV2H_IVC_MAX_HEIGHT;
+	}
+
+	return 0;
+}
+
+static int rzv2h_ivc_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+
+	if (format->pad == RZV2H_IVC_SUBDEV_SOURCE_PAD)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, RZV2H_IVC_SUBDEV_SINK_PAD);
+
+	sink_fmt->code = rzv2h_ivc_get_mbus_output_from_input(fmt->code) ?
+			 fmt->code : rzv2h_ivc_formats[0].inputs[0];
+
+	sink_fmt->width = clamp(fmt->width, RZV2H_IVC_MIN_WIDTH,
+				RZV2H_IVC_MAX_WIDTH);
+	sink_fmt->height = clamp(fmt->height, RZV2H_IVC_MIN_HEIGHT,
+				 RZV2H_IVC_MAX_HEIGHT);
+
+	*fmt = *sink_fmt;
+
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       RZV2H_IVC_SUBDEV_SOURCE_PAD);
+
+	src_fmt->code = rzv2h_ivc_get_mbus_output_from_input(sink_fmt->code);
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+
+	return 0;
+}
+
+static int rzv2h_ivc_enable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	/*
+	 * We have a single source pad, which has a single stream. V4L2 core has
+	 * already validated those things. The actual power-on and programming
+	 * of registers will be done through the video device's .vidioc_streamon
+	 * so there's nothing to actually do here...
+	 */
+
+	return 0;
+}
+
+static int rzv2h_ivc_disable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
+{
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops rzv2h_ivc_pad_ops = {
+	.enum_mbus_code		= rzv2h_ivc_enum_mbus_code,
+	.enum_frame_size	= rzv2h_ivc_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= rzv2h_ivc_set_fmt,
+	.enable_streams		= rzv2h_ivc_enable_streams,
+	.disable_streams	= rzv2h_ivc_disable_streams,
+};
+
+static const struct v4l2_subdev_core_ops rzv2h_ivc_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops rzv2h_ivc_subdev_ops = {
+	.core	= &rzv2h_ivc_core_ops,
+	.pad	= &rzv2h_ivc_pad_ops,
+};
+
+static int rzv2h_ivc_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						RZV2H_IVC_SUBDEV_SINK_PAD);
+	sink_fmt->width = RZV2H_IVC_DEFAULT_WIDTH;
+	sink_fmt->height = RZV2H_IVC_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(false,
+							  sink_fmt->colorspace,
+							  sink_fmt->ycbcr_enc);
+
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       RZV2H_IVC_SUBDEV_SOURCE_PAD);
+
+	*src_fmt = *sink_fmt;
+	src_fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
+
+	return 0;
+}
+
+static int rzv2h_ivc_registered(struct v4l2_subdev *sd)
+{
+	struct rzv2h_ivc *ivc = container_of(sd, struct rzv2h_ivc, subdev.sd);
+
+	return rzv2h_initialise_video_dev_and_queue(ivc, sd->v4l2_dev);
+}
+
+static const struct v4l2_subdev_internal_ops rzv2h_ivc_subdev_internal_ops = {
+	.init_state = rzv2h_ivc_init_state,
+	.registered = rzv2h_ivc_registered,
+};
+
+static int rzv2h_ivc_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->source->entity);
+	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
+	struct v4l2_subdev *sd =
+		media_entity_to_v4l2_subdev(link->sink->entity);
+	const struct rzv2h_ivc_format  *fmt;
+	const struct v4l2_pix_format *pix;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *mf;
+	unsigned int i;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	mf = v4l2_subdev_state_get_format(state, link->sink->index);
+
+	pix = &ivc->format.pix;
+	fmt = ivc->format.fmt;
+
+	if (mf->width != pix->width || mf->height != pix->height) {
+		dev_dbg(ivc->dev,
+			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			mf->width, mf->height,
+			pix->width, pix->height);
+		ret = -EPIPE;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(fmt->mbus_codes); i++)
+		if (mf->code == fmt->mbus_codes[i])
+			break;
+
+	if (i == ARRAY_SIZE(fmt->mbus_codes)) {
+		dev_dbg(ivc->dev,
+			"link '%s':%u -> '%s':%u not valid: pixel format %p4cc cannot produce mbus_code 0x%04x\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			&pix->pixelformat, mf->code);
+		ret = -EPIPE;
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static const struct media_entity_operations rzv2h_ivc_media_ops = {
+	.link_validate = rzv2h_ivc_link_validate,
+};
+
+int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc)
+{
+	struct v4l2_subdev *sd;
+	int ret;
+
+	/* Initialise subdevice */
+	sd = &ivc->subdev.sd;
+	sd->dev = ivc->dev;
+	v4l2_subdev_init(sd, &rzv2h_ivc_subdev_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.function = MEDIA_ENT_F_IO_V4L;
+	sd->internal_ops = &rzv2h_ivc_subdev_internal_ops;
+	sd->entity.ops = &rzv2h_ivc_media_ops;
+
+	ivc->subdev.pads[RZV2H_IVC_SUBDEV_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
+	ivc->subdev.pads[RZV2H_IVC_SUBDEV_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
+
+	snprintf(sd->name, sizeof(sd->name), "rzv2h ivc block");
+
+	ret = media_entity_pads_init(&sd->entity, RZV2H_IVC_NUM_SUBDEV_PADS,
+				     ivc->subdev.pads);
+	if (ret) {
+		dev_err(ivc->dev, "failed to initialise media entity\n");
+		return ret;
+	}
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret) {
+		dev_err(ivc->dev, "failed to register subdevice\n");
+		goto err_cleanup_subdev_entity;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		dev_err(ivc->dev, "failed to finalize subdev init\n");
+		goto err_unregister_subdev;
+	}
+
+	return 0;
+
+err_unregister_subdev:
+	v4l2_async_unregister_subdev(sd);
+err_cleanup_subdev_entity:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc)
+{
+	struct v4l2_subdev *sd = &ivc->subdev.sd;
+
+	v4l2_subdev_cleanup(sd);
+	media_entity_remove_links(&sd->entity);
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+}
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
new file mode 100644
index 000000000000..da6184823784
--- /dev/null
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -0,0 +1,703 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H Input Video Control Block driver
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/cleanup.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/media-bus-format.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
+#include <linux/videodev2.h>
+#include <linux/wait.h>
+
+#include <media/media-jobs.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "rzv2h-ivc.h"
+
+#define RZV2H_IVC_FIXED_HBLANK			0x20
+#define RZV2H_IVC_MIN_VBLANK			27
+
+#define to_rzv2h_ivc_buf(vbuf) \
+	container_of(vbuf, struct rzv2h_ivc_buf, vb)
+
+static const struct rzv2h_ivc_format rzv2h_ivc_formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SBGGR8_1X8,
+		},
+		.dtype = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SGBRG8_1X8,
+		},
+		.dtype = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SGRBG8_1X8,
+		},
+		.dtype = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SRGGB8_1X8,
+		},
+		.dtype = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_CRU_RAW10,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SGBRG10_1X10,
+			MEDIA_BUS_FMT_SGRBG10_1X10,
+			MEDIA_BUS_FMT_SRGGB10_1X10
+		},
+		.dtype = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_CRU_RAW12,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SBGGR12_1X12,
+			MEDIA_BUS_FMT_SGBRG12_1X12,
+			MEDIA_BUS_FMT_SGRBG12_1X12,
+			MEDIA_BUS_FMT_SRGGB12_1X12
+		},
+		.dtype = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_CRU_RAW14,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SBGGR14_1X14,
+			MEDIA_BUS_FMT_SGBRG14_1X14,
+			MEDIA_BUS_FMT_SGRBG14_1X14,
+			MEDIA_BUS_FMT_SRGGB14_1X14
+		},
+		.dtype = MIPI_CSI2_DT_RAW14,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SBGGR16_1X16,
+		},
+		.dtype = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SGBRG16_1X16,
+		},
+		.dtype = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SGRBG16_1X16,
+		},
+		.dtype = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SRGGB16_1X16,
+		},
+		.dtype = MIPI_CSI2_DT_RAW16,
+	},
+};
+
+static int rzv2h_ivc_pipeline_started(struct media_entity *entity)
+{
+	struct video_device *vdev = media_entity_to_video_device(entity);
+	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
+
+	/*
+	 * With min_queued_buffers set to 1, we know that we must have at least
+	 * a single buffer to start feeding, so we can fetch that now and fire
+	 * it off to the ISP.
+	 */
+	ivc->buffers.sequence = 0;
+	rzv2h_ivc_send_next_buffer(ivc);
+
+	return 0;
+}
+
+static void rzv2h_ivc_pipeline_stopped(struct media_entity *entity)
+{
+	struct video_device *vdev = media_entity_to_video_device(entity);
+	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
+	u32 val = 0;
+
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, 0x1);
+	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
+			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+}
+
+static const struct media_entity_operations rzv2h_ivc_media_ops = {
+	.pipeline_started = rzv2h_ivc_pipeline_started,
+	.pipeline_stopped = rzv2h_ivc_pipeline_stopped,
+};
+
+static bool rzv2h_ivc_job_check_dep(void *data)
+{
+	struct rzv2h_ivc *ivc = data;
+
+	guard(spinlock)(&ivc->buffers.lock);
+
+	if (list_empty(&ivc->buffers.pending))
+		return false;
+
+	return true;
+}
+
+static void rzv2h_ivc_job_clear_dep(void *data)
+{
+	struct rzv2h_ivc *ivc = data;
+	struct rzv2h_ivc_buf *buf;
+
+	/*
+	 * We need to move an entry from the pending queue to the input queue
+	 * here. We know that there is one, or .check_dep() would not have
+	 * allowed us to get this far. The entry needs to be removed or the same
+	 * check would allow a new job to be queued for the exact same buffer.
+	 */
+	guard(spinlock)(&ivc->buffers.lock);
+	buf = list_first_entry(&ivc->buffers.pending,
+			       struct rzv2h_ivc_buf, queue);
+	list_move_tail(&buf->queue, &ivc->buffers.queue);
+}
+
+static void rzv2h_ivc_job_reset_dep(void *data)
+{
+	struct rzv2h_ivc *ivc = data;
+	struct rzv2h_ivc_buf *buf;
+
+	guard(spinlock)(&ivc->buffers.lock);
+	buf = list_first_entry(&ivc->buffers.queue,
+			       struct rzv2h_ivc_buf, queue);
+
+	if (buf)
+		list_move(&buf->queue, &ivc->buffers.pending);
+}
+
+static void rzv2h_ivc_job_set_next_buffer(void *data)
+{
+	struct rzv2h_ivc *ivc = data;
+
+	rzv2h_ivc_set_next_buffer(ivc);
+}
+
+static void rzv2h_ivc_job_send_next_buffer(void *data)
+{
+	struct rzv2h_ivc *ivc = data;
+
+	rzv2h_ivc_send_next_buffer(ivc);
+}
+
+static struct media_job_dep_ops rzv2h_ivc_media_job_dep_ops = {
+	.check_dep = rzv2h_ivc_job_check_dep,
+	.clear_dep = rzv2h_ivc_job_clear_dep,
+	.reset_dep = rzv2h_ivc_job_reset_dep,
+};
+
+static int rzv2h_ivc_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				 unsigned int *num_planes, unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
+
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] < ivc->format.pix.sizeimage)
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = ivc->format.pix.sizeimage;
+
+	return 0;
+}
+
+static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
+{
+	struct rzv2h_ivc *ivc = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rzv2h_ivc_buf *buf = to_rzv2h_ivc_buf(vbuf);
+
+	spin_lock(&ivc->buffers.lock);
+	list_add_tail(&buf->queue, &ivc->buffers.pending);
+	spin_unlock(&ivc->buffers.lock);
+
+	media_jobs_try_queue_job(ivc->sched, MEDIA_JOB_TYPE_PIPELINE_PULSE,
+				 &rzv2h_ivc_media_job_dep_ops, ivc);
+}
+
+static int rzv2h_ivc_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rzv2h_ivc_buf *buf = to_rzv2h_ivc_buf(vbuf);
+
+	buf->addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+
+	return 0;
+}
+
+static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
+{
+	const struct rzv2h_ivc_format *fmt = ivc->format.fmt;
+	struct v4l2_pix_format *pix = &ivc->format.pix;
+	unsigned int min_vblank;
+	unsigned int vblank;
+	unsigned int hts;
+
+	/* Currently only CRU packed pixel formats are supported */
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
+			RZV2H_IVC_INPUT_FMT_CRU_PACKED);
+
+	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
+			      RZV2H_IVC_PXFMT_DTYPE, fmt->dtype);
+
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_HSIZE, pix->width);
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_VSIZE, pix->height);
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_STRD, pix->bytesperline);
+
+	/*
+	 * The ISP has minimum vertical blanking requirements that must be
+	 * adhered to by the IVC. The minimum is a function of the Iridix blocks
+	 * clocking requirements and the width of the image and horizontal
+	 * blanking, but if we assume the worst case then it boils down to the
+	 * below (plus one to the numerator to ensure the answer is rounded up)
+	 */
+
+	hts = pix->width + RZV2H_IVC_FIXED_HBLANK;
+	min_vblank = 15 + (120501 / hts);
+	vblank = max(min_vblank, RZV2H_IVC_MIN_VBLANK);
+
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
+			RZV2H_IVC_VBLANK(vblank));
+}
+
+void rzv2h_ivc_set_next_buffer(struct rzv2h_ivc *ivc)
+{
+	struct rzv2h_ivc_buf *buf;
+
+	guard(spinlock)(&ivc->buffers.lock);
+
+	if (ivc->buffers.curr) {
+		ivc->buffers.curr->vb.sequence = ivc->buffers.sequence++;
+		vb2_buffer_done(&ivc->buffers.curr->vb.vb2_buf,
+				VB2_BUF_STATE_DONE);
+		ivc->buffers.curr = NULL;
+	}
+
+	buf = list_first_entry_or_null(&ivc->buffers.queue,
+				       struct rzv2h_ivc_buf, queue);
+	if (buf)
+		list_del(&buf->queue);
+	else
+		return;
+
+	ivc->buffers.curr = buf;
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
+}
+
+void rzv2h_ivc_send_next_buffer(struct rzv2h_ivc *ivc)
+{
+	wait_event_interruptible_timeout(ivc->buffers.wq, !ivc->vvalid_ifp,
+					 msecs_to_jiffies(20));
+
+	spin_lock(&ivc->spinlock);
+	ivc->vvalid_ifp = 2;
+	spin_unlock(&ivc->spinlock);
+
+	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_FRCON, 0x1);
+}
+
+static void rzv2h_ivc_return_buffers(struct rzv2h_ivc *ivc,
+				     enum vb2_buffer_state state)
+{
+	struct rzv2h_ivc_buf *buf, *tmp;
+
+	guard(spinlock)(&ivc->buffers.lock);
+
+	if (ivc->buffers.curr) {
+		vb2_buffer_done(&ivc->buffers.curr->vb.vb2_buf, state);
+		ivc->buffers.curr = NULL;
+	}
+
+	list_for_each_entry_safe(buf, tmp, &ivc->buffers.pending, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	list_for_each_entry_safe(buf, tmp, &ivc->buffers.queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static bool rzv2h_ivc_pipeline_ready(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	unsigned int n_video_devices = 0;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return n_video_devices == pipe->start_count;
+}
+
+static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
+	struct media_pipeline *pipe;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ivc->dev);
+	if (ret)
+		goto err_return_buffers;
+
+	ret = video_device_pipeline_alloc_start(&ivc->vdev.dev);
+	if (ret) {
+		dev_err(ivc->dev, "failed to start media pipeline\n");
+		goto err_pm_runtime_put;
+	}
+
+	rzv2h_ivc_format_configure(ivc);
+
+	ivc->buffers.sequence = 0;
+
+	spin_lock(&ivc->spinlock);
+	ivc->vvalid_ifp = 0;
+	spin_unlock(&ivc->spinlock);
+
+	pipe = video_device_pipeline(&ivc->vdev.dev);
+	if (rzv2h_ivc_pipeline_ready(pipe)) {
+		ret = media_pipeline_started(pipe);
+		if (ret)
+			goto err_stop_pipeline;
+
+		media_jobs_run_jobs(ivc->sched);
+	}
+
+	return 0;
+
+err_stop_pipeline:
+	video_device_pipeline_stop(&ivc->vdev.dev);
+err_pm_runtime_put:
+	pm_runtime_put(ivc->dev);
+err_return_buffers:
+	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
+{
+	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
+	struct media_pipeline *pipe;
+
+	pipe = video_device_pipeline(&ivc->vdev.dev);
+	if (rzv2h_ivc_pipeline_ready(pipe)) {
+		media_pipeline_stopped(pipe);
+		media_jobs_cancel_jobs(ivc->sched);
+	}
+
+	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
+	video_device_pipeline_stop(&ivc->vdev.dev);
+	pm_runtime_put_autosuspend(ivc->dev);
+	pm_runtime_mark_last_busy(ivc->dev);
+}
+
+static const struct vb2_ops rzv2h_ivc_vb2_ops = {
+	.queue_setup		= &rzv2h_ivc_queue_setup,
+	.buf_queue		= &rzv2h_ivc_buf_queue,
+	.buf_init		= &rzv2h_ivc_buf_init,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.start_streaming	= &rzv2h_ivc_start_streaming,
+	.stop_streaming		= &rzv2h_ivc_stop_streaming,
+};
+
+static const struct rzv2h_ivc_format *
+rzv2h_ivc_format_from_pixelformat(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++)
+		if (fourcc == rzv2h_ivc_formats[i].fourcc)
+			return &rzv2h_ivc_formats[i];
+
+	return &rzv2h_ivc_formats[0];
+}
+
+static int rzv2h_ivc_enum_fmt_vid_out(struct file *file, void *fh,
+				      struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(rzv2h_ivc_formats))
+		return -EINVAL;
+
+	f->pixelformat = rzv2h_ivc_formats[f->index].fourcc;
+	return 0;
+}
+
+static int rzv2h_ivc_g_fmt_vid_out(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct rzv2h_ivc *ivc = video_drvdata(file);
+
+	f->fmt.pix = ivc->format.pix;
+
+	return 0;
+}
+
+static void rzv2h_ivc_try_fmt(struct v4l2_pix_format *pix)
+{
+	const struct rzv2h_ivc_format *fmt;
+
+	fmt = rzv2h_ivc_format_from_pixelformat(pix->pixelformat);
+	pix->pixelformat = fmt->fourcc;
+
+	pix->width = clamp(pix->width, RZV2H_IVC_MIN_WIDTH,
+			   RZV2H_IVC_MAX_WIDTH);
+	pix->height = clamp(pix->height, RZV2H_IVC_MIN_HEIGHT,
+			    RZV2H_IVC_MAX_HEIGHT);
+
+	pix->field = V4L2_FIELD_NONE;
+	pix->colorspace = V4L2_COLORSPACE_RAW;
+	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
+}
+
+static void rzv2h_ivc_set_format(struct rzv2h_ivc *ivc,
+				 struct v4l2_pix_format *pix)
+{
+	rzv2h_ivc_try_fmt(pix);
+	ivc->format.pix = *pix;
+	ivc->format.fmt = rzv2h_ivc_format_from_pixelformat(pix->pixelformat);
+}
+
+static int rzv2h_ivc_s_fmt_vid_out(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct rzv2h_ivc *ivc = video_drvdata(file);
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+
+	if (vb2_is_busy(&ivc->vdev.vb2q))
+		return -EBUSY;
+
+	rzv2h_ivc_set_format(ivc, pix);
+
+	return 0;
+}
+
+static int rzv2h_ivc_try_fmt_vid_out(struct file *file, void *fh,
+				     struct v4l2_format *f)
+{
+	rzv2h_ivc_try_fmt(&f->fmt.pix);
+	return 0;
+}
+
+static int rzv2h_ivc_querycap(struct file *file, void *fh,
+			      struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "rzv2h-ivc", sizeof(cap->driver));
+	strscpy(cap->card, "Renesas Input Video Control", sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops rzv2h_ivc_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_vid_out = rzv2h_ivc_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out = rzv2h_ivc_g_fmt_vid_out,
+	.vidioc_s_fmt_vid_out = rzv2h_ivc_s_fmt_vid_out,
+	.vidioc_try_fmt_vid_out = rzv2h_ivc_try_fmt_vid_out,
+	.vidioc_querycap = rzv2h_ivc_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations rzv2h_ivc_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static int rzv2h_ivc_populate_media_job(struct media_job *job, void *data)
+{
+	struct rzv2h_ivc *ivc = data;
+	int ret;
+
+	ret = media_jobs_add_job_dep(job, &rzv2h_ivc_media_job_dep_ops, ivc);
+	if (ret)
+		return ret;
+
+	ret = media_jobs_add_job_step(job, rzv2h_ivc_job_set_next_buffer, ivc,
+				      MEDIA_JOBS_FL_STEP_ANYWHERE, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * This stage will be the second to last one to run - the ISP driver may
+	 * have some post-frame processing to do.
+	 */
+	ret = media_jobs_add_job_step(job, rzv2h_ivc_job_send_next_buffer, ivc,
+				      MEDIA_JOBS_FL_STEP_FROM_BACK, 1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int rzv2h_initialise_video_dev_and_queue(struct rzv2h_ivc *ivc,
+					 struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_pix_format pix;
+	struct video_device *vdev;
+	struct vb2_queue *vb2q;
+	int ret;
+
+	spin_lock_init(&ivc->buffers.lock);
+	INIT_LIST_HEAD(&ivc->buffers.queue);
+	INIT_LIST_HEAD(&ivc->buffers.pending);
+	init_waitqueue_head(&ivc->buffers.wq);
+
+	/* Initialise vb2 queue */
+	vb2q = &ivc->vdev.vb2q;
+	vb2q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
+	vb2q->drv_priv = ivc;
+	vb2q->mem_ops = &vb2_dma_contig_memops;
+	vb2q->ops = &rzv2h_ivc_vb2_ops;
+	vb2q->buf_struct_size = sizeof(struct rzv2h_ivc_buf);
+	vb2q->min_queued_buffers = 1;
+	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2q->lock = &ivc->lock;
+	vb2q->dev = ivc->dev;
+
+	ret = vb2_queue_init(vb2q);
+	if (ret)
+		return dev_err_probe(ivc->dev, ret, "vb2 queue init failed\n");
+
+	/* Initialise Video Device */
+	vdev = &ivc->vdev.dev;
+	strscpy(vdev->name, "rzv2h-ivc", sizeof(vdev->name));
+	vdev->release = video_device_release_empty;
+	vdev->fops = &rzv2h_ivc_v4l2_fops;
+	vdev->ioctl_ops = &rzv2h_ivc_v4l2_ioctl_ops;
+	vdev->lock = &ivc->lock;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->queue = vb2q;
+	vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+	vdev->vfl_dir = VFL_DIR_TX;
+	video_set_drvdata(vdev, ivc);
+
+	memset(&pix, 0, sizeof(pix));
+	pix.pixelformat = V4L2_PIX_FMT_SRGGB16;
+	pix.width = RZV2H_IVC_DEFAULT_WIDTH;
+	pix.height = RZV2H_IVC_DEFAULT_HEIGHT;
+	rzv2h_ivc_set_format(ivc, &pix);
+
+	ivc->vdev.pad.flags = MEDIA_PAD_FL_SOURCE;
+	ivc->vdev.dev.entity.ops = &rzv2h_ivc_media_ops;
+	ret = media_entity_pads_init(&ivc->vdev.dev.entity, 1, &ivc->vdev.pad);
+	if (ret)
+		goto err_release_vb2q;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(ivc->dev, "failed to register params video device\n");
+		goto err_cleanup_vdev_entity;
+	}
+
+	ret = media_create_pad_link(&vdev->entity, 0, &ivc->subdev.sd.entity,
+				    RZV2H_IVC_SUBDEV_SINK_PAD,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(ivc->dev, "failed to create media link\n");
+		goto err_unregister_vdev;
+	}
+
+	ivc->sched = media_jobs_get_scheduler(vdev->entity.graph_obj.mdev);
+	if (IS_ERR(ivc->sched)) {
+		ret = PTR_ERR(ivc->sched);
+		goto err_remove_link;
+	}
+
+	ret = media_jobs_add_job_setup_func(ivc->sched,
+					    rzv2h_ivc_populate_media_job, ivc,
+					    MEDIA_JOB_TYPE_PIPELINE_PULSE);
+	if (ret)
+		goto err_put_media_job_scheduler;
+
+	return 0;
+
+err_put_media_job_scheduler:
+	media_jobs_put_scheduler(ivc->sched);
+err_remove_link:
+	media_entity_remove_links(&vdev->entity);
+err_unregister_vdev:
+	video_unregister_device(vdev);
+err_cleanup_vdev_entity:
+	media_entity_cleanup(&vdev->entity);
+err_release_vb2q:
+	vb2_queue_release(vb2q);
+
+	return ret;
+}
+
+void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc)
+{
+	struct video_device *vdev = &ivc->vdev.dev;
+	struct vb2_queue *vb2q = &ivc->vdev.vb2q;
+
+	media_jobs_put_scheduler(ivc->sched);
+	vb2_video_unregister_device(vdev);
+	media_entity_cleanup(&vdev->entity);
+	vb2_queue_release(vb2q);
+}
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
new file mode 100644
index 000000000000..6deee1c61a86
--- /dev/null
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/V2H Input Video Control Block driver
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/clk.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include <linux/wait.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#define RZV2H_IVC_REG_AXIRX_PLNUM			0x0000
+#define RZV2H_IVC_ONE_EXPOSURE				0x00
+#define RZV2H_IVC_TWO_EXPOSURE				0x01
+#define RZV2H_IVC_REG_AXIRX_PXFMT			0x0004
+#define RZV2H_IVC_INPUT_FMT_MIPI			(0 << 16)
+#define RZV2H_IVC_INPUT_FMT_CRU_PACKED			(1 << 16)
+#define RZV2H_IVC_PXFMT_DTYPE				GENMASK(7, 0)
+#define RZV2H_IVC_REG_AXIRX_SADDL_P0			0x0010
+#define RZV2H_IVC_REG_AXIRX_SADDH_P0			0x0014
+#define RZV2H_IVC_REG_AXIRX_SADDL_P1			0x0018
+#define RZV2H_IVC_REG_AXIRX_SADDH_P1			0x001c
+#define RZV2H_IVC_REG_AXIRX_HSIZE			0x0020
+#define RZV2H_IVC_REG_AXIRX_VSIZE			0x0024
+#define RZV2H_IVC_REG_AXIRX_BLANK			0x0028
+#define RZV2H_IVC_VBLANK(x)				((x) << 16)
+#define RZV2H_IVC_REG_AXIRX_STRD			0x0030
+#define RZV2H_IVC_REG_AXIRX_ISSU			0x0040
+#define RZV2H_IVC_REG_AXIRX_ERACT			0x0048
+#define RZV2H_IVC_REG_FM_CONTEXT			0x0100
+#define RZV2H_IVC_SOFTWARE_CFG				0x00
+#define RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG		BIT(0)
+#define RZV2H_IVC_MULTI_CONTEXT_SW_HW_CFG		BIT(1)
+#define RZV2H_IVC_REG_FM_MCON				0x0104
+#define RZV2H_IVC_REG_FM_FRCON				0x0108
+#define RZV2H_IVC_REG_FM_STOP				0x010c
+#define RZV2H_IVC_REG_FM_INT_EN				0x0120
+#define RZV2H_IVC_VVAL_IFPE				BIT(0)
+#define RZV2H_IVC_REG_FM_INT_STA			0x0124
+#define RZV2H_IVC_REG_AXIRX_FIFOCAP0			0x0208
+#define RZV2H_IVC_REG_CORE_CAPCON			0x020c
+#define RZV2H_IVC_REG_CORE_FIFOCAP0			0x0228
+#define RZV2H_IVC_REG_CORE_FIFOCAP1			0x022c
+
+#define RZV2H_IVC_MIN_WIDTH				640
+#define RZV2H_IVC_MAX_WIDTH				4096
+#define RZV2H_IVC_MIN_HEIGHT				480
+#define RZV2H_IVC_MAX_HEIGHT				4096
+#define RZV2H_IVC_DEFAULT_WIDTH				1920
+#define RZV2H_IVC_DEFAULT_HEIGHT			1080
+
+#define RZV2H_IVC_NUM_CLOCKS				3
+#define RZV2H_IVC_NUM_RESETS				3
+
+struct device;
+
+enum rzv2h_ivc_subdev_pads {
+	RZV2H_IVC_SUBDEV_SINK_PAD,
+	RZV2H_IVC_SUBDEV_SOURCE_PAD,
+	RZV2H_IVC_NUM_SUBDEV_PADS
+};
+
+struct rzv2h_ivc_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	dma_addr_t addr;
+};
+
+struct rzv2h_ivc_format {
+	u32 fourcc;
+	/*
+	 * The CRU packed pixel formats are bayer-order agnostic, so each could
+	 * support any one of the 4 possible media bus formats.
+	 */
+	u32 mbus_codes[4];
+	u8 dtype;
+};
+
+struct rzv2h_ivc {
+	struct device *dev;
+	void __iomem *base;
+	struct clk_bulk_data clks[RZV2H_IVC_NUM_CLOCKS];
+	struct reset_control_bulk_data resets[RZV2H_IVC_NUM_RESETS];
+	int irqnum;
+	u8 vvalid_ifp;
+
+	struct {
+		struct video_device dev;
+		struct vb2_queue vb2q;
+		struct media_pad pad;
+	} vdev;
+
+	struct {
+		struct v4l2_subdev sd;
+		struct media_pad pads[RZV2H_IVC_NUM_SUBDEV_PADS];
+	} subdev;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		wait_queue_head_t wq;
+		struct list_head queue;
+		struct list_head pending;
+		struct rzv2h_ivc_buf *curr;
+		unsigned int sequence;
+	} buffers;
+
+	struct media_job_scheduler *sched;
+
+	struct {
+		struct v4l2_pix_format pix;
+		const struct rzv2h_ivc_format *fmt;
+	} format;
+
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+	/* Lock to protect the interrupt counter */
+	spinlock_t spinlock;
+};
+
+int rzv2h_initialise_video_dev_and_queue(struct rzv2h_ivc *ivc,
+					 struct v4l2_device *v4l2_dev);
+void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc);
+int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc);
+void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc);
+void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val);
+void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
+			   u32 mask, u32 val);
+void rzv2h_ivc_send_next_buffer(struct rzv2h_ivc *ivc);
+void rzv2h_ivc_set_next_buffer(struct rzv2h_ivc *ivc);
-- 
2.34.1


