Return-Path: <linux-media+bounces-11506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E368C71D3
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA791C2136E
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2442C6BB;
	Thu, 16 May 2024 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR+3rDKL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD52C1B6
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715843117; cv=none; b=frYS/9yFEcO9UvC8Y6wwAjT42yknHnl2fA6ED/+qgjBSd+oEQ49i84eFTFOduRt5Jqa6tSSSU0EHPa58KPknM2rze4WK9OL8oseN+iSkfKzT9zx1uYJ1mbk4Sl3UW6D2U/MjaBVtRYnbdQIYOj9TKpkAK+glTJP+4y6FryCWtVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715843117; c=relaxed/simple;
	bh=hcn/dK50gEK/5NTqbgKwv0j7YOdfsDhvTka+TY7vCjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dibOlMxx4gtJSyC6m7Et09MFwU7VHsTX+NZQCMty9DfI1MJxtPL5t/SKsfZ0anDx4ETPgywHJsVI3BHPgRoQyzz5y19A9JQWYbvdBGTlC4CGbbS34MP3LB6fOgJC1w8Cbr7nZVHyw0S3nLKlnalmAsJXQ4CbrAdqWNCOYQV/7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR+3rDKL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715843116; x=1747379116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hcn/dK50gEK/5NTqbgKwv0j7YOdfsDhvTka+TY7vCjY=;
  b=gR+3rDKL3Vj/Q99NTgiNUyPC/jOqwu2Wg1QybrKzc3jbtAFVUScC5fbv
   1+XugJvEXNSEffFBQD2nYuy29bNIzBSxYvoNzTOWQvksBUiFts4Kr+glx
   9Xiymraxvn5zdY0u7TKjpUuYM9GfI2MMjcNdN48ocfBrxCD3S8gtfgDtV
   N2l2MoSQvaCdzwvXWPwlzg5nkt3Nfqs+FraXbFpxeT27LtrjZiUbTNr3O
   KepnIFA7OUmlk1MNcgiE5s6VCrNq1iPeX27iZS9vNKWB4L0WLRduOYzMN
   qKw5OsALd2zyuubGzmdWypTEn9rD4VxW/RuAHgOIIQOQMOGhNjG/MewGI
   w==;
X-CSE-ConnectionGUID: wtnSaqLUTVGIwenOfBWP/g==
X-CSE-MsgGUID: dCmKnxq8TAuIJxPcZxpodg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12113641"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="12113641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:15 -0700
X-CSE-ConnectionGUID: mP0c4VSwSXGcY/4RItUnAw==
X-CSE-MsgGUID: jK7NDR6CRi20za8cB9t42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31894941"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ECC681204F8;
	Thu, 16 May 2024 10:05:10 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v5 4/4] media: ivsc: csi: Obtain link frequency from the media pad
Date: Thu, 16 May 2024 10:05:07 +0300
Message-Id: <20240516070507.21735-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
References: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the use of the media pad for obtaining the link frequency.
Similarly, call the v4l2_get_link_freq() on the media pad, not on the
remote's control handler.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 72 +++++++++-----------------
 1 file changed, 25 insertions(+), 47 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 89b582a221ab..621a6ee32e01 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -35,8 +35,6 @@
 
 #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
 
-#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
-
 /* the 5s used here is based on experiment */
 #define CSI_CMD_TIMEOUT (5 * HZ)
 /* to setup CSI-2 link an extra delay needed and determined experimentally */
@@ -121,12 +119,11 @@ struct mei_csi {
 	struct mutex lock;
 
 	struct v4l2_subdev subdev;
-	struct v4l2_subdev *remote;
+	struct media_pad *remote;
 	struct v4l2_async_notifier notifier;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *freq_ctrl;
 	struct v4l2_ctrl *privacy_ctrl;
-	unsigned int remote_pad;
 	/* start streaming or not */
 	int streaming;
 
@@ -148,10 +145,6 @@ static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
 	.field = V4L2_FIELD_NONE,
 };
 
-static s64 link_freq_menu_items[] = {
-	MEI_CSI_LINK_FREQ_400MHZ
-};
-
 static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier *n)
 {
 	return container_of(n, struct mei_csi, notifier);
@@ -284,11 +277,13 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
 static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mei_csi *csi = sd_to_csi(sd);
+	struct v4l2_subdev *remote_sd =
+		media_entity_to_v4l2_subdev(csi->remote->entity);
 	s64 freq;
 	int ret;
 
 	if (enable && csi->streaming == 0) {
-		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
+		freq = v4l2_get_link_freq(csi->remote, 0, 0);
 		if (freq < 0) {
 			dev_err(&csi->cldev->dev,
 				"error %lld, invalid link_freq\n", freq);
@@ -307,11 +302,11 @@ static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret < 0)
 			goto err_switch;
 
-		ret = v4l2_subdev_call(csi->remote, video, s_stream, 1);
+		ret = v4l2_subdev_call(remote_sd, video, s_stream, 1);
 		if (ret)
 			goto err_switch;
 	} else if (!enable && csi->streaming == 1) {
-		v4l2_subdev_call(csi->remote, video, s_stream, 0);
+		v4l2_subdev_call(remote_sd, video, s_stream, 0);
 
 		/* switch CSI-2 link to IVSC */
 		ret = csi_set_link_owner(csi, CSI_LINK_IVSC);
@@ -468,34 +463,29 @@ static int mei_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+static int mei_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_config *mbus_config)
 {
-	struct mei_csi *csi = ctrl_to_csi(ctrl);
+	struct mei_csi *csi = sd_to_csi(sd);
+	unsigned int i;
 	s64 freq;
 
-	if (ctrl->id == V4L2_CID_LINK_FREQ) {
-		if (!csi->remote)
-			return -EINVAL;
-
-		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
-		if (freq < 0) {
-			dev_err(&csi->cldev->dev,
-				"error %lld, invalid link_freq\n", freq);
-			return -EINVAL;
-		}
-
-		link_freq_menu_items[0] = freq;
-		ctrl->val = 0;
+	mbus_config->type = V4L2_MBUS_CSI2_DPHY;
+	for (i = 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
+		mbus_config->bus.mipi_csi2.data_lanes[i] = i + 1;
+	mbus_config->bus.mipi_csi2.num_data_lanes = csi->nr_of_lanes;
 
-		return 0;
+	freq = v4l2_get_link_freq(csi->remote, 0, 0);
+	if (freq < 0) {
+		dev_err(&csi->cldev->dev,
+			"error %lld, invalid link_freq\n", freq);
+		return -EINVAL;
 	}
 
-	return -EINVAL;
-}
+	mbus_config->link_freq = csi->link_freq = freq;
 
-static const struct v4l2_ctrl_ops mei_csi_ctrl_ops = {
-	.g_volatile_ctrl = mei_csi_g_volatile_ctrl,
-};
+	return 0;
+}
 
 static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 	.s_stream = mei_csi_set_stream,
@@ -504,6 +494,7 @@ static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mei_csi_set_fmt,
+	.get_mbus_config = mei_csi_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops mei_csi_subdev_ops = {
@@ -531,8 +522,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	if (pad < 0)
 		return pad;
 
-	csi->remote = subdev;
-	csi->remote_pad = pad;
+	csi->remote = &subdev->entity.pads[pad];
 
 	return media_create_pad_link(&subdev->entity, pad,
 				     &csi->subdev.entity, CSI_PAD_SINK,
@@ -556,26 +546,14 @@ static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
 
 static int mei_csi_init_controls(struct mei_csi *csi)
 {
-	u32 max;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
+	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 1);
 	if (ret)
 		return ret;
 
 	csi->ctrl_handler.lock = &csi->lock;
 
-	max = ARRAY_SIZE(link_freq_menu_items) - 1;
-	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
-						&mei_csi_ctrl_ops,
-						V4L2_CID_LINK_FREQ,
-						max,
-						0,
-						link_freq_menu_items);
-	if (csi->freq_ctrl)
-		csi->freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY |
-					 V4L2_CTRL_FLAG_VOLATILE;
-
 	csi->privacy_ctrl = v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
 					      V4L2_CID_PRIVACY, 0, 1, 1, 0);
 	if (csi->privacy_ctrl)
-- 
2.39.2


