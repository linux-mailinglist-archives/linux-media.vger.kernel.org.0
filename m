Return-Path: <linux-media+bounces-40565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E9B2F79B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB85602184
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E87631076A;
	Thu, 21 Aug 2025 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TulhOiwM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D43115AC
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778338; cv=none; b=trNwB8sNK+UdoKqm60kKfSVGLgDmnEC9gyY32Ea12/J9IehhcOlmHSo6YaMp9o/6Nsyu61Wli5OH0gD/++/QKoNUg2xowTgIWePU84f7lDr+9DY9vlDiALqs7t/hahRoFW3dk6R29xODV5QQ+qoNp+07XEfmAuc+uZ+QKuN0M9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778338; c=relaxed/simple;
	bh=OsVyWRVl6ux7oxFH0lhtUfgf/J7ac6TlwKykjojKEmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwqPA6Jy7KqiS3WUk4XeesjKX7TKPXrzHKmpvw1oN5q0Jddz6raCIvN1866JdZin/o0IjQlbRu5VqTq+wrsFwdyI8iNeL1csCvzYzeOn7rHO8hFSOZh7qINT4Bf7fxdfVz9XB5JbqMGmKUW8Ky6ac9zl93JmoymmC3sRTtH/6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TulhOiwM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755778337; x=1787314337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OsVyWRVl6ux7oxFH0lhtUfgf/J7ac6TlwKykjojKEmg=;
  b=TulhOiwMB1v5MVmW1yXPfBjgWqycD4JRXAs/VywVCEdCI2aipLSqMttD
   FvwaafPQI2FalDxAwgNf7F8wf5ZtJEi6ViDllnSTjwNSaeuLki+Bll0il
   LgGcWbroHiE99eg1Vtl1+06CYiDm+asIN8G4QrEfjFPl2fgAi7W5UHdBx
   efgT9Blbs2c3yqJq5UJuHHZYGMDB2SPsLl/8YbXOH3t7r68PMUPkmbDzR
   pJ8Th8+WrxK/yJthB7uQ71mG1NJ5pc8vd67jwgZwO/joST/qPjbxCKmCP
   tAvCzR/kgfCR5TwAr6uLlM9kJA9I4xsVU1xE+aLDpphbo35rv0iN9Qmt4
   A==;
X-CSE-ConnectionGUID: vRyAxpWdQ5uDXRMZ2wLaEg==
X-CSE-MsgGUID: QpyQt4ZTRB6PLHt2LSrQDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57089515"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57089515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:13 -0700
X-CSE-ConnectionGUID: jUUNOrcyQUu7yNvYQw9dIA==
X-CSE-MsgGUID: xsdfSOZ0RqSPP+v79zY/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="192077013"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18F51120274;
	Thu, 21 Aug 2025 15:12:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up49I-00000002Jre-0PzG;
	Thu, 21 Aug 2025 15:12:08 +0300
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
Subject: [PATCH v3 2/3] media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
Date: Thu, 21 Aug 2025 15:12:06 +0300
Message-ID: <20250821121207.552993-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
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


