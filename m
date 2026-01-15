Return-Path: <linux-media+bounces-50789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2ED24996
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F72C30675F2
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BE39A808;
	Thu, 15 Jan 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuTKSz0u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048B39A81A
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481187; cv=none; b=bOagDrj6gEGky9vZq4HdwpcF8DQzEIcIV51bneu2j/enLEOzdVu1dsIt7QtrKaqpOpcQJy816z6bklriSYZ/IJOcmoPNjBV8ZTU343WV0Nl+ti59cKc5H67fknPCBeZIl8GAoFkCmifUojlNr6x46PcU6JBCZ0FMGREOf2qbQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481187; c=relaxed/simple;
	bh=JF8tdraQR624v/dX0OacfmeNh0Dn7Mwz9HH5Mq2HZBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scekWB/IhkfQIIs3eNMXBS+by/EBXnWdCy7ADmsxV3wG7BVzgsBcEY8sByWwP6v+PtpL75kI0URrRDg4eIwViavIC+n5WpHzupOMwUVDAUy1BqQ/rVRJVTyHHT1fr2UEcyhPVH4SgjC9V5mAg4Xo1T49xZV247rmIoYP5cm30kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuTKSz0u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481185; x=1800017185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JF8tdraQR624v/dX0OacfmeNh0Dn7Mwz9HH5Mq2HZBs=;
  b=UuTKSz0uwVYiUb+7PGDbiVVIXICFJaKx0ZqZIRTOliZA5ng2k3IkvNZo
   atU7Oj0B3+wUWDE4rfsIe3yMFerGH26ECu8EFp7xTRQmeFfgIY2S9BwDY
   kJFkmbUyJQQkr5RR5L8wLQ63CXCQBekWtsJ/xj5Y++xE0KqJByOcDg+9T
   KdpTbIt6wO1jITdlMkmk68c11Ubcg93pWUtcwUnyyIw5ko1bxQwNCtSot
   AkTprMecZJoh2Q5WL1VRRIg3TqamNi1Oa8ksL1ZnYriavWYZTy6drmepX
   hjZKbY4nREEf4i0NP9yr9mVa34tCAE4Yq9usD5tQTnSIJP7eVqpJFXlV/
   Q==;
X-CSE-ConnectionGUID: E3rcqXtyR2W/fk+mHQHSWQ==
X-CSE-MsgGUID: RPiO8wnSSZiYtxRSMeb89g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80428318"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80428318"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:20 -0800
X-CSE-ConnectionGUID: i3iX8LqyQz2Nr9fJoMPqCQ==
X-CSE-MsgGUID: jbMTRGGaSkyymXiQGqd8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204980460"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:18 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 029AE121DBA;
	Thu, 15 Jan 2026 14:46:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgMjs-00000000UMS-3fRy;
	Thu, 15 Jan 2026 14:46:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH 6/7] media: ccs: Make supported mbus code bitmask a u64
Date: Thu, 15 Jan 2026 14:46:11 +0200
Message-ID: <20260115124612.116663-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
References: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for adding more media bus codes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 9 +++++----
 drivers/media/i2c/ccs/ccs.h      | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a3f04b87cf7c..6a7622af257d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -13,6 +13,7 @@
  * Based on smia-sensor.c by Tuukka Toivonen <tuukkat76@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1209,7 +1210,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 
 			dev_dbg(&client->dev, "jolly good! %u\n", j);
 
-			sensor->default_mbus_frame_fmts |= 1 << j;
+			sensor->default_mbus_frame_fmts |= BIT_U64(j);
 		}
 	}
 
@@ -1242,7 +1243,7 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 				f->compressed - sensor->compressed_min_bpp];
 		unsigned int j;
 
-		if (!(sensor->default_mbus_frame_fmts & 1 << i))
+		if (!(sensor->default_mbus_frame_fmts & BIT_U64(i)))
 			continue;
 
 		pll->bits_per_pixel = f->compressed;
@@ -2091,7 +2092,7 @@ static const struct ccs_csi_data_format
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i) &&
+		if (sensor->mbus_frame_fmts & BIT_U64(i) &&
 		    ccs_csi_data_formats[i].code == code)
 			return &ccs_csi_data_formats[i];
 	}
@@ -2121,7 +2122,7 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i))
+		if (sensor->mbus_frame_fmts & BIT_U64(i))
 			idx++;
 
 		if (idx == code->index) {
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 51915321ef44..58952c5bf06b 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -222,10 +222,10 @@ struct ccs_sensor {
 	void *ccs_limits;
 	u8 nbinning_subtypes;
 	struct ccs_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
-	u32 mbus_frame_fmts;
+	u64 mbus_frame_fmts;
 	const struct ccs_csi_data_format *csi_format;
 	const struct ccs_csi_data_format *internal_csi_format;
-	u32 default_mbus_frame_fmts;
+	u64 default_mbus_frame_fmts;
 	int default_pixel_order;
 	struct ccs_data_container sdata, mdata;
 
-- 
2.47.3


