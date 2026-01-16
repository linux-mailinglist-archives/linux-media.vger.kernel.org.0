Return-Path: <linux-media+bounces-50884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AB9D31279
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147DB3081E58
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D754019C566;
	Fri, 16 Jan 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xdq9zMj/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAA1E0E14
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566921; cv=none; b=TkSu/rWxAkf9QVYHAFqxmsgUt0U3FhFZ99S50kfzsZ74mNn3X5Gn2RnEO30YemndzFVDr7/CjNwQgF27qyJ9gyJjSRo9tk6fm0uQgELhnvoy55uoXnap0HTRcRtMIjezat9HWK4aAjqcSjX+caxJGSiu5VGV+AVBe5dIFtz8a5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566921; c=relaxed/simple;
	bh=DAuSIhSdGUvUVT+Ikr2ugkUaUOfFf70HN2WD1frJpt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVQY0kQXObcUwohPYRvGlni4S4WJSAZVRUaL8MKOmGthGy1BeqVOaa+SSQ9H9ePPm45fjq2esNLtCIE3TZGTqiLqE7yIVQkIYh333YyyBILZMytJ5nYm552GOaUUoEGU5G5sL9YNj6ZM+K3nPun7GnwgLYJC+yFRTIugPPoHDik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xdq9zMj/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566920; x=1800102920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DAuSIhSdGUvUVT+Ikr2ugkUaUOfFf70HN2WD1frJpt4=;
  b=Xdq9zMj/Stg5WiZJEHFG1pAlaMRNppGSNq0GMAApY25Myy1BbUAOdrE4
   Ua0jCGyDu0jfPiNEKQeWXhogYGD+xenS+rHsxhNotBD76iSsniBsYzJeM
   I/BVvm4KpxB7TXDfOHa4fxF8YL68No/gDhdvEBCZOrwjqubKFRWm6sn4d
   YAQLzahZhkCMyhmII7uhlrzQUC9a/FHDM9Dt4+8CfBZRrBkeebSYt/bVh
   1FRDUJ5V1Q48wo3fv0cv/JPljbFaaLJEsKIRCfzCJI8iXBDUG22WGFN0v
   t5YuPyc7Wz0jMgtaxya8mxYZa4in2CPH28P17KNcoVtHOW4Ay6htKTPu3
   Q==;
X-CSE-ConnectionGUID: HbWZfqCBQ5S6WHQhasKn+Q==
X-CSE-MsgGUID: 5eaW1eOuRVWNWS7KztIjPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327483"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:19 -0800
X-CSE-ConnectionGUID: BGiULGMnS+KMEKbGyRxQ+A==
X-CSE-MsgGUID: WUOCt7NAQxmG0InJmXzZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511911"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:18 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 20401120D8F;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vUb-4Aqg;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 7/8] media: ccs: Make supported mbus code bitmask a u64
Date: Fri, 16 Jan 2026 14:35:13 +0200
Message-ID: <20260116123514.220949-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
References: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
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
index 062c70b0a47d..9c7f340ca9a1 100644
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
@@ -2090,7 +2091,7 @@ static const struct ccs_csi_data_format
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i) &&
+		if (sensor->mbus_frame_fmts & BIT_U64(i) &&
 		    ccs_csi_data_formats[i].code == code)
 			return &ccs_csi_data_formats[i];
 	}
@@ -2120,7 +2121,7 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
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


