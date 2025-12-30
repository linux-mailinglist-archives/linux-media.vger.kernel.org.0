Return-Path: <linux-media+bounces-49766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C4CEA57E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CF713003FFF
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1578032B996;
	Tue, 30 Dec 2025 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KueEoKSS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE3322B8A
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116451; cv=none; b=XFvHEr2nCBnSq7MrQNQzG90AO4/5PT97JGw0p/3h0vgkdq9RIaKZzJqmqPZs/T83s1AuN6M9CoyK4h0+7Np7db+AqC7l/gjuAXZYDL2/Z22gG4ezeu+QttyUuoa6CTZmf2AA3nLhmUKjDabyZYqnoMZUYA1Rz4JTZdJ9xWAjo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116451; c=relaxed/simple;
	bh=iR4KUrkEHz0qTC7mx4o+RHe85LtK68RDz8WqdiLu570=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NECXauaRYcVNk0AdV+k4XY8ImZMakmCL8aM7g/PBmAcxwWo3U1A7nWBGfc/5gM7qHNQgL6qcgHityArJgGQFqGmBxXQdpoyGsaiBF1L9ClGjL+RVR7tVv32kRUZEiRr2tGsoP3XHlJPGk9S/NYtzw7Ii1aFs0cjX4Um0KFavh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KueEoKSS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767116449; x=1798652449;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iR4KUrkEHz0qTC7mx4o+RHe85LtK68RDz8WqdiLu570=;
  b=KueEoKSSOTTPwE5mBx/luEKlLutgYB9gIfDSkfUbb4iez2XRcTyAFpCA
   bB7h+O+ASl9KeLoaBcHjELTcD96adb7DzZ1x6MrrhG4gP+VldxE3JEK5T
   zJxGx+Ko0wj75AGdnRXGj0l7FSpOu3ub88OvvwT0xA9XC1omNl0YWPzSA
   IB0hbjpje6Tev9c4K67r90loT/FdZMugtuyv+vgNoIZcgFC3lxRkayOsr
   NMVEL3m38Ml6yAmBXd9enGIi0mfgINmGxdENhsrMKE7l4Y3BoCfOPMwxb
   rTLGMBsNQ34hnYUi+thM31VruC4InBprqUgn6QBLydLtjVCP93yzpZCqH
   A==;
X-CSE-ConnectionGUID: bWBbiFOhTtSzgEXwI+PWdA==
X-CSE-MsgGUID: 953V+NkrQ3eestYSmaspNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72559952"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="72559952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:40:45 -0800
X-CSE-ConnectionGUID: GGfk9nyjSSi/w02pYa0PnA==
X-CSE-MsgGUID: TD6bwZIJQoOQr44msJzbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="206309981"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:40:44 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 68C9411F8A6
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 19:40:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vadiE-00000000tyj-0S9v
	for linux-media@vger.kernel.org;
	Tue, 30 Dec 2025 19:40:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: ccs: Use {enable,disable}_streams operations
Date: Tue, 30 Dec 2025 19:40:48 +0200
Message-ID: <20251230174050.215164-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230174050.215164-1-sakari.ailus@linux.intel.com>
References: <20251230174050.215164-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 79 ++++++++++++++------------------
 1 file changed, 34 insertions(+), 45 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 3fd9ceaead21..623fc9770205 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1709,7 +1709,7 @@ static int ccs_power_off(struct device *dev)
 }
 
 /* -----------------------------------------------------------------------------
- * Video stream management
+ * V4L2 subdev video operations
  */
 
 static int ccs_pm_get_init(struct ccs_sensor *sensor)
@@ -1733,11 +1733,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
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
 
@@ -1749,13 +1749,21 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
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
@@ -1874,62 +1882,39 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
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
-		pm_runtime_put_autosuspend(&client->dev);
-	}
+	sensor->streaming = false;
+	pm_runtime_put_autosuspend(&client->dev);
 
-	return rval;
+	return 0;
 }
 
 static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
@@ -1955,7 +1940,9 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
 		}
 	}
 
+	mutex_lock(&sensor->mutex);
 	rval = ccs_pm_get_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (rval)
 		return rval;
 
@@ -3038,7 +3025,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
-	.s_stream = ccs_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 	.pre_streamon = ccs_pre_streamon,
 	.post_streamoff = ccs_post_streamoff,
 };
@@ -3049,6 +3036,8 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+	.enable_streams = ccs_enable_streams,
+	.disable_streams = ccs_disable_streams,
 };
 
 static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
-- 
2.47.3


