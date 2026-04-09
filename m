Return-Path: <linux-media+bounces-58418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMCDMRMJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AD3CF45C
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E42C03015744
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED52F33FE06;
	Thu,  9 Apr 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZZvoc+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278B33D6E3
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765730; cv=none; b=aPVOUh/By5t/uvlPw3gss9Htg3dvuPKc9IflDFX3DhnEquRmy/ew1bYH3oz5JxNjG2l9P4a2hnC36qk73jdkyQd+590DIis5W3Lv/i30FDYp0p8DZ05Kft2yRUfsrEEjM9nJU/BiLB3GYCakw2yBGz6oTlEpSM81kbj2Q3ADa+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765730; c=relaxed/simple;
	bh=1GOzCaXoxKSPdun+zU6My5WsOqewky+c7Y/OFclBINY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfM4HcUlemhfzmz5/TP8N2HH47HSB1Vzdfv01EinV0CP5LOSsYd4TCCVhqWbgaFwI7ewfR7/baH7ht/wV8Mo9FKzGgjtOqa5n3QshPYGP781NeRczkWE8RL4DdOCO3NRhpoT1Wo1cW8Z/uOWYWoXkmpIQ8TyXwnsvF319jMZBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZZvoc+4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765726; x=1807301726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1GOzCaXoxKSPdun+zU6My5WsOqewky+c7Y/OFclBINY=;
  b=kZZvoc+4ZC8pGdyx2pzfaHWDYO22SR8G3BT6aXRdpxF6A1QE0csWi/jr
   Q63hsXD4mMwSDCpMgAVR+KBg2GI9FonuXIph7EVSZWbNpiW86SYLfVkkA
   5XhvcxCecmoHgL/TClY9k2OABp7IlCgPg4yg9gehIhVIBJ5qKtFUukvDB
   Dv8tUuFIE2xsR+9QBWWUVWgfi0nlAlltJefi0EjPKvQ++AwToJwryKGL6
   yodmiExKcPuEBU9P2b1eQYObFRyKJYbwprYt4TnhrFlzDey/uxceJNZDB
   xuHgOoRTVU2OlK1wOT/G21UOmWTKvbPSmUQa9KNVJzw6YiA6jYihCe3c2
   g==;
X-CSE-ConnectionGUID: bKLa9sp7R/uXwNtzMbsHig==
X-CSE-MsgGUID: DKRvCK4BQVqwd42n5VDjbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409023"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409023"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: MKKvMjktS8i5Uj1WI/QAEQ==
X-CSE-MsgGUID: dHQJYlzcRxm6hSwiADAgpg==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3CC57122145;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045kz-2ndt;
	Thu, 09 Apr 2026 23:15:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 05/86] media: uapi: Add V4L2_CID_CFA_PATTERN for describing color patterns
Date: Thu,  9 Apr 2026 23:13:40 +0300
Message-ID: <20260409201501.975242-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58418-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid,nxp.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB5AD3CF45C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add V4L2_CID_CFA_PATTERN to tell the camera sensor's native Color Filter
Array (CFA) pattern.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 43 +++++++++++++++++++
 .../media/v4l/subdev-formats.rst              |  2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
 include/uapi/linux/v4l2-controls.h            |  6 +++
 4 files changed, 52 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index f9c0b7ad3b4e..b09ad4b4576e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -93,3 +93,46 @@ Image Source Control IDs
     representing a gain of exactly 1.0. For example, if this default value
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
+
+``V4L2_CID_CFA_PATTERN (integer)``
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
+.. flat-table:: V4L2 Color Filter Array Patterns
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       1 2 1
+
+    * - Macro name
+      - Synopsis
+      - Value
+    * - V4L2_CFA_PATTERN_GRBG
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-left and bottom-right pixels, a red filter in the top-right
+        pixel, and a blue filter in the bottom-left pixel.
+      - 0
+    * - V4L2_CFA_PATTERN_RGGB
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-right and bottom-left pixels, a red filter in the top-left
+        pixel, and a blue filter in the bottom-right pixel.
+      - 1
+    * - V4L2_CFA_PATTERN_BGGR
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-right and bottom-left pixels, a blue filter in the top-left
+        pixel, and a red filter in the bottom-right pixel.
+      - 2
+    * - V4L2_CFA_PATTERN_GBRG
+      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
+        the top-left and bottom-right pixels, a blue filter in the top-right
+        pixel, and a red filter in the bottom-left pixel.
+      - 3
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index fecb786cb8af..7d34c2991f81 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3855,6 +3855,8 @@ organization is given as an example for the first pixel only.
 
     \endgroup
 
+.. _v4l2-mbus-pixelcode-generic-raw:
+
 Generic raw formats on serial interfaces
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index aab785e8948c..4fafc7a3c233 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 349d75d0da32..78c6fc69b1c1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1235,6 +1235,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
+#define V4L2_CID_CFA_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_CFA_PATTERN_GRBG			0U
+#define V4L2_CFA_PATTERN_RGGB			1U
+#define V4L2_CFA_PATTERN_BGGR			2U
+#define V4L2_CFA_PATTERN_GBRG			3U
+
 
 /* Image processing controls */
 
-- 
2.47.3


