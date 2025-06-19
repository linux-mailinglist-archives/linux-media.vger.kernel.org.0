Return-Path: <linux-media+bounces-35274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACBAE04C9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09F35A2C1D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2131253F3A;
	Thu, 19 Jun 2025 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkIkwBkC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85597253B56
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334338; cv=none; b=WA8Moas0UbMIkF8KRsmoIkTu+JzMocWcU/WpzSgz2okokh1kqFo18cGwYQP7lzXI/QgTtBwQZr+MEhesGFC0A51Y1tuAsk1v3+QdBKoRjw36r6COHiHTJONXNcH+fmA3E8IPRCTmVjNR4cHng9QL0rFSmSL9adnXt0uZJunISX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334338; c=relaxed/simple;
	bh=QP4OOC1hxCFZ1mmgS7nJXN+gUPOlVNEJOkMY9ruotug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n/Y0h51N8ZAiAHWYf8jz4RcIdF2mtOqIX3IMlE1ftLm+aed0PsKVfz+8zeyewEqvk1mSeJ0AXBPjALMii9zMWOBWmRyqHMYp+Zc099wVNyvpcIPlYHrkmSpQSS0cLCSAtj6T1J5LLuN7G5IZxVzvACUQVuvKriSrJMQkQdF5qqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkIkwBkC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334337; x=1781870337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QP4OOC1hxCFZ1mmgS7nJXN+gUPOlVNEJOkMY9ruotug=;
  b=KkIkwBkCaggmv92dqIPSlZjYBaw5scb+DUbGkahKQG/SQ3baz1yLf+/5
   NEpLYRTYYbhqQgdt4EXfiwW84tJRWWWg2v5BTAgW/MIH8S03BrRUfkK2V
   JJZBbHOIyyXHp/z0GBcHg5Kr1eyArT8FZE9pW3aVjPJ3rriTd9CFQ+018
   9rZz5jM5rSOG5J9MqT02JY/TsSkVqBmdepgp/42kmRibdCYlvx3M3i8Kz
   m3lVIPBaja7LmdCkRdkY8I7FCXX+mV8uc9luUZnqvXAzFxhv5MOClkrAx
   iZSZOA84th/I6QSY++sRDipVqDKB/46eIsfPqUEPl2NGX2yxgwP3lcVVs
   w==;
X-CSE-ConnectionGUID: q2k+L9LaSj2dKjSYxvtczQ==
X-CSE-MsgGUID: tyMW9NBtSx2S9oBK5z9Lcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014869"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:55 -0700
X-CSE-ConnectionGUID: 0sA4VFo5SH+EOPCo6bdNjQ==
X-CSE-MsgGUID: TpBXTMLjSo6sYLmewffk9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192207"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BDA8512074F;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AII-2Q;
	Thu, 19 Jun 2025 14:58:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 09/64] media: ccs: Use {enable,disable}_streams operations
Date: Thu, 19 Jun 2025 14:57:41 +0300
Message-Id: <20250619115836.1946016-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs/ccs-core.c | 83 ++++++++++++++------------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6cf60e1758b4..56c9f7124b2a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1711,7 +1711,7 @@ static int ccs_power_off(struct device *dev)
 }
 
 /* -----------------------------------------------------------------------------
- * Video stream management
+ * V4L2 subdev video operations
  */
 
 static int ccs_pm_get_init(struct ccs_sensor *sensor)
@@ -1735,11 +1735,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
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
 
@@ -1751,13 +1751,21 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
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
@@ -1876,64 +1884,41 @@ static int ccs_start_streaming(struct ccs_sensor *sensor)
 
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
@@ -1959,7 +1944,9 @@ static int ccs_pre_streamon(struct v4l2_subdev *subdev, u32 flags)
 		}
 	}
 
+	mutex_lock(&sensor->mutex);
 	rval = ccs_pm_get_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (rval)
 		return rval;
 
@@ -3039,7 +3026,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ccs_video_ops = {
-	.s_stream = ccs_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 	.pre_streamon = ccs_pre_streamon,
 	.post_streamoff = ccs_post_streamoff,
 };
@@ -3050,6 +3037,8 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+	.enable_streams = ccs_enable_streams,
+	.disable_streams = ccs_disable_streams,
 };
 
 static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
-- 
2.39.5


