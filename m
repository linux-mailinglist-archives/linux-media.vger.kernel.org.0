Return-Path: <linux-media+bounces-5499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C07D885BCCF
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE062811DA
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 13:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27D66A037;
	Tue, 20 Feb 2024 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhlwPP62"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77A69E1D
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708434229; cv=none; b=IbNS9vEKURMFHvF+uQ4wYEOaxIxBl++u8jabNx61FnWJLL+rAUN+QK3YcQTD8Yf0PQUqfDJDxA+H1CAwpncB2BQqeEP/WyI0IyXlrJ+VKsr0k02ixsnnTLOpVEvLh6oyDszGLmSeRjZWWg15GyCC0baNmmgpUhnpqX5L+OwpVA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708434229; c=relaxed/simple;
	bh=HewI4k2b03fEISi7jlgB9TQB193I3lkbf6LuEGTwS7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TzVHzGO5xikDIXjGt//hdt4huwiNzKpjaQYTJcRd4DZWRC5+bU1xc5co39i0XcY0b++daI3QpbXQ8Fo1I3sZkX6TBNnfGhvhmkLAmWVBSPvSq8NSr4X+VSwaXO1EkrePtT25Sf0Zqv3UlVxaisFPOCMuy+OCai9E6OjQkeBCTO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhlwPP62; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434228; x=1739970228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HewI4k2b03fEISi7jlgB9TQB193I3lkbf6LuEGTwS7Q=;
  b=XhlwPP629qcy0QCPy9/F9tQ+cYWCLHIKzwXT9Av42rfrrMjl7+zNsRoR
   nWT9l/M4seJaAt6uOZiySTh7SxYHeoybsTkBUgLehAve0rBJpRVoDKuv0
   pov+CwNEV8IAJ52qpxuebD8qRdI9b0HqJXLVPAieXdxaC2mKsQrwtwHWT
   j/VPuAttdWvwQkbVYA/jIPiGW7r2giipyayMqTjhfJXfqifKpa7KsrLPN
   qhLQvBlvetR0w4yzFn/43vyUurixMeqxTZxG69XkK6WpPIN2hyRqkJH49
   JAphAITOsW0ScvQGPEeS9xtPIF/tQB4kvIoY39+d4h1sGeAV8HqCL2Z7/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13158166"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13158166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827157826"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="827157826"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:44 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 574F11203E6;
	Tue, 20 Feb 2024 15:03:41 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 3/3] media: ivsc: csi: Fix link frequency control behaviour
Date: Tue, 20 Feb 2024 15:03:39 +0200
Message-Id: <20240220130339.543749-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The link frequency control was an integer menu control the value of which
was hard-coded in the MEI CSI driver itself. Instead obtain the control
value from the upstream sub-device and use a INTEGER64 control type for
the purpose.

Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 30 ++++++++++++--------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 89b582a221ab..eef3b028c58e 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -15,6 +15,7 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/mei_cl_bus.h>
 #include <linux/module.h>
@@ -35,8 +36,6 @@
 
 #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
 
-#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
-
 /* the 5s used here is based on experiment */
 #define CSI_CMD_TIMEOUT (5 * HZ)
 /* to setup CSI-2 link an extra delay needed and determined experimentally */
@@ -148,10 +147,6 @@ static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
 	.field = V4L2_FIELD_NONE,
 };
 
-static s64 link_freq_menu_items[] = {
-	MEI_CSI_LINK_FREQ_400MHZ
-};
-
 static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier *n)
 {
 	return container_of(n, struct mei_csi, notifier);
@@ -484,8 +479,7 @@ static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 			return -EINVAL;
 		}
 
-		link_freq_menu_items[0] = freq;
-		ctrl->val = 0;
+		ctrl->p_new.p_s64[0] = csi->link_freq = freq;
 
 		return 0;
 	}
@@ -554,9 +548,18 @@ static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
 	.unbind = mei_csi_notify_unbind,
 };
 
+static const struct v4l2_ctrl_config mei_csi_link_freq_ctrl = {
+	.ops = &mei_csi_ctrl_ops,
+	.type = V4L2_CTRL_TYPE_INTEGER64,
+	.id = V4L2_CID_LINK_FREQ,
+	.name = "Link Frequency",
+	.max = S64_MAX,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
+};
+
 static int mei_csi_init_controls(struct mei_csi *csi)
 {
-	u32 max;
 	int ret;
 
 	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
@@ -565,13 +568,8 @@ static int mei_csi_init_controls(struct mei_csi *csi)
 
 	csi->ctrl_handler.lock = &csi->lock;
 
-	max = ARRAY_SIZE(link_freq_menu_items) - 1;
-	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
-						&mei_csi_ctrl_ops,
-						V4L2_CID_LINK_FREQ,
-						max,
-						0,
-						link_freq_menu_items);
+	csi->freq_ctrl = v4l2_ctrl_new_custom(&csi->ctrl_handler,
+					      &mei_csi_link_freq_ctrl, NULL);
 	if (csi->freq_ctrl)
 		csi->freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY |
 					 V4L2_CTRL_FLAG_VOLATILE;
-- 
2.39.2


