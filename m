Return-Path: <linux-media+bounces-24951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 682AFA16B2B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8B9188755A
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FEC1BBBF7;
	Mon, 20 Jan 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGNJd7I1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D631991CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370964; cv=none; b=XLBOO9pH0h0Eh7g6gMwh7ytP1Y2xpDPJgPlak+Ry53CpJwbg4Ayv1TSI+QDicB1kUhNbh/5tdGrCNI8kOroploBKEyHOFwLJICYaB02CHsw1q3P+8E4BRzS1yOvFWZ7zg94N1Cgs9/FT5z8tCksHIJaoQEmxIgozJaCtQ2axjkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370964; c=relaxed/simple;
	bh=75ZQyIaBWia2JQ1Fw7fjbUiYJWt2tiOBwL+a86BcjQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=czZFbkJk50dUSZ18GLUbX1bXRDtnZPo91fX+bfsan6vZsTwD1oajE7RvobLWB/uEA+dCUiPWjsnPsKns+OTDKW1VrFF955oHRVWt00nD+b57GJeYL8BfH6KmQu07FzorLs/q8aEbxm3YBngnkhKofm23yVVgnlwGUj5cczi+mE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGNJd7I1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370963; x=1768906963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=75ZQyIaBWia2JQ1Fw7fjbUiYJWt2tiOBwL+a86BcjQI=;
  b=dGNJd7I1UDQcCXejF9U+p0lJzMLPuiblCfShZmJTbfjjY7lHmndpRhY1
   KUZVlupZrB8+61A3ekKg3LFncFjSFIiDwMvXqXHb6AEiDM/fnzGwUkm4U
   srU+4REyOLjghAx10hNzsKqT8rd/a0Si+tw2dcP4Oovu6shCryAF1Zk8L
   NR8dQKnRrW0s8rE6QuAofGV2DICrB/v4KoNJFSDHXNOs4FEtdpI/MjBtl
   /5YxD9o+aQPalSC2Dkfpa5Gc0U59osjqOt6qmNg3YpkCeXgNg4vOHmbg8
   ZmyKZwvQlAc7K8wRejOWgLvN6xZJb1HXPtAteJ+RFsIeGRhv4e2MDv+qw
   A==;
X-CSE-ConnectionGUID: zfNCgF8HQMCDVOIk6Z+xAA==
X-CSE-MsgGUID: MZhxYfN7SPOPBZQYCqszMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41680365"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41680365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:42 -0800
X-CSE-ConnectionGUID: 4qWCiosVQJ+PQCoeEWb1+Q==
X-CSE-MsgGUID: jGXx7EoZRWeEiHfDOrPaVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106606524"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:36 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4974C11F94F;
	Mon, 20 Jan 2025 13:02:30 +0200 (EET)
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
Subject: [PATCH v10 8/9] media: ivsc: csi: Obtain link frequency from the media pad
Date: Mon, 20 Jan 2025 13:01:56 +0200
Message-Id: <20250120110157.152732-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
References: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
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


