Return-Path: <linux-media+bounces-40580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B63B2F924
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC1E87AD08E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2742155C88;
	Thu, 21 Aug 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHZ2SoWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7731DDBC
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781210; cv=none; b=tBkOfWo/iJNHayomwO+EIjCCoO2p/Hhgkgblrq/IyFbUf48rCtXQ7KfFAmmJqzHWz2euHGYfGm5AHxsb39cnt1QfnixQRJGtXx+uiC0BunjV/P9IQfCVebi0tSP7sH198jW5elbD2G5RfGXFK7EgVgVmERm0NYgCgbqegJxBinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781210; c=relaxed/simple;
	bh=7soslKFfZnHJhclcXXRFop6bc+96W1s4fYvTwsjTLFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HjaDaOA3JguVD0944OHpisdWZtAR8+idwHAAOE76vgAdfRlfJgdER8fSb+qkfTRbWsJyK0vBzCyfPT9JFMKGSE3W4MLvTWP7dXx6eRGZ4mG/LnxZJwKaNenilGHn1inTFTiZl9Tk6z8FkTD6d7go1E2hOAonoLxOQEpCjhv4hcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHZ2SoWg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781209; x=1787317209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7soslKFfZnHJhclcXXRFop6bc+96W1s4fYvTwsjTLFs=;
  b=gHZ2SoWgook1jSLmtMZo4DSGiUQ2SEezzMnEYI3H9ezmvM4V8AqLwQax
   EUkZ+qfYkzy7gdnOG9sXETe2VQkJFGTfFzHvKbnPn+GGtCTEuES+oft5p
   ykrDT2CeCiOLYfeVs6appoZkygNGZh2On83G3R62mu618rpqxUGi9bE6U
   luSLGGq52C6/EgdQIdAoF/seSwUdUuBKFlmbDBZ70d9aMEOWgbFmRrLK5
   GQz4OU3CJS8GO05Yu+IZFP30SGcy6I+A7MchaU5iLcbqX4Rh0iMtNJ+PC
   AG5DcwIzC4qPzelg68uKSFjPKQl8oWqApnKh0oHl8xYyG7CLBaxmS7E0E
   w==;
X-CSE-ConnectionGUID: wFbt3XTwRaGvxOF//SzxeA==
X-CSE-MsgGUID: yUNEexgmQF2A/k2RQcdNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58018274"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58018274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:05 -0700
X-CSE-ConnectionGUID: YpCLXdWnQYCUNrDVJeDOwg==
X-CSE-MsgGUID: FGPbSSvzTk+9V8P60ZDadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199278779"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DB4A6120274;
	Thu, 21 Aug 2025 15:59:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up4tb-00000002K2k-3acb;
	Thu, 21 Aug 2025 15:59:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 2/3] media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
Date: Thu, 21 Aug 2025 15:59:58 +0300
Message-ID: <20250821125959.553681-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
References: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the workaround that allowed calling v4l2_get_link_freq() on the
control handler.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
 include/media/v4l2-common.h           | 19 ++++---------------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a5334aa35992..0574f5d685f8 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -512,8 +512,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
 
-s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
-			      unsigned int mul, unsigned int div)
+#ifdef CONFIG_MEDIA_CONTROLLER
+static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
+				   unsigned int mul, unsigned int div)
 {
 	struct v4l2_ctrl *ctrl;
 	s64 freq;
@@ -548,11 +549,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 
 	return freq > 0 ? freq : -EINVAL;
 }
-EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
 
-#ifdef CONFIG_MEDIA_CONTROLLER
-s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
-			     unsigned int div)
+s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
+		       unsigned int div)
 {
 	struct v4l2_mbus_config mbus_config = {};
 	struct v4l2_subdev *sd;
@@ -571,10 +570,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 	 * Fall back to using the link frequency control if the media bus config
 	 * doesn't provide a link frequency.
 	 */
-	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
+	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
-EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
-#endif /* CONFIG_MEDIA_CONTROLLER */
+EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
+#endif
 
 /*
  * Simplify a fraction using a simple continued fraction decomposition. The
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 39dd0c78d70f..ab0ce8e605c3 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -560,15 +560,14 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
- * @pad: The transmitter's media pad (or control handler for non-MC users or
- *	 compatibility reasons, don't use in new code)
+ * @pad: The transmitter's media pad
  * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
  *	 D-PHY, samples per clock on parallel. 0 otherwise.
  * @div: The divisor between pixel rate and link frequency. Number of data lanes
  *	 times two on D-PHY, 1 on parallel. 0 otherwise.
  *
  * This function is intended for obtaining the link frequency from the
- * transmitter sub-devices. It returns the link rate, either from the
+ * transmitter sub-device's pad. It returns the link rate, either from the
  * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
  * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
  *
@@ -578,19 +577,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  * * %-EINVAL: Invalid link frequency value
  */
 #ifdef CONFIG_MEDIA_CONTROLLER
-#define v4l2_get_link_freq(pad, mul, div)				\
-	_Generic(pad,							\
-		 struct media_pad *: __v4l2_get_link_freq_pad,		\
-		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
-	(pad, mul, div)
-s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
-			     unsigned int div);
-#else
-#define v4l2_get_link_freq(handler, mul, div)		\
-	__v4l2_get_link_freq_ctrl(handler, mul, div)
+s64 v4l2_get_link_freq(struct media_pad *pad, unsigned int mul,
+		       unsigned int div);
 #endif
-s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
-			      unsigned int mul, unsigned int div);
 
 void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
 		unsigned int n_terms, unsigned int threshold);
-- 
2.47.2


