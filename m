Return-Path: <linux-media+bounces-45507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B221DC06592
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C56218859C2
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCF831D746;
	Fri, 24 Oct 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/+1vIk7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C731A558;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761310296; cv=none; b=elOb6YLZDCq25ENPJQGn4UUpZMTiDqA2d6modQlHX919ewi0U9cWRoa3ISyQle+PMoVsTkTori+6xCM+ObzInjRkmmWCnizPu/B322LEDvk1qIXi26aAv5MhnPX7wXsqFk02ZdOCGezHExf9SW0Z4+VO8fdcY7mnzekUPdeZnTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761310296; c=relaxed/simple;
	bh=UIrJN68kElCxBVF7n6PJ8kfGlSlrI/qz1zPfJGHuaOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVrI84eqwRUsKxaR7GB3kMOT0MF0f2WSUecbwsO8xS1J2qIdY3oP/mRbbW+sJJbNOBFqY4jlQkUgU03bVfrQLrDHX6O6rp6pewan6tsKMeYs8tn6b7ZB4qyVeIdfikKaqd2Tppf70cocbnWLf3WVOq2ZBjO6Hz+dRg+OPKZXiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/+1vIk7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63AFCC2BCB7;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310296;
	bh=UIrJN68kElCxBVF7n6PJ8kfGlSlrI/qz1zPfJGHuaOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X/+1vIk7QkDKBeTNYkFRuCTWuVNEz8uU0F+/KUlisSGc8jBx4VPdvT7fFZB5t/aoQ
	 37xjz9BhVyXTFX8wlSQeswC5uaSPhOK5YM5nIp95WqgsNHoRbSaInaFHUcTpAer34K
	 Z4Tl3dNqQsxvfJUPI4y7PjVEn+PXBECf9P+YsTzFCSx/n6wgsOzNkVQ/4C/4bQTcEk
	 RjYAFMj5lc7D6/oQQV6U8U7xoN5aMiXFG6BoxzZ9KNpWMGeO3QkJwDIUvIhe9X7FmK
	 oOG+KoIW63aGYz+RF/ZclozGEjpXvaSHi8KjJFDcg3K9F6gROSGf94levlEx3GglCF
	 rNAjvWQmqxyDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D01CCF9E3;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:36 +0200
Subject: [PATCH v14 07/18] media: rockchip: add driver for the rockchip
 camera interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-7-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=12686;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=W6+5TZPeEqczgGgNhjcxJKv3eBYuIrq45EiGu3Fqx3Y=;
 b=A4+A1Xl2vksw515807eQK7QUBiP/tAdEEyBkNjmeDVQPfiNAong63E4UpaYa3pY1hACH0DS8h
 O2NEdW5exj8DmT+I5xil8F3nYabOI1n2OpgKTBUma9q8DrzIh4Jez5Z
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add the skeleton for a media controller centric V4L2 driver for the
Rockchip Camera Interface (CIF).
The skeleton features support for the PX30 Video Input Processor (VIP)
and the RK3568 Video Capture (VICAP) unit.

Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 MAINTAINERS                                        |   1 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  18 ++
 drivers/media/platform/rockchip/rkcif/Makefile     |   4 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  55 +++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 262 +++++++++++++++++++++
 7 files changed, 342 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4ef44651f7b..a4edcdf7af53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22217,6 +22217,7 @@ S:	Maintained
 F:	Documentation/admin-guide/media/rkcif*
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+F:	drivers/media/platform/rockchip/rkcif/
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
index 2f6f77afecfc..54b698c4cd2c 100644
--- a/drivers/media/platform/rockchip/Kconfig
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -3,6 +3,7 @@
 comment "Rockchip media platform drivers"
 
 source "drivers/media/platform/rockchip/rga/Kconfig"
+source "drivers/media/platform/rockchip/rkcif/Kconfig"
 source "drivers/media/platform/rockchip/rkcsi/Kconfig"
 source "drivers/media/platform/rockchip/rkisp1/Kconfig"
 source "drivers/media/platform/rockchip/rkvdec/Kconfig"
diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
index 33e24b47735c..522a7d3e30b0 100644
--- a/drivers/media/platform/rockchip/Makefile
+++ b/drivers/media/platform/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += rga/
+obj-y += rkcif/
 obj-y += rkcsi/
 obj-y += rkisp1/
 obj-y += rkvdec/
diff --git a/drivers/media/platform/rockchip/rkcif/Kconfig b/drivers/media/platform/rockchip/rkcif/Kconfig
new file mode 100644
index 000000000000..efd82ac35bd8
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/Kconfig
@@ -0,0 +1,18 @@
+config VIDEO_ROCKCHIP_CIF
+	tristate "Rockchip Camera Interface (CIF)"
+	depends on VIDEO_DEV
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on V4L_PLATFORM_DRIVERS
+	depends on PM && COMMON_CLK
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This is a driver for Rockchip Camera Interface (CIF). It is featured
+	  in many Rockchips SoCs in different variations, such as the PX30
+	  Video Input Processor (VIP, one Digital Video Port (DVP)) or the
+	  RK3568 Video Capture (VICAP, one DVP, one MIPI CSI-2 receiver) unit.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rockchip-cif.
diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
new file mode 100644
index 000000000000..c6837ed2f65c
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
+
+rockchip-cif-objs += rkcif-dev.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
new file mode 100644
index 000000000000..b456a56b5ac4
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2025 Collabora, Ltd.
+ */
+
+#ifndef _RKCIF_COMMON_H
+#define _RKCIF_COMMON_H
+
+#include <linux/clk.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#define RKCIF_DRIVER_NAME "rockchip-cif"
+#define RKCIF_CLK_MAX	  4
+
+struct rkcif_remote {
+	struct v4l2_async_connection async_conn;
+	struct v4l2_subdev *sd;
+};
+
+struct rkcif_match_data {
+	const char *const *clks;
+	unsigned int clks_num;
+};
+
+struct rkcif_device {
+	struct device *dev;
+
+	const struct rkcif_match_data *match_data;
+	struct clk_bulk_data clks[RKCIF_CLK_MAX];
+	unsigned int clks_num;
+	struct regmap *grf;
+	struct reset_control *reset;
+	void __iomem *base_addr;
+
+	struct media_device media_dev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_async_notifier notifier;
+};
+
+#endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
new file mode 100644
index 000000000000..9215dbe90353
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
+ * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2025 Collabora, Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+
+#include "rkcif-common.h"
+
+static const char *const px30_vip_clks[] = {
+	"aclk",
+	"hclk",
+	"pclk",
+};
+
+static const struct rkcif_match_data px30_vip_match_data = {
+	.clks = px30_vip_clks,
+	.clks_num = ARRAY_SIZE(px30_vip_clks),
+};
+
+static const char *const rk3568_vicap_clks[] = {
+	"aclk",
+	"hclk",
+	"dclk",
+	"iclk",
+};
+
+static const struct rkcif_match_data rk3568_vicap_match_data = {
+	.clks = rk3568_vicap_clks,
+	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
+};
+
+static const struct of_device_id rkcif_plat_of_match[] = {
+	{
+		.compatible = "rockchip,px30-vip",
+		.data = &px30_vip_match_data,
+	},
+	{
+		.compatible = "rockchip,rk3568-vicap",
+		.data = &rk3568_vicap_match_data,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
+
+static int rkcif_register(struct rkcif_device *rkcif)
+{
+	return 0;
+}
+
+static void rkcif_unregister(struct rkcif_device *rkcif)
+{
+}
+
+static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *sd,
+				struct v4l2_async_connection *asd)
+{
+	struct rkcif_remote *remote =
+		container_of(asd, struct rkcif_remote, async_conn);
+
+	remote->sd = sd;
+
+	return 0;
+}
+
+static int rkcif_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct rkcif_device *rkcif =
+		container_of(notifier, struct rkcif_device, notifier);
+
+	return v4l2_device_register_subdev_nodes(&rkcif->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations rkcif_notifier_ops = {
+	.bound = rkcif_notifier_bound,
+	.complete = rkcif_notifier_complete,
+};
+
+static irqreturn_t rkcif_isr(int irq, void *ctx)
+{
+	irqreturn_t ret = IRQ_NONE;
+
+	return ret;
+}
+
+static int rkcif_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rkcif_device *rkcif;
+	int ret, irq;
+
+	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
+	if (!rkcif)
+		return -ENOMEM;
+
+	rkcif->match_data = of_device_get_match_data(dev);
+	if (!rkcif->match_data)
+		return -ENODEV;
+
+	dev_set_drvdata(dev, rkcif);
+	rkcif->dev = dev;
+
+	rkcif->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rkcif->base_addr))
+		return PTR_ERR(rkcif->base_addr);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, rkcif_isr, IRQF_SHARED,
+			       dev_driver_string(dev), dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq\n");
+
+	if (rkcif->match_data->clks_num > RKCIF_CLK_MAX)
+		return dev_err_probe(dev, -EINVAL, "invalid number of clocks\n");
+
+	rkcif->clks_num = rkcif->match_data->clks_num;
+	for (unsigned int i = 0; i < rkcif->clks_num; i++)
+		rkcif->clks[i].id = rkcif->match_data->clks[i];
+	ret = devm_clk_bulk_get(dev, rkcif->clks_num, rkcif->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+
+	rkcif->reset = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(rkcif->reset))
+		return PTR_ERR(rkcif->reset);
+
+	rkcif->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
+						     "rockchip,grf");
+	if (IS_ERR(rkcif->grf))
+		rkcif->grf = NULL;
+
+	pm_runtime_enable(&pdev->dev);
+
+	rkcif->media_dev.dev = dev;
+	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
+		sizeof(rkcif->media_dev.model));
+	media_device_init(&rkcif->media_dev);
+
+	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
+	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
+	if (ret)
+		goto err_media_dev_cleanup;
+
+	ret = media_device_register(&rkcif->media_dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register media device: %d\n", ret);
+		goto err_v4l2_dev_unregister;
+	}
+
+	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
+	rkcif->notifier.ops = &rkcif_notifier_ops;
+
+	ret = rkcif_register(rkcif);
+	if (ret) {
+		dev_err(dev, "failed to register media entities: %d\n", ret);
+		goto err_notifier_cleanup;
+	}
+
+	ret = v4l2_async_nf_register(&rkcif->notifier);
+	if (ret)
+		goto err_rkcif_unregister;
+
+	return 0;
+
+err_rkcif_unregister:
+	rkcif_unregister(rkcif);
+err_notifier_cleanup:
+	v4l2_async_nf_cleanup(&rkcif->notifier);
+	media_device_unregister(&rkcif->media_dev);
+err_v4l2_dev_unregister:
+	v4l2_device_unregister(&rkcif->v4l2_dev);
+err_media_dev_cleanup:
+	media_device_cleanup(&rkcif->media_dev);
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static void rkcif_remove(struct platform_device *pdev)
+{
+	struct rkcif_device *rkcif = platform_get_drvdata(pdev);
+
+	v4l2_async_nf_unregister(&rkcif->notifier);
+	rkcif_unregister(rkcif);
+	v4l2_async_nf_cleanup(&rkcif->notifier);
+	media_device_unregister(&rkcif->media_dev);
+	v4l2_device_unregister(&rkcif->v4l2_dev);
+	media_device_cleanup(&rkcif->media_dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int rkcif_runtime_suspend(struct device *dev)
+{
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
+
+	/*
+	 * Reset CIF (CRU, DMA, FIFOs) to allow a clean resume.
+	 * Since this resets the IOMMU too, we cannot issue this reset when
+	 * resuming.
+	 */
+	reset_control_assert(rkcif->reset);
+	udelay(5);
+	reset_control_deassert(rkcif->reset);
+
+	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
+
+	return 0;
+}
+
+static int rkcif_runtime_resume(struct device *dev)
+{
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(rkcif->clks_num, rkcif->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rkcif_plat_pm_ops = {
+	.runtime_suspend = rkcif_runtime_suspend,
+	.runtime_resume = rkcif_runtime_resume,
+};
+
+static struct platform_driver rkcif_plat_drv = {
+	.driver = {
+		   .name = RKCIF_DRIVER_NAME,
+		   .of_match_table = rkcif_plat_of_match,
+		   .pm = &rkcif_plat_pm_ops,
+	},
+	.probe = rkcif_probe,
+	.remove = rkcif_remove,
+};
+module_platform_driver(rkcif_plat_drv);
+
+MODULE_DESCRIPTION("Rockchip Camera Interface (CIF) platform driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5



