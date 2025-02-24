Return-Path: <linux-media+bounces-26832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0226A42199
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4FF176BAA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4E33FBB3;
	Mon, 24 Feb 2025 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tUGCzz0v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94641248866;
	Mon, 24 Feb 2025 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404450; cv=none; b=OjT17E/SjyhrAzM6JxnDIaPftuekNsYlsxN1oGL+7C7fJxgANlQtGwm91rS+3+dShhdLbY15hv+J7xQhyi5T1YGxTj7ZJoyW09yFo/bdG1KD5nwK1ioWNCOkBjGXsQs4R2SSZZDFCTMslQzOFXnldn6WhAcw1fr1L4Nmtr0F7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404450; c=relaxed/simple;
	bh=/hb8XpoHfN5TkFNW4WCJoAf7bdbLnMTQCs8WzFgEb8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yt+93bEI57d6We3bBhwt/VBZTyRhlYJnETnYMqrnC8sBrHwo8GaVdqnAf8SZUforX0Br264TEIIeHvlAw9JUYZscYcxkLb6U6Imxm6FC/yUSpP+YN6QldnhkfhmLMFVQWF47dvEuMto2cBRW5la495oJgy4PuMfaApPfSl9Gjp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tUGCzz0v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DCBE455;
	Mon, 24 Feb 2025 14:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740404361;
	bh=/hb8XpoHfN5TkFNW4WCJoAf7bdbLnMTQCs8WzFgEb8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tUGCzz0vyRAUUstWDEaZjnzwb9qytJeNvIbo/9nv3AIhHWqhsMWnGxC0mqf+JTrsT
	 qNAUmbQUJcoHZH2U7TK3sMQiJe+A7osEdWNuZclUOOU6MiQnMLRd4cbA/p0zEibHPq
	 JyGlxpNse+6YiYTmuiruHLXT2FhUtwuLRtPFwsIU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Feb 2025 19:05:56 +0530
Subject: [PATCH 1/3] media: cadence: csi2rx: Support runtime PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-ti_csi_pm-v1-1-8f8c29ef646d@ideasonboard.com>
References: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
In-Reply-To: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7317;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=90ICLFjJh7hBrJU7wrD1GxE2bG6CWGg7Dagw1g1eEMw=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvHbAtW75BWsui36gFb+G1tB0zQTyjWwkpXeOA
 wZPrVeHIT2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7x2wAAKCRBD3pH5JJpx
 ReJnD/9s8msMhdoBjdjY+Joxka44sVEAxDnxYrM7JaL+v5nre937m+pTRC0P/wJH8ZX0BZFGOVU
 UjciA81Vo5oxCg1Jk6quq15v7nBi66VsQJrC0D1GBrQdkyyHY2HECI64Scq7BuONlzBcDOhd3iq
 XgxquZlIPX1Oy+SJPawbeYvx7K3qWnAuQnhl7oKxeCMJb3xUurKRrbT4ihO1tng4Wegow9oZbZ9
 gaQF5lfIWTl4j+JhKUiQK+SBtGT3iawE20y4gpHXoEjqRY9jvp+ssccLI7hjkOlDv1v7RvKl70u
 WFeCk6V6C197EzFlZc8+Y2zbenSg0Sbkq6NmDw8DWASSK2ohH5SLz0o8yMxjLhuUqUA3pTIjAJx
 axF9bt8DY5s+TLOjoOVvY3UAFhqpt4+NqpeEEmci9xMq/oCh4Vl15ZS6bH1IejR9prxJUyjTn4f
 q6hljxMzQS4xnew5kS4NAjk/sGWp3bFigFcpdsjbTI3vaopEujMvBFP1lwL6Cml0avQJS5btHFm
 0zFAEMTW0z91wKNnx6RALs675I8WODXDnTCuBdcu5j+zYXDdVa82N8drAKDf4zGPW0PdHFtdu/u
 KvPsTx6+MGqcBA6czx/HEhe5ET24Px4oPzGAMxjNGpc+Ob2VH9pSLqRN1aI5CRA94a/2AZOo8yS
 znlZDgAlcYO56Gw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Use runtime power management hooks to save power when CSI-RX is not in
use.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/cadence/Kconfig       |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c | 121 ++++++++++++++++++---------
 2 files changed, 81 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 1aa608c00dbce9b52d0d48b5ac8c877db7494fd7..ea85ef82760e694c1e03fa323fc7a468b135e2e1 100644
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
index 4d64df829e7585b6e305651f3ff9bdd008508ec5..44d3189fbec11d391352d4630326d78962b49a0e 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -211,11 +211,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
 	reg = csi2rx->num_lanes << 8;
@@ -253,7 +248,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		if (ret) {
 			dev_err(csi2rx->dev,
 				"Failed to configure external DPHY: %d\n", ret);
-			goto err_disable_pclk;
+			return ret;
 		}
 	}
 
@@ -268,11 +263,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 * hence the reference counting.
 	 */
 	for (i = 0; i < csi2rx->max_streams; i++) {
-		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
-		if (ret)
-			goto err_disable_pixclk;
-
-		reset_control_deassert(csi2rx->pixel_rst[i]);
 
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
@@ -288,34 +278,18 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
 	}
 
-	ret = clk_prepare_enable(csi2rx->sys_clk);
-	if (ret)
-		goto err_disable_pixclk;
-
-	reset_control_deassert(csi2rx->sys_rst);
 
 	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
 	if (ret)
-		goto err_disable_sysclk;
-
-	clk_disable_unprepare(csi2rx->p_clk);
+		goto err_phy_power_off;
 
 	return 0;
 
-err_disable_sysclk:
-	clk_disable_unprepare(csi2rx->sys_clk);
-err_disable_pixclk:
-	for (; i > 0; i--) {
-		reset_control_assert(csi2rx->pixel_rst[i - 1]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
-	}
-
+err_phy_power_off:
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 		phy_power_off(csi2rx->dphy);
 	}
-err_disable_pclk:
-	clk_disable_unprepare(csi2rx->p_clk);
 
 	return ret;
 }
@@ -326,10 +300,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	u32 val;
 	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
-	reset_control_assert(csi2rx->sys_rst);
-	clk_disable_unprepare(csi2rx->sys_clk);
-
 	for (i = 0; i < csi2rx->max_streams; i++) {
 		writel(CSI2RX_STREAM_CTRL_STOP,
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
@@ -342,14 +312,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
 	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
 		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
 
@@ -374,9 +338,15 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 		 * enable the whole controller.
 		 */
 		if (!csi2rx->count) {
+			ret = pm_runtime_resume_and_get(csi2rx->dev);
+			if (ret < 0)
+				goto out;
+
 			ret = csi2rx_start(csi2rx);
-			if (ret)
+			if (ret) {
+				pm_runtime_put(csi2rx->dev);
 				goto out;
+			}
 		}
 
 		csi2rx->count++;
@@ -386,8 +356,10 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 		/*
 		 * Let the last user turn off the lights.
 		 */
-		if (!csi2rx->count)
+		if (!csi2rx->count) {
 			csi2rx_stop(csi2rx);
+			pm_runtime_put(csi2rx->dev);
+		}
 	}
 
 out:
@@ -707,6 +679,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -721,6 +694,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -739,9 +713,73 @@ static void csi2rx_remove(struct platform_device *pdev)
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
@@ -756,6 +794,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);

-- 
2.48.1


