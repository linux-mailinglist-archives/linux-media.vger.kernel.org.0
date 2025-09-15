Return-Path: <linux-media+bounces-42516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A6B57083
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 118BF3AAD22
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC652882AC;
	Mon, 15 Sep 2025 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MhmEQVyL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169542874F9;
	Mon, 15 Sep 2025 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918408; cv=none; b=jfY1CBD6YmVUucgDBHMNMdLqsdjqpmvefjB+5XD5C9ZGMClrMMywi7Bv9IQUjvq6QhpNTjUL/EUIsc/h5ZdZjRRxsOQXJLs8ljvlnQVbORJS1RzcArOxQ+4x6PqifRMPa475ftfBV42/O1k2atXVG3rO4UjVi3xGSkwSI9sNWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918408; c=relaxed/simple;
	bh=Z27Luf1hV+G1on3BVIe0T+c/+Uec1k2icLXye/u0ti8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNZvIFoA5/xxL3H4NmnR0SSL6te7V2WjueuEAHi2HJkocan7scTRbfHHTw2ohft6K9HS2IHL0ECcaG+DJuWNs7P+PJuqtE4Lg/QAUkgrIxCeUqm8Gr9P9xS4uypFPDoavB5UJjA1lX/XpwymgOEaYtfvck+f8/NGDJVO3tPb5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MhmEQVyL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CE69C71;
	Mon, 15 Sep 2025 08:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918327;
	bh=Z27Luf1hV+G1on3BVIe0T+c/+Uec1k2icLXye/u0ti8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MhmEQVyL8gjCC08MQpVOWDS/WJZkpCMczh/x5/hTG5s3+MPtVvIHHEPHc4pc66/wJ
	 TWUAWWAaaGJHRtzOXVHAig2QaJrGuuvyFFavQ4J6kSXNOKi/HlDvrRbmYEoQkKktCK
	 bQwCyDBEXZCdT4a+nF83ooZJGHwk4QZipfHXfOSE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:11 +0530
Subject: [PATCH v3 5/8] media: imx335: Handle runtime PM in leaf functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-5-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3696;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Z27Luf1hV+G1on3BVIe0T+c/+Uec1k2icLXye/u0ti8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SUhX05DKUd06tpXTMFe+FGdE3QhSD3w7+rf
 CGVbk05G5KJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0lAAKCRBD3pH5JJpx
 RYclEADIhswdS+Q8xhOeHejr9jsuwelt4B4kw1rCI4RpOpHMMGxGgXsItnqlbXBWzfFBUAxJ6FG
 qiqNVuDNt3MuKfJAXKsTjRtJRXeq1cnH8jzSZyXPaKY3yCjEzbkTrvefe8CGyFVNTrn1z3PNJ9Q
 tOykDLnAdVjh16FxKF9bzfcWGrvdqWcuTAwceMkE7jLDseR30CmAuANUMqu7oULiJPZHFtfZDgk
 VfOMhcvXwihSD3Bg3yxNViTqqnhVYmF2KmuSDghPsrTUY7kmGinK+/8g3M5RNbYe92N5ebBPl1g
 VDI5o1686jU5fjB7mZ5cTQvMm+3mpPpgfhvnOhHqKL6jk0fsB8h0rkYJkAB1C4dhlACEMg0oBzT
 q8/e+2lHoisZARiM2ZEDilqGbr2fYf9abufumVVAz1GZCG9BoicYTSwI/DUzYJttfV42I54wwaR
 Jy7EMdB61LRGuaFoXtslYkGqlM7zcE12xv1kNqaNouFLET8Mch/RwI938tvxjBYZ8XRjMJhB3kX
 vk3YXN9OLdyZjnVU36XF/3LrKNaujP1Rs4NMXzCDHwN4rzvSZ7gyyD5EYfWK001u5ZFCytQTSN8
 ZgTgoQtbMBeylNTELc31Fz465cuZnArXNgLyfHM9WYdUqiXmY+0OBOlqBgKuubyy2bOzMc39uuM
 4Lbue4/Jvrx069Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Simplify .s_stream callback implementation by moving the runtime PM
calls to the leaf functions. This patch should not affect any
functionality.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 51 ++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 62a76517ecb263a4fd7e7a593c02a3cdaf3da190..7631f41e6f1e65695fb76a66d9ac5a3588c69658 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -919,13 +919,17 @@ static int imx335_start_streaming(struct imx335 *imx335)
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
@@ -934,27 +938,27 @@ static int imx335_start_streaming(struct imx335 *imx335)
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
@@ -962,25 +966,29 @@ static int imx335_start_streaming(struct imx335 *imx335)
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
@@ -993,30 +1001,15 @@ static int imx335_stop_streaming(struct imx335 *imx335)
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


