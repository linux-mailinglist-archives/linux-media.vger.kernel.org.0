Return-Path: <linux-media+bounces-12450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3BE8D7F3F
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC291F217FA
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1BC84D02;
	Mon,  3 Jun 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENmdY5g6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1584A54
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407821; cv=none; b=Dp9IVDKKmstppn4KaV/LJQPDOMETtzaYIleHWOQLwN2iEXLQ+T2O/nHBfHJh1CeRseF4kyxyv68IqWH9yTJpmD5tB2WpzedLK+pUmmAR7ZwBeqnHY6eZCXnNWrK/5K0z707fYP7eqqwCNwTRo1GfsI7Ei3HK+WMwYyZ8uDf3REg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407821; c=relaxed/simple;
	bh=NdemFMXFy1ARsZPrB+29qFAmnZz0cnVLR1vfCl1hrP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ORoyWr9cT9cncTzYoG8UwiqTGnBIkmsRhQxuK4aHaTAkoSh3TpkmMHG+ndCS3+pKB1zBsQjk/wUgfsnGy2oc80z2R36QKJ5tXjYFetzjn/fvVMlZzpgm588sVWf4+IRsYcsvebQTbLTKliGlREhOsiVdgVuf92No4qt6P+hcx2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENmdY5g6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717407820; x=1748943820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NdemFMXFy1ARsZPrB+29qFAmnZz0cnVLR1vfCl1hrP4=;
  b=ENmdY5g6BKSRbcg7f45IZgHbrm+eu3BpI3jkUiDdFJvEw4Id/LnnFlz3
   8BOb/9rfy3jYwRdF+bCTpJAOtj6xPZ4esIK+FyR3lkkVRXwqxOUmtlkfy
   2C/ewAxeSnD0NGwJp0Td/s5s9HYPh2+mHDRF2fQxipIjmL3uRj9Dxd/by
   eG9nMjIKNo7VrY5zPY6NKXSOArklgo+YRviz8qkHQBisHlDclRqQiZJEx
   /mv0eyNApb68qIelJw3EROnAhOKJ9n99sSagdp56nLnM/SaRpSDrT61Pz
   sB8lxUFoRYVDnAjQDXvQ6kwvzUoFh4FjYpe98AXLTjZKzoORewM0KeJnQ
   g==;
X-CSE-ConnectionGUID: Ze4q04xnS1mfgjDYzo8o0A==
X-CSE-MsgGUID: ngbIv0ZkQWmTvT7HSaFbZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="25294758"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="25294758"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 02:43:39 -0700
X-CSE-ConnectionGUID: dEW6pmR8SpSrMi4bkRZ7AQ==
X-CSE-MsgGUID: aFfG2l9yQp2RAiRW/GEzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41272241"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 02:43:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 52F8511F9DB;
	Mon,  3 Jun 2024 12:43:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sE4E1-000lwT-0z;
	Mon, 03 Jun 2024 12:43:33 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 1/1] media: ipu6: Rework CSI-2 sub-device streaming control
Date: Mon,  3 Jun 2024 12:43:23 +0300
Message-Id: <20240603094323.184281-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CSI-2 sub-device streaming control should use {enable,disable}_streams pad
ops and not s_stream video ops as the sub-device supports streams. Fix
this by removing driver-implemented stream management and moving sensor
streaming control to the CSI-2 sub-device sub-driver.

Fixes: a11a5570a09d ("media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Removed unused variables.

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 98 ++++++++-----------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  2 -
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  3 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 43 ++------
 4 files changed, 49 insertions(+), 97 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index b9ce4324996d..051898ce53f4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -345,42 +345,61 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int set_stream(struct v4l2_subdev *sd, int enable)
+static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 u32 pad, u64 streams_mask)
 {
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
 	struct ipu6_isys_csi2_timing timing = { };
-	unsigned int nlanes;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret;
 
-	dev_dbg(dev, "csi2 stream %s callback\n", enable ? "on" : "off");
-
-	if (!enable) {
-		csi2->stream_count--;
-		if (csi2->stream_count)
-			return 0;
-
-		ipu6_isys_csi2_set_stream(sd, &timing, 0, enable);
-		return 0;
-	}
-
-	if (csi2->stream_count) {
-		csi2->stream_count++;
-		return 0;
-	}
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	nlanes = csi2->nlanes;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
+						       CSI2_PAD_SINK,
+						       &streams_mask);
 
 	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
 		return ret;
 
-	ret = ipu6_isys_csi2_set_stream(sd, &timing, nlanes, enable);
+	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
 	if (ret)
 		return ret;
 
-	csi2->stream_count++;
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
+					 sink_streams);
+	if (ret) {
+		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
+{
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
+						       CSI2_PAD_SINK,
+						       &streams_mask);
+
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
 	return 0;
 }
@@ -475,10 +494,6 @@ static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static const struct v4l2_subdev_video_ops csi2_sd_video_ops = {
-	.s_stream = set_stream,
-};
-
 static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ipu6_isys_subdev_set_fmt,
@@ -486,11 +501,12 @@ static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
 	.set_selection = ipu6_isys_csi2_set_sel,
 	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
 	.set_routing = ipu6_isys_subdev_set_routing,
+	.enable_streams = ipu6_isys_csi2_enable_streams,
+	.disable_streams = ipu6_isys_csi2_disable_streams,
 };
 
 static const struct v4l2_subdev_ops csi2_sd_ops = {
 	.core = &csi2_sd_core_ops,
-	.video = &csi2_sd_video_ops,
 	.pad = &csi2_sd_pad_ops,
 };
 
@@ -631,33 +647,3 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 
 	return 0;
 }
-
-void ipu6_isys_set_csi2_streams_status(struct ipu6_isys_video *av, bool status)
-{
-	struct ipu6_isys_stream *stream = av->stream;
-	struct v4l2_subdev *sd = &stream->asd->sd;
-	struct v4l2_subdev_state *state;
-	struct media_pad *r_pad;
-	unsigned int i;
-	u32 r_stream;
-
-	r_pad = media_pad_remote_pad_first(&av->pad);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	for (i = 0; i < state->stream_configs.num_configs; i++) {
-		struct v4l2_subdev_stream_config *cfg =
-			&state->stream_configs.configs[i];
-
-		if (cfg->pad == r_pad->index && r_stream == cfg->stream) {
-			dev_dbg(&av->isys->adev->auxdev.dev,
-				"%s: pad:%u, stream:%u, status:%u\n",
-				sd->entity.name, r_pad->index, r_stream,
-				status);
-			cfg->enabled = status;
-		}
-	}
-
-	v4l2_subdev_unlock_state(state);
-}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index eba6b29386ea..bc8594c94f99 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -45,7 +45,6 @@ struct ipu6_isys_csi2 {
 	u32 receiver_errors;
 	unsigned int nlanes;
 	unsigned int port;
-	unsigned int stream_count;
 };
 
 struct ipu6_isys_csi2_timing {
@@ -77,6 +76,5 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 				   struct ipu6_isys_csi2 *csi2,
 				   struct media_entity *source_entity,
 				   struct v4l2_mbus_frame_desc_entry *entry);
-void ipu6_isys_set_csi2_streams_status(struct ipu6_isys_video *av, bool status);
 
 #endif /* IPU6_ISYS_CSI2_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 40a8ebfcfce2..6bea7754875d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -551,7 +551,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		stream->nr_queues);
 
 	list_add(&aq->node, &stream->queues);
-	ipu6_isys_set_csi2_streams_status(av, true);
 	ipu6_isys_configure_stream_watermark(av, true);
 	ipu6_isys_update_stream_watermark(av, true);
 
@@ -598,8 +597,6 @@ static void stop_streaming(struct vb2_queue *q)
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct ipu6_isys_stream *stream = av->stream;
 
-	ipu6_isys_set_csi2_streams_status(av, false);
-
 	mutex_lock(&stream->mutex);
 
 	ipu6_isys_update_stream_watermark(av, false);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index c8a33e1e910c..e41d40243abd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -990,9 +990,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 	struct v4l2_subdev_state *subdev_state;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_subdev *sd;
-	struct v4l2_subdev *ssd;
 	struct media_pad *r_pad;
-	struct media_pad *s_pad;
 	u32 sink_pad, sink_stream;
 	u64 r_stream;
 	u64 stream_mask = 0;
@@ -1003,7 +1001,6 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 	if (WARN(!stream->source_entity, "No source entity for stream\n"))
 		return -ENODEV;
 
-	ssd = media_entity_to_v4l2_subdev(stream->source_entity);
 	sd = &stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
 	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
@@ -1017,27 +1014,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 	if (ret)
 		return ret;
 
-	s_pad = media_pad_remote_pad_first(&stream->asd->pad[sink_pad]);
-
 	stream_mask = get_stream_mask_by_pipeline(av);
 	if (!state) {
 		stop_streaming_firmware(av);
 
-		/* stop external sub-device now. */
-		dev_dbg(dev, "disable streams 0x%llx of %s\n", stream_mask,
-			ssd->name);
-		ret = v4l2_subdev_disable_streams(ssd, s_pad->index,
-						  stream_mask);
-		if (ret) {
-			dev_err(dev, "disable streams of %s failed with %d\n",
-				ssd->name, ret);
-			return ret;
-		}
-
 		/* stop sub-device which connects with video */
-		dev_dbg(dev, "stream off entity %s pad:%d\n", sd->name,
-			r_pad->index);
-		ret = v4l2_subdev_call(sd, video, s_stream, state);
+		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
+			sd->name, r_pad->index, stream_mask);
+		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
+						  stream_mask);
 		if (ret) {
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
@@ -1052,34 +1037,20 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 		}
 
 		/* start sub-device which connects with video */
-		dev_dbg(dev, "stream on %s pad %d\n", sd->name, r_pad->index);
-		ret = v4l2_subdev_call(sd, video, s_stream, state);
+		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
+			r_pad->index, stream_mask);
+		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
 		if (ret) {
 			dev_err(dev, "stream on %s failed with %d\n", sd->name,
 				ret);
 			goto out_media_entity_stop_streaming_firmware;
 		}
-
-		/* start external sub-device now. */
-		dev_dbg(dev, "enable streams 0x%llx of %s\n", stream_mask,
-			ssd->name);
-		ret = v4l2_subdev_enable_streams(ssd, s_pad->index,
-						 stream_mask);
-		if (ret) {
-			dev_err(dev,
-				"enable streams 0x%llx of %s failed with %d\n",
-				stream_mask, stream->source_entity->name, ret);
-			goto out_media_entity_stop_streaming;
-		}
 	}
 
 	av->streaming = state;
 
 	return 0;
 
-out_media_entity_stop_streaming:
-	v4l2_subdev_disable_streams(sd, r_pad->index, BIT(r_stream));
-
 out_media_entity_stop_streaming_firmware:
 	stop_streaming_firmware(av);
 
-- 
2.39.2


