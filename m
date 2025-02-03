Return-Path: <linux-media+bounces-25544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F673A25533
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CADCB18887BC
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1112066DB;
	Mon,  3 Feb 2025 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwWkTHhL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4D206F18
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573175; cv=none; b=ZDTMce3b5qAdVf89dWXweTxL0tieo1HMW4xehGV6V/y4FwEp+j/J3Ta2WsNQabj0IHSx240Et8seC6N1MxtcUmJ4FUbtuT0olty9KOMw6ZQE/j5iWnAoEEFWJ65iJHVyOJlyVEQ0sJzbGaD7+WsEOZEAHT0Q1OuhzNtCq28r80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573175; c=relaxed/simple;
	bh=7KTRKidiKuQyjrzuGr1x3NP6RgTolxd1QWlMqfM/9b4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YsSK3oZLDUWqXrE4F6SzCCE5RPAz+tb7OTanCT/pzLatMNmYP9xDjgdgTdEWM44ZZmVr+UOPmRqYnE6XklUCvNhJ5KruSf/SftHOCWRO4V3mM/rQTlvQwGuWasGcHJkrEuDupXxiWb2soTSnV7WaSgOJHgGNEIof4+nUGp3FHXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwWkTHhL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573175; x=1770109175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7KTRKidiKuQyjrzuGr1x3NP6RgTolxd1QWlMqfM/9b4=;
  b=QwWkTHhLH0O+HrB1dFn1qk7cgAbk9VbWmcXPsbXEukMQrAKK4E/x4B6N
   1A2FdaMVCHpbfpP6Z5/Ec7kh/KCk8kcpY12QPxBJwb36sZtaz6FkOpUEI
   dHMopkjEPLR2r/UAJWm/Owy4+adPIs5u3nUVvQRQKe0m/UgWWlb4WvyYn
   HgWg974yFIAUqwMaWjJ367FBol9UkykuMvJU8xJ5Qnp6a+Yc62k6kYTSM
   URlbxTJxxowpDcdnpgWNygiroZWiiHY9zt9gM8pXAMq4VTAZxTTtBKRaz
   YS0QNC0UenBIuqMrn9skS4DyYQ/BRZ/qK+d4kd9p1SyLF+oQLmaqHr3Px
   A==;
X-CSE-ConnectionGUID: b4votyyTRDaZtrXsGPQSJA==
X-CSE-MsgGUID: LhjiBNGxT7+P2LjPpASgFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50472697"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50472697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:34 -0800
X-CSE-ConnectionGUID: KSlutdmkTs6VSaELE1yGXw==
X-CSE-MsgGUID: 5raauqzRSHK1c4f3DXhpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110382977"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:28 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F293B11F9C3;
	Mon,  3 Feb 2025 10:59:22 +0200 (EET)
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
Subject: [RFC v5 07/15] media: uapi: Add V4L2_CID_COLOUR_PATTERN for describing colour patterns
Date: Mon,  3 Feb 2025 10:58:45 +0200
Message-Id: <20250203085853.1361401-8-sakari.ailus@linux.intel.com>
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

Add V4L2_CID_COLOUR_PATTERN to tell the camera sensor's native colour
pattern.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  1 +
 include/uapi/linux/v4l2-controls.h                     |  6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 71f23f131f97..fca729512b6f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -92,3 +92,13 @@ Image Source Control IDs
     representing a gain of exactly 1.0. For example, if this default value
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
+
+``V4L2_CID_COLOUR_PATTERN (integer)``
+    This control determines the colour components and pixel order in the
+    sensor's CFA (Colour Filter Array) when used in conjunction with
+    :ref:`luma-only mbus codes MEDIA_BUS_FMT_Yx_1Xx (where 'x' is the bit depth)
+    <v4l2-mbus-pixelcode-yuv8>` pixelformats.
+
+    This control may only be used on a V4L2 sub-device.
+
+    This is a read-only control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 24c9c25e20d1..5b6a4a94f18f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_COLOUR_PATTERN:		return "Colour Pattern";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 731add75d9ee..8e761c38b995 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1214,6 +1214,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
+#define V4L2_CID_COLOUR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_COLOUR_PATTERN_GRBG		0
+#define V4L2_COLOUR_PATTERN_RGGB		1
+#define V4L2_COLOUR_PATTERN_BGGR		2
+#define V4L2_COLOUR_PATTERN_GBRG		3
+
 
 /* Image processing controls */
 
-- 
2.39.5


