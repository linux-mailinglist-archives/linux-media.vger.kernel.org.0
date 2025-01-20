Return-Path: <linux-media+bounces-24944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FBA16B24
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD66188769C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B500F1BBBF7;
	Mon, 20 Jan 2025 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emS8xJTe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A59481CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370936; cv=none; b=MQDaFRbFezBcoByersUm+vpyxMw4M9SPipy37G4Vx73naNM99xhOAFZRxiClUPpNKUvu8tlckE2wNDQzskoX4+2RRdUHJXsykY6NCrsdZOXCAIk8pqFqhNomFciBILw9hbaa44o+0W95Zj86AnskS49tRDWAxg5j4j04PMLCrNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370936; c=relaxed/simple;
	bh=cSzUNR4PUt5j2gD5m4v5XCZZuTHlKFUZti2+ZXYeseQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UY/QW8osskr56qZuoEeyMyS+mEdbwIgDGlWzvICGRNPYeRnmHfcGx93fqSFxhnJAMBIRIcECG6/1SS8ewFx3qPqeY2/ih//LHyehPruC0pBNIl+kfLUzEnHDletUooN/wc7I0fISgeap+AfsTj7N2l9qAWd2Dl5/lnglQdXcKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emS8xJTe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370935; x=1768906935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cSzUNR4PUt5j2gD5m4v5XCZZuTHlKFUZti2+ZXYeseQ=;
  b=emS8xJTe8W7krFvC+e/F9oyA3B+4YeVWqf6cW7KxxcpDpHwPZmY0tX9g
   ikEfqxW5L0fsDyb39R999Q9z0hR4hfTGl/ImKSnALw2726sC0nAt65MET
   ArvFupukj275UagDLegO0IME/87Ad4Lz3/w6Iyfw5wDkIWCKH46sRG15j
   ipIfHanIAndoggH0HWfNSlUyZVKWzQHQRP0fagWbC2cRVmbWmFWR5X1vk
   R0WFcq4kLgesnUeMc6px4Y2Rt5CR0kkq6hJba6K776wKejK1gaLgzFsHp
   3vJHQZ+66zArC+FcNxc1wywXYYpvjAwDHfc2Hy8iw9kV+8gjjOazxwOh6
   g==;
X-CSE-ConnectionGUID: eGvjb3yRQ367tayzjtHnGg==
X-CSE-MsgGUID: OeWdsNalSCeaobaWyL4azg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37914510"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37914510"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:14 -0800
X-CSE-ConnectionGUID: V2K5efIXRy65e6Xk2FOXvg==
X-CSE-MsgGUID: o46l7irGS6aZrZc60lv18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106491057"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:08 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B828A11FA93;
	Mon, 20 Jan 2025 13:02:01 +0200 (EET)
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
Subject: [PATCH v10 1/9] media: v4l: Support passing media pad argument to v4l2_get_link_freq()
Date: Mon, 20 Jan 2025 13:01:49 +0200
Message-Id: <20250120110157.152732-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
References: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
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


