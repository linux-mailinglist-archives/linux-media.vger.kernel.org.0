Return-Path: <linux-media+bounces-10230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF88B3A6F
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 16:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D94CE1C221AE
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 14:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6943B148858;
	Fri, 26 Apr 2024 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4BIdgS5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40514882F
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714143356; cv=none; b=TEiRWjF86nP56aMLNaPqTMWx/pqCIPnArY+obOhv3zwkKVCnMZbMZhhElNGSQPJQDU0vUBNHn4K1b+ECV/V8ReLP1PQIjmpY1s20MIWdw0z9DdLUDn6r1S8wuXewwXaQuJp6cAnQ6U4p8zjC7AinY5Ks5w5Bnt0Htij4ZkO2AeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714143356; c=relaxed/simple;
	bh=YWYuh/AzryDgZMdNjbpVnsayhUqySvnOTMpZ/xyBSfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NjqTJ3j22IUSPmCqLBNuiP8N4A4PFwW7lvfEVVeXl2Yc5vI6fQSNwTZ7Y7w+UZ22Wl/3ybBChiOsaCH9U9o83vxkI3JAUDr7R6Ds7eij4gBkkzOLXlWbMKLODQiQDjivvpvQPcoqkFOef2c/69lpdTqqeMhijzNVGmtqrdT5rYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4BIdgS5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714143355; x=1745679355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YWYuh/AzryDgZMdNjbpVnsayhUqySvnOTMpZ/xyBSfs=;
  b=X4BIdgS5qGrb5SIPxjVzc5YmQLMxYMxtQa1ffx2KHDwimuXtZpEmmZyK
   /umd3NToy0htG/gxgNv6E0SZEHOR5ZxbBO7Q1DnReO/5GcDMSGsc5BZKN
   VPMlpmE3x1xSZF6DmpYt7X4OFF9hGf6zN9R8JgfEHmXa6h9FRFR3WOKV/
   qUqoC4ZQqnUiWA/uHTyhn+NkIE3bV2GF3epWKo0P1Tszd2Rc5+SG0CQIa
   YG8BbEBJWLBHLAZqtAPsa1zKe7p/OyH9kClaXv8Xzf7bWlNF2n6/Z0+wK
   wKAj5d9y2LZDrSEQAo/VqGBhY6DBqm7RI+Yd3h0Dl5mg4OZ1WbJBgmbm/
   g==;
X-CSE-ConnectionGUID: 5h2npbN7T2i65nzuPb3VBQ==
X-CSE-MsgGUID: TR84cNi7QeengQNXTMWMvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10095282"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="10095282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:52 -0700
X-CSE-ConnectionGUID: 9DCslBtmQkumCJp/OVof1A==
X-CSE-MsgGUID: lA9GIIcERiSU5k6PdB1fDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25514720"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B6B451203ED;
	Fri, 26 Apr 2024 17:55:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s0MzM-002kCH-2M;
	Fri, 26 Apr 2024 17:55:48 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 3/3] media: ivsc: csi: Fix link frequency control behaviour
Date: Fri, 26 Apr 2024 17:55:38 +0300
Message-Id: <20240426145538.654212-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The link frequency control was an integer menu control the value of which
was hard-coded in the MEI CSI driver itself. Instead obtain the control
value from the upstream sub-device and use the CUR_LINK_FREQ INTEGER64
control type for the purpose.

Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 55e0c60c420c..4a35932f1cd3 100644
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
@@ -32,8 +33,6 @@
 
 #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
 
-#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
-
 /* the 5s used here is based on experiment */
 #define CSI_CMD_TIMEOUT (5 * HZ)
 /* to setup CSI-2 link an extra delay needed and determined experimentally */
@@ -145,10 +144,6 @@ static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
 	.field = V4L2_FIELD_NONE,
 };
 
-static s64 link_freq_menu_items[] = {
-	MEI_CSI_LINK_FREQ_400MHZ
-};
-
 static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier *n)
 {
 	return container_of(n, struct mei_csi, notifier);
@@ -470,7 +465,7 @@ static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	struct mei_csi *csi = ctrl_to_csi(ctrl);
 	s64 freq;
 
-	if (ctrl->id == V4L2_CID_LINK_FREQ) {
+	if (ctrl->id == V4L2_CID_CUR_LINK_FREQ) {
 		if (!csi->remote)
 			return -EINVAL;
 
@@ -481,8 +476,7 @@ static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 			return -EINVAL;
 		}
 
-		link_freq_menu_items[0] = freq;
-		ctrl->val = 0;
+		ctrl->p_new.p_s64[0] = csi->link_freq = freq;
 
 		return 0;
 	}
@@ -553,7 +547,6 @@ static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
 
 static int mei_csi_init_controls(struct mei_csi *csi)
 {
-	u32 max;
 	int ret;
 
 	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
@@ -562,13 +555,10 @@ static int mei_csi_init_controls(struct mei_csi *csi)
 
 	csi->ctrl_handler.lock = &csi->lock;
 
-	max = ARRAY_SIZE(link_freq_menu_items) - 1;
-	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
-						&mei_csi_ctrl_ops,
-						V4L2_CID_LINK_FREQ,
-						max,
-						0,
-						link_freq_menu_items);
+	csi->freq_ctrl = v4l2_ctrl_new_std(&csi->ctrl_handler,
+					   &mei_csi_ctrl_ops,
+					   V4L2_CID_CUR_LINK_FREQ, 1, S64_MAX,
+					   1, 1);
 	if (csi->freq_ctrl)
 		csi->freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY |
 					 V4L2_CTRL_FLAG_VOLATILE;
-- 
2.39.2


