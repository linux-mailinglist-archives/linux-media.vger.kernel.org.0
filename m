Return-Path: <linux-media+bounces-35283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F83AE04C8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0936D17C89E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9B2253F1A;
	Thu, 19 Jun 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzj/Pjk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424523B636
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334345; cv=none; b=dfeqU8179WzLne/OSG7JzET6jY4MPO+iBN264tT6i1yDSkvP98Myzh4Pl6YqTbNMDsd6yajR7qWunYOLm7XCLiA/Qo1elP11+EiZ+7Kbqhb/fOSu0K6xvapC2lJwOZu38mnYQytmPbW1bmgk6UNDnzbocJGchjbVlsoasMWHCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334345; c=relaxed/simple;
	bh=B6V9t+873ZCRFUADXRP8RlCu5xk2tixt9+x+Z2ubIyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MdC6DXMbWAmzHGcPyJGMgJAi0OfyMRAaWV3eWzHOcoDFxaBDbjfw8qiHravwddE9ylZQULEh+DRmRTC7fnqb7z7zu4KABKeiusZ8akrKdN8WDm+MetEbNTMIKcyeuBCywSdlSbzvsxtNrgIzIQeh7IQ7DaVoV6ycKAege6tqaYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzj/Pjk1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334345; x=1781870345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B6V9t+873ZCRFUADXRP8RlCu5xk2tixt9+x+Z2ubIyo=;
  b=kzj/Pjk1jZYHm5Edor7CBuZ/akLgEHnI1b/BYQ3B7Jl6lnQWbbErZnfO
   8rI1ePdfgQLONm3fmJ2SS4ALpvu+4BP3VTHThMpxAO9KwnbubtyOxNGvc
   uocQzoN/X0aWamR7TB9WGSnPIeNYzKkOHCvpXuw9QgRNVsLUnUanc74ky
   HLCDA7cChhO0doce6Ndm18QzSp8qMdHhjM2zf9YKM+ToSFhZjAWYukMmJ
   V4pq0+LippAA1+6N9BlNyzA4uQ4oLBfFutX2Ey5P11bwayJKgQ3hcvS4W
   LxW2T2b/VOmlGc1utkAG6rbKqSgHQz97mkEymX8X1H9DO0K9kYrY4R2Mk
   g==;
X-CSE-ConnectionGUID: a0eR+pd8SLygQ8IxA5YQ5A==
X-CSE-MsgGUID: BvQd7HOJQ3O93frr26laTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64015066"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64015066"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:03 -0700
X-CSE-ConnectionGUID: Smiy3UoUQ0q0QZdp+6XXBQ==
X-CSE-MsgGUID: JtdnOd/GSjmA5ryE5dYTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192291"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DD6FF120DEC;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AJ1-2q;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 18/64] media: uapi: Add V4L2_CID_COLOR_PATTERN for describing color patterns
Date: Thu, 19 Jun 2025 14:57:50 +0300
Message-Id: <20250619115836.1946016-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
index c06d8c83e2b8..d6d0e9a0eee1 100644
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
index c3e6a49b2549..09e5d5bbe7f8 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1221,6 +1221,12 @@ enum v4l2_jpeg_chroma_subsampling {
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
2.39.5


