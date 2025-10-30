Return-Path: <linux-media+bounces-45989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CECC1F0B1
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687EA189E3F3
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191B733B970;
	Thu, 30 Oct 2025 08:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZQhoRzoz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF34334688;
	Thu, 30 Oct 2025 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813822; cv=none; b=pYy2GzAZ5vB75FdNR/uBxTJeRdVgf+JueozwdtUsxdh6hVetYad+4YomhyKTb38KYNw4WhgGeSDys1DMtYoOpxUqlhF8ItNU82rMhC3nAEBg02vWJ7tbIlxLo9282MmBl/kFYiBr/lQ708Yaku0w3g7F5Ic7j3MHuH71o0qBPUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813822; c=relaxed/simple;
	bh=DptlhcOCv/jEqQi8H1Qnjja+E+XZztRNKeEjDcwb0to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4+pJWVqGodn/POuivcw7mfqkASaL4HFU1+x4CgILPCik/nJCXwMwt3/hdI++1oNUz4Ko0S3qaLwd3JPHRcSfdhmR0xC5Tqr+Od/dr+9to1SHF7oIzt82pxreGgDWx5FnhSHdxmZwCE15nMNhArlT40zSnjH2rdYTlYu6yYB4Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZQhoRzoz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51B85EAE;
	Thu, 30 Oct 2025 09:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813709;
	bh=DptlhcOCv/jEqQi8H1Qnjja+E+XZztRNKeEjDcwb0to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQhoRzozdozkqobwZEG7sAV1jVq0Y3Bf5ufsrcw44qv9Tk81hfPEiMzWmSVEnfxCt
	 r+S9osOCOvoUrD8trebtDmDhDtl2B8QlBTnYfCOcRx7t42W4xoDrPYUWMM/7N327Tm
	 HPDaeHaZIRT/l7Um9t+gLSR/hwg6InDyOuOKblCs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 5/8] media: imx335: Handle runtime PM in leaf functions
Date: Thu, 30 Oct 2025 14:12:58 +0530
Message-ID: <20251030-imx335_binning-v4-5-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Simplify .s_stream callback implementation by moving the runtime PM
calls to the leaf functions. This patch should not affect any
functionality.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 51 ++++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 77863a28c4725ae151ac60213ab05a46bd1549ee..5e18eb998f9d76907ef88cd09ee19e7afe9166e4 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -912,13 +912,17 @@ static int imx335_start_streaming(struct imx335 *imx335)
 	const struct imx335_reg_list *reg_list;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(imx335->dev);
+	if (ret < 0)
+		return ret;
+
 	/* Setup PLL */
 	reg_list = &link_freq_reglist[__ffs(imx335->link_freq_bitmap)];
 	ret = cci_multi_reg_write(imx335->cci, reg_list->regs,
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx335->dev, "%s failed to set plls\n", __func__);
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Write sensor mode registers */
@@ -927,27 +931,27 @@ static int imx335_start_streaming(struct imx335 *imx335)
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx335->dev, "fail to write initial registers\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	ret = imx335_set_framefmt(imx335);
 	if (ret) {
 		dev_err(imx335->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Configure lanes */
 	ret = cci_write(imx335->cci, IMX335_REG_LANEMODE,
 			imx335->lane_mode, NULL);
 	if (ret)
-		return ret;
+		goto err_rpm_put;
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
 	if (ret) {
 		dev_err(imx335->dev, "fail to setup handler\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Start streaming */
@@ -955,25 +959,29 @@ static int imx335_start_streaming(struct imx335 *imx335)
 			IMX335_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx335->dev, "fail to start streaming\n");
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Initial regulator stabilization period */
 	usleep_range(18000, 20000);
 
 	return 0;
+
+err_rpm_put:
+	pm_runtime_put(imx335->dev);
+
+	return ret;
 }
 
 /**
  * imx335_stop_streaming() - Stop sensor stream
  * @imx335: pointer to imx335 device
- *
- * Return: 0 if successful, error code otherwise.
  */
-static int imx335_stop_streaming(struct imx335 *imx335)
+static void imx335_stop_streaming(struct imx335 *imx335)
 {
-	return cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
-			 IMX335_MODE_STANDBY, NULL);
+	cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
+		  IMX335_MODE_STANDBY, NULL);
+	pm_runtime_put(imx335->dev);
 }
 
 /**
@@ -986,30 +994,15 @@ static int imx335_stop_streaming(struct imx335 *imx335)
 static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx335 *imx335 = to_imx335(sd);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&imx335->mutex);
 
-	if (enable) {
-		ret = pm_runtime_resume_and_get(imx335->dev);
-		if (ret)
-			goto error_unlock;
-
+	if (enable)
 		ret = imx335_start_streaming(imx335);
-		if (ret)
-			goto error_power_off;
-	} else {
+	else
 		imx335_stop_streaming(imx335);
-		pm_runtime_put(imx335->dev);
-	}
-
-	mutex_unlock(&imx335->mutex);
 
-	return 0;
-
-error_power_off:
-	pm_runtime_put(imx335->dev);
-error_unlock:
 	mutex_unlock(&imx335->mutex);
 
 	return ret;

-- 
2.51.0

