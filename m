Return-Path: <linux-media+bounces-10587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C124F8B9869
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 12:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74EF01F25916
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE5C5CDFA;
	Thu,  2 May 2024 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEncbucx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85665914A
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714644178; cv=none; b=IjIiSKoFSM3nTeWERmsS+rk6PQUuO2UsLWE5H/k5ELHx7I+3NvHnBDkPMnl+uO0SUP3w8m+nSxI6RCDoyuGupinIQMguphQpJu8x+QSJE/MV/ONWDa+IfPFtOQwEI1rSAteoEx0/ZnmMYnb3WvlO0UPvSsyp9I6fdC4UNyrELMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714644178; c=relaxed/simple;
	bh=ORl/E7gVAjdwNVex2S+96/jwcyWIay3UgCSav/NBOyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WWigd/KgdBsoOULf0pCnSoYZ79HLqakYBeLGPw9e/fG0gtkx+RaePwDOlDZF6W1vmmsnl2NgtxHf/meFYQ1bsIzL6CRqQn/VDFi7LmPiGwWDDOt6t7CvBFXvIinjCuDnlgCS72K8VOJaBQAF704wW7udU+ZcWpwr4kDRhykPJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEncbucx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714644175; x=1746180175;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ORl/E7gVAjdwNVex2S+96/jwcyWIay3UgCSav/NBOyg=;
  b=bEncbucxTo2LBJVAVjZJF1wMSQtIQmqXWHeHhr+5VAXUWHgCVTp33cXu
   MU0SE+8e/Qx0YYLtyq+Za7fV1g9XgUbx37lfh0Z8k/oEgZ8XdHaAzpBrH
   ohcVMx6T93Ngx6moRD/Ls+WRx4JiQ+zrJacWwOQvTx3RZ9SIr784qpnkC
   teDD2oVJBRpOw0ShY2inW37OqEmw0YRZQCnwfKm79f9mS9KBGYw/P+fx0
   bG1yDig8COl0D2xUEi4znI8QoXifSJOFX5jTFBQLxgPHdCXpUBWaBSi3b
   8x2jfDOg5rHe3yQ2TtcKmSIrVMHzQmX5YFVFTDkOfD0L1I/ZEFI8/OoP0
   g==;
X-CSE-ConnectionGUID: j8enD5EGQHerj1S/Qrj2Fw==
X-CSE-MsgGUID: p127KNlgSKO6zhGwbgyv4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10560308"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10560308"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:02:55 -0700
X-CSE-ConnectionGUID: n7M227RCRM2sdKdrPcME7g==
X-CSE-MsgGUID: meQyCefdTaq5hrvJ10NiMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27129010"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:02:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4F19611F832;
	Thu,  2 May 2024 13:02:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s2TH8-006eQo-0j;
	Thu, 02 May 2024 13:02:50 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 1/1] media: ov2740: Add event support for controls
Date: Thu,  2 May 2024 13:02:40 +0300
Message-Id: <20240502100240.1585378-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver supports controls. Therefore, add support for control events.
This makes the driver pass v4l2-compliance, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 57906df7be4e..3e3f958db256 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
 #define OV2740_LINK_FREQ_360MHZ		360000000ULL
@@ -1100,7 +1101,13 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.enum_frame_size = ov2740_enum_frame_size,
 };
 
+static const struct v4l2_subdev_core_ops ov2740_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
+	.core = &ov2740_core_ops,
 	.video = &ov2740_video_ops,
 	.pad = &ov2740_pad_ops,
 };
@@ -1364,7 +1371,8 @@ static int ov2740_probe(struct i2c_client *client)
 	}
 
 	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
-	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
 	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ov2740->pad.flags = MEDIA_PAD_FL_SOURCE;
-- 
2.39.2


