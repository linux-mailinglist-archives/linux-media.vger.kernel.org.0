Return-Path: <linux-media+bounces-5122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B37118544EB
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 648CA285637
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE2C1173D;
	Wed, 14 Feb 2024 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/l3KRKE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD1125A2
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902397; cv=none; b=JPL19k21Yn7u/nyLuQPo4H56YjFspsj89N8tnj2qJZecpGH/tz23Tw6UyKentvuUygTTwM4CCe7tdF3f8OgMu+uwYSoUu1qaBc81EFp8xiSZ3KFJpxjrI10EM5Jja/pQnKUUyLMhbRTDs74BBvSYWKPBZV8bT8+L0EunG5LU8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902397; c=relaxed/simple;
	bh=WtsV2qEipoMK1VH4b155HxI/Tu9KVECGuHR/NaBzOQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lsun4jSfTro8hyuohXw/YV+i0ny3TA6fYqFKoukxu8psuBURFe52hl1eOgGpF8bzGzYQ6OcC6pL9+eQxM9uTdGs6y/DvMmNmqZu1rfdDjzs3A6ZK2rxFnWjoLa0NDxOQjUFYr5x8Dj+PQoP6oc/ftcSD3Bx7Bl/nQSjmgHzyB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/l3KRKE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902395; x=1739438395;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WtsV2qEipoMK1VH4b155HxI/Tu9KVECGuHR/NaBzOQA=;
  b=i/l3KRKE0uTYaED3yv5b3zxmC50CCBoyCcNsSPpkb+SGGrpwbAEdT1i4
   xM4JDOwgN8drHBSPAGjaXIR6njaWupa7je+a6WkP6HH6xGIYeHyLa0m6r
   kn0KtdIP1VVokRi6zu99Hvbzw9aQ6HPbluQGzENF62jndt73EDSz6I0WE
   XBV1as/LycFzFIjFWGR32wiIVA+Rr83OPHwaXXEt3BQTfJZkWu3YAJxTY
   StH7vBF2xy+XqXW26uwrVkwHcUwCU/iqcfr+B2diZWQhs1qaD4+0ATRTs
   gDZFgwYKufSbJmgaxT4H7mosk2/QhDcaF2Ab0GExp+GVmmlHuKm+fx+wT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27384637"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="27384637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="33940569"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:19:53 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4D2511F86A;
	Wed, 14 Feb 2024 11:19:49 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 1/1] media: ivsc: csi: Make use of sub-device state
Date: Wed, 14 Feb 2024 11:19:49 +0200
Message-Id: <20240214091949.399497-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MEI CSI driver was using sub-device state but still maintained its own
format information and did its own locking. Rely on sub-device state
instead. This also fixes a circular locking problem during link
validation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 83 ++++----------------------
 1 file changed, 13 insertions(+), 70 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 7ec38570ecd0..89b582a221ab 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -131,7 +131,6 @@ struct mei_csi {
 	int streaming;
 
 	struct media_pad pads[CSI_NUM_PADS];
-	struct v4l2_mbus_framefmt format_mbus[CSI_NUM_PADS];
 
 	/* number of data lanes used on the CSI-2 link */
 	u32 nr_of_lanes;
@@ -332,58 +331,17 @@ static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static struct v4l2_mbus_framefmt *
-mei_csi_get_pad_format(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, u32 which)
-{
-	struct mei_csi *csi = sd_to_csi(sd);
-
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &csi->format_mbus[pad];
-	default:
-		return NULL;
-	}
-}
-
 static int mei_csi_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *mbusformat;
-	struct mei_csi *csi = sd_to_csi(sd);
 	unsigned int i;
 
-	mutex_lock(&csi->lock);
-
 	for (i = 0; i < sd->entity.num_pads; i++) {
 		mbusformat = v4l2_subdev_state_get_format(sd_state, i);
 		*mbusformat = mei_csi_format_mbus_default;
 	}
 
-	mutex_unlock(&csi->lock);
-
-	return 0;
-}
-
-static int mei_csi_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state,
-			   struct v4l2_subdev_format *format)
-{
-	struct v4l2_mbus_framefmt *mbusformat;
-	struct mei_csi *csi = sd_to_csi(sd);
-
-	mutex_lock(&csi->lock);
-
-	mbusformat = mei_csi_get_pad_format(sd, sd_state, format->pad,
-					    format->which);
-	if (mbusformat)
-		format->format = *mbusformat;
-
-	mutex_unlock(&csi->lock);
-
 	return 0;
 }
 
@@ -391,20 +349,17 @@ static int mei_csi_set_fmt(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *source_mbusformat;
-	struct v4l2_mbus_framefmt *mbusformat;
-	struct mei_csi *csi = sd_to_csi(sd);
-	struct media_pad *pad;
+	struct v4l2_mbus_framefmt *source_fmt;
+	struct v4l2_mbus_framefmt *sink_fmt;
 
-	mbusformat = mei_csi_get_pad_format(sd, sd_state, format->pad,
-					    format->which);
-	if (!mbusformat)
-		return -EINVAL;
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, CSI_PAD_SINK);
+	source_fmt = v4l2_subdev_state_get_format(sd_state, CSI_PAD_SOURCE);
 
-	source_mbusformat = mei_csi_get_pad_format(sd, sd_state, CSI_PAD_SOURCE,
-						   format->which);
-	if (!source_mbusformat)
-		return -EINVAL;
+	if (format->pad) {
+		*source_fmt = *sink_fmt;
+
+		return 0;
+	}
 
 	v4l_bound_align_image(&format->format.width, 1, 65536, 0,
 			      &format->format.height, 1, 65536, 0, 0);
@@ -507,18 +462,8 @@ static int mei_csi_set_fmt(struct v4l2_subdev *sd,
 	if (format->format.field == V4L2_FIELD_ANY)
 		format->format.field = V4L2_FIELD_NONE;
 
-	mutex_lock(&csi->lock);
-
-	pad = &csi->pads[format->pad];
-	if (pad->flags & MEDIA_PAD_FL_SOURCE)
-		format->format = csi->format_mbus[CSI_PAD_SINK];
-
-	*mbusformat = format->format;
-
-	if (pad->flags & MEDIA_PAD_FL_SINK)
-		*source_mbusformat = format->format;
-
-	mutex_unlock(&csi->lock);
+	*sink_fmt = format->format;
+	*source_fmt = *sink_fmt;
 
 	return 0;
 }
@@ -557,7 +502,7 @@ static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
-	.get_fmt = mei_csi_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mei_csi_set_fmt,
 };
 
@@ -764,6 +709,7 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 		goto err_disable;
 
 	csi->subdev.dev = &cldev->dev;
+	csi->subdev.state_lock = &csi->lock;
 	v4l2_subdev_init(&csi->subdev, &mei_csi_subdev_ops);
 	csi->subdev.internal_ops = &mei_csi_internal_ops;
 	v4l2_set_subdevdata(&csi->subdev, csi);
@@ -779,9 +725,6 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 	if (ret)
 		goto err_ctrl_handler;
 
-	csi->format_mbus[CSI_PAD_SOURCE] = mei_csi_format_mbus_default;
-	csi->format_mbus[CSI_PAD_SINK] = mei_csi_format_mbus_default;
-
 	csi->pads[CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	csi->pads[CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&csi->subdev.entity, CSI_NUM_PADS,
-- 
2.39.2


