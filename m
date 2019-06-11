Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8315C3D6B1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 21:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407508AbfFKTVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 15:21:19 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:37644 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407495AbfFKTVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:18 -0400
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 208A5C0199;
        Tue, 11 Jun 2019 19:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560280877; bh=2lagE3xzIjKXevg4rJegdsYJOP1YZdgNLZhn6DYJwlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JEwpkbPsMK+Knjs0HQqvlwu/ktkoRksJkvLi3RB7fHlfCKzbWzBbluQi7GOiPpeYO
         ecSlZgV+WLC1gP4tGF8iYe1XDHTZWRbZeiFN7p75suIVYGlneDYP1vPTOFbGpngjE9
         mnPFIDFcCh8n+bdtKnpJzFi/brLt5KCSx8WgSXJdXz5mUDvMmnxHNDqxvTX6n/RRG9
         smBOCXnFftZtgdJUCYDvmFI6IsZ0J118BkZC5zGFqdUvSGyau1beA5fcccBX8/AlGB
         1Fa+Y83KvUskjafhODH9TdHmRQvdY9dM6gaNPLeICmS+C7VX2sPBg69xH+RE4MJvkO
         /kpku9hzPYyPw==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id C673EA022F;
        Tue, 11 Jun 2019 19:21:15 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id B226D3F89F;
        Tue, 11 Jun 2019 21:21:15 +0200 (CEST)
From:   Luis Oliveira <Luis.Oliveira@synopsys.com>
To:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 3/6] media: platform: dwc: Add MIPI CSI-2 platform data
Date:   Tue, 11 Jun 2019 21:20:52 +0200
Message-Id: <1560280855-18085-4-git-send-email-luis.oliveira@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This allows the driver loading via platform data which makes the driver
not device tree dependent.

Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
v3-v4
- not present on v3, allows configuration using pdata

 MAINTAINERS                              |   1 +
 drivers/media/platform/dwc/dw-csi-plat.c | 105 +++++++++++++++++++++----------
 include/media/dwc/dw-csi-data.h          |  26 ++++++++
 3 files changed, 100 insertions(+), 32 deletions(-)
 create mode 100644 include/media/dwc/dw-csi-data.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ffe4fd..2df1f7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15193,6 +15193,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/platform/dwc
+F:	include/media/dwc/dw-csi-data.h
 F:	Documentation/devicetree/bindings/media/snps,dw-csi.txt
 
 SYNOPSYS DESIGNWARE DMAC DRIVER
diff --git a/drivers/media/platform/dwc/dw-csi-plat.c b/drivers/media/platform/dwc/dw-csi-plat.c
index 9828d55..c7117c6 100644
--- a/drivers/media/platform/dwc/dw-csi-plat.c
+++ b/drivers/media/platform/dwc/dw-csi-plat.c
@@ -8,6 +8,7 @@
  * Author: Luis Oliveira <luis.oliveira@synopsys.com>
  */
 
+#include <media/dwc/dw-csi-data.h>
 #include <media/dwc/dw-dphy-data.h>
 
 #include "dw-csi-plat.h"
@@ -312,12 +313,16 @@ static const struct of_device_id dw_mipi_csi_of_match[];
 static int dw_csi_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *of_id = NULL;
+	struct dw_csih_pdata *pdata;
 	struct device *dev = &pdev->dev;
 	struct resource *res = NULL;
 	struct dw_csi *csi;
 	struct v4l2_subdev *sd;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_OF))
+		pdata = pdev->dev.platform_data;
+
 	dev_vdbg(dev, "Probing started\n");
 
 	/* Resource allocation */
@@ -329,18 +334,29 @@ static int dw_csi_probe(struct platform_device *pdev)
 	spin_lock_init(&csi->slock);
 	csi->dev = dev;
 
-	of_id = of_match_node(dw_mipi_csi_of_match, dev->of_node);
-	if (!of_id)
-		return -EINVAL;
+	if (dev->of_node) {
+		of_id = of_match_node(dw_mipi_csi_of_match, dev->of_node);
+		if (!of_id)
+			return -EINVAL;
 
-	ret = dw_mipi_csi_parse_dt(pdev, csi);
-	if (ret < 0)
-		return ret;
+		ret = dw_mipi_csi_parse_dt(pdev, csi);
+		if (ret < 0)
+			return ret;
 
-	csi->phy = devm_of_phy_get(dev, dev->of_node, NULL);
-	if (IS_ERR(csi->phy)) {
-		dev_err(dev, "No DPHY available\n");
-		return PTR_ERR(csi->phy);
+		csi->phy = devm_of_phy_get(dev, dev->of_node, NULL);
+		if (IS_ERR(csi->phy)) {
+			dev_err(dev, "No DPHY available\n");
+			return PTR_ERR(csi->phy);
+		}
+	} else {
+		csi->phy = devm_phy_get(dev, phys[pdata->id].name);
+		if (IS_ERR(csi->phy)) {
+			dev_err(dev, "No '%s' DPHY available\n",
+				phys[pdata->id].name);
+			return PTR_ERR(csi->phy);
+		}
+		dev_vdbg(dev, "got D-PHY %s with id %d\n", phys[pdata->id].name,
+			 csi->phy->id);
 	}
 	/* Registers mapping */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -370,7 +386,10 @@ static int dw_csi_probe(struct platform_device *pdev)
 			       dw_mipi_csi_irq1, IRQF_SHARED,
 			       dev_name(dev), csi);
 	if (ret) {
-		dev_err(dev, "irq csi %s failed\n", of_id->name);
+		if (dev->of_node)
+			dev_err(dev, "irq csi %s failed\n", of_id->name);
+	else
+		dev_err(dev, "irq csi %d failed\n", pdata->id);
 
 		goto end;
 	}
@@ -379,25 +398,44 @@ static int dw_csi_probe(struct platform_device *pdev)
 	v4l2_subdev_init(sd, &dw_mipi_csi_subdev_ops);
 	csi->sd.owner = THIS_MODULE;
 
-	snprintf(sd->name, sizeof(sd->name), "%s.%d",
-		 "dw-csi", csi->index);
+	if (dev->of_node) {
+		snprintf(sd->name, sizeof(sd->name), "%s.%d",
+			 "dw-csi", csi->index);
 
-	csi->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+		csi->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	} else {
+		strlcpy(sd->name, dev_name(dev), sizeof(sd->name));
+		strlcpy(csi->v4l2_dev.name, dev_name(dev),
+			sizeof(csi->v4l2_dev.name));
+	}
 	csi->fmt = &dw_mipi_csi_formats[0];
 	csi->format.code = dw_mipi_csi_formats[0].mbus_code;
 
 	sd->entity.function = MEDIA_ENT_F_IO_V4L;
-	csi->pads[CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	csi->pads[CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&csi->sd.entity,
-				     CSI_PADS_NUM, csi->pads);
 
-	dev_vdbg(dev, "v4l2.name: %s\n", csi->v4l2_dev.name);
+	if (dev->of_node) {
+		csi->pads[CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+		csi->pads[CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
-	if (ret < 0) {
-		dev_err(dev, "media entity init failed\n");
-		goto end;
+		ret = media_entity_pads_init(&csi->sd.entity,
+					     CSI_PADS_NUM, csi->pads);
+		if (ret < 0) {
+			dev_err(dev, "media entity init failed\n");
+			goto end;
+		}
+	} else {
+		csi->hw.num_lanes = pdata->lanes;
+		csi->hw.pclk = pdata->pclk;
+		csi->hw.fps = pdata->fps;
+		csi->hw.dphy_freq = pdata->hs_freq;
+
+		ret = v4l2_device_register(NULL, &csi->v4l2_dev);
+		if (ret) {
+			dev_err(dev, "failed to register v4l2 device\n");
+			goto end;
+		}
 	}
+	dev_vdbg(dev, "v4l2.name: %s\n", csi->v4l2_dev.name);
 
 	v4l2_set_subdevdata(&csi->sd, pdev);
 	platform_set_drvdata(pdev, &csi->sd);
@@ -405,6 +443,7 @@ static int dw_csi_probe(struct platform_device *pdev)
 
 	if (csi->rst)
 		reset_control_deassert(csi->rst);
+
 #if IS_ENABLED(CONFIG_DWC_MIPI_TC_DPHY_GEN3)
 	dw_csi_create_capabilities_sysfs(pdev);
 #endif
@@ -418,11 +457,12 @@ static int dw_csi_probe(struct platform_device *pdev)
 	phy_init(csi->phy);
 
 	return 0;
-
 end:
+#if IS_ENABLED(CONFIG_OF)
 	media_entity_cleanup(&csi->sd.entity);
+	return ret;
+#endif
 	v4l2_device_unregister(csi->vdev.v4l2_dev);
-
 	return ret;
 }
 
@@ -436,35 +476,36 @@ static int dw_csi_remove(struct platform_device *pdev)
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct dw_csi *mipi_csi = sd_to_mipi_csi_dev(sd);
 
-	dev_dbg(&pdev->dev, "Removing MIPI CSI-2 module\n");
+	dev_dbg(&pdev->dev, "Removing DW MIPI CSI-2 Host module\n");
 
 	if (mipi_csi->rst)
 		reset_control_assert(mipi_csi->rst);
+#if IS_ENABLED(CONFIG_OF)
 	media_entity_cleanup(&mipi_csi->sd.entity);
-
+#else
+	v4l2_device_unregister(mipi_csi->vdev.v4l2_dev);
+#endif
 	return 0;
 }
 
-/**
- * @short of_device_id structure
- */
+#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id dw_mipi_csi_of_match[] = {
 	{ .compatible = "snps,dw-csi" },
 	{},
 };
 
 MODULE_DEVICE_TABLE(of, dw_mipi_csi_of_match);
+#endif
 
-/**
- * @short Platform driver structure
- */
 static struct platform_driver dw_mipi_csi_driver = {
 	.remove = dw_csi_remove,
 	.probe = dw_csi_probe,
 	.driver = {
 		.name = "dw-csi",
 		.owner = THIS_MODULE,
+#if IS_ENABLED(CONFIG_OF)
 		.of_match_table = of_match_ptr(dw_mipi_csi_of_match),
+#endif
 	},
 };
 
diff --git a/include/media/dwc/dw-csi-data.h b/include/media/dwc/dw-csi-data.h
new file mode 100644
index 0000000..87942ab
--- /dev/null
+++ b/include/media/dwc/dw-csi-data.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Synopsys DesignWare MIPI CSI-2 platform data
+ *
+ * Author: Luis Oliveira <Luis.Oliveira@synopsys.com>
+ */
+
+#include <linux/kernel.h>
+#include <media/dwc/dw-mipi-csi-pltfrm.h>
+
+struct dw_csih_pdata {
+	u8 eotp_enabled;
+	u32 hs_freq;
+	u32 lanes;
+	u32 pclk;
+	u32 fps;
+	u32 bpp;
+	u8 id;
+};
+
+static const struct pdata_names csis[] = {
+	{ .name = "dw-csi.0", },
+	{ .name = "dw-csi.1", },
+};
-- 
2.7.4

