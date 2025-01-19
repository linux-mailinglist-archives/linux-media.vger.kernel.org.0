Return-Path: <linux-media+bounces-24909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A519BA1623F
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDED8164599
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52131DF25A;
	Sun, 19 Jan 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLUTt3QP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F61DED70
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297593; cv=none; b=YZH/gzC7M3O00E1ExXUAqIbSykZ/oV8spgT74sYnW7OghW4C2CIZPeyrAfEjy63/AaMfc37+P0oxKqGEk3SNhhH2KTFzxZNHlBpCdzrQSgNR1Kc/QQiFvgpywnRJVds6trOBbe40pmEa0w6fu3jTKt8DAJ8o+GCf7pcCUJM6oac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297593; c=relaxed/simple;
	bh=75ZQyIaBWia2JQ1Fw7fjbUiYJWt2tiOBwL+a86BcjQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lr6iqtv8uBmzTTIJ39PrYYi/9R/HPxP8qoQCzqHn7iuJWfNnmuUhyJh/0K9GMwRvuuPnLDuAub0iNGob8zbY95SjChY6yV21joHpnY3//oaXT4fXxb48RC+7ehwDdE2PzdZ72l8lbjYoV8dZw0xqEy8e53lWUEoJntzOJCbs0bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLUTt3QP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297592; x=1768833592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=75ZQyIaBWia2JQ1Fw7fjbUiYJWt2tiOBwL+a86BcjQI=;
  b=gLUTt3QPck79dpwxQ/mSbl3j03BlLXeKfJaNJ9JY99320T0YJ8FbxCFd
   2KZYGGa+wWpmjdskSPtEQS4OaLgkM0bawQQn90D8oo11/9BaMiFYzlDIr
   a3PDVe/rLkaum3zdcNygMYr6Us+I2XrAN0pN3o6HsKBksf67vHYlT9bed
   e//9gjP2hhfDPnOOtXuFUQZ1jGTOmeId+SICCB73hmYZyWbTkVldx0qd6
   c8ztAAdc19R01UNCAERjGAQVKtWkv7ngxQyO5m/aLvdJ0XyeyNsDVMr9j
   IKiJMgTd5cd4wPczZkMdHNzF+Hh4nklutg7/MbjulWIx9E/IWPGaAuTWO
   w==;
X-CSE-ConnectionGUID: EpVf1HWnRPONmOQSMEnbRg==
X-CSE-MsgGUID: Jdii3w4rQFe8aXGY+HOlDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49086304"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49086304"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:51 -0800
X-CSE-ConnectionGUID: YLuLWHZnRlSdWFDNtXbpDw==
X-CSE-MsgGUID: 8J1hNVqqTy+cKK6NPps7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106701557"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:45 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1A20111F95E;
	Sun, 19 Jan 2025 16:39:37 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: [PATCH v9 8/9] media: ivsc: csi: Obtain link frequency from the media pad
Date: Sun, 19 Jan 2025 16:39:03 +0200
Message-Id: <20250119143904.114991-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
References: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
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
 drivers/media/pci/intel/ivsc/mei_csi.c | 78 +++++++++-----------------
 1 file changed, 26 insertions(+), 52 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 2a9c12c975ca..545de4654609 100644
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
@@ -161,11 +154,6 @@ static inline struct mei_csi *sd_to_csi(struct v4l2_subdev *sd)
 	return container_of(sd, struct mei_csi, subdev);
 }
 
-static inline struct mei_csi *ctrl_to_csi(struct v4l2_ctrl *ctrl)
-{
-	return container_of(ctrl->handler, struct mei_csi, ctrl_handler);
-}
-
 /* send a command to firmware and mutex must be held by caller */
 static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len)
 {
@@ -286,11 +274,13 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
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
@@ -309,11 +299,11 @@ static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
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
@@ -470,34 +460,30 @@ static int mei_csi_set_fmt(struct v4l2_subdev *sd,
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
+	mbus_config->type = V4L2_MBUS_CSI2_DPHY;
+	for (i = 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
+		mbus_config->bus.mipi_csi2.data_lanes[i] = i + 1;
+	mbus_config->bus.mipi_csi2.num_data_lanes = csi->nr_of_lanes;
 
-		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
-		if (freq < 0) {
-			dev_err(&csi->cldev->dev,
-				"error %lld, invalid link_freq\n", freq);
-			return -EINVAL;
-		}
-
-		link_freq_menu_items[0] = freq;
-		ctrl->val = 0;
-
-		return 0;
+	freq = v4l2_get_link_freq(csi->remote, 0, 0);
+	if (freq < 0) {
+		dev_err(&csi->cldev->dev,
+			"error %lld, invalid link_freq\n", freq);
+		return -EINVAL;
 	}
 
-	return -EINVAL;
-}
+	csi->link_freq = freq;
+	mbus_config->link_freq = freq;
 
-static const struct v4l2_ctrl_ops mei_csi_ctrl_ops = {
-	.g_volatile_ctrl = mei_csi_g_volatile_ctrl,
-};
+	return 0;
+}
 
 static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 	.s_stream = mei_csi_set_stream,
@@ -506,6 +492,7 @@ static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mei_csi_set_fmt,
+	.get_mbus_config = mei_csi_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops mei_csi_subdev_ops = {
@@ -533,8 +520,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	if (pad < 0)
 		return pad;
 
-	csi->remote = subdev;
-	csi->remote_pad = pad;
+	csi->remote = &subdev->entity.pads[pad];
 
 	return media_create_pad_link(&subdev->entity, pad,
 				     &csi->subdev.entity, CSI_PAD_SINK,
@@ -558,28 +544,16 @@ static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
 
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


