Return-Path: <linux-media+bounces-49729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94ACE9C0C
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C99CD303FE22
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81221218827;
	Tue, 30 Dec 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsUOEO+e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AED21ABBB
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100220; cv=none; b=EcC0VrunsUSrdd2y3rZexCKSojGtgcuyx4uNIpV1ylHzPUr/m1OeyYICKKa14X3uU5IhkTq6saIpGoWfQYXohoC8D6L75YGnZfWUqjUdxMK/vwIIxxhsvgXyWvwILt8yFMMHhui7KopKU5jm49vNJRSMQ5yd3M+O2U/WMKaXwvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100220; c=relaxed/simple;
	bh=XM87yFaXdMhgm2nT/qbsSu0JJ6YRUOt+7Al1VvBeTdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMVbrTIQklN2D8b2pgIewZ3E8lWy9uHijSDox3Y2JETfvP5vFlInBLkPDwMlBBFy67Gc3bYttJplTgv6mOP5yLiwNUquJRuIjJabYbNr91cC8I4BdPHEyGCrB/HUfbr5wPkx5NIAt4wFcVgH3ztTTFBBTN1Sra7AvfMaLu6wLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsUOEO+e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100219; x=1798636219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XM87yFaXdMhgm2nT/qbsSu0JJ6YRUOt+7Al1VvBeTdg=;
  b=jsUOEO+eY5nV0qitY0Q7giZeCuuyDorxycaAd2CxpC4rux6Ceas6PTmy
   iPC36QqccwNGKTRPy+n7A4hD6nzkbpWjXGfzFneS8UEc2j6Qxq+Z+HaHQ
   RDuR7uFM2S5S5Hr1xtJBbw41nv8UFE0JUFynT8kTnU/bHk+GB6RaPgqQA
   CGWA5WF33etAJmCUiXfw5/Bn1vKGT0ldMtu83DT0UQNnePA/EcarN2ESO
   IyR/7KIcdJPDVMJPJKvjD+qgGbOTQKq70hb85VldyvNqJcaIYsgOnP3an
   HAeLT03hp1UjeRnZwMwJacDs7F99QAVM1tB2QwqpO5fT+zoGlQ0ZcZxIz
   g==;
X-CSE-ConnectionGUID: Fa00F0jERl2SyWO22p2WJQ==
X-CSE-MsgGUID: 5wHQa28pQJOU55WCSZLndA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309262"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: WZaMqnLdQHqS414olpoUnQ==
X-CSE-MsgGUID: ZBeLu4b9Tb2luIEWpu3t8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882158"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AE190121E70;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jce-1i6r;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 12/13] media: ipu6: Drop custom functions to obtain sd state information
Date: Tue, 30 Dec 2025 15:10:12 +0200
Message-ID: <20251230131013.75338-13-sakari.ailus@linux.intel.com>
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

Drop the custom functions that are used to obtain information from the
sub-device state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 17 ++++++---
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 -------------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 ---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 33 +++++++----------
 4 files changed, 24 insertions(+), 66 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 651ddab9ef14..c862de31af9c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -420,7 +420,7 @@ static void buf_queue(struct vb2_buffer *vb)
 
 static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 {
-	struct v4l2_mbus_framefmt format;
+	struct v4l2_mbus_framefmt format, *__format;
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct media_pad *remote_pad =
@@ -435,13 +435,20 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
 
-	ret = ipu6_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
-					   &format);
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_lock_and_get_active_state(sd);
 
-	if (ret) {
+	__format = v4l2_subdev_state_get_format(state, remote_pad->index,
+						r_stream);
+	if (__format)
+		format = *__format;
+
+	v4l2_subdev_unlock_state(state);
+
+	if (!__format) {
 		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
 			sd->entity.name, remote_pad->index, r_stream);
-		return ret;
+		return -EPIPE;
 	}
 
 	if (format.width != ipu6_isys_get_frame_width(av) ||
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 869e7d4ba572..dbd6f76a066d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -265,42 +265,6 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
 	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
 }
 
-int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
-				 struct v4l2_mbus_framefmt *format)
-{
-	struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_subdev_state *state;
-
-	if (!sd || !format)
-		return -EINVAL;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, pad, stream);
-	if (fmt)
-		*format = *fmt;
-	v4l2_subdev_unlock_state(state);
-
-	return fmt ? 0 : -EINVAL;
-}
-
-int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
-				  struct v4l2_rect *crop)
-{
-	struct v4l2_subdev_state *state;
-	struct v4l2_rect *rect;
-
-	if (!sd || !crop)
-		return -EINVAL;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	rect = v4l2_subdev_state_get_crop(state, pad, stream);
-	if (rect)
-		*crop = *rect;
-	v4l2_subdev_unlock_state(state);
-
-	return rect ? 0 : -EINVAL;
-}
-
 u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
 {
 	struct v4l2_subdev_state *state;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 268dfa01e903..35069099c364 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -38,10 +38,6 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
 u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
-int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
-				 struct v4l2_mbus_framefmt *format);
-int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
-				  struct v4l2_rect *crop);
 int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 enum v4l2_subdev_format_whence which,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 141f0e72c5c8..c7f9f888c46d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -455,6 +455,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 {
 	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
 	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
 	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
 	struct ipu6_isys_stream *stream = av->stream;
@@ -464,26 +465,13 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct v4l2_rect v4l2_crop;
 	struct ipu6_isys *isys = av->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
 	int input_pins = cfg->nof_input_pins++;
 	int output_pins;
 	u32 src_stream;
-	int ret;
 
 	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
-	ret = ipu6_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
-					   &fmt);
-	if (ret < 0) {
-		dev_err(dev, "can't get stream format (%d)\n", ret);
-		return ret;
-	}
-
-	ret = ipu6_isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
-					    &v4l2_crop);
-	if (ret < 0) {
-		dev_err(dev, "can't get stream crop (%d)\n", ret);
-		return ret;
-	}
+	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
+	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
 
 	input_pin = &cfg->input_pins[input_pins];
 	input_pin->input_res.width = fmt.width;
@@ -784,13 +772,16 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
 	if (link_freq > 0) {
+		struct v4l2_subdev_state *state =
+			v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
+
 		lanes = csi2->nlanes;
-		ret = ipu6_isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
-						   av->source_stream, &format);
-		if (!ret) {
-			bpp = ipu6_isys_mbus_code_to_bpp(format.code);
-			pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
-		}
+		format = *v4l2_subdev_state_get_format(state, 0,
+						       av->source_stream);
+		bpp = ipu6_isys_mbus_code_to_bpp(format.code);
+		pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
+
+		v4l2_subdev_unlock_state(state);
 	}
 
 	av->watermark.pixel_rate = pixel_rate;
-- 
2.47.3


