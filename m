Return-Path: <linux-media+bounces-40952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F5B33BE5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 004BD1882D6A
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13382D9EFB;
	Mon, 25 Aug 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9TmHRmB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3942D978A
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115503; cv=none; b=p67gNvdPE1Q+Qei7Y0W2B/yL6EzYFL4ocwxQHdBj8JjjR1OGNnC03Jh3YCui9mI2rrlG2gkbYognZDscKV7WKpKL1SLoTdklX7d7qittuH/2oldP+vw2c9Y0IPSWCfA75psIuUnflPprfMbGVa9OPJfVbMWtFk/5EF6WzUEV0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115503; c=relaxed/simple;
	bh=InDsEvu4KymNPyx5bbeV6yopEunBNL5stoGxRnD1KHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5mROutE9ASi1R4WgtjXCMfDQ15RDr799fyhqFAEUmP0AsjHPBSCsFClGxs8SlDtjzFvVkQttzXaGVwTnP+2SccmOEqgkywTjVkZH1ZVjuOklZJ51DMSiohclP1RnboR+H4qdZ4/I+EFGg/vxHK5gRVqHwbmThJWs3b44pEi0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9TmHRmB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115502; x=1787651502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=InDsEvu4KymNPyx5bbeV6yopEunBNL5stoGxRnD1KHk=;
  b=C9TmHRmBA49/YzGh9PCokDgC/aV3MGXelJlihZefikrUSg+ouc9J2ATE
   tUPD2sV0FrrtkRilwt6kPoAMOxlOklyoBimunSC0yzkD5nNdgkHM+wzCT
   V7e5oONbG7AfguPF0ZoRr7ItBhuYLbYS/opvaZPH1gNdr3CaHp9CZdoKW
   VTAVN05R0Styezy3SOR//4z3ZwS/Re68lA7mSS77Q1RZceDQq7Ra9Ltqt
   XKfK+iUFX3EHLYUARuGM2DN8aVgruje1MmlC4dMNzM14MwDM6z84MgHGi
   3hN3HH9LJD/1HwSlA2RIikszAmVB20mRXwS62d2zhJUkcx3lzezCB9xaa
   A==;
X-CSE-ConnectionGUID: sBBV3yU+TGqvf2kaYzEFNw==
X-CSE-MsgGUID: 7FJ1utTuTYGdOotf63s4EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69696028"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69696028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: gkppQICVSWqnAjCK5nSy4g==
X-CSE-MsgGUID: j393SaQXTiODi60Mnbq7UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195506"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 59974121FC1;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aet-1Nya;
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
Subject: [PATCH v11 21/66] media: v4l: uapi: Add a control for color pattern flipping effect
Date: Mon, 25 Aug 2025 12:50:22 +0300
Message-ID: <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
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

Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
flipping results in a change in the sensor's color pattern, separately
horizontally and vertically. The information is essential for raw formats
when using generic raw mbus codes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
 include/uapi/linux/v4l2-controls.h                     |  6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 0fcd60d8c621..ef3784d1119a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -133,3 +133,13 @@ Image Source Control IDs
       - Raw Bayer, with alternating lines beginning with green, blue pixels and
         red, green pixels.
       - 3
+
+``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
+    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
+    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
+    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
+    either horizontal or vertical bit is set, the readout pattern order is that
+    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
+    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8119012c2638..9ec65998a8f7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
+	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1484,6 +1485,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
 	case V4L2_CID_CONFIG_MODEL:
+	case V4L2_CID_COLOR_PATTERN_FLIP:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index e552f6655fd0..eb9ffdd74d32 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1233,6 +1233,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_COLOR_PATTERN_BGGR			2U
 #define V4L2_COLOR_PATTERN_GBRG			3U
 
+#define V4L2_CID_COLOR_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL	(1U << 0)
+#define V4L2_COLOR_PATTERN_FLIP_VERTICAL	(1U << 1)
+#define V4L2_COLOR_PATTERN_FLIP_BOTH \
+	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
+
 
 /* Image processing controls */
 
-- 
2.47.2


