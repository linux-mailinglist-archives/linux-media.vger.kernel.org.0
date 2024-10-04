Return-Path: <linux-media+bounces-19084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3833D990013
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 11:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B7661C238F3
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFA1154C04;
	Fri,  4 Oct 2024 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZl82bcC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A71547DA
	for <linux-media@vger.kernel.org>; Fri,  4 Oct 2024 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034898; cv=none; b=e9vKu/jjtL8JkmdkBsa8jamtyTGxsifk+KoCQ99ccmkheOmOWWrNoE37hyNWAaSkYHsJ76urIuFjUzs92QUCFdKsSAP79K04nFDAkQcUX2uiXaOHfkrkJCOUUCWBjh7Hm1wiR3OGQNvHf4079axDYmUJL8FL5/6Yb7fl+qUf2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034898; c=relaxed/simple;
	bh=PO5fFYDbovpXTEjKTX6CHzcLG4aVaOQ+4hPrHvruW1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lW/+KvugRMooYviAx3vzE788qJjhg8S4c0s/t1X03SYIYa8L2jSYPm1LM6S6zaKHzEggGTyn2kFKD0eDX3uPwv68ZtzaLujWCYrc5V3uNh0WP+Nfbjfy2mIAf+D02Zes1ES6pHit+jeQ1Ajzpay3yttA+o5x1boLLK/HtqGNQyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZl82bcC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034897; x=1759570897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PO5fFYDbovpXTEjKTX6CHzcLG4aVaOQ+4hPrHvruW1w=;
  b=kZl82bcCnKjJl+7MWRnMVS3FsPNyxptoUOuYl+ItgEyLXe0TYI8uifbq
   i/UjCt5CUZb78Z0Y6j4I7J6xG+yv/Eu1SeKZ7mIItA6lWzDGK8R+ZDirq
   qML7Cc0I9Wjya2OG3trJd6kB0bnKk9rC93bOmzG818+vRWsneH486KezF
   oQVoGo/BKTPah6XDeJ7kWEd0BOMnARyYL3GaXbpMT0PdpcEPqiVCs5LN9
   51BMObER9Re2MvLZWuPMokEnkf7pp0WUZwBTdIpnVS6yGdOVHWWJ4nja+
   Bw7kwEznZYC2JvPphjXCCDcEMRNU4cgLgQwM+QTV32PX6sxuLP6KrLgdS
   Q==;
X-CSE-ConnectionGUID: VmqeDzgaQzGzk0C6w8Nu/g==
X-CSE-MsgGUID: 919IvGh0TQSWnJNLeFxWYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856308"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:36 -0700
X-CSE-ConnectionGUID: S8Nqz9uNSG2h4zr8gOEFuA==
X-CSE-MsgGUID: 1kny5o+0SgGLqU3ngBd9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331954"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:35 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 87BDE11F727;
	Fri,  4 Oct 2024 12:41:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoX-000TbK-1g;
	Fri, 04 Oct 2024 12:41:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH 25/51] media: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:23 +0300
Message-Id: <20241004094123.113776-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/alvium-csi2.c                      |  2 +-
 drivers/media/i2c/ccs/ccs-core.c                     | 10 +++++-----
 drivers/media/i2c/dw9719.c                           |  2 +-
 drivers/media/i2c/gc0308.c                           |  6 +++---
 drivers/media/i2c/gc2145.c                           |  8 ++++----
 drivers/media/i2c/imx283.c                           |  6 +++---
 drivers/media/i2c/imx290.c                           |  6 +++---
 drivers/media/i2c/imx296.c                           |  4 ++--
 drivers/media/i2c/imx415.c                           |  4 ++--
 drivers/media/i2c/mt9m114.c                          | 12 ++++++------
 drivers/media/i2c/ov2680.c                           |  2 +-
 drivers/media/i2c/ov4689.c                           |  6 +++---
 drivers/media/i2c/ov5640.c                           |  8 ++++----
 drivers/media/i2c/ov5645.c                           |  6 +++---
 drivers/media/i2c/ov5693.c                           |  2 +-
 drivers/media/i2c/ov64a40.c                          |  8 ++++----
 drivers/media/i2c/ov7251.c                           |  2 +-
 drivers/media/i2c/ov8858.c                           |  4 ++--
 drivers/media/i2c/thp7312.c                          |  8 ++++----
 drivers/media/i2c/video-i2c.c                        |  8 ++++----
 drivers/media/platform/nvidia/tegra-vde/h264.c       |  4 ++--
 drivers/media/platform/qcom/venus/vdec.c             |  4 ++--
 drivers/media/platform/qcom/venus/venc.c             |  4 ++--
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c |  4 ++--
 drivers/media/platform/st/sti/delta/delta-v4l2.c     |  4 ++--
 drivers/media/platform/st/sti/hva/hva-hw.c           |  8 ++++----
 drivers/media/platform/verisilicon/hantro_drv.c      |  2 +-
 drivers/media/rc/gpio-ir-recv.c                      |  2 +-
 28 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 5ddfd3dcb188..bdd1e531911f 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1843,7 +1843,7 @@ static int alvium_s_stream(struct v4l2_subdev *sd, int enable)
 	} else {
 		alvium_set_stream_mipi(alvium, enable);
 		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
+		__pm_runtime_put_autosuspend(&client->dev);
 	}
 
 	alvium->streaming = !!enable;
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e1ae0f9fad43..f7d4fb522473 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -789,7 +789,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	if (pm_status > 0) {
 		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
+		__pm_runtime_put_autosuspend(&client->dev);
 	}
 
 	return rval;
@@ -1919,7 +1919,7 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 		ccs_stop_streaming(sensor);
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
+		__pm_runtime_put_autosuspend(&client->dev);
 
 		return 0;
 	}
@@ -1934,7 +1934,7 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 	if (rval < 0) {
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
+		__pm_runtime_put_autosuspend(&client->dev);
 	}
 
 	return rval;
@@ -2682,7 +2682,7 @@ nvm_show(struct device *dev, struct device_attribute *attr, char *buf)
 	}
 
 	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	/*
 	 * NVM is still way below a PAGE_SIZE, so we can safely
@@ -3555,7 +3555,7 @@ static int ccs_probe(struct i2c_client *client)
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index c626ed845928..36116c428a93 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -292,7 +292,7 @@ static int dw9719_probe(struct i2c_client *client)
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 
diff --git a/drivers/media/i2c/gc0308.c b/drivers/media/i2c/gc0308.c
index fa754a8a39a6..5814eeb6d2e1 100644
--- a/drivers/media/i2c/gc0308.c
+++ b/drivers/media/i2c/gc0308.c
@@ -976,7 +976,7 @@ static int gc0308_s_ctrl(struct v4l2_ctrl *ctrl)
 		dev_err(gc0308->dev, "failed to set control: %d\n", ret);
 
 	pm_runtime_mark_last_busy(gc0308->dev);
-	pm_runtime_put_autosuspend(gc0308->dev);
+	__pm_runtime_put_autosuspend(gc0308->dev);
 
 	return ret;
 }
@@ -1161,14 +1161,14 @@ static int gc0308_start_stream(struct gc0308 *gc0308)
 
 disable_pm:
 	pm_runtime_mark_last_busy(gc0308->dev);
-	pm_runtime_put_autosuspend(gc0308->dev);
+	__pm_runtime_put_autosuspend(gc0308->dev);
 	return ret;
 }
 
 static int gc0308_stop_stream(struct gc0308 *gc0308)
 {
 	pm_runtime_mark_last_busy(gc0308->dev);
-	pm_runtime_put_autosuspend(gc0308->dev);
+	__pm_runtime_put_autosuspend(gc0308->dev);
 	return 0;
 }
 
diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index 667bb756d056..086436d823f7 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -963,7 +963,7 @@ static int gc2145_start_streaming(struct gc2145 *gc2145,
 
 err_rpm_put:
 	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 	return ret;
 }
 
@@ -982,7 +982,7 @@ static void gc2145_stop_streaming(struct gc2145 *gc2145)
 		dev_err(&client->dev, "%s failed to write regs\n", __func__);
 
 	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 }
 
 static int gc2145_set_stream(struct v4l2_subdev *sd, int enable)
@@ -1210,7 +1210,7 @@ static int gc2145_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1434,7 +1434,7 @@ static int gc2145_probe(struct i2c_client *client)
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&gc2145->sd);
 	if (ret < 0) {
diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 94276f4f2d83..f6558251649c 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1145,7 +1145,7 @@ static int imx283_enable_streams(struct v4l2_subdev *sd,
 
 err_rpm_put:
 	pm_runtime_mark_last_busy(imx283->dev);
-	pm_runtime_put_autosuspend(imx283->dev);
+	__pm_runtime_put_autosuspend(imx283->dev);
 
 	return ret;
 }
@@ -1165,7 +1165,7 @@ static int imx283_disable_streams(struct v4l2_subdev *sd,
 		dev_err(imx283->dev, "Failed to stop stream\n");
 
 	pm_runtime_mark_last_busy(imx283->dev);
-	pm_runtime_put_autosuspend(imx283->dev);
+	__pm_runtime_put_autosuspend(imx283->dev);
 
 	return ret;
 }
@@ -1580,7 +1580,7 @@ static int imx283_probe(struct i2c_client *client)
 	 * autosuspend delay, turning the power off.
 	 */
 	pm_runtime_mark_last_busy(imx283->dev);
-	pm_runtime_put_autosuspend(imx283->dev);
+	__pm_runtime_put_autosuspend(imx283->dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 458905dfb3e1..f1f42bec211a 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -824,7 +824,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(imx290->dev);
-	pm_runtime_put_autosuspend(imx290->dev);
+	__pm_runtime_put_autosuspend(imx290->dev);
 
 	return ret;
 }
@@ -1058,7 +1058,7 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 	} else {
 		imx290_stop_streaming(imx290);
 		pm_runtime_mark_last_busy(imx290->dev);
-		pm_runtime_put_autosuspend(imx290->dev);
+		__pm_runtime_put_autosuspend(imx290->dev);
 	}
 
 	/*
@@ -1604,7 +1604,7 @@ static int imx290_probe(struct i2c_client *client)
 	 * autosuspend delay, turning the power off.
 	 */
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 83149fa729c4..4003e224412b 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -605,7 +605,7 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
 		ret = imx296_stream_off(sensor);
 
 		pm_runtime_mark_last_busy(sensor->dev);
-		pm_runtime_put_autosuspend(sensor->dev);
+		__pm_runtime_put_autosuspend(sensor->dev);
 
 		goto unlock;
 	}
@@ -1102,7 +1102,7 @@ static int imx296_probe(struct i2c_client *client)
 	 */
 	pm_runtime_set_autosuspend_delay(sensor->dev, 1000);
 	pm_runtime_use_autosuspend(sensor->dev);
-	pm_runtime_put_autosuspend(sensor->dev);
+	__pm_runtime_put_autosuspend(sensor->dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index a20b0db330d3..1681b06cdaa8 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -957,7 +957,7 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
 		ret = imx415_stream_off(sensor);
 
 		pm_runtime_mark_last_busy(sensor->dev);
-		pm_runtime_put_autosuspend(sensor->dev);
+		__pm_runtime_put_autosuspend(sensor->dev);
 
 		goto unlock;
 	}
@@ -1399,7 +1399,7 @@ static int imx415_probe(struct i2c_client *client)
 	 */
 	pm_runtime_set_autosuspend_delay(sensor->dev, 1000);
 	pm_runtime_use_autosuspend(sensor->dev);
-	pm_runtime_put_autosuspend(sensor->dev);
+	__pm_runtime_put_autosuspend(sensor->dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..a78800f96fdb 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -955,7 +955,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 
 error:
 	pm_runtime_mark_last_busy(&sensor->client->dev);
-	pm_runtime_put_autosuspend(&sensor->client->dev);
+	__pm_runtime_put_autosuspend(&sensor->client->dev);
 
 	return ret;
 }
@@ -969,7 +969,7 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
 
 	pm_runtime_mark_last_busy(&sensor->client->dev);
-	pm_runtime_put_autosuspend(&sensor->client->dev);
+	__pm_runtime_put_autosuspend(&sensor->client->dev);
 
 	return ret;
 }
@@ -1027,7 +1027,7 @@ static int mt9m114_pa_g_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(&sensor->client->dev);
-	pm_runtime_put_autosuspend(&sensor->client->dev);
+	__pm_runtime_put_autosuspend(&sensor->client->dev);
 
 	return ret;
 }
@@ -1094,7 +1094,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(&sensor->client->dev);
-	pm_runtime_put_autosuspend(&sensor->client->dev);
+	__pm_runtime_put_autosuspend(&sensor->client->dev);
 
 	return ret;
 }
@@ -1546,7 +1546,7 @@ static int mt9m114_ifp_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(&sensor->client->dev);
-	pm_runtime_put_autosuspend(&sensor->client->dev);
+	__pm_runtime_put_autosuspend(&sensor->client->dev);
 
 	return ret;
 }
@@ -2438,7 +2438,7 @@ static int mt9m114_probe(struct i2c_client *client)
 	 * autosuspend delay, turning the power off.
 	 */
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 7237fb27ecd0..c4766c0d09f4 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1245,7 +1245,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index 1c3a449f9354..25139204fb76 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -498,7 +498,7 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 		cci_write(ov4689->regmap, OV4689_REG_CTRL_MODE,
 			  OV4689_MODE_SW_STANDBY, NULL);
 		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 	}
 
 unlock_and_return:
@@ -703,7 +703,7 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -1000,7 +1000,7 @@ static int ov4689_probe(struct i2c_client *client)
 	}
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index c1d3fce4a7d3..66c272f0eb06 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3341,7 +3341,7 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
-	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+	__pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
 
 	return 0;
 }
@@ -3417,7 +3417,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
-	pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+	__pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
 
 	return ret;
 }
@@ -3754,7 +3754,7 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (!enable || ret) {
 		pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
-		pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
+		__pm_runtime_put_autosuspend(&sensor->i2c_client->dev);
 	}
 
 	return ret;
@@ -3965,7 +3965,7 @@ static int ov5640_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 0c32bd2940ec..15846490f88a 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -815,7 +815,7 @@ static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(ov5645->dev);
-	pm_runtime_put_autosuspend(ov5645->dev);
+	__pm_runtime_put_autosuspend(ov5645->dev);
 	mutex_unlock(&ov5645->power_lock);
 
 	return ret;
@@ -1026,7 +1026,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 
 stream_off_rpm_put:
 	pm_runtime_mark_last_busy(ov5645->dev);
-	pm_runtime_put_autosuspend(ov5645->dev);
+	__pm_runtime_put_autosuspend(ov5645->dev);
 	return ret;
 }
 
@@ -1247,7 +1247,7 @@ static int ov5645_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 46b9ce111676..7a19d654b1a1 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1360,7 +1360,7 @@ static int ov5693_probe(struct i2c_client *client)
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 
diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
index 541bf74581d2..cfa01880bda2 100644
--- a/drivers/media/i2c/ov64a40.c
+++ b/drivers/media/i2c/ov64a40.c
@@ -2992,7 +2992,7 @@ static int ov64a40_start_streaming(struct ov64a40 *ov64a40,
 
 error_power_off:
 	pm_runtime_mark_last_busy(ov64a40->dev);
-	pm_runtime_put_autosuspend(ov64a40->dev);
+	__pm_runtime_put_autosuspend(ov64a40->dev);
 
 	return ret;
 }
@@ -3002,7 +3002,7 @@ static int ov64a40_stop_streaming(struct ov64a40 *ov64a40,
 {
 	cci_update_bits(ov64a40->cci, OV64A40_REG_SMIA, BIT(0), 0, NULL);
 	pm_runtime_mark_last_busy(ov64a40->dev);
-	pm_runtime_put_autosuspend(ov64a40->dev);
+	__pm_runtime_put_autosuspend(ov64a40->dev);
 
 	__v4l2_ctrl_grab(ov64a40->link_freq, false);
 	__v4l2_ctrl_grab(ov64a40->vflip, false);
@@ -3338,7 +3338,7 @@ static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	if (pm_status > 0) {
 		pm_runtime_mark_last_busy(ov64a40->dev);
-		pm_runtime_put_autosuspend(ov64a40->dev);
+		__pm_runtime_put_autosuspend(ov64a40->dev);
 	}
 
 	return ret;
@@ -3631,7 +3631,7 @@ static int ov64a40_probe(struct i2c_client *client)
 	}
 
 	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 30f61e04ecaf..09baaf19a0f7 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1762,7 +1762,7 @@ static int ov7251_probe(struct i2c_client *client)
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	ret = v4l2_async_register_subdev(&ov7251->sd);
 	if (ret < 0) {
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 326f50a5ab51..ead116e7c0d8 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1393,7 +1393,7 @@ static int ov8858_s_stream(struct v4l2_subdev *sd, int on)
 	} else {
 		ov8858_stop_stream(ov8858);
 		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
+		__pm_runtime_put_autosuspend(&client->dev);
 	}
 
 unlock_and_return:
@@ -1953,7 +1953,7 @@ static int ov8858_probe(struct i2c_client *client)
 	}
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index c77440ff098c..662dfa841e8b 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -810,7 +810,7 @@ static int thp7312_s_stream(struct v4l2_subdev *sd, int enable)
 		thp7312_stream_enable(thp7312, false);
 
 		pm_runtime_mark_last_busy(thp7312->dev);
-		pm_runtime_put_autosuspend(thp7312->dev);
+		__pm_runtime_put_autosuspend(thp7312->dev);
 
 		v4l2_subdev_unlock_state(sd_state);
 
@@ -841,7 +841,7 @@ static int thp7312_s_stream(struct v4l2_subdev *sd, int enable)
 
 finish_pm:
 	pm_runtime_mark_last_busy(thp7312->dev);
-	pm_runtime_put_autosuspend(thp7312->dev);
+	__pm_runtime_put_autosuspend(thp7312->dev);
 finish_unlock:
 	v4l2_subdev_unlock_state(sd_state);
 
@@ -1151,7 +1151,7 @@ static int thp7312_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	pm_runtime_mark_last_busy(thp7312->dev);
-	pm_runtime_put_autosuspend(thp7312->dev);
+	__pm_runtime_put_autosuspend(thp7312->dev);
 
 	return ret;
 }
@@ -2187,7 +2187,7 @@ static int thp7312_probe(struct i2c_client *client)
 	 * autosuspend delay, turning the power off.
 	 */
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	dev_info(dev, "THP7312 firmware version %02u.%02u\n",
 		 THP7312_FW_VERSION_MAJOR(thp7312->fw_version),
diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..0edbc48c5f28 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -299,7 +299,7 @@ static int amg88xx_read(struct device *dev, enum hwmon_sensor_types type,
 
 	tmp = regmap_bulk_read(data->regmap, AMG88XX_REG_TTHL, &buf, 2);
 	pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
-	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+	__pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
 	if (tmp)
 		return tmp;
 
@@ -538,7 +538,7 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 
 error_rpm_put:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 error_del_list:
 	video_i2c_del_list(vq, VB2_BUF_STATE_QUEUED);
 
@@ -555,7 +555,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	kthread_stop(data->kthread_vid_cap);
 	data->kthread_vid_cap = NULL;
 	pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
-	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+	__pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
 
 	video_i2c_del_list(vq, VB2_BUF_STATE_ERROR);
 }
@@ -866,7 +866,7 @@ static int video_i2c_probe(struct i2c_client *client)
 		goto error_pm_disable;
 
 	pm_runtime_mark_last_busy(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	__pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
 
diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 0e56a4331b0d..2cab9def0cf8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -586,7 +586,7 @@ static int tegra_vde_decode_begin(struct tegra_vde *vde,
 
 put_runtime_pm:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 unlock:
 	mutex_unlock(&vde->lock);
@@ -613,7 +613,7 @@ static void tegra_vde_decode_abort(struct tegra_vde *vde)
 		dev_err(dev, "DEC end: Failed to assert HW reset: %d\n", err);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	mutex_unlock(&vde->lock);
 }
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d12089370d91..3cd9ec3cac70 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -644,7 +644,7 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		ret = __pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -666,7 +666,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		ret = __pm_runtime_put_autosuspend(dev);
 	}
 
 error:
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..b429ad401f34 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -623,7 +623,7 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		ret = __pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -645,7 +645,7 @@ static int venc_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		ret = __pm_runtime_put_autosuspend(dev);
 	}
 
 error:
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe..f5b16ee27620 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -952,7 +952,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
 	pm_runtime_mark_last_busy(pispbe->dev);
-	pm_runtime_put_autosuspend(pispbe->dev);
+	__pm_runtime_put_autosuspend(pispbe->dev);
 
 	dev_dbg(pispbe->dev, "Nodes streaming now 0x%x\n",
 		pispbe->streaming_map);
@@ -1741,7 +1741,7 @@ static int pispbe_probe(struct platform_device *pdev)
 		goto disable_devs_err;
 
 	pm_runtime_mark_last_busy(pispbe->dev);
-	pm_runtime_put_autosuspend(pispbe->dev);
+	__pm_runtime_put_autosuspend(pispbe->dev);
 
 	return 0;
 
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index da402d1e9171..667acbd674a6 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1288,7 +1288,7 @@ void delta_put_autosuspend(struct delta_ctx *ctx)
 {
 	struct delta_dev *delta = ctx->dev;
 
-	pm_runtime_put_autosuspend(delta->dev);
+	__pm_runtime_put_autosuspend(delta->dev);
 }
 
 static void delta_vb2_au_queue(struct vb2_buffer *vb)
@@ -1910,7 +1910,7 @@ static void delta_remove(struct platform_device *pdev)
 
 	destroy_workqueue(delta->work_queue);
 
-	pm_runtime_put_autosuspend(delta->dev);
+	__pm_runtime_put_autosuspend(delta->dev);
 	pm_runtime_disable(delta->dev);
 
 	v4l2_device_unregister(&delta->v4l2_dev);
diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
index fcb18fb52fdd..00ab1fafb78a 100644
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -278,7 +278,7 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
 	version = readl_relaxed(hva->regs + HVA_HIF_REG_VERSION) &
 				VERSION_ID_MASK;
 
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	switch (version) {
 	case HVA_VERSION_V400:
@@ -418,7 +418,7 @@ void hva_hw_remove(struct hva_dev *hva)
 	disable_irq(hva->irq_its);
 	disable_irq(hva->irq_err);
 
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	pm_runtime_disable(dev);
 }
 
@@ -537,7 +537,7 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
 	}
 
 	if (got_pm)
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 	mutex_unlock(&hva->protect_mutex);
 
 	return ret;
@@ -578,7 +578,7 @@ void hva_hw_dump_regs(struct hva_dev *hva, struct seq_file *s)
 	DUMP(HVA_HIF_REG_CLK_GATING);
 	DUMP(HVA_HIF_REG_VERSION);
 
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	mutex_unlock(&hva->protect_mutex);
 }
 #endif
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 05bbac853c4f..238c31cef990 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -90,7 +90,7 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 			      enum vb2_buffer_state result)
 {
 	pm_runtime_mark_last_busy(vpu->dev);
-	pm_runtime_put_autosuspend(vpu->dev);
+	__pm_runtime_put_autosuspend(vpu->dev);
 
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 
diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index b29a1a9f381d..2316759a768a 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -50,7 +50,7 @@ static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
 
 	if (pmdev) {
 		pm_runtime_mark_last_busy(pmdev);
-		pm_runtime_put_autosuspend(pmdev);
+		__pm_runtime_put_autosuspend(pmdev);
 	}
 
 	return IRQ_HANDLED;
-- 
2.39.5


