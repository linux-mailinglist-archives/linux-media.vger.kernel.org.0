Return-Path: <linux-media+bounces-50206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A397ED01EE5
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D12FF34B1D2A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EC6357A26;
	Thu,  8 Jan 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1QmOpfi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5937FF6C
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860268; cv=none; b=s0RkldlzWFjSDqvIHUZy6HX3w4norQMKLqxRQKy5hZnMfQNQA9ZoHPJnKC9Pcfu2rT51SRPaskm3jzXDkwEJP8tH9o24TI6tkiAJPDPbtMisG3zMWt0b46DIo7Vj9XvU3SEZRNykZc+HYTO0GgjCeUHWEDDjlcb5igiVYhligfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860268; c=relaxed/simple;
	bh=jzTVEhf5YSk29B/eIOSvEL9Q5u/pRVsXszYGZ7rT7I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuGh8QETDFk+fXQwQ/3Ut7qslVxEVDEJeNKcBFCvkirypklm/lS+ug8vOxGSpfNLD3lUPUWhHA78rMH4kLsCkoFyhrVQSihHj035pzewHLxXBgAJ0HCoMAQT03i4aqcOuh2JUYtO7Bbrqm72Zq0lb1JBg2BSTVAbozmtSGvOQEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1QmOpfi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860265; x=1799396265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jzTVEhf5YSk29B/eIOSvEL9Q5u/pRVsXszYGZ7rT7I8=;
  b=H1QmOpfit3o2HIiQYZ0xYiHPV4m3y1IF4UhOGerR0b2XdZCH80Q9vGdG
   OoAtY8ZybrGql76nUl7H+3hGPoZgmijRb7ziz48m7Hy+5Bj3CtNOZU/Iv
   JNP1ev+VvSEiqXq4bYUmbwQFf2dMvywYu11EyLU7ARrFeAsR2c44t6yIC
   4UXjUhfcMRwzgo0s4V+hw5l+1mL+idC8auQsZ7nt+3X74weXtFlSDlXRM
   EpKXvImnld8K0ZTLhwCesTeDKlPibulyPzOQLT3MNVCIXpKJ1bR6Ci0e+
   s17o3sCzxFUtg7Wxjatpk6oGtYZiPmX3bVtSk2pGa0k5NqCYEkI5k8kWh
   g==;
X-CSE-ConnectionGUID: HJmV7RGmT46KfOeK0WJfzA==
X-CSE-MsgGUID: Si+r/FTKTHaBnQtg8nk6Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869940"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869940"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:07 -0800
X-CSE-ConnectionGUID: 1tvrbxRAQpWoHDAWghwMRA==
X-CSE-MsgGUID: vf+5SWJcTTCO9sW4xtP31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842990"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8919E121EA2;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HT3-15Fp;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 13/14] media: ipu6: Drop custom functions to obtain sd state information
Date: Thu,  8 Jan 2026 10:17:10 +0200
Message-ID: <20260108081712.543704-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
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
index b035c7342a91..e9dab8a709ef 100644
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


