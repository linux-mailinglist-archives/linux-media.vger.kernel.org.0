Return-Path: <linux-media+bounces-24902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5AA16238
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD321883E3C
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8591DF255;
	Sun, 19 Jan 2025 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd6jMuCG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B612D1DF244
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297564; cv=none; b=dkfNGskBm79HU99zSe8Sii3MNs8nV/vHHA2XlFDxyH9uBbQkw5V0wxtaD5YRtVSX9eLK7jqQ5qlGCzMVewcdzMXwHsqo+GPCOxLodqrzhfBloOsxnJ2Fsjs1SKNLVRjmy8Y7c++yoMGGlk/w0Ra70OB6hs7jefTYlGNh2cSKoGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297564; c=relaxed/simple;
	bh=cSzUNR4PUt5j2gD5m4v5XCZZuTHlKFUZti2+ZXYeseQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gbY1M1AmwBcEzWYdy6KKBK9YmxWZ5+4mOsg0CSOmmrrc7wueNHlHC5wqjqP/L3zvy8GnfzORrf4oYKsOb+0C3I+VjjCU5yYxCAV059xTBKE9Kfm6XoSsrdjCF2nbg+7FqDenGyaU73x4eUNdgorvSnY2Jrxo25G0gJYO7eDk/64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd6jMuCG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297562; x=1768833562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cSzUNR4PUt5j2gD5m4v5XCZZuTHlKFUZti2+ZXYeseQ=;
  b=bd6jMuCGL+FVZ8vrIefZB232MsRr/rXgpQTNDFxm1KigczkhzkGbTmOa
   aZ0YN0oagrYgJWsyIMCInlLDvGstXltFx7a8sH/1PxACuOoY86dc7gapB
   /pfO2QhrNWeeY1WxdTbQxc2EZ3nXr91CM6P0JWxiH3X3PJqPnV0qWy6OR
   50RVNlEHiV5isY/e/yohr2fMVWKkHrpZ0TE/5Jmn0DX5zqLKqIRb1wXNI
   fHU8lIlMCECIIedoXrI1+2sAdrMV7KridtZOCm1pbzYQu32m2rgdwqxFl
   Kn6FFFz9mvdxQr6P/H0l7E/Q7csupPvr92vIhgiiBdKU9Y81Ho+QzMhKT
   Q==;
X-CSE-ConnectionGUID: ndtCWeBERG6UUQWCm5u9Sg==
X-CSE-MsgGUID: 1F4o/jYMRy2I02hqun+0rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37579697"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37579697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:22 -0800
X-CSE-ConnectionGUID: +w074XatSASYGGSGzvtElg==
X-CSE-MsgGUID: vl1rr42qRCqpd6Ck51hDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="111232035"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:16 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7AC9311FA93;
	Sun, 19 Jan 2025 16:39:09 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: [PATCH v9 1/9] media: v4l: Support passing media pad argument to v4l2_get_link_freq()
Date: Sun, 19 Jan 2025 16:38:56 +0200
Message-Id: <20250119143904.114991-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
References: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
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


