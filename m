Return-Path: <linux-media+bounces-30860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A3A99748
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E21E3AA8A8
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FA428DEF0;
	Wed, 23 Apr 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6Sme3Bx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC4328D846
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430969; cv=none; b=IbM3wnfXrODnm8XdY0I9iXCrjdfJOEAtouayPNf88OIY8slIxobMHKYI15VVr9C2Xz+Ma6maDpBbOOZ2/FmL7bIn1u7oWvgupAuFcwzGTG9duZm5k9rqTgJ3SPLVAyzzOSAo1crD3ziKPiu/tN1tgzBye6zrzb40Ag4H3ln8HYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430969; c=relaxed/simple;
	bh=c4LTopKGJ6lcfZbgVUsouw9stc53Y6T2PW5R0N3SpGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4HKIVqGRdIYSt+nbttv2clNL49Toh56wNHP7xlKAfzxRfwlmNZcOQT5yyNUmFbj++6Lqw+2tJLzdgvVCm6GUnpb2U2MuDnrpoGDRZa18NnthJhfKHMevX3ScE2Gj4gcPet4shgjWKW3mCm8dZIM96mcxXv/Ks8aE81zKduFf1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6Sme3Bx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745430968; x=1776966968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c4LTopKGJ6lcfZbgVUsouw9stc53Y6T2PW5R0N3SpGI=;
  b=L6Sme3BxWCCaT0sGKY6b6YAaozKuS1mMOPD5dzTf8ljpxcwFV7oGx11v
   /yLiXZrWATXfQiNyTe8Lr7HrvoiQKWmP3jeyoyiWmUS+IuF2ze323nDDX
   JEmLnjvUYeRM4kx62HS58CK1niMYdTIw/XvNaS0MkBHzyX6mWp7mWEJN/
   38Xt37Ywk0AnJHZ/6CiE9piCyI1jhefqD4UJi4r4HAsXylO+mq2TGJOev
   +LTsSqN3Vk684e8nuSJA60H1MX4bG/de1NtA3dJk+RgV4errnQ3zltHfc
   ++GUMQ+kdlPUE7FoaZIH1vqcvTGpMBq+rYiBPl9BYAhMmLlxEkvNQQfdZ
   A==;
X-CSE-ConnectionGUID: eM5U2m3ITwOXd42XENky2w==
X-CSE-MsgGUID: v4MVqr9lSE6uS32NAS88vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="69529330"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="69529330"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:56:07 -0700
X-CSE-ConnectionGUID: 534j+vAWRQSdAdNmMVfOhA==
X-CSE-MsgGUID: l+Qv5EsgRje6pUsKdTu26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137467730"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.225.65.15])
  by fmviesa004.fm.intel.com with ESMTP; 23 Apr 2025 10:56:04 -0700
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com,
	jimmy.su@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	qingwu.zhang@intel.com,
	arun.t@intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v8 6/6] media: ov08x40: Select mode based on mipi lane count
Date: Thu, 24 Apr 2025 01:56:36 +0800
Message-Id: <20250423175636.1338374-6-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423175636.1338374-1-jason.z.chen@intel.com>
References: <20250423175636.1338374-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

Use the v4l2_find_nearest_size_conditional() helper to figure out which
drive-supported lane can be used on a given system.
Also avoid exposing duplicate frame sizes to userspace when multiple
modes share the same resolution but differ in lane count.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 55 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 37ce6595a7d8..d44a8f1a09c5 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -1325,6 +1326,9 @@ struct ov08x40 {
 	/* Mutex for serialized access */
 	struct mutex mutex;
 
+	/* data lanes */
+	u8 mipi_lanes;
+
 	/* True if the device has been identified */
 	bool identified;
 
@@ -1749,6 +1753,15 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
+static bool filter_by_mipi_lanes(const void *array, size_t index,
+				 const void *context)
+{
+	const struct ov08x40_mode *mode = array;
+	const struct ov08x40 *ov08x = context;
+
+	return mode->lanes == ov08x->mipi_lanes;
+}
+
 static const struct v4l2_ctrl_ops ov08x40_ctrl_ops = {
 	.s_ctrl = ov08x40_set_ctrl,
 };
@@ -1770,18 +1783,28 @@ static int ov08x40_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
-		return -EINVAL;
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+	size_t i, count = 0;
 
 	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = fse->min_height;
+	for (i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_by_mipi_lanes(&supported_modes[i], i, ov08x))
+			continue;
 
-	return 0;
+		if (count == fse->index) {
+			fse->min_width = supported_modes[i].width;
+			fse->max_width = fse->min_width;
+			fse->min_height = supported_modes[i].height;
+			fse->max_height = fse->min_height;
+			return 0;
+		}
+
+		count++;
+	}
+
+	return -EINVAL;
 }
 
 static void ov08x40_update_pad_format(const struct ov08x40_mode *mode,
@@ -1844,10 +1867,13 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->format.code != MEDIA_BUS_FMT_SGRBG10_1X10)
 		fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
-				      width, height,
-				      fmt->format.width, fmt->format.height);
+	mode = v4l2_find_nearest_size_conditional(supported_modes,
+						  ARRAY_SIZE(supported_modes),
+						  width, height,
+						  fmt->format.width,
+						  fmt->format.height,
+						  filter_by_mipi_lanes,
+						  ov08x);
 	ov08x40_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
@@ -2226,7 +2252,12 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
+	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
+	case 2:
+	case 4:
+		ov08x->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+		break;
+	default:
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
-- 
2.34.1


