Return-Path: <linux-media+bounces-58423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHzoMh4J2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 917FA3CF478
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63EC63035E75
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77080343D9D;
	Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfqkXjDk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6E33F5B3
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765731; cv=none; b=fpoh+lxM77c0gbInpB82WXp5uubwGAOuzDla/9lDdW9g+AFKV4yfRKl8rDwncfcS/dbIzMVZwUE/lQqoaSkBBFwMmJ5aHxrfMz06APqv3vkg50ZCOwyCeouigmNeA33oBmI8T+QfZcSd5TgZ9an57P38atTto1K7zqap0h4lg00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765731; c=relaxed/simple;
	bh=x8ItTsn9GSp1LPnOGvE/pofEkvcawQvPxYIZ7abuZLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVcgzcuTNMlMoW+CaVKpu03BMI0fkk+8/3gDJbP6X0twhTx7dCb8lqxFpbmwyiAqLwcQjRXgGKvtK6HfdCxDpaHjr8G1qxZxfhisMZ09qtGcCzcGxlXhSLTTLfz2lIr8hNM314SL1XTnhPQkz22GOkVc+DxGVX0IuN2TQxd8IX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfqkXjDk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765730; x=1807301730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x8ItTsn9GSp1LPnOGvE/pofEkvcawQvPxYIZ7abuZLA=;
  b=gfqkXjDkoCuErUe6q4v9rzWh2NB2xpN73+6O0AyFxGkc3z1uWymObmWJ
   2bcm/weXJgxz7qFh24gvvkUypMDfJY7gl8ilPvxI9J3qAT3fnGTvGL621
   MYEXcRDhyuDamPkfJJ3oYSSF9wk0avmHwqMwPohSNupS05q03guUFil3D
   4jyrFZBsl98RR9QBDubbZuA+H1HUuYQwyaIwSCGif8+fbVVgNFN+RZcVq
   Bq9k/kyzm+DPo+4WF5pnDQ/3ddm/YVUt8R+nWawJru4IrXF/lMsbbSRsy
   PsFc1HggrAuGc0XrL/bH8DdKQq9b0PYeAuW9kfJVHjO9qpngcjeRLVR5N
   w==;
X-CSE-ConnectionGUID: 3uZgJYY6SjaJjAmpsOVOiw==
X-CSE-MsgGUID: 98xspmc6T2GgRC+B8JvvRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409076"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: oe7ytwfZQWqndYJ07gMS6g==
X-CSE-MsgGUID: 3U8hvLmbSmOf3dTuGZ1hpQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 430FC12231C;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lB-2zox;
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
Subject: [PATCH v12 08/86] media: v4l: uapi: Add a control for color pattern flipping effect
Date: Thu,  9 Apr 2026 23:13:43 +0300
Message-ID: <20260409201501.975242-9-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58423-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 917FA3CF478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a bitmask control (V4L2_CID_CFA_PATTERN_FLIP) to tell whether flipping
results in a change in the sensor's Color Filter Array (CFA) pattern,
separately horizontally and vertically. The information is essential for
raw formats when using generic raw mbus codes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  2 ++
 include/uapi/linux/v4l2-controls.h                   |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 2328ac99e97a..f3e4428c4bf1 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -138,3 +138,15 @@ Image Source Control IDs
         the top-left and bottom-right pixels, a blue filter in the top-right
         pixel, and a red filter in the bottom-left pixel.
       - 3
+
+``V4L2_CID_CFA_PATTERN_FLIP (bitmask)``
+    This control determines whether the horizontal or vertical flipping controls
+    (V4L2_CID_HFLIP and V4L2_CID_VFLIP) have an effect on the pixel order of the
+    output color pattern. Macros ``V4L2_CFA_PATTERN_FLIP_HORIZONTAL`` and
+    ``V4L2_CFA_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If either
+    horizontal or vertical bit is set, the readout pattern order is that of the
+    reversed readout. ``V4L2_CFA_PATTERN_FLIP_BOTH`` for setting both
+    ``V4L2_CFA_PATTERN_FLIP_HORIZONTAL`` and ``V4L2_CFA_PATTERN_FLIP_VERTICAL``
+    is provided as well.
+
+    This is a read-only control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 4fafc7a3c233..32a4b1b3fc0e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1158,6 +1158,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
+	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1489,6 +1490,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
 	case V4L2_CID_CONFIG_MODEL:
+	case V4L2_CID_CFA_PATTERN_FLIP:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 78c6fc69b1c1..d5cedb28a564 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1241,6 +1241,12 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CFA_PATTERN_BGGR			2U
 #define V4L2_CFA_PATTERN_GBRG			3U
 
+#define V4L2_CID_CFA_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_CFA_PATTERN_FLIP_HORIZONTAL	(1U << 0)
+#define V4L2_CFA_PATTERN_FLIP_VERTICAL		(1U << 1)
+#define V4L2_CFA_PATTERN_FLIP_BOTH \
+	(V4L2_CFA_PATTERN_FLIP_HORIZONTAL | V4L2_CFA_PATTERN_FLIP_VERTICAL)
+
 
 /* Image processing controls */
 
-- 
2.47.3


