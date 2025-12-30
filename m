Return-Path: <linux-media+bounces-49730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEFCE9BEB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 746EF301F004
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35333219A79;
	Tue, 30 Dec 2025 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSyUsf8d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B621D00A
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100221; cv=none; b=fzxk0LP6Brk0+XJtfLdGNoOOL2rRaf8Y6XFYIdz969P458VfhojWty0tq3Q3mN9RqZSsaWZKiMmt8Cs4t1Fsml276rhZUNK+R/Jcwfo1c7hFFncaoO2u5g8xxJqjzZPiqfNrEC9sgTRQ/q+mSMSbZKkDL1G/KbfdFzVCFwEJbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100221; c=relaxed/simple;
	bh=3pi+4wrzkkgGtPJ5h7FNVyu72MDVpOX5fDFVP5UW4ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqNLXwfmLA/6gs0xUQe0mIZma5sFZdvb3r8lwY3Vlf/vU50JZweMrlOaxBWgX+Ob0lRwZtX2U1I3yW3lCLWKhEC/2KTTCHq1peQQCco9g6BWP+vJdIo+83VBtwnTuso+TdOp/vTlWmtNnPDt7E3O5CAjJQ3UyqkPoM4UKPpyTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSyUsf8d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100220; x=1798636220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3pi+4wrzkkgGtPJ5h7FNVyu72MDVpOX5fDFVP5UW4ko=;
  b=iSyUsf8dNwI7O8BunPdovFN9dSQMG69r1spv8pTI6b1pAsSYeKBDIxtK
   ST6lerkixCcK8trw3iFkWHh7QmHOEhAVWfUSQCghvs7fERGRIkWGF4dKc
   JTOIcs2d+2zVh5ECQmkuKBCvWDX8SCH16YJomQItwSb0i99/psXsrjCvg
   cOY2fuUuBnuuaXJD8JiIPMILRk17zz44AQUrcJfK70OuAaylBaLIi5osj
   Hc9nrux3FaubZ4o6srlIiYbmNzLOtVJ4rBZbW8TQfTC+kmbZLJB9H5kPo
   lQc/h1tQE28H+m16K5x0tWT5NskIi5ibNe8WT8nsdvmjqc7TFXr8WjtPU
   g==;
X-CSE-ConnectionGUID: 6vLwOMplSvCtbj7fncDFnw==
X-CSE-MsgGUID: xdDE3WtdQMS1pwpNT09GgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309263"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: IyFbs9TzRXSsDwPt1DeemA==
X-CSE-MsgGUID: Xuz+kHNYSXayBMuX4vGaxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882160"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A9AEA121E65;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000JcZ-1esi;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 11/13] media: ipu6: Remove source_entity from struct ipu6_isys_stream
Date: Tue, 30 Dec 2025 15:10:11 +0200
Message-ID: <20251230131013.75338-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove source_entity from struct ipu6_isys_stream and instead pass it on
in function arguments.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 22 ++++++++--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 42 +++++--------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +--
 3 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 0e9f0025aeb3..651ddab9ef14 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -532,14 +532,28 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct ipu6_isys_buffer_list __bl, *bl = NULL;
 	struct ipu6_isys_stream *stream;
-	struct media_entity *source_entity = NULL;
+	struct media_pad *source_pad, *remote_pad;
 	int nr_queues, ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
 		av->vdev.name, ipu6_isys_get_frame_width(av),
 		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
 
-	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
+	remote_pad = media_pad_remote_pad_unique(&av->pad);
+	if (IS_ERR(remote_pad)) {
+		dev_dbg(dev, "failed to get remote pad\n");
+		ret = PTR_ERR(remote_pad);
+		goto out_return_buffers;
+	}
+
+	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
+	if (IS_ERR(source_pad)) {
+		dev_dbg(dev, "No external source entity\n");
+		ret = PTR_ERR(source_pad);
+		goto out_return_buffers;
+	}
+
+	ret = ipu6_isys_setup_video(av, remote_pad, source_pad, &nr_queues);
 	if (ret < 0) {
 		dev_dbg(dev, "failed to setup video\n");
 		goto out_return_buffers;
@@ -560,7 +574,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	stream = av->stream;
 	mutex_lock(&stream->mutex);
 	if (!stream->nr_streaming) {
-		ret = ipu6_isys_video_prepare_stream(av, source_entity,
+		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity,
 						     nr_queues);
 		if (ret)
 			goto out_fw_close;
@@ -571,7 +585,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		stream->nr_queues);
 
 	list_add(&aq->node, &stream->queues);
-	ipu6_isys_configure_stream_watermark(av, true);
+	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
 	ipu6_isys_update_stream_watermark(av, true);
 
 	if (stream->nr_streaming != stream->nr_queues)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index fb319d623a11..141f0e72c5c8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -745,17 +745,16 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 	stream->stream_source = stream->asd->source;
 	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
 	csi2->receiver_errors = 0;
-	stream->source_entity = source_entity;
 
 	dev_dbg(&av->isys->adev->auxdev.dev,
 		"prepare stream: external entity %s\n",
-		stream->source_entity->name);
+		source_entity->name);
 
 	return 0;
 }
 
 void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
-					  bool state)
+					  struct media_entity *source)
 {
 	struct ipu6_isys *isys = av->isys;
 	struct ipu6_isys_csi2 *csi2 = NULL;
@@ -769,10 +768,7 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	u64 pixel_rate = 0;
 	int ret;
 
-	if (!state)
-		return;
-
-	esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
+	esd = media_entity_to_v4l2_subdev(source);
 
 	av->watermark.width = ipu6_isys_get_frame_width(av);
 	av->watermark.height = ipu6_isys_get_frame_height(av);
@@ -804,7 +800,7 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 		iwake_watermark->force_iwake_disable = true;
 		mutex_unlock(&iwake_watermark->mutex);
 		dev_warn(dev, "unexpected pixel_rate from %s, disable iwake.\n",
-			 av->stream->source_entity->name);
+			 source->name);
 	}
 }
 
@@ -1011,9 +1007,6 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 	dev_dbg(dev, "set stream: %d\n", state);
 
-	if (WARN(!stream->source_entity, "No source entity for stream\n"))
-		return -ENODEV;
-
 	sd = &stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
 	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
@@ -1180,7 +1173,8 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 }
 
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-			  struct media_entity **source_entity, int *nr_queues)
+			  struct media_pad *remote_pad,
+			  struct media_pad *source_pad, int *nr_queues)
 {
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
@@ -1189,30 +1183,14 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct v4l2_subdev_route *route = NULL;
 	struct v4l2_subdev_route *r;
 	struct v4l2_subdev_state *state;
-	struct ipu6_isys_subdev *asd;
-	struct v4l2_subdev *remote_sd;
+	struct v4l2_subdev *remote_sd =
+		media_entity_to_v4l2_subdev(remote_pad->entity);
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
 	struct media_pipeline *pipeline;
-	struct media_pad *source_pad, *remote_pad;
 	int ret = -EINVAL;
 
 	*nr_queues = 0;
 
-	remote_pad = media_pad_remote_pad_unique(&av->pad);
-	if (IS_ERR(remote_pad)) {
-		dev_dbg(dev, "failed to get remote pad\n");
-		return PTR_ERR(remote_pad);
-	}
-
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-	asd = to_ipu6_isys_subdev(remote_sd);
-	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
-	if (IS_ERR(source_pad)) {
-		dev_dbg(dev, "No external source entity\n");
-		return PTR_ERR(source_pad);
-	}
-
-	*source_entity = source_pad->entity;
-
 	/* Find the root */
 	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
 	for_each_active_route(&state->routing, r) {
@@ -1232,7 +1210,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 
 	ret = ipu6_isys_csi2_get_remote_desc(av->source_stream,
 					     to_ipu6_isys_csi2(asd),
-					     *source_entity, &entry);
+					     source_pad->entity, &entry);
 	if (ret == -ENOIOCTLCMD) {
 		av->vc = 0;
 		av->dt = ipu6_isys_mbus_code_to_mipi(pfmt->code);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 1dd36f2a077e..2ff53315d7b9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -43,7 +43,6 @@ struct sequence_info {
  */
 struct ipu6_isys_stream {
 	struct mutex mutex;
-	struct media_entity *source_entity;
 	atomic_t sequence;
 	unsigned int seq_index;
 	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
@@ -113,7 +112,8 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-			  struct media_entity **source_entity, int *nr_queues);
+			  struct media_pad *remote_pad,
+			  struct media_pad *source_pad, int *nr_queues);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
@@ -123,7 +123,7 @@ struct ipu6_isys_stream *
 ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc);
 
 void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
-					  bool state);
+					  struct media_entity *source);
 void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state);
 
 u32 ipu6_isys_get_format(struct ipu6_isys_video *av);
-- 
2.47.3


