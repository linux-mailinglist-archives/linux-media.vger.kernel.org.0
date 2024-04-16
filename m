Return-Path: <linux-media+bounces-9591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 343508A74FC
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54B61F22898
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70F513BC0A;
	Tue, 16 Apr 2024 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvWEhn7m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D5C139D0E
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296064; cv=none; b=ZIOcuz35ehdLhmvqM36pu17cB9JLXbKj1oUb2wk7gTEMrPhlBNqz4FglPSUqH90GC3uFtLXtuA0rzrDycoHjYdhVNO/JtoJ5uPn0CBMr3VAtCUXE2oOLVrsUPPyHNmN0ms+jCu3+cfn9x6Pbs8BzjRmU6GCP/cOcgdB6Tjp4pdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296064; c=relaxed/simple;
	bh=m+GE64Mh6I17enFQ4cXwaamIVloS1tOTMqbeEEh3wjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eCTAYdNKXCYiigAmhwYiAmfyRaEOrTfwpRawPUVMm6Odka/ATAZ5W/z9XIdSeZ46OSKdp9bo+Uqmi+AJmkKMuGQFqGDsqX2/5JB/Op4txPcZQ3o9Ftt5fFRQ7pkgEnPzFo7vx6n0VSll67d7+nJgfS7nLbDuvcEDM08S0Lz9U8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvWEhn7m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296063; x=1744832063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m+GE64Mh6I17enFQ4cXwaamIVloS1tOTMqbeEEh3wjA=;
  b=PvWEhn7mxxjtn5yMBh+DxPJjK9uImmoSlMarMJAiQoisi75ezpqq/Z6v
   nP8bXnbAoVHhanvWCwmKAoGNh6ucdsCWjTBGMsDEV/J2XpLrmHAZyUvH2
   2TpDGX5Dse5x5JHhgqhgfVRzL/eD2tPxZXsPboJMdbMr+H7JRjyZxOj/+
   Gaakxw3+Xh9JSB39+TD4QHNx1goLfGw1jJqonM0gCfBGNF0QRl3EziopN
   m1c6ILm4hghjS0Su/WijFw8Jit/eWTOMMjDEKaN53DfnBZRPDTQCeWYXF
   645TKznAhHC3PTZCO+494ZQyvwMd7e//1z+0On2P/hH+zdK81Gy0jaADi
   w==;
X-CSE-ConnectionGUID: 49SGw484Rc+bpRrG6FM6zA==
X-CSE-MsgGUID: z911V5qGTtmyaIYIWn7K9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929898"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929898"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:22 -0700
X-CSE-ConnectionGUID: bbQD1ygpReeXR4piB6nopg==
X-CSE-MsgGUID: 5/j9Yw9+SCeaPHHpwxmvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380282"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:19 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 24AF91204F9;
	Tue, 16 Apr 2024 22:34:15 +0300 (EEST)
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
Subject: [PATCH v9 39/46] media: ov2740: Switch to {enable,disable}_streams
Date: Tue, 16 Apr 2024 22:33:12 +0300
Message-Id: <20240416193319.778192-40-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 72 +++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 196a111516b0..a12dc58fa0c0 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -916,16 +916,23 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
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
@@ -934,7 +941,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
 	if (ret) {
 		dev_err(&client->dev, "failed to reset\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	usleep_range(10000, 15000);
@@ -944,64 +951,47 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
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
@@ -1086,7 +1076,7 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ov2740_video_ops = {
-	.s_stream = ov2740_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
@@ -1094,6 +1084,8 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.set_fmt = ov2740_set_format,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
+	.enable_streams = ov2740_enable_streams,
+	.disable_streams = ov2740_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
-- 
2.39.2


