Return-Path: <linux-media+bounces-11553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7AA8C7651
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A856B286762
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C415B14D71A;
	Thu, 16 May 2024 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ge9w4EVo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9D145B24
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862349; cv=none; b=M+3c0n9nqBY4fXLuk946MVU+46mQx60ylHkMjv7Fn2I8CRRk00f1zGdw2oC17kmKGilFCghv17hQzF8GzDeeVu81uyvrL7KTvrldkm59VE+onevizbpgcX538cRuzQR3HqZ9nGacGlLStwHC6pR2fkMtaBNwG8DLU4uVP2Rdm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862349; c=relaxed/simple;
	bh=iH5xIYXg7ybOZjjXO5+5CTuo4fdxN1VCH6jrERxiZGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n2k/6WIRdU+ZXLvx+c/7PluSBmRzrBxzshHE8T2unfXtOTv8u7R6uG6gDOgLVaj6BgK2j1AugK9MXRQi4C2wycLEI6mqL1E4+hpza2j0jYymL+iunCz3avoku7JUWIvFY3BHPH6xX9zxlWTdtlabQ6+AzmZ3lzGgOuDEuQkne+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ge9w4EVo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715862347; x=1747398347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iH5xIYXg7ybOZjjXO5+5CTuo4fdxN1VCH6jrERxiZGE=;
  b=ge9w4EVoQOqyDOmxZ3prLunc4DjKQa0aS544h+Ynqn1n2WQXxXkHGkrO
   KOEuFdiTpyx8AN1apr7HVkU7pIpesKh8PKP2ad3v6I8z1+EVySEc6cP4X
   3G2Pn97P2LhZ+sjTK1/t3PKR5RHzWI4wWApplfebUBKlnWZaWiGzh+RvM
   LGISeY9uOFzkDjALEhmJJJK4ruwtsjyDWhdBj1fu3c4WzudHsJWUR2RGH
   XeMI7eC+KsYl4jPgFFFBpLlvwEtvWy8Uw8+05/tGWvruimXFFWvrRa9T+
   HP6b9LsL5vIPmgENDRmqEyP9uALneBX6e2IUOtJJg5Le72HF7l9wsm7fA
   w==;
X-CSE-ConnectionGUID: 3iyiVm+JRP2yXnYXy4Vv+A==
X-CSE-MsgGUID: hhoitsQrQXWzw9fTMvrV7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37345814"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="37345814"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:45 -0700
X-CSE-ConnectionGUID: jJwemFjhRg+muNamVqDWuQ==
X-CSE-MsgGUID: ZF2onttOT1uoTT4HkN/qnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36290251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6166120D1C;
	Thu, 16 May 2024 15:25:40 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v6 1/4] media: v4l: Support passing media pad argument to v4l2_get_link_freq()
Date: Thu, 16 May 2024 15:25:36 +0300
Message-Id: <20240516122539.30787-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
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
index 4165c815faef..01650aed7c30 100644
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
@@ -500,7 +500,22 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 
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
index 63ad36f04f72..f29dc8bb8f09 100644
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
+#else /* !CONFIG_MEDIA_CONTROLLER */
+#define v4l2_get_link_freq(handler, mul, div)		\
+	__v4l2_get_link_freq_ctrl(handler, mul, div)
+#endif /* !CONFIG_MEDIA_CONTROLLER */
+s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
+			      unsigned int mul, unsigned int div);
 
 void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
 		unsigned int n_terms, unsigned int threshold);
-- 
2.39.2


