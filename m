Return-Path: <linux-media+bounces-29122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A204CA77746
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B881687F7
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021421EB9E8;
	Tue,  1 Apr 2025 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmHGQ/UM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3647D2E3398
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498607; cv=none; b=aLhUKUpukYuViqLASuoWRVDwiz4J5hDwlVzf8DY/Z9Za02idSitf6qlb3mH5caEys/8Hizq0SwNLMeaoDO4M+I4EBD2UT2rO0XFxemLn8gco9ehakYKMgOAn4aLtorXS1Ogi32R2jVewZfxOTUxBjkrb19B74GL8CJHIvB28Z0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498607; c=relaxed/simple;
	bh=BA6HUXKY1hekNZwyURqeN9lHqG1Rf2jVuhSQ08bAUhk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gCggDYHjLLVGw2T1aoGb8vBdYSvo/4yNlkKTNipTGoVxIDoDkhVNSm8dD5oDbEUl0Urii26oaORoPq1fP1e96bvajb/2LKlhcXtgMximz49FgSxSIVoSx6O3A0PRBlg7wpvfZ4DSOjAAtDDU58NS8sGFyqJQrPJg3SAh8mesbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmHGQ/UM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743498605; x=1775034605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BA6HUXKY1hekNZwyURqeN9lHqG1Rf2jVuhSQ08bAUhk=;
  b=BmHGQ/UM9R+MoOe7Zd7rgMC6dwKUsNMaa5hXIhYJ5ufg2E5nXOpEE0t6
   356r4buZR8s1tjIPnbganh0yPmTMH8T5QSi0ct/fHcrncgNQtoZMFlBXz
   K2RPnNzKq9AMKNFPBlQt2rIaOfE84gqU2SjZPEdOqzX4+BCzf460A3lHJ
   4IsPRVtvDHeffFeVjiwaCeU5sh4M6Jc2dcC03vOreL1tipOx5B+YMrlPT
   snaaB6ivyra06VyvGM8hGhY1B7gYEFsYmUgeQKrBjCxX+MIK2eEFNZBqu
   FNFR/07K/N5+b2vHpNAFwUQ5JjyzmD1lHyNfpwWUImKMwEeEHLhVQ4Sva
   g==;
X-CSE-ConnectionGUID: 7Wn2GRHDSIqGGFqr/tBoWg==
X-CSE-MsgGUID: beLh3tarRcG+5KigI0YmEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47532602"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="47532602"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:04 -0700
X-CSE-ConnectionGUID: m/D1C4ZSSquiSAd/YCpQhA==
X-CSE-MsgGUID: lodnGmVtQx+oBGoQXDgopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126301078"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.43])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:04 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 1/5] media: intel/ipu6: Separate ipu6 subdev functions
Date: Tue,  1 Apr 2025 11:09:49 +0200
Message-Id: <20250401090953.473339-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
References: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move ipu6 isys functions that do not have dependency's other than
v4l-subdev into separate file. Rename them using isys_ prefix.

This is initial commit of changes that separate layers in ipu6 driver to
make them reusable in incoming ipu7 driver.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile         |  3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  5 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 68 --------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   | 11 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 17 ++--
 drivers/media/pci/intel/ipu6/isys-subdev.c    | 94 +++++++++++++++++++
 drivers/media/pci/intel/ipu6/isys.h           | 19 ++++
 8 files changed, 128 insertions(+), 91 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/isys.h

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index a821b0a1567f..493aca7a1e71 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -18,6 +18,7 @@ intel-ipu6-isys-y		:= ipu6-isys.o \
 				ipu6-isys-subdev.o \
 				ipu6-isys-mcd-phy.o \
 				ipu6-isys-jsl-phy.o \
-				ipu6-isys-dwc-phy.o
+				ipu6-isys-dwc-phy.o \
+				isys-subdev.o
 
 obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6-isys.o
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index da8581a37e22..923e92785a17 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -494,7 +494,7 @@ static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
 	.get_selection = ipu6_isys_csi2_get_sel,
 	.set_selection = ipu6_isys_csi2_set_sel,
 	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
-	.set_routing = ipu6_isys_subdev_set_routing,
+	.set_routing = isys_subdev_set_routing,
 	.enable_streams = ipu6_isys_csi2_enable_streams,
 	.disable_streams = ipu6_isys_csi2_disable_streams,
 };
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 2b2bc6ff8099..5fc52a3b89e6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -446,10 +446,9 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 		return -ENOTCONN;
 
 	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
+	r_stream = isys_get_src_stream_by_src_pad(sd, remote_pad->index);
 
-	ret = ipu6_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
-					   &format);
+	ret = isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream, &format);
 
 	if (ret) {
 		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 0a06de5c739c..e5ce76c17ca3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -243,66 +243,6 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
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
-u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
-{
-	struct v4l2_subdev_state *state;
-	struct v4l2_subdev_route *routes;
-	unsigned int i;
-	u32 source_stream = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (!state)
-		return 0;
-
-	routes = state->routing.routes;
-	for (i = 0; i < state->routing.num_routes; i++) {
-		if (routes[i].source_pad == pad) {
-			source_stream = routes[i].source_stream;
-			break;
-		}
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return source_stream;
-}
-
 static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
 				       struct v4l2_subdev_state *state)
 {
@@ -321,14 +261,6 @@ static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
 	return subdev_set_routing(sd, state, &routing);
 }
 
-int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *state,
-				 enum v4l2_subdev_format_whence which,
-				 struct v4l2_subdev_krouting *routing)
-{
-	return subdev_set_routing(sd, state, routing);
-}
-
 static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
 	.init_state = ipu6_isys_subdev_init_state,
 };
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 268dfa01e903..42e35ae820c4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -10,6 +10,8 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+#include "isys.h"
+
 struct ipu6_isys;
 
 struct ipu6_isys_subdev {
@@ -37,15 +39,6 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
-u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
-int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
-				 struct v4l2_mbus_framefmt *format);
-int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
-				  struct v4l2_rect *crop);
-int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *state,
-				 enum v4l2_subdev_format_whence which,
-				 struct v4l2_subdev_krouting *routing);
 int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
 			  const struct v4l2_subdev_ops *ops,
 			  unsigned int nr_ctrls,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 959869a88556..2d3506d84922 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -387,7 +387,7 @@ static int link_validate(struct media_link *link)
 		link->sink->entity->name);
 
 	s_pad = media_pad_remote_pad_first(&av->pad);
-	s_stream = ipu6_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
+	s_stream = isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
 
 	v4l2_subdev_lock_state(s_state);
 
@@ -456,16 +456,15 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	u32 src_stream;
 	int ret;
 
-	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
-	ret = ipu6_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
-					   &fmt);
+	src_stream = isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	ret = isys_get_stream_pad_fmt(sd, src_pad->index, src_stream, &fmt);
 	if (ret < 0) {
 		dev_err(dev, "can't get stream format (%d)\n", ret);
 		return ret;
 	}
 
-	ret = ipu6_isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
-					    &v4l2_crop);
+	ret = isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
+				       &v4l2_crop);
 	if (ret < 0) {
 		dev_err(dev, "can't get stream crop (%d)\n", ret);
 		return ret;
@@ -776,8 +775,8 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
 	if (link_freq > 0) {
 		lanes = csi2->nlanes;
-		ret = ipu6_isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
-						   av->source_stream, &format);
+		ret = isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
+					      av->source_stream, &format);
 		if (!ret) {
 			bpp = ipu6_isys_mbus_code_to_bpp(format.code);
 			pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
@@ -1003,7 +1002,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 	sd = &stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
+	r_stream = isys_get_src_stream_by_src_pad(sd, r_pad->index);
 
 	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
 	routing = &subdev_state->routing;
diff --git a/drivers/media/pci/intel/ipu6/isys-subdev.c b/drivers/media/pci/intel/ipu6/isys-subdev.c
new file mode 100644
index 000000000000..483d718f2ea4
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/isys-subdev.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2025 Intel Corporation
+ */
+
+#include "isys.h"
+
+int isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+			    struct v4l2_mbus_framefmt *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (!sd || !format)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, pad, stream);
+	if (fmt)
+		*format = *fmt;
+	v4l2_subdev_unlock_state(state);
+
+	return fmt ? 0 : -EINVAL;
+}
+
+int isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
+			     struct v4l2_rect *crop)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_rect *rect;
+
+	if (!sd || !crop)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	rect = v4l2_subdev_state_get_crop(state, pad, stream);
+	if (rect)
+		*crop = *rect;
+	v4l2_subdev_unlock_state(state);
+
+	return rect ? 0 : -EINVAL;
+}
+
+u32 isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *routes;
+	unsigned int i;
+	u32 source_stream = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	routes = state->routing.routes;
+	for (i = 0; i < state->routing.num_routes; i++) {
+		if (routes[i].source_pad == pad) {
+			source_stream = routes[i].source_stream;
+			break;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return source_stream;
+}
+
+static int subdev_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 4096,
+		.height = 3072,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.field = V4L2_FIELD_NONE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+}
+
+int isys_subdev_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	return subdev_set_routing(sd, state, routing);
+}
diff --git a/drivers/media/pci/intel/ipu6/isys.h b/drivers/media/pci/intel/ipu6/isys.h
new file mode 100644
index 000000000000..d822930e94bb
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/isys.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Intel Corporation */
+
+#ifndef ISYS_H
+#define ISYS_H
+
+#include <media/v4l2-subdev.h>
+
+int isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+			    struct v4l2_mbus_framefmt *format);
+int isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
+			     struct v4l2_rect *crop);
+u32 isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
+
+int isys_subdev_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing);
+#endif
-- 
2.34.1


