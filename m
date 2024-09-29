Return-Path: <linux-media+bounces-18749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5719895C1
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 15:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD82283012
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 13:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2209D17E010;
	Sun, 29 Sep 2024 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QH6/IGbp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FE17C9A3;
	Sun, 29 Sep 2024 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617444; cv=none; b=oxkqp2FJXkVB0U1e1gk7z6pJUxAzqzCRuP55qzAwYsVnpUNSbixKl0Zd7ExtsSw186cLvjCekOqGUma8XN8+EUDl7PZwb/YcWSSfWkqQMzgbfbLCshFj9Lky0QR96Ybgp7ebPeNcqw61K/FLF1OETbJh2+JGZhLBmrOlhUI1VAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617444; c=relaxed/simple;
	bh=BJyfg/bYawpzN0ZweGvRjC/Ui3Wm3vXBCxldTdF1wbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEtvs8nobhMXRMx4ErjfexnxOwvshTTaCc95qGaZCKx4+JAILuMtJH5vTX0jWvG8X8s8R+Ok611g6kcTdsnu7lMjyYhxn3A01l8wvyIoDedzNcoaln/qM98FnCvZybWgrfmegIIRwwdRNIx28/VC1izvLFLS65fnCBnbbaCcvUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QH6/IGbp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02231A98;
	Sun, 29 Sep 2024 15:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727617351;
	bh=BJyfg/bYawpzN0ZweGvRjC/Ui3Wm3vXBCxldTdF1wbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QH6/IGbpbJV+gDlbOlpvqcmDa2n8G2F0GuS8Awursera//bBjtbxgNgndcFHjBrM1
	 j5B9D9+nEyDTPP2E5qJuwKcFo4+ER+rD+NsMDWVw54Ruoi8QIVlat2zjBWQ6qkBQpa
	 a/UHgG6y+3oWau1+soN0O3VWB+bU4+KDaoVco6T4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: imx8mq-mipi-csi2: Drop system suspend/resume handlers
Date: Sun, 29 Sep 2024 16:43:54 +0300
Message-ID: <20240929134354.20735-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Video capture pipelines are suspended and resumes in a controlled
manner by the top-level driver (the CSI bridge driver in this case), to
ensure proper synchronization of sources and sinks. There is therefore
no need for system suspend/resume handlers in the imx8mq-mipi-csi2
driver. Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 81 +++----------------
 1 file changed, 10 insertions(+), 71 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0f56a40abf33..54b2de09692b 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -15,7 +15,6 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -62,10 +61,6 @@
 #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
 #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
 
-enum {
-	ST_POWERED	= 1,
-};
-
 enum imx8mq_mipi_csi_clk {
 	CSI2_CLK_CORE,
 	CSI2_CLK_ESC,
@@ -116,9 +111,6 @@ struct csi_state {
 
 	struct v4l2_mbus_config_mipi_csi2 bus;
 
-	struct mutex lock; /* Protect state */
-	u32 state;
-
 	struct regmap *phy_gpr;
 	u8 phy_gpr_reg;
 
@@ -400,27 +392,23 @@ static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 	}
 
-	mutex_lock(&state->lock);
-
 	if (enable) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 		ret = imx8mq_mipi_csi_start_stream(state, sd_state);
 		v4l2_subdev_unlock_state(sd_state);
 
 		if (ret < 0)
-			goto unlock;
+			goto out;
 
 		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
 		if (ret < 0)
-			goto unlock;
+			goto out;
 	} else {
 		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
 		imx8mq_mipi_csi_stop_stream(state);
 	}
 
-unlock:
-	mutex_unlock(&state->lock);
-
+out:
 	if (!enable || ret < 0)
 		pm_runtime_put(state->dev);
 
@@ -638,59 +626,14 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
  * Suspend/resume
  */
 
-static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-
-	mutex_lock(&state->lock);
-
-	if (state->state & ST_POWERED) {
-		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
-		state->state &= ~ST_POWERED;
-	}
-
-	mutex_unlock(&state->lock);
-}
-
-static int imx8mq_mipi_csi_pm_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-	int ret = 0;
-
-	mutex_lock(&state->lock);
-
-	if (!(state->state & ST_POWERED)) {
-		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
-	}
-
-	mutex_unlock(&state->lock);
-
-	return ret ? -EAGAIN : 0;
-}
-
-static int imx8mq_mipi_csi_suspend(struct device *dev)
-{
-	imx8mq_mipi_csi_pm_suspend(dev);
-
-	return 0;
-}
-
-static int imx8mq_mipi_csi_resume(struct device *dev)
-{
-	return imx8mq_mipi_csi_pm_resume(dev);
-}
-
 static int imx8mq_mipi_csi_runtime_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
 	int ret;
 
-	imx8mq_mipi_csi_pm_suspend(dev);
+	imx8mq_mipi_csi_stop_stream(state);
+	imx8mq_mipi_csi_clk_disable(state);
 
 	ret = icc_set_bw(state->icc_path, 0, 0);
 	if (ret)
@@ -711,13 +654,14 @@ static int imx8mq_mipi_csi_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	return imx8mq_mipi_csi_pm_resume(dev);
+	ret = imx8mq_mipi_csi_clk_enable(state);
+
+	return ret ? -EAGAIN : 0;
 }
 
 static const struct dev_pm_ops imx8mq_mipi_csi_pm_ops = {
 	RUNTIME_PM_OPS(imx8mq_mipi_csi_runtime_suspend,
 		       imx8mq_mipi_csi_runtime_resume, NULL)
-	SYSTEM_SLEEP_PM_OPS(imx8mq_mipi_csi_suspend, imx8mq_mipi_csi_resume)
 };
 
 /* -----------------------------------------------------------------------------
@@ -854,15 +798,13 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &state->sd);
 
-	mutex_init(&state->lock);
-
 	ret = imx8mq_mipi_csi_subdev_init(state);
 	if (ret < 0)
-		goto mutex;
+		return ret;
 
 	ret = imx8mq_mipi_csi_init_icc(pdev);
 	if (ret)
-		goto mutex;
+		return ret;
 
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
@@ -889,8 +831,6 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&state->sd);
 icc:
 	imx8mq_mipi_csi_release_icc(pdev);
-mutex:
-	mutex_destroy(&state->lock);
 
 	return ret;
 }
@@ -908,7 +848,6 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 	media_entity_cleanup(&state->sd.entity);
 	v4l2_subdev_cleanup(&state->sd);
-	mutex_destroy(&state->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 	imx8mq_mipi_csi_release_icc(pdev);
 }
-- 
Regards,

Laurent Pinchart


