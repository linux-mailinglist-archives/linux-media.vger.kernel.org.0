Return-Path: <linux-media+bounces-25547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47653A2553E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A763A8DEF
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F712207A3D;
	Mon,  3 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZR3zefg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86979207A31
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573187; cv=none; b=u2Xqeree+kABlXZFfUKoBPbXEEpajzzPKRlumlr5AKwMWTuEw1hxrMcDq1jJGkDP9xkvOKW+69bIPUBfEz973G44rmkWlAEy1p26jurw3HyTN3t5vNO3F/CrlLvF8SSGB6l5nJIzPJ26q36lL6/y/vJjNBWXgxuvIL6UBXLipy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573187; c=relaxed/simple;
	bh=A7LfAM8uQlowCF2ENCO4YsrEYCod4Tp1T3ZsImhdxwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HhgFZpgkFpdDC6qB5vPKPZ6FMS7iOML6yMnEo3GirsXwBVGXeMsN86FRH35FPU7a10TjUcSmTOyPsWOXVEu7HLt1sJo3W3mcEOfN1/VJ41MrCqGH7QDyvUXnP3fb7mkjwpUUMuuuu3fNJCaXc/GlcNCdv/cez2H7QpyolOV5wNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZR3zefg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573186; x=1770109186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A7LfAM8uQlowCF2ENCO4YsrEYCod4Tp1T3ZsImhdxwo=;
  b=gZR3zefg1iy2XyiuBYIQDrMWn9h7UIfejw8zzl4zjGM2J0yc8Vv8zTpo
   pzjpOR3dVcYR2QwchlmwGczqjrjLrvQCm2FUAnnuyfBAWpd2VPLvWY3Q3
   XW6UQReY1LzThhaSbBgbI1PjDNhOkM36vUJgSKqUeQ5wTbO11im5C+Mf/
   Q0M/5NHjaBC80k77gpB5nPMmLeHY4U5hJpEi8kdL764DzRZkHilnFkz3R
   b7E6l1bABm1ROZWg4+wxGbw8VC5xUXNSDCErMgKAFy6s6V/X1M05KxcLs
   WL8QapOZhrJ/I+XrTW6VtUY/vAwBq2zCykwXLjwpgTbtV5O1DEKaOF94/
   w==;
X-CSE-ConnectionGUID: TaAT2/1NSSK0CSVbZ28Z0w==
X-CSE-MsgGUID: SleW+mnwRveah+xSNrw50g==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="56485428"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56485428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:45 -0800
X-CSE-ConnectionGUID: pLCP3vXISrCrHb3pRo8wew==
X-CSE-MsgGUID: KYUAU68vQOWt5+RDAYUdwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110066406"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:39 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B63A11F9C3;
	Mon,  3 Feb 2025 10:59:34 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 10/15] media: v4l: uapi: Add a control for colour pattern flipping effect
Date: Mon,  3 Feb 2025 10:58:48 +0200
Message-Id: <20250203085853.1361401-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a bitmask control (V4L2_CID_COLOUR_PATTERN_FLIP) to tell whether
flipping results in a change in the sensor's colour pattern, separately
horizontally and vertically. The information is essential for raw formats
when using generic raw mbus codes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/ext-ctrls-image-source.rst          |  8 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         |  2 ++
 include/uapi/linux/v4l2-controls.h                | 15 +++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index fca729512b6f..ecfa38c118e3 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -102,3 +102,11 @@ Image Source Control IDs
     This control may only be used on a V4L2 sub-device.
 
     This is a read-only control.
+
+``V4L2_CID_COLOUR_PATTERN_FLIP (bitmask)``
+    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
+    V4L2_CID_VFLIP) have an effect on the pixel order of the output colour
+    pattern. Macros ``V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_COLOUR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
+    either horizontal or vertical bit is set, the readout pattern order is that
+    of the reversed readout.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 5b6a4a94f18f..3f0704a982b8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_COLOUR_PATTERN:		return "Colour Pattern";
+	case V4L2_CID_COLOUR_PATTERN_FLIP:	return "Colour Pattern Flip";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1474,6 +1475,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*max = 0xffff;
 		break;
 	case V4L2_CID_FLASH_FAULT:
+	case V4L2_CID_COLOUR_PATTERN_FLIP:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
 	case V4L2_CID_AUTO_FOCUS_STATUS:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 8e761c38b995..fd6465e9a743 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1215,11 +1215,26 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
 #define V4L2_CID_COLOUR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+/*
+ * CFA pattern start shall be aligned with the number of patterns for colour
+ * components. Patterns shall be calculable based on flipping when it affects
+ * the pattern the following way:
+ *
+ * flipped_pattern = native_pattern ^
+ *	((hflip ? V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL : 0) |
+ *	 (vflip ? V4L2_COLOUR_PATTERN_FLIP_VERTICAL : 0))
+ *
+ * where hflip and vflip are the values of V4L2_CID_HFLIP and V4L2_CID_VFLIP
+ * controls, respectively.
+ */
 #define V4L2_COLOUR_PATTERN_GRBG		0
 #define V4L2_COLOUR_PATTERN_RGGB		1
 #define V4L2_COLOUR_PATTERN_BGGR		2
 #define V4L2_COLOUR_PATTERN_GBRG		3
 
+#define V4L2_CID_COLOUR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
+#define V4L2_COLOUR_PATTERN_FLIP_VERTICAL	(1U << 1)
 
 /* Image processing controls */
 
-- 
2.39.5


