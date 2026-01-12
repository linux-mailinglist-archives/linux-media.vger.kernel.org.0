Return-Path: <linux-media+bounces-50419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0884D11AB1
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 066FB304CAF7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B82283C9E;
	Mon, 12 Jan 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra9exUOl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C44264609
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212013; cv=none; b=PNO6p2Nkl1koNg5uQdXYJnFsA4PtvrHQdNkJ+UbfKRzpK2Lfqg4jwZrCmqOK6Zv55ruKAxFoFNoi0BIn9EH9vjiSlS1lFGDsuTBqWivTDA7FeiWDPfX+hGRL5kimJnlp0TCqSTsIWsdv4oIY8tTCHiC9xXAl63JwofHgyazRpis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212013; c=relaxed/simple;
	bh=byiZAniAXtKNz2CVF3LH390cqTXU6mTUFfOBWwir78U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5nsDqss7hh7gWaik21AXcu9wvkZWkFLcyFRmkS96GE6r9Tx8mnYlClwJMyKso0uQDhh/5GER5Nrh69cHNodSqCoTNgnI1lNnAqtRaDuS7gHLc9qxd4sNULt9lqGw21T+gurjc4a46PeyKw3t19EYFbx0dErCrO7pgLCd0YZ9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra9exUOl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212013; x=1799748013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=byiZAniAXtKNz2CVF3LH390cqTXU6mTUFfOBWwir78U=;
  b=Ra9exUOlRbmaX/VBShbpaileHw0lSDkDh9UlVcWWNPGz/i1Ltm+gJBl2
   rcUG9uDNJTydfErJtZF1jqbyM8KlSlPOfAQkCWc3x4Fl9kWamliD2j46O
   HNGhIRFSY/7TvperwlbL5OkVbp3p7UbeA7wFPDrgt3wg6VMuslX4HuGtP
   V57QNz+mL2BSugeT417xHzTIKE66VDCEpifaam9KL4nVrE38wGQuDpdD4
   IXbw4EJ+T3Ebtb0c6G+ETce1BpdDTJbaeXAe7COpnINpq+OG8gwp+dGGG
   aWiGmb6rhBpC8fWYJBcGFCMiu1UcffC9LeotTHVZkLRwD9byKASiAP4fv
   g==;
X-CSE-ConnectionGUID: 24UjV9GjR9+3zehw+d4EyA==
X-CSE-MsgGUID: +jZEhVzeQkq4BR36/DgRzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218809"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: dFPFE23MRUCKGTct+bFAMA==
X-CSE-MsgGUID: XC+KqDUiQ8K37h88Vv8kFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743165"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 49D1A121FB4;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012B-0gl3;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 15/23] media: i2c: ov01a10: Use native and default for pixel-array size names
Date: Mon, 12 Jan 2026 11:59:41 +0200
Message-ID: <20260112095949.3851-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

According to the OV01A10 product-brief PDF the OV01A10 has an active pixel
array size of 1296x816. In otherwords the native and active sizes are
the same.

Replace the (misspelled) ACTIVE defines for the default resolution of
1280x800 with DEFAULT to avoid giving the impression that the active pixel
array size is only 1280x800.

And replace PIXEL_ARRAY with NATIVE to make clear this is the native pixel
array size / to match the V4L2_SEL_TGT_NATIVE_SIZE naming.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 6dcd982cf8eb..3eb6445b8f00 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -34,10 +34,10 @@
 #define OV01A10_MODE_STREAMING		0x01
 
 /* pixel array */
-#define OV01A10_PIXEL_ARRAY_WIDTH	1296
-#define OV01A10_PIXEL_ARRAY_HEIGHT	816
-#define OV01A10_ACITVE_WIDTH		1280
-#define OV01A10_ACITVE_HEIGHT		800
+#define OV01A10_NATIVE_WIDTH		1296
+#define OV01A10_NATIVE_HEIGHT		816
+#define OV01A10_DEFAULT_WIDTH		1280
+#define OV01A10_DEFAULT_HEIGHT		800
 
 /* vertical and horizontal timings */
 #define OV01A10_REG_VTS			CCI_REG16(0x380e)
@@ -270,8 +270,8 @@ static const struct ov01a10_link_freq_config link_freq_configs[] = {
 
 static const struct ov01a10_mode supported_modes[] = {
 	{
-		.width = OV01A10_ACITVE_WIDTH,
-		.height = OV01A10_ACITVE_HEIGHT,
+		.width = OV01A10_DEFAULT_WIDTH,
+		.height = OV01A10_DEFAULT_HEIGHT,
 		.hts = OV01A10_HTS_DEF,
 		.vts_def = OV01A10_VTS_DEF,
 		.vts_min = OV01A10_VTS_MIN,
@@ -642,8 +642,8 @@ static int ov01a10_init_state(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.format = {
-			.width = OV01A10_ACITVE_WIDTH,
-			.height = OV01A10_ACITVE_HEIGHT,
+			.width = OV01A10_DEFAULT_WIDTH,
+			.height = OV01A10_DEFAULT_HEIGHT,
 		},
 	};
 
@@ -692,17 +692,17 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.top = 0;
 		sel->r.left = 0;
-		sel->r.width = OV01A10_PIXEL_ARRAY_WIDTH;
-		sel->r.height = OV01A10_PIXEL_ARRAY_HEIGHT;
+		sel->r.width = OV01A10_NATIVE_WIDTH;
+		sel->r.height = OV01A10_NATIVE_HEIGHT;
 		return 0;
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		sel->r.top = (OV01A10_PIXEL_ARRAY_HEIGHT -
-			      OV01A10_ACITVE_HEIGHT) / 2;
-		sel->r.left = (OV01A10_PIXEL_ARRAY_WIDTH -
-			       OV01A10_ACITVE_WIDTH) / 2;
-		sel->r.width = OV01A10_ACITVE_WIDTH;
-		sel->r.height = OV01A10_ACITVE_HEIGHT;
+		sel->r.top = (OV01A10_NATIVE_HEIGHT -
+			      OV01A10_DEFAULT_HEIGHT) / 2;
+		sel->r.left = (OV01A10_NATIVE_WIDTH -
+			       OV01A10_DEFAULT_WIDTH) / 2;
+		sel->r.width = OV01A10_DEFAULT_WIDTH;
+		sel->r.height = OV01A10_DEFAULT_HEIGHT;
 		return 0;
 	}
 
-- 
2.47.3


