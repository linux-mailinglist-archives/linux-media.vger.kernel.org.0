Return-Path: <linux-media+bounces-58424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKFHLSYJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E39473CF48D
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8801A30177AB
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9950B3446AB;
	Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSqVCKMT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7D33F5B4
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765732; cv=none; b=HPdIHT8WRpy1MuRoP/FvzfuYKc+wICoAesaPf5uyha/h/JGHeruY9HG1XD+i6YSvQeJaAPl91C73nTtyO4DtNAEFPT2oPoyHRZmXUle42gHpft6+rYGamWc1pZmfT7bKcL4/A8aGDwEEk6s/gDyJstXjNW57Z2ZhZRXHwctOxmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765732; c=relaxed/simple;
	bh=CyXV1MMGELZcGn+UinvKpGpHtbbTdNWkHpt04Bdgsoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLUZRRnlx7wmu5sXrtblBmWbniqdacesRZ8Oa/pKRf5E0Ry/ZZ2YZcYKWW09bf0HI7vJGbFXTvo1QIlk6LNzteAVVNjdaP6VrS29DQJsUE8Llpj2A0EO9yR0gjxdsPIZoIZTxtg8r4BBH5Xc8nr2o4nRKW4VbY9kVB/MDXBk/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSqVCKMT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765731; x=1807301731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CyXV1MMGELZcGn+UinvKpGpHtbbTdNWkHpt04Bdgsoc=;
  b=iSqVCKMTdhQz5TCdmNY3GQH8ZzQF0MMsPtiv9o0i2o+mqrIolpmk7bOK
   TD0xPfflTqQH1Y1XhnmvJVnffOk3iEJ4dMp+rsO64K+kklm1VhnPIr8A2
   NglOq7VsXnJlLXx3D1Uwk/6G8rHa2lBzJdPzDqCTndEiMaksclDmobiOL
   nkiCwTCeGDRTq1LCtxK4mA1Y4B7VFeXfVqfZ6ajNPUWFWEb4yjEurLEGR
   MnRUpZGKqvjeEcekR1OLEO3Lr/B6zmKYCDHflusjcUsezYQflrQS2Ugsr
   ZAyg3a6XuZXfK5VkKERuHJdPlZVgS77YIiZp24fUSGJDsXtSPwnxQVkCh
   w==;
X-CSE-ConnectionGUID: rT5w0rSoTDetJ7/pxXjCFw==
X-CSE-MsgGUID: 0tt2Dhp/S26E/HAyxKw8cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176445"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176445"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: i67k7TZuRqObiyW3L1ScVg==
X-CSE-MsgGUID: WPBzIs/eS96Zqz3GwjaOpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047525"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 96F4C12283F;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mP-068G;
	Thu, 09 Apr 2026 23:15:02 +0300
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
Subject: [PATCH v12 27/86] media: uapi: Add V4L2_CID_BINNING control for binning configuration
Date: Thu,  9 Apr 2026 23:14:02 +0300
Message-ID: <20260409201501.975242-28-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58424-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E39473CF48D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add V4L2_CID_BINNING control for configuring binning and enumerating a
camera sensor's binning capabilities. The control combines horizontal and
vertical binning into a single control as the two are generally related.

New drivers should use this control to configure binning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/drivers/camera-sensor.rst           | 12 ++++++++
 .../media/v4l/ext-ctrls-image-source.rst      | 30 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  2 ++
 4 files changed, 46 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index d8ba809486c5..12f075379bc8 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
 controls shall be 0 (disabled). Especially these controls shall not be inverted,
 independently of the sensor's mounting rotation.
 
+Binning
+-------
+
+Binning has traditionally been configured using :ref:`the compose selection
+rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
+<image_source_control_binning_factors>` control is also available for binning
+configuration and users should use it when it's available. Drivers supporting
+the control shall also support the compose rectangle, albeit the rectangle may
+be read-only when the control is present.
+
+Binning isn't affected by flipping.
+
 .. _media_using_camera_sensor_drivers_embedded_data:
 
 Embedded data
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 490cd16186cd..0ef76b02a6e1 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -160,3 +160,33 @@ Image Source Control IDs
     interface for metadata streams. The control is used in conjunction with
     :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
     specify the layout of the data.
+
+.. _image_source_control_binning_factors:
+
+``V4L2_CID_BINNING_FACTORS (integer menu)``
+
+    This control determines horizontal and vertical binning factors. Binning
+    combines several horizontal, vertical or both pixel values into a single
+    pixel. It is a way to scale an image. Binning typically produces fairly good
+    quality output.
+
+    Determines both horizontal and vertical binning factors for a camera
+    sensor. The values are encoded in the following way:
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Bits
+      - Synopsis
+    * - 48--63
+      - Horizontal binning numerator.
+    * - 32--47
+      - Horizontal binning denominator.
+    * - 16--31
+      - Vertical binning numerator.
+    * - 0--15
+      - Vertical binning denominator.
+
+For instance, a value of ``0x0001000300020003`` indicates binning by 3
+(horizontally) * 3/2 (vertically).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 4618252d24f2..fee343667b69 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1160,6 +1160,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
 	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
 	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
+	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1438,6 +1439,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_HDR_SENSOR_MODE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
+	case V4L2_CID_BINNING_FACTORS:
 	case V4L2_CID_LINK_FREQ:
 		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 1bf6d298e3c4..5496b1664432 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1249,6 +1249,8 @@ enum v4l2_jpeg_chroma_subsampling {
 
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
+#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
+
 /* Image processing controls */
 
 #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
-- 
2.47.3


