Return-Path: <linux-media+bounces-10361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6608B5DD7
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E921F2243D
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CABA82897;
	Mon, 29 Apr 2024 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNYyI2VT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F78120C
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714405034; cv=none; b=JYEvAbG+f4OCB7h99XVMkidS/cR/VRFyRGl62gS2X85EKvwLEZAM1r4ktxzIsQKZ/wNevxzfzhOpCZgsUtkcI6QiUzfOhoOCKFpfUYSECbk9vOli/pNd03Y44UW4SWIae264XzG0dxIMaOrUdTmV5lEk67wtzx1FegjipAYtHCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714405034; c=relaxed/simple;
	bh=ZpKRy1M2fNG2ERRyUF8FAQ0dw+Nbc41Phkw+ptejPro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EoveMB+6YFYMNz2vbuYpbe2DZNjsHm/rGzXiuAyxiCtVTDD+tuqjUr8xcmBUiE8eZ9iD1xeEPVHmYhcjJfhPSoOAHJzVdZHcxltMUH7COfz9bLuVaO+O3QNWDmPIzbqwB63/b5y4MbqXpfdIVcckemOerIwFOm2CI6lZ0sdwTb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNYyI2VT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714405032; x=1745941032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZpKRy1M2fNG2ERRyUF8FAQ0dw+Nbc41Phkw+ptejPro=;
  b=jNYyI2VTGRfAcMA5nXQ2uYMPvflhrhaSJ7L1oHqLYpBnf4QxngIxeApQ
   rf10MeJozwZrkIBr9i/wfoca/ZR+8n81tYC1VbLB5TogCgTA1z6/WumRj
   ltDXYrMvqJV1kH6mqytCy/JXvjy/sCp1FQMnp9z3n9+iBM80sG6/wy06R
   /EbWn+a7BNdjaEFtqPQHaB3TYMxbTJ+JnhqZkLrIChUhkUiCugggaQCcS
   xqYf/r1CAgDTRq9uf1I2G6EirFvYyGdXOr0h47G0uzfL+GFdTA9dD+98G
   jG4Ie8aLpvlkTnLrADBe/5yLXFQIdAS7QoeXZFeqHaet7y2Bm7SSx0F/c
   w==;
X-CSE-ConnectionGUID: uYtCKX1zRhaYeI0OGcTLXg==
X-CSE-MsgGUID: JQAgebeWSCK24PURcrYvbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9951163"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9951163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:10 -0700
X-CSE-ConnectionGUID: EHM/OASRRP2fAKdw70/rvA==
X-CSE-MsgGUID: PrukqYkCRD6c7BcexeEk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30972892"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:08 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A0DBE11FA8A;
	Mon, 29 Apr 2024 18:37:05 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 1/4] media: v4l: Support passing sub-device argument to v4l2_get_link_freq()
Date: Mon, 29 Apr 2024 18:37:01 +0300
Message-Id: <20240429153704.1005192-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
References: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
to take struct v4l2_subdev argument in order to obtain the link frequency
using get_mbus_config() pad op. Prepare for this by allowing struct
v4l2_subdev as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 19 ++++++++++++++++---
 include/media/v4l2-common.h           | 14 +++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 4165c815faef..7f69b5a025fa 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -464,8 +464,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
 
-s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
-		       unsigned int div)
+s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
+			      unsigned int mul, unsigned int div)
 {
 	struct v4l2_ctrl *ctrl;
 	s64 freq;
@@ -500,7 +500,20 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
 	return freq > 0 ? freq : -EINVAL;
 }
-EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
+EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
+
+s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+			     unsigned int div)
+{
+	struct v4l2_subdev *sd;
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+	if (!sd)
+		return -ENODEV;
+
+	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
+}
+EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
 
 /*
  * Simplify a fraction using a simple continued fraction decomposition. The
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 63ad36f04f72..d7115cd61a38 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
- * @handler: The transmitter's control handler
+ * @pad: The transmitter's media pad (or control handler for compatibility
+ *	 reasons, don't use in new code)
  * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
  *	 D-PHY, samples per clock on parallel. 0 otherwise.
  * @div: The divisor between pixel rate and link frequency. Number of data lanes
@@ -541,8 +542,15 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  * * %-ENOENT: Link frequency or pixel rate control not found
  * * %-EINVAL: Invalid link frequency value
  */
-s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
-		       unsigned int div);
+#define v4l2_get_link_freq(pad, mul, div)				\
+	_Generic(pad,							\
+		 struct media_pad *: __v4l2_get_link_freq_pad,		\
+		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
+	(pad, mul, div)
+s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+			     unsigned int div);
+s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
+			      unsigned int mul, unsigned int div);
 
 void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
 		unsigned int n_terms, unsigned int threshold);
-- 
2.39.2


