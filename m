Return-Path: <linux-media+bounces-49154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE5CCF401
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25154307A226
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22492F12A5;
	Fri, 19 Dec 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nhk9U0pO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBA32F6928
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138327; cv=none; b=D7tMRBEqTk+2NpVcL0pCcfrpaWnbDWZpwHE268t2VlRV2N92rURXED4FzYsR6tiBjrR8BHi3QJXIEBesyNCF3JOQkeErM811m2e1W9gjZXV79Mmd7/Ge+NSCo0Vrv9mZqbMT1c+Woq9e4/FnyMWc7n9odN4XsAmoypSpiIxh0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138327; c=relaxed/simple;
	bh=7UJ2Bcb6yNOlsEMS+3ZhnjFPHSCxNN/4ZdAualIXzmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUrOvu84eSiBo/crqCxKKTvRoY4Mp7843LOUyelXmZuw09PSzKDJyfI/6vZfBOEaPcKNTzL4DBBT/mBMdYyNCSh3UkXLGhmb4S/y6ubOEqTO/e0EWrjYGRY3X/glVildjkx48JMh0gw6n80mU4K3+sqEo9xR72OQsvyRkNRX1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nhk9U0pO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138325; x=1797674325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7UJ2Bcb6yNOlsEMS+3ZhnjFPHSCxNN/4ZdAualIXzmY=;
  b=Nhk9U0pOddEIEVBtdDW4tt4apEwCmfdVuJtU0UpSlLJIyduZHLYiJOt2
   IKZ86R7AzHwT1Le3R4FjNaQuvpN7D+7rzoXALB8jIXeqGm2XkQ4HV3yhO
   VrIwZ5w3AVPhKvBxJtA+cXIovu6+fZbE/mWwUCZqLFwZjw88FrIsOFpRK
   IcJVFtP2SIsb2/57g6h+HQsX05xisYqkXuXT3dpJHNXA+p3jd8auUVzYq
   nxJ8qU7DNq5ERYz3mbWm7Dk/lGbrZlRsFlD+reFOTf/4g0ISWVlVJVAl7
   TVileIiQlnwLpIP/XJyfWpDz9bz8LPafSgbqyOHtOfzCAJweSf7Eb3SuA
   g==;
X-CSE-ConnectionGUID: suCn5EojRcChbcvJQbrbnw==
X-CSE-MsgGUID: B/xegvWwQ8eTvTcZGVmx9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945169"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:38 -0800
X-CSE-ConnectionGUID: IgRDOcLpSR2zVuJ/O1maSw==
X-CSE-MsgGUID: lHk5dzEbQcWmZDxnA3ufQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973404"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1A736121DBC;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsSG-3N0d;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 12/13] media: ipu6: Drop custom functions to obtain sd state information
Date: Fri, 19 Dec 2025 11:58:28 +0200
Message-ID: <20251219095829.2830843-13-sakari.ailus@linux.intel.com>
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

Drop the custom functions that are used to obtain information from the
sub-device state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  9 +++--
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 -------------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 ---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 33 +++++++----------
 4 files changed, 19 insertions(+), 63 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 347b5df4813f..4debe50bb71c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -438,8 +438,13 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
 
-	ret = ipu6_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
-					   &format);
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_lock_and_get_active_state(sd);
+
+	format = *v4l2_subdev_state_get_format(state, remote_pad->index,
+					       r_stream);
+
+	v4l2_subdev_unlock_state(state);
 
 	if (ret) {
 		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
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


