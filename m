Return-Path: <linux-media+bounces-40246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958EB2BDCE
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83D107A1E14
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F5531AF14;
	Tue, 19 Aug 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObS987Iu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA46E253F03
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596744; cv=none; b=iHhx2mq0Hj1AqbA4S9hdm6n0O/pwyBBki0H6gvsStGbwIC/U5U2znaE9h3gOSF8h9YGFEUh/nAYP2nyWZ0lBo4lYFuSzU7gmTz0V1OoU2WPvQWuopT5eo7jYBxTH0dR2kZBxW12+wM5vpVS24kMIqBxz3yzC7qZ7MQ2/QbF4U/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596744; c=relaxed/simple;
	bh=VJYk/XLlJQ/I8nMFbolMOWKwARiG3pXNp4MZHHfvBFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7LC1oVIhfwtiPPUhHaGXsy45Pa5G9U+UUA0Y1FlonoDOP5WemGG3nwZQJfhFcnsdLyTceimnuIeowyC2BsedmFkDlRqTCtqpCVQFzPGaGnojmdoe4SA4/8OoXa7jbvXqwVyEhVezFdDQc4xhJ2SCIo86oYa1M5MrRXmDTVlLmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObS987Iu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755596742; x=1787132742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VJYk/XLlJQ/I8nMFbolMOWKwARiG3pXNp4MZHHfvBFo=;
  b=ObS987IuWOcj3aYWFciG6ovZ8S+S0lwZt0K7bY0H3Sn3XEmC/0yxj3z8
   aFh5vmlZ/KezYzKYdA7AEKLNDbhVTyX7x2mFdYeVEN/QeoM6E2CGjl0lX
   3eXL6GwLKhJ/ZhTrbvTUF8gPC0yzvGVNqCk8RWs1oXuYsezaFyR6SASuw
   RJ6x0Gmuvh8EL47S8tMBMKujyGkycMkdwdG7EdAAEznEj7GfxTutbxu6B
   HYAnJQh3tGghzdHZMLHpXuBvWp1pvmNbud1ASXj7dI/7rQWObfofuFPyA
   diGzI8u7p5cHlxSzKaHPL05sMfGIPW2YGOJCCokI/C6j0+FC+kyvU24UZ
   Q==;
X-CSE-ConnectionGUID: uR7masoJTTmKaV1+FbtLUw==
X-CSE-MsgGUID: gU0WhpZsSTm2lYJcUEVr/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57691424"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57691424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:45:40 -0700
X-CSE-ConnectionGUID: 9MjonraCTDGa8fYEuTyWTA==
X-CSE-MsgGUID: 4cFyrxyVSkex/eJK7DkadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172045335"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.148])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:45:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1D8F8120247;
	Tue, 19 Aug 2025 12:45:34 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uoIuM-000000000c4-0TpI;
	Tue, 19 Aug 2025 12:45:34 +0300
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 2/2] media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
Date: Tue, 19 Aug 2025 12:45:32 +0300
Message-ID: <20250819094533.2335-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
References: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
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
 include/media/v4l2-common.h           | 14 ++------------
 2 files changed, 10 insertions(+), 21 deletions(-)

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
index 39dd0c78d70f..aedcfc81d12b 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -578,19 +578,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
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


