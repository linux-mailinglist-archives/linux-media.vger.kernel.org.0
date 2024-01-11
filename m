Return-Path: <linux-media+bounces-3511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC282A7D8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CCE61F2201C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4120D53A9;
	Thu, 11 Jan 2024 06:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRqqocRX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459FB53A0
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955641; x=1736491641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8nfAurZ4F7iCum6ll3LtQsq+nJcwdoeFkJNgAnCKJDo=;
  b=KRqqocRXzfx4xBdYzPI0dveTKFIyOjT6NiA4xW/vJ6sXHv3xJfoQxk9g
   42K44GjNuhRO/qdtyuFHsuDHiR5YP5gaQh1ehw/X6PD4sE7qUUpAYZn5m
   sTdKwuzBzTyPuEXxi8LZP2QfMniRWcO82d3lNWl5esJHwTkQPdQHGdUw5
   sdXSFQciojIlzZPbo50LJdk8wlgC5XLvScPMU4iFv7q0N+Op+AO+WeUzc
   OVAwb0M/9gYsOQorBfHaOOhuZzGLkD7AU5p9bpgJQBL74xtJjpvG2HXOw
   1IHPnt2jKXfwmo2TGpvdNEy/j3J5wcU5W8q3RKp7oVHF/krqO++dpTjLY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397629282"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397629282"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515816"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515816"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:47:15 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v3 17/17] media: ipu6/isys: support new v4l2 subdev state APIs
Date: Thu, 11 Jan 2024 14:55:31 +0800
Message-ID: <20240111065531.2418836-18-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Add support for the upcoming v4l2-subdev API changes in kernel 6.8.
This patch is based on Sakari's branch:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  8 +++-----
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 19 +++++++++++--------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  2 --
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  3 +--
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index a6430d531129..6f258cf92fc1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -403,12 +403,11 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
 	if (!sink_ffmt)
 		return -EINVAL;
 
-	src_ffmt = v4l2_subdev_state_get_stream_format(state, sel->pad,
-						       sel->stream);
+	src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
 	if (!src_ffmt)
 		return -EINVAL;
 
-	crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
 	if (!crop)
 		return -EINVAL;
 
@@ -453,7 +452,7 @@ static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
 	if (!sink_ffmt)
 		return -EINVAL;
 
-	crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
 	if (!crop)
 		return -EINVAL;
 
@@ -480,7 +479,6 @@ static const struct v4l2_subdev_video_ops csi2_sd_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
-	.init_cfg = ipu6_isys_subdev_init_cfg,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ipu6_isys_subdev_set_fmt,
 	.get_selection = ipu6_isys_csi2_get_sel,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 3c9263ac02a3..aeccd6f93986 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -156,8 +156,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Store the format and propagate it to the source pad. */
-	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-						  format->stream);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
@@ -182,8 +181,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 	if (ret)
 		return -EINVAL;
 
-	crop = v4l2_subdev_state_get_stream_crop(state, other_pad,
-						 other_stream);
+	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
 	/* reset crop */
 	crop->left = 0;
 	crop->top = 0;
@@ -241,7 +239,7 @@ int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
+	fmt = v4l2_subdev_state_get_format(state, pad, stream);
 	if (fmt)
 		*format = *fmt;
 	v4l2_subdev_unlock_state(state);
@@ -259,7 +257,7 @@ int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	rect = v4l2_subdev_state_get_stream_crop(state, pad, stream);
+	rect = v4l2_subdev_state_get_crop(state, pad, stream);
 	if (rect)
 		*crop = *rect;
 	v4l2_subdev_unlock_state(state);
@@ -291,8 +289,8 @@ u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
 	return source_stream;
 }
 
-int ipu6_isys_subdev_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *state)
+static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_route route = {
 		.sink_pad = 0,
@@ -317,6 +315,10 @@ int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
 	return subdev_set_routing(sd, state, routing);
 }
 
+static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
+	.init_state = ipu6_isys_subdev_init_state,
+};
+
 int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
 			  const struct v4l2_subdev_ops *ops,
 			  unsigned int nr_ctrls,
@@ -334,6 +336,7 @@ int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
 			 V4L2_SUBDEV_FL_STREAMS;
 	asd->sd.owner = THIS_MODULE;
 	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
 
 	asd->pad = devm_kcalloc(&asd->isys->adev->auxdev.dev, num_pads,
 				sizeof(*asd->pad), GFP_KERNEL);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index adea2a55761d..f4e32b094b5b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -46,8 +46,6 @@ int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 				 struct v4l2_mbus_framefmt *format);
 int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
 				  struct v4l2_rect *crop);
-int ipu6_isys_subdev_init_cfg(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *state);
 int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 enum v4l2_subdev_format_whence which,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 1a023bf1e1a6..62d4043fc2a1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -389,8 +389,7 @@ static int link_validate(struct media_link *link)
 
 	v4l2_subdev_lock_state(s_state);
 
-	s_fmt = v4l2_subdev_state_get_stream_format(s_state, s_pad->index,
-						    s_stream);
+	s_fmt = v4l2_subdev_state_get_format(s_state, s_pad->index, s_stream);
 	if (!s_fmt) {
 		dev_err(dev, "failed to get source pad format\n");
 		goto unlock;
-- 
2.42.0


