Return-Path: <linux-media+bounces-40947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0354B33BC9
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5FA17B1F54
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091272D781E;
	Mon, 25 Aug 2025 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKrlyKTj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A62D6E75
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115499; cv=none; b=NZkzJooxST+T+V3zE89UeZF75i69oFblplzHD6wiqA1pzNx3mXoY9Ll7VEieeDtN4ASFdHoXvlUlsdR2KWHhKecbw/AsvCgUFOhuqzgQcrZnD7Axo5ZIf2oyb3fdpoCOxtxfOFfaJzGPdTdSqjvyBp3uQG9DQS5Pt3bMYfvRdpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115499; c=relaxed/simple;
	bh=F0SO6kFzzNUBss2qDiREa9kV2eCFY1xvOONB87UIUKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M03ASZkdwOYg70qkjuREQFPq9PllO1zz88/3f/gV8j1bVqGuQx0NDIwTAJPE1wJ/SzCY1FfuCkO9eqKXTmutzvCLs40XsvuRnBI9mDxIkRvHBN6Y+j0fMU0MQHThomRWleHVAUxvEh8OqnS+Hs8lNgXF6PTmBuG9lo+1pCuXlxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKrlyKTj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115498; x=1787651498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F0SO6kFzzNUBss2qDiREa9kV2eCFY1xvOONB87UIUKo=;
  b=OKrlyKTjgSqskrQ8ETeGzVdyO4wMXRW0O3y+ZnBJ54GeCyzgSNsTniNj
   KnPEZgchjy/Tmjz19qBcsvYQCm2CWWYtSr0c1kPwTH62vfTi90u4SWMoQ
   8D8nh9HnDuXXTbmF+rXYqJN44IJ6qHlS4c8u3CfU2nSJNtboqnCvIUrhC
   RttjW3mJHCxUJUGWjt0trD+m2svvB6+Cm9i7kItSN71Zfvrd3oWKNrH3V
   fSPnqnXymUvjeNT5yv1Awmb+hb1X2XabxvDF+XQqd7sy6HLRtVcSVwjHg
   WXEelTvzD6oOFupY+l7EL/td5y/fLBZDQ1CCM4YIyCZJ3g/oAm8/FAdBo
   g==;
X-CSE-ConnectionGUID: 2E8Mf33kQCiCviXJNdKwJg==
X-CSE-MsgGUID: 8ZHi6hSdQXGjSEFUSDikpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695964"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695964"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:36 -0700
X-CSE-ConnectionGUID: T9xxA7CERIGH+fY7/HyGaw==
X-CSE-MsgGUID: YP8s76i6R/yAQzPlu4XQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195486"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4EAEE121FB7;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aee-1CH2;
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
Subject: [PATCH v11 18/66] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Date: Mon, 25 Aug 2025 12:50:19 +0300
Message-ID: <20250825095107.1332313-19-sakari.ailus@linux.intel.com>
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

Add the V4L2_CID_CONFIG_MODEL control for the configuration model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
 include/uapi/linux/v4l2-controls.h                           | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 27803dca8d3e..2ae17ed99729 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -55,3 +55,7 @@ Image Process Control IDs
     control value divided by e.g. 0x100, meaning that to get no
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
+
+``V4L2_CID_CONFIG_MODEL (bitmask)``
+    Which configuration models the sub-device supports. Please see
+    :ref:`media_subdev_config_model`. This is a read-only control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..dd5f06546773 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
 	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
 	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
+	case V4L2_CID_CONFIG_MODEL:		return "Sub-device Configuration Model";
 
 	/* DV controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DV_RX_POWER_PRESENT:
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
+	case V4L2_CID_CONFIG_MODEL:
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*type = V4L2_CTRL_TYPE_BITMASK;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		*type = V4L2_CTRL_TYPE_INTEGER;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9deb..3c0f6afe7500 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1238,6 +1238,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
 #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
 #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
+#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
+
+#define V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR	(1U << 0)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.47.2


