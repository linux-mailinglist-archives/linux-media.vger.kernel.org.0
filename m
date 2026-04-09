Return-Path: <linux-media+bounces-58438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOZRMTkK2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B03CF6E4
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB31302DB4E
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFCE33D509;
	Thu,  9 Apr 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTMmM/lc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A90E346FAB
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765736; cv=none; b=g/c2Td70KJr+qz+S2NCFe46cmrB6LacqGgrjxt3AIIIpbwy3qVYypB60lCMX+3GKkppKA9a+ZusTAwaHon7FGPiVdpIp2EshZ/dfIjHzW2nf5GMt0ytN435jlisA/W2iXrboY923QAmJMAXRnSGEFDZm+BlLQ1ZuIcrXDD7mztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765736; c=relaxed/simple;
	bh=JlyLyzLKg29aOTNi9MnM+J183BDjfRHhdHOq3O1W9g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5vjOnwPcw7854d53wiVnaLw9SpTEBue7vWySsOoAN3tIO0Edu2WmaL8FiXbryTBZve+pTNUii7DD9kGS1SInZ4kDEYibfFCSlqWMmEBmUg7mmFBgBJ571jexK9z0s2n2fqX4KEj1GulAGoG3UGhMEHnvnTqkWRr8kjcBR31p5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTMmM/lc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765735; x=1807301735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JlyLyzLKg29aOTNi9MnM+J183BDjfRHhdHOq3O1W9g4=;
  b=UTMmM/lc4D1E0o/B8LjNL0bL1dAoIc1l7eniY0hct8wGeWuPB5xrDj7o
   VzwswByY/Xpe14kaVhJtoA5Ty6VtFH+yDy82B2tBMm++62MIYFXMzDWbk
   Fms+XaeDNlB3GLOmx8HG45XHFwFTG/yBCsNuwvqswzJSzcVp2HK0fy/Ik
   TVSzC6FxvUNxowRjsxWN3TLTrIdy7aciZmBFECCmrW6lYgsI31C/Ee7xH
   Q4rOoCpyX61QvnqD4WDfnQR4LxnBh2pdjTQ3xH+6PcuGz4WuMDBziY4G6
   8QImoudBdbORhFnn7dDdb4waNVwmCMI7/efSNaIHToBWo3k7XInmeI+Au
   w==;
X-CSE-ConnectionGUID: tPV04ZBVRWSrQp2YG4JOTA==
X-CSE-MsgGUID: tOCPH9i1TiuD82X3JCnkAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176531"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: Lo1x1pktQdCiU+jYn59Stg==
X-CSE-MsgGUID: ES61e1kqTzOKKCPYHKXTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047540"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AD9BE1228C6;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mn-0U91;
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
Subject: [PATCH v12 33/86] media: uapi: Add new controls for camera sensor FLL and LLP
Date: Thu,  9 Apr 2026 23:14:08 +0300
Message-ID: <20260409201501.975242-34-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58438-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 689B03CF6E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analogue
crop rectangle and horizontal and vertical blanking.

The reason for adding the new controls is that they're much easier to use
as the user doesn't have to be concerned of the analogue crop in the same
context. Secondarily, the newly added common raw sensor model uses
different values for the same.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
 include/uapi/linux/v4l2-controls.h                     |  3 +++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 63e53c883db6..fb4dee1b4f94 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -201,3 +201,13 @@ For instance, a value of ``0x0001000300020003`` indicates binning by 3
     Sub-sampling is used to downscale an image, horizontally and vertically, by
     discarding a part of the image data. Typically sub-sampling produces lower
     quality images than binning.
+
+.. _image_source_control_frame_length:
+
+``V4L2_CID_FRAME_LENGTH_LINES (integer)``
+    Frame length in lines. The value of the control is the number of lines
+    captured in the sensor's pixel array added to the vertical blanking.
+
+``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
+    Line length in pixels. The value of the control is the number of pixels per
+    line captured in the sensor's pixel array added to the horizontal blanking.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 227bcb5a549d..bd23c5640722 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1163,6 +1163,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
 	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
 	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
+	case V4L2_CID_FRAME_LENGTH_LINES:	return "Frame Length in Lines";
+	case V4L2_CID_LINE_LENGTH_PIXELS:	return "Line Length in Pixels";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index acb6f9ad4d1b..60f0fb599926 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1253,6 +1253,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 14)
 #define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 15)
 
+#define V4L2_CID_FRAME_LENGTH_LINES		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 16)
+#define V4L2_CID_LINE_LENGTH_PIXELS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 17)
+
 /* Image processing controls */
 
 #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
-- 
2.47.3


