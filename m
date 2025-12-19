Return-Path: <linux-media+bounces-49152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C1ACCF3D7
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D4FE3016F97
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32AD2F5A25;
	Fri, 19 Dec 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpphRLBS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B12F5492
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138326; cv=none; b=tdqZmxX1y/JRLPnD5AAU9nONDh7Yhn4TyCKrvXeP+ctSgFITfTY8z63b365Ic70YugYUnh1ByDFAHPOOFPlXmuft9w9zn3CbnymsUFgAJw04bv+PRvJZYKtPRcns1b8Nu7yuVC2RQFwleFjvMJZjhsBbPXhzq5DbqDCzOkAowF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138326; c=relaxed/simple;
	bh=SAM0W85Hk6hm1rAiUfoSofoLr3BCv/cmhu3CT6zepgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uku82hIvHhvVJqJ3YR5kBZc2KoQE9bKFFwbgAHp7dBfLBMhhYmdqKjjYlFOtH9XvsyFE0BOdELqBDMfxamhK3eqKfW9uB4Z/OQlPxbUB0i2Q8ku6k0RFnvI2BZ4B2hG+yuEdkPIs48xHzV53UUAObVWPr65DV0QTBT5ejqqx4Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpphRLBS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138324; x=1797674324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SAM0W85Hk6hm1rAiUfoSofoLr3BCv/cmhu3CT6zepgI=;
  b=NpphRLBSwZuM7PdGVqp7U5D1U1ySiBSDe8jIxffijt6c6Hy/Ma8ZyQda
   HP94vy6Q1Ur6Zcl4dRSoU+aYpwphpPDW7Qfi0o2kMHMifka30f8RP/WyK
   Yv9QFxoRUOz64ESrpoc83BLi9BxWWt/9NvfNzBFsutFS1Pa/Rw7FZSR/8
   IS931br4HGdV4vspGJJxEL1IwetTWHpZ2zxMuiO8C6AXm2F6JwHV3NBIA
   S154PE/YHWiGMDtalKh/Mau2Gu2VpdW3/2ejbh8rR0Ymb8pAFC1L9n1Gn
   VhPShLs6gxBTTXxVFswnKZzs9BTc5YqbfL7ChtOVeV37T9W8PG/4e2LT2
   A==;
X-CSE-ConnectionGUID: sFdKLqPJQz+10A5Wmqcalg==
X-CSE-MsgGUID: X0ZZjWOBSVCTl1BK2U6e9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945167"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945167"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: VbWKig5BTiyg2XLQWXNO/A==
X-CSE-MsgGUID: Q32ykmAXQt2Kc1IPH39RrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973400"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1731A121DB9;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsSB-3JoA;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 11/13] media: ipu6: Remove source_entity from struct ipu6_isys_stream
Date: Fri, 19 Dec 2025 11:58:27 +0200
Message-ID: <20251219095829.2830843-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
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
index db533d45d994..347b5df4813f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -535,14 +535,28 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
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
@@ -563,7 +577,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	stream = av->stream;
 	mutex_lock(&stream->mutex);
 	if (!stream->nr_streaming) {
-		ret = ipu6_isys_video_prepare_stream(av, source_entity,
+		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity,
 						     nr_queues);
 		if (ret)
 			goto out_fw_close;
@@ -574,7 +588,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
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


