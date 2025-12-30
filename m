Return-Path: <linux-media+bounces-49711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893CCE97A6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AE0A3040A58
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184441FF1AD;
	Tue, 30 Dec 2025 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gy5T3r2K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7394B2E22AA
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091949; cv=none; b=GC4SXdZLJ3pdNWEsrfB0ZAMTMY/MSnDE7Kl7Vf06dCYqFWAljIjkIfIYvoCIkeP9IV7tnRJ7etU9SO8JUu29lNye1Eu54iUxbn1PXcmIPMzv8xCSvvOzxE6quoSUyDfmvmHbnpEpGNyS5v5onxQPVVK93lcqWBu4Ylnt43wRnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091949; c=relaxed/simple;
	bh=fE2My8g3bPqbQcbt3WP62L8w6Mwg60NeJzHWIPyvjUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poG43x2yfyI87pEhHTCl7RAFqdQbm3kfI2CPNQftQciTRjNgfpCjCmjRvyA8XFZK8EtAKo+EDgVimj/tSGulUtF2x32YCrYAyyFDaTTBO0r121xBnvg47eEjVnvw1VhfBahoopr8uIJjKQeJLIuD4uKwXkwAxNePIg/n1L5AZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gy5T3r2K; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091948; x=1798627948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fE2My8g3bPqbQcbt3WP62L8w6Mwg60NeJzHWIPyvjUA=;
  b=gy5T3r2KCBBXZLgjnsrLjScF77DFpcs9nQDXYeQ0mdRj9nRSguM2Mn/j
   VEWooQr0KcNuQuHnldV9/dsA3+LOl7mRLNCejLb9MMkmGQChVhUS1sFai
   ZlGsnr1EGU6vlP8teuFLaSB+IHKt3w0+xmFE5Z/zZje3xo/MEXKXTlQRW
   D4H4KXhhutEoPEZPXdVwjq26CCGbx03MOw7LBMQD4QerzdyqrTmaJx1hf
   6JVkzz9Ob7xd+byzcTsfvYmwsrbkC4YF+fZskQFAZReEerWJzqqJOnJNZ
   e/fumxPLGHLnaYNJCiGCAoq1QS1+cjNsMaVETJ2yQAwKc1QHopl+Q1LOs
   A==;
X-CSE-ConnectionGUID: JPInIBbiQsytlVRZPq982g==
X-CSE-MsgGUID: 0S0iGntBQo2lEAnINHOmnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148733"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148733"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:21 -0800
X-CSE-ConnectionGUID: hgVPfZ1DS4WFsAp5L45ITg==
X-CSE-MsgGUID: ep+r4lMvT4WowL7gAkFVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186930"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A114121E70;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYn-1OCz;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 12/13] media: ipu6: Drop custom functions to obtain sd state information
Date: Tue, 30 Dec 2025 12:52:21 +0200
Message-ID: <20251230105222.3676928-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
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
index 347b5df4813f..622cd28f5cf8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -423,7 +423,7 @@ static void buf_queue(struct vb2_buffer *vb)
 
 static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 {
-	struct v4l2_mbus_framefmt format;
+	struct v4l2_mbus_framefmt format, *__format;
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct media_pad *remote_pad =
@@ -438,13 +438,20 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
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


