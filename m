Return-Path: <linux-media+bounces-35242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C289ADFF91
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D886B7A987E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C9D265CB6;
	Thu, 19 Jun 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4edo3WF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B274265606
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320961; cv=none; b=Lga2fHq3iRojRSmq0OA3d1EEQOV6n7M/EGQElu9fKxydAepp1oGB4SZQjc3bOoVb/oN7f1YbDhu6zloM6uYU1LtgyV5nn7z1vV40ikGKPBwbMpwDshzt7QnIs1Og1OvGbE2oKtyCmitR32gcWk9J+hdnEe6Q1UQs9F839zgw8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320961; c=relaxed/simple;
	bh=dKbodxoJD7d2/qL6o/HHJIDo44aZD+3GZkQ8RkTPGnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OoQ3EbRGl2V5Qjde38GfJKwTDTUh4HTld8frwd0q3JzpWsulE1v0phRw6cVKyq6WyrenbahcVHApLN50apO84mXGYykL5ZHZFuoQ2PFJ4bYhVWaGWCvgULYBjP9Qvpt8dHxRTq46mEQPMHHS/c0IofAFS4yPYN7put3R1rZNf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4edo3WF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320959; x=1781856959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dKbodxoJD7d2/qL6o/HHJIDo44aZD+3GZkQ8RkTPGnQ=;
  b=i4edo3WFOeQLndA9eR1yQLWRt2TAckHGmZaFZ/MeETBvCz+7G4ZTyyht
   ur2/Z6QXfd3p42iz0LcH3sI76pYyoHvtzzHXdcTROChSKXLS4Q2C+wY/z
   1uDfsHGDngR0lJW4cNiYp6hPKsSFxdKYVrm4sjDPHOUEDk6L+qfPKPtlQ
   EDmdESGkT1UCityfMWF4mnYQ8DLk4UgpMWVwmkGKoA+4oeXXqq2muTlDS
   ICmfny3TQa6ivnAmMrabc0hfFTWbEFL30PouP3PEtMUln752uKzDnPVZV
   oMqWBhT/UWvj+zsaF97h+FHk/yKPsX1sLiGzMHJvc2hyfabhXeEeD7izS
   w==;
X-CSE-ConnectionGUID: QcrbRHkbQ9GnvOCnB7kS+g==
X-CSE-MsgGUID: iUM6n5ShRzmwyp3uwWAKVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716701"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:54 -0700
X-CSE-ConnectionGUID: cuslPnu7SLS2xnm8/iXOxA==
X-CSE-MsgGUID: EweVfgHZRi+kIWqy+dSWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640668"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A5F12120AFC;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006dpO-25;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 13/13] media: ipu6: isys: Rework stream starting and stopping
Date: Thu, 19 Jun 2025 11:15:46 +0300
Message-Id: <20250619081546.1582969-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework starting and stopping streams, based on determining which streams
are available on the source. Rely on v4l2_mc_pipeline_enabled() to obtain
information on when to start streaming.

This effectively both complicates and simplifies driver implementation.
There's some cleanup to be done in the driver after this patch, as
starting and stopping streaming is currently a quite complicated process.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 38 ++++++++++---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 48 ++++++++++-------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 53 ++++++++++++-------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  9 ++--
 4 files changed, 99 insertions(+), 49 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 3b837e9ccffe..8d57cdb6aeb0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -346,21 +346,31 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys_csi2_timing timing = { };
+	struct ipu6_isys_video *iv;
+	struct ipu6_isys_stream *stream;
 	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
-	u64 sink_streams, already_enabled;
+	struct media_pad *remote_pad, *vdev_pad;
+	u64 sink_streams;
 	int ret;
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	vdev_pad = media_pad_remote_pad_first(&sd->entity.pads[pad]);
+	iv = container_of_const(media_entity_to_video_device(vdev_pad->entity),
+				struct ipu6_isys_video, vdev);
+	stream = iv->stream;
 
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	already_enabled = v4l2_subdev_state_streams_enabled(sd, state,
-							    CSI2_PAD_SINK);
-	if (!already_enabled) {
+	if ((sink_streams | stream->streams_enabled) != stream->streams) {
+		stream->streams_enabled |= sink_streams;
+		return 0;
+	}
+
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	if (!stream->streaming) {
 		ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 		if (ret)
 			return ret;
@@ -371,12 +381,15 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
+					 stream->streams_enabled |
 					 sink_streams);
 	if (ret) {
 		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
 		return ret;
 	}
 
+	stream->streams_enabled |= sink_streams;
+
 	return 0;
 }
 
@@ -402,6 +415,17 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
+	struct media_pad *vdev_pad;
+	struct ipu6_isys_video *iv;
+	struct ipu6_isys_stream *stream;
+
+	vdev_pad = media_pad_remote_pad_first(&sd->entity.pads[pad]);
+	iv = container_of_const(media_entity_to_video_device(vdev_pad->entity),
+				struct ipu6_isys_video, vdev);
+	stream = iv->stream;
+
+	stream->streams_enabled &= ~sink_streams;
+
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index aa2cf7287477..89a49395ecc4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 #include <media/media-entity.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
@@ -300,7 +301,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	if (ret)
 		goto out_requeue;
 
-	stream->streaming = 1;
+	stream->streaming = true;
 
 	bl = &__bl;
 
@@ -380,7 +381,7 @@ static void buf_queue(struct vb2_buffer *vb)
 
 	mutex_lock(&stream->mutex);
 
-	if (stream->nr_streaming != stream->nr_queues) {
+	if (!stream->streaming) {
 		dev_dbg(dev, "not streaming yet, adding to incoming\n");
 		goto out;
 	}
@@ -410,7 +411,6 @@ static void buf_queue(struct vb2_buffer *vb)
 		ret = ipu6_isys_stream_start(av, &bl, true);
 		if (ret)
 			dev_err(dev, "stream start failed.\n");
-		goto out;
 	}
 
 	/*
@@ -536,6 +536,14 @@ static void ipu6_isys_stream_cleanup(struct ipu6_isys_video *av)
 	av->stream = NULL;
 }
 
+static bool ipu6_isys_video_streaming(struct video_device *vdev)
+{
+	struct ipu6_isys_video *iv =
+		container_of_const(vdev, struct ipu6_isys_video, vdev);
+
+	return iv->streaming;
+}
+
 static int start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
@@ -546,13 +554,13 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct ipu6_isys_buffer_list __bl, *bl = NULL;
 	struct ipu6_isys_stream *stream;
 	struct media_entity *source_entity = NULL;
-	int nr_queues, ret;
+	int ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
 		av->vdev.name, ipu6_isys_get_frame_width(av),
 		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
 
-	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
+	ret = ipu6_isys_setup_video(av, &source_entity);
 	if (ret < 0) {
 		dev_dbg(dev, "failed to setup video\n");
 		goto out_return_buffers;
@@ -572,23 +580,24 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 
 	stream = av->stream;
 	mutex_lock(&stream->mutex);
-	if (!stream->nr_streaming) {
-		ret = ipu6_isys_video_prepare_stream(av, source_entity,
-						     nr_queues);
-		if (ret)
-			goto out_fw_close;
-	}
 
-	stream->nr_streaming++;
-	dev_dbg(dev, "queue %u of %u\n", stream->nr_streaming,
-		stream->nr_queues);
+	av->streaming = true;
+
+	ret = ipu6_isys_video_prepare_stream(av, source_entity);
+	if (ret)
+		goto out_fw_close;
 
 	list_add(&aq->node, &stream->queues);
 	ipu6_isys_configure_stream_watermark(av, true);
 	ipu6_isys_update_stream_watermark(av, true);
 
-	if (stream->nr_streaming != stream->nr_queues)
-		goto out;
+	if (!stream->streaming) {
+		ret = v4l2_mc_pipeline_enabled(&av->vdev,
+					       ipu6_isys_video_streaming,
+					       NULL, &stream->streams);
+		if (ret != 1)
+			goto out;
+	}
 
 	bl = &__bl;
 	ret = buffer_list_get(stream, bl);
@@ -609,7 +618,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 out_stream_start:
 	ipu6_isys_update_stream_watermark(av, false);
 	list_del(&aq->node);
-	stream->nr_streaming--;
+	av->streaming = false;
 
 out_fw_close:
 	mutex_unlock(&stream->mutex);
@@ -635,11 +644,12 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_update_stream_watermark(av, false);
 
 	mutex_lock(&av->isys->stream_mutex);
-	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
+	if (stream->streaming)
 		ipu6_isys_video_set_streaming(av, 0, NULL);
+
 	mutex_unlock(&av->isys->stream_mutex);
 
-	stream->nr_streaming--;
+	av->streaming = false;
 	list_del(&aq->node);
 	stream->streaming = 0;
 	mutex_unlock(&stream->mutex);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 54006b5e2ccd..db00e4f3afc7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -710,24 +710,16 @@ static void close_streaming_firmware(struct ipu6_isys_video *av)
 }
 
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity,
-				   int nr_queues)
+				   struct media_entity *source_entity)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_csi2 *csi2;
 
-	if (WARN_ON(stream->nr_streaming))
-		return -EINVAL;
-
-	stream->nr_queues = nr_queues;
 	atomic_set(&stream->sequence, 0);
 
 	stream->seq_index = 0;
 	memset(stream->seq, 0, sizeof(stream->seq));
 
-	if (WARN_ON(!list_empty(&stream->queues)))
-		return -EINVAL;
-
 	stream->stream_source = stream->asd->source;
 	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
 	csi2->receiver_errors = 0;
@@ -1020,8 +1012,24 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 		/* stop sub-device which connects with video */
 		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
+			u64 sink_stream = 1U, src_stream;
+
 			if (!media_pad_pipeline(&sd->entity.pads[i]))
 				continue;
+
+			struct v4l2_subdev_state *state =
+				v4l2_subdev_get_unlocked_active_state(sd);
+
+			src_stream =
+				v4l2_subdev_state_xlate_streams(state, i,
+								CSI2_PAD_SINK,
+								&sink_stream);
+
+			v4l2_subdev_unlock_state(state);
+
+			if (!(src_stream & stream->streams))
+				continue;
+
 			ret = v4l2_subdev_disable_streams(sd, i, 1U);
 			if (ret) {
 				dev_err(dev, "stream off %s failed with %d\n",
@@ -1039,8 +1047,24 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 		/* start sub-device which connects with video */
 		for (i = CSI2_PAD_SRC; i < NR_OF_CSI2_SRC_PADS; i++) {
+			u64 sink_stream = 1U, src_stream;
+
 			if (!media_pad_pipeline(&sd->entity.pads[i]))
 				continue;
+
+			struct v4l2_subdev_state *state =
+				v4l2_subdev_get_unlocked_active_state(sd);
+
+			src_stream =
+				v4l2_subdev_state_xlate_streams(state, i,
+								CSI2_PAD_SINK,
+								&sink_stream);
+
+			v4l2_subdev_unlock_state(state);
+
+			if (!(src_stream & stream->streams))
+				continue;
+
 			ret = v4l2_subdev_enable_streams(sd, i, 1U);
 			if (ret) {
 				dev_err(dev, "stream on %s failed with %d\n",
@@ -1050,8 +1074,6 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 		}
 	}
 
-	av->streaming = state;
-
 	return 0;
 
 out_media_entity_stop_streaming_firmware:
@@ -1178,7 +1200,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 }
 
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-			  struct media_entity **source_entity, int *nr_queues)
+			  struct media_entity **source_entity)
 {
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
@@ -1193,8 +1215,6 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct media_pad *source_pad, *remote_pad;
 	int ret = -EINVAL;
 
-	*nr_queues = 0;
-
 	remote_pad = media_pad_remote_pad_unique(&av->pad);
 	if (IS_ERR(remote_pad)) {
 		dev_dbg(dev, "failed to get remote pad\n");
@@ -1213,12 +1233,9 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 
 	/* Find the root */
 	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
-	for_each_active_route(&state->routing, r) {
-		(*nr_queues)++;
-
+	for_each_active_route(&state->routing, r)
 		if (r->source_pad == remote_pad->index)
 			route = r;
-	}
 
 	if (!route) {
 		v4l2_subdev_unlock_state(state);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 1dd36f2a077e..6f95544794cf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -44,6 +44,8 @@ struct sequence_info {
 struct ipu6_isys_stream {
 	struct mutex mutex;
 	struct media_entity *source_entity;
+	u64 streams;
+	u64 streams_enabled;
 	atomic_t sequence;
 	unsigned int seq_index;
 	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
@@ -52,8 +54,6 @@ struct ipu6_isys_stream {
 	unsigned int nr_output_pins;
 	struct ipu6_isys_subdev *asd;
 
-	int nr_queues;	/* Number of capture queues */
-	int nr_streaming;
 	int streaming;	/* Has streaming been really started? */
 	struct list_head queues;
 	struct completion stream_open_completion;
@@ -106,14 +106,13 @@ extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 const struct ipu6_isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity,
-				   int nr_queues);
+				   struct media_entity *source_entity);
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 				  struct ipu6_isys_buffer_list *bl);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-			  struct media_entity **source_entity, int *nr_queues);
+			  struct media_entity **source_entity);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
-- 
2.39.5


