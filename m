Return-Path: <linux-media+bounces-22980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13759EAA24
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8291D283543
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB6322D4CB;
	Tue, 10 Dec 2024 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAZNSccX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ADD1D5CCF
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817555; cv=none; b=Ko4L4OEGdXCyN2I8KdAW4AEKhwKaq1XiwEjWTh3+67asQawH7zv066KE6eom8xEnlvuxzD644q3z+UylGfZEqvlDaM0lLt5N5AETrYZ63aKYVHCgCVuz5BppLAUcStSocOlJUWlEyHQuYGXp/jJFY8Y4l3gVgxQOirt1Yka08yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817555; c=relaxed/simple;
	bh=cSzUNR4PUt5j2gD5m4v5XCZZuTHlKFUZti2+ZXYeseQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OCU0KkWZFw18MKevRjQ1VXmJh6GOuCVN8whQAX7Xw/XewuGilE8recC7m+Ufa2fXM9NyHsU24VzYMiqjWy24ar/53DlQADYuh850TAPluS8PXnLHP4AQGfxM3KPUJx1822p/n5rgkHFQtdrtSHFNYPlbx/BzsRJCg53O4mZlsKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAZNSccX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733817554; x=1765353554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cSzUNR4PUt5j2gD5m4v5XCZZuTHlKFUZti2+ZXYeseQ=;
  b=cAZNSccXyYZOKa2c0DDSvWgQJJQ90PXFnALwPtLNfxgECjUXX8rJH1h2
   7FL/M5pxKC0ooWhgDKNlUIP01lGlj71iyz3QnduTY0fydsTjnnyU1y+sN
   ZynEVxmbOqEy3DdNbpDiomkCp0XuWPvaErSj5HNhuk+xBd9/SdCmG1aYz
   lYSvGjKJ/qf5wS4HeGYsgUi6J+CNYaMD226Os0QqCYMhelgCcGWX6zp/w
   2yc8iEaUkibUgd1JRJJJ7KWtib1Rb1REowK9C2CXlKArWKsqw56ZxG6rY
   rAxzdrE5vfIbDbeMRwg/+kKNrwiI5/I5+jLGZbo+Dyfn0xk01tBauWKP4
   w==;
X-CSE-ConnectionGUID: rbsPDAikRy+72wfjZDXVlA==
X-CSE-MsgGUID: 0UZvuVqORJmqmSZdS9ibIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45544616"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45544616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:13 -0800
X-CSE-ConnectionGUID: 5N84vIP0TxWDbs1Eg95kTA==
X-CSE-MsgGUID: A+eTtaRPTUuszldH6eAegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99808196"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:11 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4387911F81D;
	Tue, 10 Dec 2024 09:59:08 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 1/5] media: v4l: Support passing media pad argument to v4l2_get_link_freq()
Date: Tue, 10 Dec 2024 09:59:02 +0200
Message-Id: <20241210075906.609490-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_get_link_freq() accepts a V4L2 control handler for now, but it needs
to take struct media_pad argument in order to obtain the link frequency
using get_mbus_config() pad op. Prepare for this by allowing struct
media_pad as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 21 ++++++++++++++++++---
 include/media/v4l2-common.h           | 19 ++++++++++++++++---
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..9fe74c7e064f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -466,8 +466,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
 
-s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
-		       unsigned int div)
+s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
+			      unsigned int mul, unsigned int div)
 {
 	struct v4l2_ctrl *ctrl;
 	s64 freq;
@@ -502,7 +502,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
 	return freq > 0 ? freq : -EINVAL;
 }
-EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
+EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
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
+#endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
  * Simplify a fraction using a simple continued fraction decomposition. The
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 63ad36f04f72..fda903bb3674 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -525,7 +525,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
- * @handler: The transmitter's control handler
+ * @pad: The transmitter's media pad (or control handler for non-MC users or
+ *	 compatibility reasons, don't use in new code)
  * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
  *	 D-PHY, samples per clock on parallel. 0 otherwise.
  * @div: The divisor between pixel rate and link frequency. Number of data lanes
@@ -541,8 +542,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  * * %-ENOENT: Link frequency or pixel rate control not found
  * * %-EINVAL: Invalid link frequency value
  */
-s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
-		       unsigned int div);
+#ifdef CONFIG_MEDIA_CONTROLLER
+#define v4l2_get_link_freq(pad, mul, div)				\
+	_Generic(pad,							\
+		 struct media_pad *: __v4l2_get_link_freq_pad,		\
+		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
+	(pad, mul, div)
+s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+			     unsigned int div);
+#else
+#define v4l2_get_link_freq(handler, mul, div)		\
+	__v4l2_get_link_freq_ctrl(handler, mul, div)
+#endif
+s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
+			      unsigned int mul, unsigned int div);
 
 void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
 		unsigned int n_terms, unsigned int threshold);
-- 
2.39.5


