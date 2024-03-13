Return-Path: <linux-media+bounces-6969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7C87A38C
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 324061F223B4
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0006C18EAD;
	Wed, 13 Mar 2024 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKQ9DpB9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54B225CD
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314774; cv=none; b=KkV3x95AALjxHkv+Dem1/YPOSkjd65SvHUNRkKRxhEKgs4EG6kXF8ECvVYOAx8Y4Ev7UFmQhCgc2Zb7URlpcrwwO+4yrzG59AruoGSucEAbm6m2mA5FRAUjzaqtSPo1Dd7wbq8yqQt50U8sGB/be6B8syBVJ1a85AGtMjpj6M+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314774; c=relaxed/simple;
	bh=MJGdlXAhqkufKKmnKtRzRs26sggQDU+5m0QfhvD75B0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S3DDNecHchb8D6MuvbdwhaRwKk1Yx3xzgGwPlvHBANgMrd1FmCSzta8upJelU3vgx294sL81X0OS41203Wm74B6TgVHnCb9+kIjeHYbcFKWFIs3DI5oz9oNwM2Bb/6cIwp7b+qdKsAs0Rw7pP1VSw5tzjZf6JomuckjVlmiiSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKQ9DpB9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314773; x=1741850773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MJGdlXAhqkufKKmnKtRzRs26sggQDU+5m0QfhvD75B0=;
  b=bKQ9DpB9vu5hKRONhcrLUZBL/AapoyorOVxHHWSH3/DKyMgUSFmBPpwd
   WIkIU3G8px9grSF6Um5bNnngnPhaDdLx6o8SIn3ufTyiggsx5/7n7OJuq
   yh2WiRUC/j2xvTuH7hNTqYr1zhO8MxEHHC21A6aVQSD8t1TlaeiQspFV5
   GY+3Cfmcg67sBpWe/sbcfQxp4dpUpZ5vOKtcXf1qefLvkFpGBLAoNkgMs
   dTH9/MMtj77qEI2RVJn6G38Lpz/7Le8FFuRsat8qRfsSYWa3yIxb3n55e
   VCN4irKk/+YUQD9GqA/oC45UfugTVyZiTNVKyKzDw4R5XTJCtcJkGBxLW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909325"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542374"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:09 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7A1951204F6;
	Wed, 13 Mar 2024 09:26:05 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 33/38] media: ov2740: Switch to {enable,disable}_streams
Date: Wed, 13 Mar 2024 09:25:11 +0200
Message-Id: <20240313072516.241106-34-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 72 +++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 552935ccb4a9..44c6724a102c 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -919,16 +919,23 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
 	return ret;
 }
 
-static int ov2740_start_streaming(struct ov2740 *ov2740)
+static int ov2740_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov2740 *ov2740 = to_ov2740(sd);
 	const struct ov2740_reg_list *reg_list;
 	int link_freq_index;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = ov2740_identify_module(ov2740);
 	if (ret)
-		return ret;
+		goto out_pm_put;
 
 	if (ov2740->nvm)
 		ov2740_load_otp_data(ov2740->nvm);
@@ -937,7 +944,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
 	if (ret) {
 		dev_err(&client->dev, "failed to reset\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	usleep_range(10000, 15000);
@@ -947,64 +954,47 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
 		dev_err(&client->dev, "failed to set plls\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	reg_list = &ov2740->cur_mode->reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
 		dev_err(&client->dev, "failed to set mode\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
 	if (ret)
-		return ret;
+		goto out_pm_put;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STREAMING);
-	if (ret)
+	if (ret) {
 		dev_err(&client->dev, "failed to start streaming\n");
+		goto out_pm_put;
+	}
 
-	return ret;
-}
+	return 0;
 
-static void ov2740_stop_streaming(struct ov2740 *ov2740)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+out_pm_put:
+	pm_runtime_put(&client->dev);
 
-	if (ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			     OV2740_MODE_STANDBY))
-		dev_err(&client->dev, "failed to stop streaming\n");
+	return ret;
 }
 
-static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov2740_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
-	struct ov2740 *ov2740 = to_ov2740(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev_state *sd_state;
-	int ret = 0;
-
-	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
-		if (ret < 0)
-			goto out_unlock;
+	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret;
 
-		ret = ov2740_start_streaming(ov2740);
-		if (ret) {
-			enable = 0;
-			ov2740_stop_streaming(ov2740);
-			pm_runtime_put(&client->dev);
-		}
-	} else {
-		ov2740_stop_streaming(ov2740);
-		pm_runtime_put(&client->dev);
-	}
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STANDBY);
 
-out_unlock:
-	v4l2_subdev_unlock_state(sd_state);
+	pm_runtime_put(&client->dev);
 
 	return ret;
 }
@@ -1089,7 +1079,7 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ov2740_video_ops = {
-	.s_stream = ov2740_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
@@ -1097,6 +1087,8 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.set_fmt = ov2740_set_format,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
+	.enable_streams = ov2740_enable_streams,
+	.disable_streams = ov2740_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
-- 
2.39.2


