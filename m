Return-Path: <linux-media+bounces-9572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A828A74E9
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A851C22465
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0A81386D8;
	Tue, 16 Apr 2024 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqYJK3+9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D81386C7
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296039; cv=none; b=emP81vXHpKqVm26xipm/+y9yKgYooAcrxRzkpljO4eC5rPE5GVxPummyVDFGeoLBs6LfoAfDRwo18bCxNCSvO4fta2tZZRxCVKT+IDQGZUv7d4fGe96QjZj3MffxYXObDmQbiSJDFKv+Ndnq420DhwdlzqmCXzBvtKuuhvx1/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296039; c=relaxed/simple;
	bh=AQyxc2i6RGx3HmT+VL717qXd+tyFmMtovdcwFhMtTfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c1lqkHGMYcSSp/jO5wUaFWbzPUWugSGuvs4fjfdMlk/w2C6KlqB3tUEFdrP9rzqkZBAcnBXEcmoa9r0yYELJTxFN+QOnXOeVP1UvcQ87pC7ud4EXzaLXOZK5qsCyv2SkudBAHru9Pl3c2ocs/P5cdL4amrcJ0HOBl5oM6ghvcvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqYJK3+9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296038; x=1744832038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AQyxc2i6RGx3HmT+VL717qXd+tyFmMtovdcwFhMtTfo=;
  b=QqYJK3+9v5f8rlLWsCH0HILBkX3AUsLsn/4p9FH1MRudcu61Qu4r4G95
   QP1KS5z+6gmayYh2tQn5rnQj4wtKniBveTM3lFVGh7nHhOwfq5FIyeARq
   SClzPu9moAEuNlx/+U888/IDu6pUxN8KJlPht7IamOzTNH2kv0s0VpUod
   4YLkx3LxR+LWkUjHvKpwti94W16WHR7GvpbjtYCzqskmkatbvwEip2UhF
   OXJ4+2Rw0DKqI7J4VszPYjlNFZkM5oLf9ifyP+s+ot7XlT3pMg3wn5lhE
   8frVTiz5pE3Nkp/AiPRhezg4cTEkJUg7tD7QJ78EWHsTvYXgO2T0FsnSr
   g==;
X-CSE-ConnectionGUID: a2/GL41hSECIVQqapUcmAw==
X-CSE-MsgGUID: ylhAZo9jRrWfeQVgbhKbGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929798"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:57 -0700
X-CSE-ConnectionGUID: SWx9L4ZLROaQv5MU5KrQcg==
X-CSE-MsgGUID: QB54Pbe6RnOjMQD21EmxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380172"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:54 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5BEB91204F6;
	Tue, 16 Apr 2024 22:33:50 +0300 (EEST)
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
Subject: [PATCH v9 21/46] media: ccs: Use {enable,disable}_streams operations
Date: Tue, 16 Apr 2024 22:32:54 +0300
Message-Id: <20240416193319.778192-22-sakari.ailus@linux.intel.com>
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

Switch from s_stream() video op to enable_streams() and disable_streams()
pad operations. They are preferred and required for streams support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 83 ++++++++++++++------------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d14e90f8568a..aaa6bf8495e1 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1715,7 +1715,7 @@ static int ccs_power_off(struct device *dev)
 }
 
 /* -----------------------------------------------------------------------------
- * Video stream management
+ * V4L2 subdev video operations
  */
 
 static int ccs_pm_get_init(struct ccs_sensor *sensor)
@@ -1739,11 +1739,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	sensor->handler_setup_needed = false;
 
 	/* Restore V4L2 controls to the previously suspended device */
-	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
+	rval = __v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
 	if (rval)
 		goto error;
 
-	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
+	rval = __v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
 	if (rval)
 		goto error;
 
@@ -1755,13 +1755,21 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	return rval;
 }
 
-static int ccs_start_streaming(struct ccs_sensor *sensor)
+static int ccs_enable_streams(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *state, u32 pad,
+			      u64 streams_mask)
 {
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int binning_mode;
 	int rval;
 
-	mutex_lock(&sensor->mutex);
+	if (pad != CCS_PAD_SRC)
+		return -EINVAL;
+
+	rval = ccs_pm_get_init(sensor);
+	if (rval)
+		return rval;
 
 	rval = ccs_write(sensor, CSI_DATA_FORMAT,
 			 (sensor->csi_format->width << 8) |
@@ -1880,64 +1888,41 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-err_pm_put:
-	mutex_unlock(&sensor->mutex);
-
-	return rval;
-}
-
-static int ccs_stop_streaming(struct ccs_sensor *sensor)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	int rval;
+	sensor->streaming = true;
 
-	mutex_lock(&sensor->mutex);
-	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
-	if (rval)
-		goto out;
+	return 0;
 
-	rval = ccs_call_quirk(sensor, post_streamoff);
-	if (rval)
-		dev_err(&client->dev, "post_streamoff quirks failed\n");
+err_pm_put:
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
-out:
-	mutex_unlock(&sensor->mutex);
 	return rval;
 }
 
-/* -----------------------------------------------------------------------------
- * V4L2 subdev video operations
- */
-
-static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
+static int ccs_disable_streams(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *state, u32 pad,
+			       u64 streams_mask)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	if (!enable) {
-		ccs_stop_streaming(sensor);
-		sensor->streaming = false;
-		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
-
-		return 0;
-	}
+	if (pad != CCS_PAD_SRC)
+		return -EINVAL;
 
-	rval = ccs_pm_get_init(sensor);
+	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
 
-	sensor->streaming = true;
+	rval = ccs_call_quirk(sensor, post_streamoff);
+	if (rval)
+		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	rval = ccs_start_streaming(sensor);
-	if (rval < 0) {
-		sensor->streaming = false;
-		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
-	}
+	sensor->streaming = false;
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
-	return rval;
+	return 0;
 }
 
 static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
@@ -1963,7 +1948,9 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
 		}
 	}
 
+	mutex_lock(&sensor->mutex);
 	rval = ccs_pm_get_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (rval)
 		return rval;
 
@@ -3047,7 +3034,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
-	.s_stream = ccs_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 	.pre_streamon = ccs_pre_streamon,
 	.post_streamoff = ccs_post_streamoff,
 };
@@ -3058,6 +3045,8 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+	.enable_streams = ccs_enable_streams,
+	.disable_streams = ccs_disable_streams,
 };
 
 static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
-- 
2.39.2


