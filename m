Return-Path: <linux-media+bounces-40165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A057B2AAF2
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA411B6724C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB400343D93;
	Mon, 18 Aug 2025 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmWOoMQ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5436343D79
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526495; cv=none; b=R0TaDdkVcSW7Ksx2kqCJkSBzLqzHrJZrzIijMwmeqjdb09WEroFxI3QiAJ1wVmybMiqwiqQDp7WnKOcRyqmr9PLHu9LUn7K1mbsKdNpYhVm4aw1ehb/C94cC/xwug+bV9uDVeySKc8XKncBf3LgcvbaP5cAP5+ZAy65Vbppzgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526495; c=relaxed/simple;
	bh=LV+d8KNWydp2rx9Z5kmRz7CgKgCE2JQWSdUg9adMRjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DoUw6oXdkLJxswNh42luj0J+7btTeqKKYom0JpPpghe1YRbUzPv0aX+NeBuy6SdivcdafXt6qQEiv7c0OXcLGJPvzngqPmBR7smxJoNvd4K+6n9qVONCbL73qqgPsIwGpVtphE7dVu/LixhNsJRcm+Ay3/Gg5ivLaNJzoTd4cO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmWOoMQ+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755526494; x=1787062494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LV+d8KNWydp2rx9Z5kmRz7CgKgCE2JQWSdUg9adMRjI=;
  b=ZmWOoMQ+vD8eaxZyj2K1x8IOfmKg/BHsXfMqnaLLZVyhahBMPuVKY90m
   3JLmcNB7I48BzlGtm/+sFOMQ/ieJCpWm7N6VqpH+QELKdC+kzNn73UmWx
   3pyS30qP9crd+FWTI2GG+h1L1mjXDKDZ7qj55DO2M9f7M+TedeNxSWNdb
   mvJhgGbUhxxGZDx51XDhGguN/bf9AahHeZR9ld3mKGA2reFynpUP+5X9l
   t8X0H8AixWMU0s7qyXsqYtu/AaUC11CmQ/clRevJj40TqFscrrMgo3ihj
   Y+QDv9iD8ViFbwwmVh3wvPpUPKE7kPuI3LfzrFnCGG7Yo1S8eKo+v9oOI
   w==;
X-CSE-ConnectionGUID: S2L/VaW8SKuZuuUXXby30g==
X-CSE-MsgGUID: z0LbBMj6RQSuLbEOfMsCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57606983"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57606983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:14:50 -0700
X-CSE-ConnectionGUID: wFKHRXARQ26E+qpQCHooiQ==
X-CSE-MsgGUID: G+o1/aI2TmK65egUfYqdEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166755391"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:14:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F32D31201EF;
	Mon, 18 Aug 2025 17:14:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uo0dI-004rvA-2s;
	Mon, 18 Aug 2025 17:14:44 +0300
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
Subject: [PATCH 2/2] media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
Date: Mon, 18 Aug 2025 17:14:44 +0300
Message-Id: <20250818141444.1160565-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
References: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the workaround and don't allow v4l2_get_link_freq() to be called on
the control handler anymore.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 17 ++++++++---------
 include/media/v4l2-common.h           | 14 ++------------
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6e585bc76367..fb6e2b71f7c4 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -509,8 +509,9 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
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
@@ -545,11 +546,9 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 
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
@@ -568,10 +567,10 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
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
index 0a43f56578bc..79aaa510dab7 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -577,19 +577,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
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
2.39.5


