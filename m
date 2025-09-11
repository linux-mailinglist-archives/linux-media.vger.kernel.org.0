Return-Path: <linux-media+bounces-42261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF6B52B5E
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D903B1FCB
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3182DF121;
	Thu, 11 Sep 2025 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nz8btcSD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1D2E2663;
	Thu, 11 Sep 2025 08:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578531; cv=none; b=Ho4z2DSHuMag+UUSqoo/6CmhksidnJ+G8hB1yfph8gbs5QuVAX9kBJthiF3u5wIOfmV289RvgENibDy1XRmVFq3UedOaOh+5/ilbnO3vo6rQsH3vi+5/G4lEHlCCzmgvxvD0dteE+z8oOUh3R70yXz/xEuCQ/ysZju4ofcFkFoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578531; c=relaxed/simple;
	bh=bLOkEQEv8lxgOKj1znhro5fYwb+dRvfhABBzfwGQTEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBSuQSH9JqqMdzPSTZWk61GWkjPdYk/SHVn9iPhWgvAV9Ue3ASIgKNhvu9R6R9oDWP0+yc0HFMkw1nlfG3jT3D61tJ8xYhmaRltHuKPK+FW1/NFl/DXx+ZJbprEL2icO3E43OaGzqwcqfHuyhTieFNXxf5L2vRep6clLzH5/znM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nz8btcSD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FA744A4;
	Thu, 11 Sep 2025 10:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578453;
	bh=bLOkEQEv8lxgOKj1znhro5fYwb+dRvfhABBzfwGQTEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nz8btcSD5xUzc2y5rnRnOKyvzAYcrujPCiYkVWmk5hXjwC9lSlODTEnmvjopuUzOu
	 h3u+ZG8InJDN724BFZO7eQh5Oji9Zh0+CvJFdL+sHyu3qAlByyd+JKkOdQ4pfQa99f
	 4tBzJeDT/JZiacEqDBato34xG3rMj+j74GT+ts28=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:21 +0530
Subject: [PATCH v2 5/8] media: imx335: Handle runtime PM in leaf functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-5-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3633;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=bLOkEQEv8lxgOKj1znhro5fYwb+dRvfhABBzfwGQTEM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTwSWRqlbkm0BcDEx3dk//gQy0tNcw2lZb98
 KPmJkn9/nqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE8AAKCRBD3pH5JJpx
 RQs2D/42bThp7GhNuIuF9mWXc8Cm3hzPzTRRHvCDsB4NBoRXi9ZBFpSx1am3/83soRcEvhKtgys
 HIAFMRCCkbZm5aqFIDq8/Ru/K2ERCWjFmqHyw43YYfkApHKhaEJjBaDrqFv+2Hs8pAU/vW6Z5X6
 +xxPHOh8bzlvVt7oWiforoXYUD45M1oSYqxvvBrxkN034UiULa5l/nWpCCjUwKq0cMFGE0kLE+s
 O1G2Uv2lNCDdnSvQpUsj3MoOLIT/QoLQx/hdgnOPRHTlLfliMDXW+YTNZIHhA8ot0xB9oDzcvqY
 Ga3p/mU7gW4pBPvzuBdOYcTygy1wL8F8MX23gZh9Ejh2pbrVr79PCd8+phSWlhpKnx0T9824pZh
 kLdH9JTxl1pIzfgy06PxUJdND1Ry6YD4F0R1ZJ3KHxtFcH2softDdJRjyYa8shN5jGlHLRFDi6Z
 fNpoAqT3ZR83c27brVLKDy84tFVfL/dAsfXRlzk+IQTzV5kKuiUtrroUGAuD7M/9y00MEXy1PqO
 t7kvz4JiPNVqDeRN7f2okIb9DCxswCgOPZZqZayHKUReNd4OyWTxa2SmQSrSveqgOA2jVQ3yV+1
 vPL/L64gXf9C5kVM5qzqfoSyDMvfoj2grn+iAz9OuTF6WW7aG6Hqq19uukLDamQwxHTBPlq/UZt
 AnX7ol9oE1MAarg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Simplify .s_stream callback implementation by moving the runtime PM
calls to the leaf functions. This patch should not affect any
functionality.

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


