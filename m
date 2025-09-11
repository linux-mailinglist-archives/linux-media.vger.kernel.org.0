Return-Path: <linux-media+bounces-42305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB2B52E95
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982145A3017
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2475C314A9D;
	Thu, 11 Sep 2025 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p4wHUX3n"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9F313E2B;
	Thu, 11 Sep 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586642; cv=none; b=R9LcIMoznSP9GWxwkk24BToWlzI0iZSexhO14ujksPufcSA96LsPNdzE/9vnuE7CulqTnaFhHgqcl6jwGuVZO9xNyTrMaCxnblw6Oayv4xYNwqCibaDxkai9Rd5VI2sh3dZxjJCPO78tbUInJ+10ZQk6zWtMZUsrGNZT52rwFTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586642; c=relaxed/simple;
	bh=wcv/yuJXsjH3Dbu1OjLNr4e0vAv5beeb/5Gkk4AP2fI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CedeO+k2i/83YyLxi4QXOo0Ibu8KewBtBWxcYLhZ62FHE+y0XCzRniHsgMheMFnHNav4sQZJV4V6wxNNYKY9wJrpotYKoRPz6Uomu8m58sdopYadLgQmb7tbwkwKy4Ieq9+buEMUSuTbUjNXJGIib4zDcZoMEsBRlEp6c0rSq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p4wHUX3n; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BAUIX5273541;
	Thu, 11 Sep 2025 05:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757586618;
	bh=wyk0iOCO2C9gbXR4bLbd2UVCDCrVo7otWVB1PBsf1WE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p4wHUX3nXJGiE6gjhOhHIvhd49qyASx9d7LZHcyMHV9GCOcDPzLOhuduK7oHYzheP
	 YfGJUtwa+KjcRQjm4SlXLMfp9pCojrl8MJYTeTeFENgqKJHBqrFv0uXvA4UgOU0c34
	 0WHObtXhA/w6GQD0jEaCj2msOzBpwDP7UfojKJXc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BAUIbq1093895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 05:30:18 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:30:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:30:18 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BASXbs1985821;
	Thu, 11 Sep 2025 05:30:11 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
        <hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 14/16] media: cadence: csi2rx: Support runtime PM
Date: Thu, 11 Sep 2025 15:58:30 +0530
Message-ID: <20250911102832.1583440-15-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911102832.1583440-1-r-donadkar@ti.com>
References: <20250911102832.1583440-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Use runtime power management hooks to save power when CSI-RX is not in
use.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/Kconfig       |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c | 129 ++++++++++++-------
 2 files changed, 83 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 1aa608c00dbc..ea85ef82760e 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
 	depends on VIDEO_DEV
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 11b73c79adff..fce9397448cd 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -343,11 +343,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
 	if (csi2rx->error_irq >= 0)
@@ -388,7 +383,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		if (ret) {
 			dev_err(csi2rx->dev,
 				"Failed to configure external DPHY: %d\n", ret);
-			goto err_disable_pclk;
+			return ret;
 		}
 	}
 
@@ -403,12 +398,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 * hence the reference counting.
 	 */
 	for (i = 0; i < csi2rx->max_streams; i++) {
-		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
-		if (ret)
-			goto err_disable_pixclk;
-
-		reset_control_deassert(csi2rx->pixel_rst[i]);
-
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
 			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
 					  csi2rx->num_pixels[i]),
@@ -421,30 +410,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
 	}
 
-	ret = clk_prepare_enable(csi2rx->sys_clk);
-	if (ret)
-		goto err_disable_pixclk;
-
-	reset_control_deassert(csi2rx->sys_rst);
-
-	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
-
-err_disable_pixclk:
-	for (; i > 0; i--) {
-		reset_control_assert(csi2rx->pixel_rst[i - 1]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
-	}
-
-	if (csi2rx->dphy) {
-		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
-		phy_power_off(csi2rx->dphy);
-	}
-err_disable_pclk:
-	clk_disable_unprepare(csi2rx->p_clk);
-
-	return ret;
 }
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
@@ -453,10 +420,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	u32 val;
 	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
-	reset_control_assert(csi2rx->sys_rst);
-	clk_disable_unprepare(csi2rx->sys_clk);
-
 	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
 
 	for (i = 0; i < csi2rx->max_streams; i++) {
@@ -471,14 +434,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 		if (ret)
 			dev_warn(csi2rx->dev,
 				 "Failed to stop streaming on pad%u\n", i);
-
-		reset_control_assert(csi2rx->pixel_rst[i]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i]);
 	}
 
-	reset_control_assert(csi2rx->p_rst);
-	clk_disable_unprepare(csi2rx->p_clk);
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -555,10 +512,17 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 	 * enable the whole controller.
 	 */
 	if (!csi2rx->count) {
+		ret = pm_runtime_resume_and_get(csi2rx->dev);
+		if (ret < 0)
+			return ret;
+
 		csi2rx_update_vc_select(csi2rx, state);
+
 		ret = csi2rx_start(csi2rx);
-		if (ret)
+		if (ret) {
+			pm_runtime_put(csi2rx->dev);
 			return ret;
+		}
 	}
 
 	/* Start streaming on the source */
@@ -568,8 +532,10 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 		dev_err(csi2rx->dev,
 			"Failed to start streams %#llx on subdev\n",
 			sink_streams);
-		if (!csi2rx->count)
+		if (!csi2rx->count) {
 			csi2rx_stop(csi2rx);
+			pm_runtime_put(csi2rx->dev);
+		}
 		return ret;
 	}
 
@@ -597,8 +563,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
 	csi2rx->count--;
 
 	/* Let the last user turn off the lights. */
-	if (!csi2rx->count)
+	if (!csi2rx->count) {
 		csi2rx_stop(csi2rx);
+		pm_runtime_put(csi2rx->dev);
+	}
 
 	return 0;
 }
@@ -1101,6 +1069,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -1115,6 +1084,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -1133,9 +1103,73 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
+	pm_runtime_disable(csi2rx->dev);
 	kfree(csi2rx);
 }
 
+static int csi2rx_runtime_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+
+	reset_control_assert(csi2rx->sys_rst);
+	clk_disable_unprepare(csi2rx->sys_clk);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		reset_control_assert(csi2rx->pixel_rst[i]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return 0;
+}
+
+static int csi2rx_runtime_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+	int ret;
+
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(csi2rx->p_rst);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
+		if (ret)
+			goto err_disable_pixclk;
+
+		reset_control_deassert(csi2rx->pixel_rst[i]);
+	}
+
+	ret = clk_prepare_enable(csi2rx->sys_clk);
+	if (ret)
+		goto err_disable_pixclk;
+
+	reset_control_deassert(csi2rx->sys_rst);
+
+	return 0;
+
+err_disable_pixclk:
+	for (; i > 0; i--) {
+		reset_control_assert(csi2rx->pixel_rst[i - 1]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
+};
+
 static const struct of_device_id csi2rx_of_table[] = {
 	{ .compatible = "starfive,jh7110-csi2rx" },
 	{ .compatible = "cdns,csi2rx" },
@@ -1150,6 +1184,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);
-- 
2.34.1


