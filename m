Return-Path: <linux-media+bounces-22983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A829EAA27
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E410D28374D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180ED22E418;
	Tue, 10 Dec 2024 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Plz+C/l4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757222CBFB
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817557; cv=none; b=gqzAaphzgeo7pWZ8tNO1ZwPnYwA4gJal4o0C3vkP6XfanAU0HfXVAYxPwaZvyi1KHYvN1Q4q0Uc/AHwVuh8+a8u0grs6km6uW4grHBdQrNi0RhyjDMvzajtajUqiKka1EUIx6fMAEJdz3CvCTc5RhAECN6YhUFzLhpN6LS6mAI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817557; c=relaxed/simple;
	bh=Ta8IJ88rMpXX4EirEMzXQfZ8PbPUWvgkr9k9+jtjVMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TOWq5kVrnh47KndVdZ1E3pcn7jzxz6iHSq7YaDa6+brlBqBqVEnwweBf+O/6CA4H4RDGNQoWFvNlkpl3L/RwH63Aqld1fmVinFhYMawBo+6SyXxKNXMG5RsJOcApkrp0vnmnm3iv+vTP0UphkwUiPbbocq94Q4/3lkGaMIkZSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Plz+C/l4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733817556; x=1765353556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ta8IJ88rMpXX4EirEMzXQfZ8PbPUWvgkr9k9+jtjVMU=;
  b=Plz+C/l4euSuMm5Jli2RTwFe0v61gacHOHQk7Deh3ej2hjIO3yHdgW0C
   30LcKWhq41KUzJdNosC45Uxmtul/8GIOpfrcNLbYpJMtKMMJ7JJI3c+kU
   CtYpw3TLgftPdf1R1g/FiGAJFxtQ6IIvyFXXUrYAtwOytsT4r9O6kaRrh
   V5mDKGBPqwV5hx35KwsHjp4vq922RxvjTo69X4w7eylG2MfFswXlUBYdG
   h6QJZmh0o8P11gjRmdEqdFGLmFfjWOUBYPx8MGkcpUKPhoC2KwMZChvHM
   c4uJH4kA2hPcS4FqTu7Fu+8786X9p5vjzA2vTHl22I6u9/VJweGBSeqKI
   A==;
X-CSE-ConnectionGUID: WFFyhpp0TMGqAtrMtn4kQw==
X-CSE-MsgGUID: FlUAPWtJT9ajojSjnoGiSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45544640"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45544640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:15 -0800
X-CSE-ConnectionGUID: 7a7yVahpSCOEqY5xul28oA==
X-CSE-MsgGUID: aE+sIGVmRDKLRD4EKsnVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99808228"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:14 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6318C120819;
	Tue, 10 Dec 2024 09:59:11 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 4/5] media: ivsc: csi: Obtain link frequency from the media pad
Date: Tue, 10 Dec 2024 09:59:05 +0200
Message-Id: <20241210075906.609490-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
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
index 2a9c12c975ca..9241c95fb025 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -35,8 +35,6 @@
 
 #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
 
-#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
-
 /* the 5s used here is based on experiment */
 #define CSI_CMD_TIMEOUT (5 * HZ)
 /* to setup CSI-2 link an extra delay needed and determined experimentally */
@@ -121,14 +119,13 @@ struct mei_csi {
 	struct mutex lock;
 
 	struct v4l2_subdev subdev;
-	struct v4l2_subdev *remote;
+	struct media_pad *remote;
 	struct v4l2_async_notifier notifier;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *freq_ctrl;
 	struct v4l2_ctrl *privacy_ctrl;
 	/* lock for v4l2 controls */
 	struct mutex ctrl_lock;
-	unsigned int remote_pad;
 	/* start streaming or not */
 	int streaming;
 
@@ -147,10 +144,6 @@ static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
 	.field = V4L2_FIELD_NONE,
 };
 
-static s64 link_freq_menu_items[] = {
-	MEI_CSI_LINK_FREQ_400MHZ
-};
-
 static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier *n)
 {
 	return container_of(n, struct mei_csi, notifier);
@@ -286,11 +279,13 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
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
@@ -309,11 +304,11 @@ static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
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
@@ -470,34 +465,29 @@ static int mei_csi_set_fmt(struct v4l2_subdev *sd,
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
@@ -506,6 +496,7 @@ static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mei_csi_set_fmt,
+	.get_mbus_config = mei_csi_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops mei_csi_subdev_ops = {
@@ -533,8 +524,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	if (pad < 0)
 		return pad;
 
-	csi->remote = subdev;
-	csi->remote_pad = pad;
+	csi->remote = &subdev->entity.pads[pad];
 
 	return media_create_pad_link(&subdev->entity, pad,
 				     &csi->subdev.entity, CSI_PAD_SINK,
@@ -558,28 +548,16 @@ static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
 
 static int mei_csi_init_controls(struct mei_csi *csi)
 {
-	u32 max;
 	int ret;
 
 	mutex_init(&csi->ctrl_lock);
 
-	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
+	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 1);
 	if (ret)
 		return ret;
 
 	csi->ctrl_handler.lock = &csi->ctrl_lock;
 
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
2.39.5


