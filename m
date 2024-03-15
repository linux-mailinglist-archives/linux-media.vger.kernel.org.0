Return-Path: <linux-media+bounces-7108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D352187CA41
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639C91F22023
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B3E175A7;
	Fri, 15 Mar 2024 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z2iAW8iL"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3317581
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710492747; cv=none; b=pGzJIIXUWV2vIIj5hVAg6YDc6sv5+8LGUp3rD2GSZ1ClR+4if1bwYE5awwTzoH1VSmBrJYknKvK7e60gIONmdYAjsBGV6mpl+HXgnu/Uv/k6P2RJTasfoj3RnHZNYiL4PN6xhkj4bMWVIfGte0Zb8pSQoBFrv0AXkWRlqo2sA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710492747; c=relaxed/simple;
	bh=xvbE61BXNyacirQPmWzpIkFW38J4PRYit33d1n6+rEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RstBd9YdriGdft+fRijAjnLQ8Qo4YgcuYKqLUTBRCEkywF8JUX7T/LOhVTv+y+ib5UO3h3f9NHAFfHVlFI/k5vedFtrubvrYqS3pKhp4DqDgux7mdINfTiuAiLwUhSYh2o4CHPjK8RDUaWlxPXL0L7VyL0Npr2Gl0QUHFNUx7fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z2iAW8iL; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710492743;
	bh=xvbE61BXNyacirQPmWzpIkFW38J4PRYit33d1n6+rEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2iAW8iLPNM76b8jeNKVSAplNyca91vbzjMgce3u+FGPjJYKIKjcsVruljneab7ZK
	 k3L3FgGAa8bB3lhsuDTAHmjQXiXA6S6KVcAsVzmv1fXi92nLyMVwDTo0MzW2xVwTvq
	 RFSqqB64dJRvtqkfgGRfFsLrJOjX13IhMW7jFP69KreBQExKyiV2hc93AGJMtEHwpF
	 VsmleBoS6lPnxl36vSVb+63T6bM0cFVAf1Waw74BJJoyEwHNKMP0mL82hX+W7tPvlM
	 5uv7iG27rZdYTHCJe2i1ESVzFPnxmBUskq7/5HblyWZ1qWZYrKh2GLgzrkMNFiilnw
	 pqJu4wObaN/UQ==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1FD4D37820FD;
	Fri, 15 Mar 2024 08:52:23 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 1/4] media: i2c: st-vgxy61: Use sub-device active state
Date: Fri, 15 Mar 2024 09:51:55 +0100
Message-ID: <20240315085158.1213159-2-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315085158.1213159-1-julien.massot@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sub-device active state. Rely on control handler lock to serialize
access to the active state.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/st-vgxy61.c | 109 ++++++++++++----------------------
 1 file changed, 39 insertions(+), 70 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index b9e7c57027b1..733713f909cf 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -397,8 +397,6 @@ struct vgxy61_dev {
 	u16 line_length;
 	u16 rot_term;
 	bool gpios_polarity;
-	/* Lock to protect all members below */
-	struct mutex lock;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *pixel_rate_ctrl;
 	struct v4l2_ctrl *expo_ctrl;
@@ -686,27 +684,6 @@ static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int vgxy61_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *format)
-{
-	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	mutex_lock(&sensor->lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
-	else
-		fmt = &sensor->fmt;
-
-	format->format = *fmt;
-
-	mutex_unlock(&sensor->lock);
-
-	return 0;
-}
-
 static u16 vgxy61_get_vblank_min(struct vgxy61_dev *sensor,
 				 enum vgxy61_hdr_mode hdr)
 {
@@ -1167,16 +1144,17 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
 static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
+	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
-	mutex_lock(&sensor->lock);
+	sd_state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
 
 	ret = enable ? vgxy61_stream_enable(sensor) :
 	      vgxy61_stream_disable(sensor);
 	if (!ret)
 		sensor->streaming = enable;
 
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(sd_state);
 
 	return ret;
 }
@@ -1187,51 +1165,39 @@ static int vgxy61_set_fmt(struct v4l2_subdev *sd,
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 	const struct vgxy61_mode_info *new_mode;
-	struct v4l2_mbus_framefmt *fmt;
 	int ret;
 
-	mutex_lock(&sensor->lock);
-
-	if (sensor->streaming) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (sensor->streaming)
+		return -EBUSY;
 
 	ret = vgxy61_try_fmt_internal(sd, &format->format, &new_mode);
 	if (ret)
-		goto out;
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt = v4l2_subdev_state_get_format(sd_state, 0);
-		*fmt = format->format;
-	} else if (sensor->current_mode != new_mode ||
-		   sensor->fmt.code != format->format.code) {
-		fmt = &sensor->fmt;
-		*fmt = format->format;
-
-		sensor->current_mode = new_mode;
-
-		/* Reset vblank and framelength to default */
-		ret = vgxy61_update_vblank(sensor,
-					   VGXY61_FRAME_LENGTH_DEF -
-					   new_mode->crop.height,
-					   sensor->hdr);
-
-		/* Update controls to reflect new mode */
-		__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl,
-					 get_pixel_rate(sensor));
-		__v4l2_ctrl_modify_range(sensor->vblank_ctrl,
-					 sensor->vblank_min,
-					 0xffff - new_mode->crop.height,
-					 1, sensor->vblank);
-		__v4l2_ctrl_s_ctrl(sensor->vblank_ctrl, sensor->vblank);
-		__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
-					 sensor->expo_max, 1,
-					 sensor->expo_long);
-	}
+		return ret;
+
+	*v4l2_subdev_state_get_format(sd_state, format->pad) = format->format;
 
-out:
-	mutex_unlock(&sensor->lock);
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	sensor->current_mode = new_mode;
+
+	/* Reset vblank and framelength to default */
+	ret = vgxy61_update_vblank(sensor,
+				   VGXY61_FRAME_LENGTH_DEF -
+				   new_mode->crop.height,
+				   sensor->hdr);
+
+	/* Update controls to reflect new mode */
+	__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl,
+				 get_pixel_rate(sensor));
+	__v4l2_ctrl_modify_range(sensor->vblank_ctrl,
+				 sensor->vblank_min,
+				 0xffff - new_mode->crop.height,
+				 1, sensor->vblank);
+	__v4l2_ctrl_s_ctrl(sensor->vblank_ctrl, sensor->vblank);
+	__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
+				 sensor->expo_max, 1,
+				 sensor->expo_long);
 
 	return ret;
 }
@@ -1321,8 +1287,6 @@ static int vgxy61_init_controls(struct vgxy61_dev *sensor)
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 16);
-	/* We can use our own mutex for the ctrl lock */
-	hdl->lock = &sensor->lock;
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN, 0, 0x1c, 1,
 			  sensor->analog_gain);
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN, 0, 0xfff, 1,
@@ -1398,7 +1362,7 @@ static const struct v4l2_subdev_video_ops vgxy61_video_ops = {
 
 static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
 	.enum_mbus_code = vgxy61_enum_mbus_code,
-	.get_fmt = vgxy61_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = vgxy61_set_fmt,
 	.get_selection = vgxy61_get_selection,
 	.enum_frame_size = vgxy61_enum_frame_size,
@@ -1801,7 +1765,7 @@ static int vgxy61_probe(struct i2c_client *client)
 	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
 			     VGXY61_MEDIA_BUS_FMT_DEF);
 
-	mutex_init(&sensor->lock);
+	sensor->sd.state_lock = sensor->ctrl_handler.lock;
 
 	ret = vgxy61_update_hdr(sensor, sensor->hdr);
 	if (ret)
@@ -1820,6 +1784,10 @@ static int vgxy61_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	ret = v4l2_subdev_init_finalize(&sensor->sd);
+	if (ret)
+		goto error_media_entity_cleanup;
+
 	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -1841,11 +1809,12 @@ static int vgxy61_probe(struct i2c_client *client)
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&sensor->sd);
+error_media_entity_cleanup:
 	media_entity_cleanup(&sensor->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
 error_power_off:
-	mutex_destroy(&sensor->lock);
 	vgxy61_power_off(dev);
 
 	return ret;
@@ -1857,7 +1826,7 @@ static void vgxy61_remove(struct i2c_client *client)
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
-	mutex_destroy(&sensor->lock);
+	v4l2_subdev_cleanup(&sensor->sd);
 	media_entity_cleanup(&sensor->sd.entity);
 
 	pm_runtime_disable(&client->dev);
-- 
2.44.0


