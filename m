Return-Path: <linux-media+bounces-40950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345BB33BCC
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2C7167349
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B9A2D97BF;
	Mon, 25 Aug 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2msE/36"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F062D73B3
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115501; cv=none; b=MNM/dFBamo9jprtZVDLZKzHUyYmBCXoWUz0/4r6WT9nOo/Rba/2MMEZRjJ87MqKZK/OPJmnOlghQZLPjmNbG3jMpBH014t/YlSM19tPHSuV5Xtf5cgULrkmpHwaOrrQhqDjnagT28yh6/IohPAc5xNPvXeYrBKUhfvy63np2K2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115501; c=relaxed/simple;
	bh=Woh3Nd9iqks7ratYx5U6suOkof04Dg4E3k1Peu1v3L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPhDxg8IelDdknelXJZqPU/DObDmYQwMiI1GCnDKMga3sLAaBFr/TsQ08wLATVWm2K71utev+ssubNVM+npC51Jva2fyCKl9ZAg+6YzVDpaFiZkHJOzdF/g/htTaWHEmJyTsOUtoBpwx7nQd3g80tOQHO7PIBnijnYKmjGImQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2msE/36; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115500; x=1787651500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Woh3Nd9iqks7ratYx5U6suOkof04Dg4E3k1Peu1v3L8=;
  b=f2msE/36KDcuLIKAPz+lMnhoUnlolYb4HiEYoVtnPrqoxARt+tMOrQ/R
   Vp4FBfc6TDHECXGrXT1OKods9c1MfCF84YbMnIJsOw4A3Ey0iPbwY84b4
   ix+sPyGpO/i5vN9OqAyeAdIHlpqv7130YHUHw/kdAJBPMKJUEp8HD2vzb
   lbmOfXvjzRMcKFMgMHD2jDbX4lrZ5ZUPNpOQNzsMXAglC9T9oi5RCd1w6
   hIBNTGkU4RnXx4IqLp3iaWIIHeWWIv47mZDC4yC3nWiWVYZ5v0V3I/KDt
   aG0i9smukYLdgLZCafxIy69g5CX5AqTrjg4Uw5ddV21H8F6raE+YSeLu9
   Q==;
X-CSE-ConnectionGUID: BY5bLsRSS8WZQfbdtLvoQg==
X-CSE-MsgGUID: z5VZZ2jDTyaXg43YW1vtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696007"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: 3yoi2AuVSE29m09+tnhrkQ==
X-CSE-MsgGUID: YDnlcNvmSuiJ+BXtRKlQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195498"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 52C37121FB8;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aej-1GFo;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 19/66] media: uapi: Add V4L2_CID_COLOR_PATTERN for describing color patterns
Date: Mon, 25 Aug 2025 12:50:20 +0300
Message-ID: <20250825095107.1332313-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
pattern.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
 .../media/v4l/subdev-formats.rst              |  2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 include/uapi/linux/v4l2-controls.h            |  6 +++
 4 files changed, 48 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 71f23f131f97..b19aaaffbce0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -92,3 +92,42 @@ Image Source Control IDs
     representing a gain of exactly 1.0. For example, if this default value
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
+
+``V4L2_CID_COLOR_PATTERN (integer)``
+    This control determines the color components and native pixel order in the
+    sensor's CFA (Color Filter Array) when used in conjunction with
+    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
+    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
+    order is constant for a given device, it is not affected by cropping or
+    flipping.
+
+    This control may only be used on V4L2 sub-devices.
+
+    This is a read-only control.
+
+    Available patterns:
+
+.. flat-table:: V4L2 color patterns
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 2 1
+
+    * - Macro name
+      - Synopsis
+      - Value
+    * - V4L2_COLOR_PATTERN_GRBG
+      - Raw Bayer, with alternating lines beginning with green, red pixels and
+        blue, green pixels.
+      - 0
+    * - V4L2_COLOR_PATTERN_RGGB
+      - Raw Bayer, with alternating lines beginning with red, green pixels and
+        green, blue pixels.
+      - 1
+    * - V4L2_COLOR_PATTERN_BGGR
+      - Raw Bayer, with alternating lines beginning with blue, green pixels and
+        green, red pixels.
+      - 2
+    * - V4L2_COLOR_PATTERN_GBRG
+      - Raw Bayer, with alternating lines beginning with green, blue pixels and
+        red, green pixels.
+      - 3
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 1a51b5c817f1..e77b4ad19737 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+.. _v4l2-mbus-pixelcode-generic-raw:
+
 Generic raw formats on serial interfaces
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index dd5f06546773..8119012c2638 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 3c0f6afe7500..e552f6655fd0 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1227,6 +1227,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
+#define V4L2_CID_COLOR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_COLOR_PATTERN_GRBG			0U
+#define V4L2_COLOR_PATTERN_RGGB			1U
+#define V4L2_COLOR_PATTERN_BGGR			2U
+#define V4L2_COLOR_PATTERN_GBRG			3U
+
 
 /* Image processing controls */
 
-- 
2.47.2


