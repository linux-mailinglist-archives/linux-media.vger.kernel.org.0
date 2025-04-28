Return-Path: <linux-media+bounces-31225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A45A9F56F
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DCCC4623CD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B0B27A916;
	Mon, 28 Apr 2025 16:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqHSJ2uf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F627A131
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857020; cv=none; b=JwGrzmN491V28/FJOYx8IElHmGKux0tylTwmUMrGfJ1Km9DI1PXtMWnlDKfum1RnGQLyfSHKL3XBqVzhXKva3XT76Di7ux1xWy1jSuPRDtyQPZIbesg710Z2PTDRoiFPLqiAEzrsx0clA0TXp0v/uDqTGIUFnh8yn4GH1rxnFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857020; c=relaxed/simple;
	bh=2dSGU761g/bJTcwy5cxpvwdFryB02PpTg7ea/fQ+OvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PVFNiyQa4tVvoMxEncRtxKwRpU0e5+bwvc/HU1VHMPA28ShyEn8Ox+WmNkmcCb2xkifVTeI7g8jssarvBRnE4LOIgJhHJL4vmyhhhRXrhrc9GrdsfbieT701bTGRcPZyanke0uxzBMNp8EvFrk79p/Ds8c7Nfb9Y39Uaoe7GL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqHSJ2uf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857018; x=1777393018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2dSGU761g/bJTcwy5cxpvwdFryB02PpTg7ea/fQ+OvU=;
  b=aqHSJ2uf7nNvzifktU90fbi1Snq9Qh+kurOiFmg2XPxylJK4zYmoL2p4
   LyV7ZVAa3rxpDemMOPxVHfwG80SU1HlixGAD0e6rLnIXXHpZfGmiQHPXQ
   YiTRNZZFdG4ab0K/gJXewa28/RX3BcWA3BwzDQqHxct71TWHzu7hJRkDm
   fxBo43JdaCXSJF4tZNL5p0ofwK06CEhKD1vP+ViFhSQdJXTxQIA1AtSsk
   kz9ZXdK0qabXzE6Gcw5uosY7yLQwnH+cKibknTBPKSmXOSPO3WCpWKYRc
   jCkREvXpL8/ZdQTEp0PTICM5fU3JX+iphIvq+wErM1LvJWaBNAjqFRMry
   w==;
X-CSE-ConnectionGUID: ahnwNo6FQ16OJnIiPxczYg==
X-CSE-MsgGUID: NBq+rtrdRHiVRu7dEFJ7lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47341230"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47341230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:51 -0700
X-CSE-ConnectionGUID: rz1c7T3cQuuMh2+QlsGfeA==
X-CSE-MsgGUID: i1hjPDb2Q9aapqmfEgSuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="134546790"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.253.52])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:50 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 1/5] media: intel/ipu6: Separate ipu6 subdev functions
Date: Mon, 28 Apr 2025 18:16:39 +0200
Message-Id: <20250428161643.321617-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
References: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move ipu6 isys functions that do not have dependency's other than
v4l-subdev into separate file. Rename them using ipu_isys_ prefix.

This is initial commit of changes that separate layers in ipu6 driver to
make them reusable in incoming ipu7 driver.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile         |  3 +-
 .../media/pci/intel/ipu6/ipu-isys-subdev.c    | 94 +++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu-isys.h       | 19 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  6 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 68 --------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   | 11 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 17 ++--
 8 files changed, 129 insertions(+), 91 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu-isys.h

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index a821b0a1567f..b773615e9b71 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -18,6 +18,7 @@ intel-ipu6-isys-y		:= ipu6-isys.o \
 				ipu6-isys-subdev.o \
 				ipu6-isys-mcd-phy.o \
 				ipu6-isys-jsl-phy.o \
-				ipu6-isys-dwc-phy.o
+				ipu6-isys-dwc-phy.o \
+				ipu-isys-subdev.o
 
 obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6-isys.o
diff --git a/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
new file mode 100644
index 000000000000..27b816a7303c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013-2025 Intel Corporation
+ */
+
+#include "ipu-isys.h"
+
+int ipu_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				struct v4l2_mbus_framefmt *format)
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
+int ipu_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				 struct v4l2_rect *crop)
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
+u32 ipu_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
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
+int ipu_isys_subdev_set_routing(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				enum v4l2_subdev_format_whence which,
+				struct v4l2_subdev_krouting *routing)
+{
+	return subdev_set_routing(sd, state, routing);
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu-isys.h b/drivers/media/pci/intel/ipu6/ipu-isys.h
new file mode 100644
index 000000000000..52dd0a5a8c8c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu-isys.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Intel Corporation */
+
+#ifndef IPU_ISYS_H
+#define IPU_ISYS_H
+
+#include <media/v4l2-subdev.h>
+
+int ipu_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				struct v4l2_mbus_framefmt *format);
+int ipu_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				 struct v4l2_rect *crop);
+u32 ipu_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
+
+int ipu_isys_subdev_set_routing(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				enum v4l2_subdev_format_whence which,
+				struct v4l2_subdev_krouting *routing);
+#endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index da8581a37e22..685ef81969ac 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -494,7 +494,7 @@ static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
 	.get_selection = ipu6_isys_csi2_get_sel,
 	.set_selection = ipu6_isys_csi2_set_sel,
 	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
-	.set_routing = ipu6_isys_subdev_set_routing,
+	.set_routing = ipu_isys_subdev_set_routing,
 	.enable_streams = ipu6_isys_csi2_enable_streams,
 	.disable_streams = ipu6_isys_csi2_disable_streams,
 };
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index a9127b1c4d45..12b42b46ebab 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -446,10 +446,10 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 		return -ENOTCONN;
 
 	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
+	r_stream = ipu_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
 
-	ret = ipu6_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
-					   &format);
+	ret = ipu_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
+					  &format);
 
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
index 268dfa01e903..46a2ede867f0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -10,6 +10,8 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+#include "ipu-isys.h"
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
index 959869a88556..f2e8922be166 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -387,7 +387,7 @@ static int link_validate(struct media_link *link)
 		link->sink->entity->name);
 
 	s_pad = media_pad_remote_pad_first(&av->pad);
-	s_stream = ipu6_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
+	s_stream = ipu_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
 
 	v4l2_subdev_lock_state(s_state);
 
@@ -456,16 +456,15 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	u32 src_stream;
 	int ret;
 
-	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
-	ret = ipu6_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
-					   &fmt);
+	src_stream = ipu_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	ret = ipu_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream, &fmt);
 	if (ret < 0) {
 		dev_err(dev, "can't get stream format (%d)\n", ret);
 		return ret;
 	}
 
-	ret = ipu6_isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
-					    &v4l2_crop);
+	ret = ipu_isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
+					   &v4l2_crop);
 	if (ret < 0) {
 		dev_err(dev, "can't get stream crop (%d)\n", ret);
 		return ret;
@@ -776,8 +775,8 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
 	if (link_freq > 0) {
 		lanes = csi2->nlanes;
-		ret = ipu6_isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
-						   av->source_stream, &format);
+		ret = ipu_isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
+						  av->source_stream, &format);
 		if (!ret) {
 			bpp = ipu6_isys_mbus_code_to_bpp(format.code);
 			pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
@@ -1003,7 +1002,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 	sd = &stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
+	r_stream = ipu_isys_get_src_stream_by_src_pad(sd, r_pad->index);
 
 	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
 	routing = &subdev_state->routing;
-- 
2.34.1


