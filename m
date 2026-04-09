Return-Path: <linux-media+bounces-58446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA5EKW4J2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678D3CF526
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CF3F302D67D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD5034FF40;
	Thu,  9 Apr 2026 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqiNwkbP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2898345724
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765740; cv=none; b=fluHiBSIR0hy4bJod4RC/1vzJIQbV6WVxSPNabwmc3RTYBYMTAIgSSkKHsvZQPscCsQprPMIvtGWWdIcGoUH56DWnZceFoJLc+0qMewNs0UR3fcKcIs0y65tKPR06RCiXY8GxOnSVc5XgPzCDoK9K8s5iClSIqYeXd5v9xPZJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765740; c=relaxed/simple;
	bh=NhjCVd+Hc8U+rBbbFH9BnYqQ29KraH0ozG01IQyrXno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnhSVwJ4JhlBLIM3MNNgLlFCHvucVMxD+5/LXwuAD4IYq9EirArqPsVyuIAGmWkwKFaS5Try5XAlzPy3foOHtyHni+jpWg44uXuANyHeyU+nPbyeEZ4s4wjYzhoAkx23NHHW7NugoMpzrhdHlVXRA57qTVNweFmzyrHH3TIAaCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqiNwkbP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765739; x=1807301739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NhjCVd+Hc8U+rBbbFH9BnYqQ29KraH0ozG01IQyrXno=;
  b=IqiNwkbPNSJJeYHcgVfp99+TZj1kodDv9dy8WkCoZ5HN+NSlvQam/XNT
   S0ef9SnNv2vBI/V9K39kAQtCUPf8wtOJoESo1hzBRgP16fQZSctU272i6
   oHPL07Nk8UvotNRj7IhO19wIpVBYCHdnaWJ4n+lLeMn2x1h9nNYIT3bns
   2YBz8dBpZ1dd/fkbZqRsofvuPJft4aGe1VIEoKDRoYal/j/tILLPxAq61
   hfLPFeI82/7wjmApivTerTknrxT9UxekBXE9JzJ/+s/RIbQ4XDmbMuRlQ
   9PnAUg3b9XWJiaUtLlokeffjwNQ+xYxYJK6z9uc2HgE8HNDM43FX0p7Fy
   g==;
X-CSE-ConnectionGUID: EfdIEek5ROiKp3siOBBddw==
X-CSE-MsgGUID: xUFU/Y7AQ7SGEE5CxJ4y8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176652"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:33 -0700
X-CSE-ConnectionGUID: l0ETqy7lQNC5znswVOi91w==
X-CSE-MsgGUID: 2H6lJ593RS+lJ95lWJhwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047621"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CB09D122926;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045nJ-13De;
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
Subject: [PATCH v12 41/86] media: uapi: Add generic CSI-2 raw pixelformats for 16, 20, 24 and 28 bpp
Date: Thu,  9 Apr 2026 23:14:16 +0300
Message-ID: <20260409201501.975242-42-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58446-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4678D3CF526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add generic raw pixelformats for bit depths 16, 20, 24 and 28. These
formats are CSI-2 packed, apart from the 16-bit and 24-bit formats.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 212 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   4 +
 3 files changed, 217 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
index 708aa17b80b0..1992a797ce50 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
-************************************************************************************************************************************
-V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE')
-************************************************************************************************************************************
+**********************************************************************************************************************************************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
+**********************************************************************************************************************************************************************************************************************************************************************
 
 
 Generic line-based raw image data formats
@@ -175,3 +175,209 @@ Each cell is one byte. "P" denotes a pixel.
         P\ :sub:`11 bits 5--2` (bits 3--0)
       - P\ :sub:`31 bits 5--0` (bits 7--2),
         P\ :sub:`21 bits 5--4` (bits 1--0)
+
+.. _v4l2-pix-fmt-raw-16:
+
+V4L2_PIX_FMT_RAW_16
+-------------------
+
+V4L2_PIX_FMT_RAW_16 contains 16-bit image data, with each two consecutive
+bytes forming a pixel value. This format is typically used by CSI-2 receivers
+with a source that transmits MEDIA_BUS_FMT_RAW_16 and the CSI-2 receiver writes
+the received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_16.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 15--8`
+      - P\ :sub:`00 bits 7--0`
+      - P\ :sub:`10 bits 15--8`
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`20 bits 15--8`
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`30 bits 15--8`
+      - P\ :sub:`30 bits 7--0`
+    * - start + 8:
+      - P\ :sub:`01 bits 15--8`
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`11 bits 15--8`
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`21 bits 15--8`
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`31 bits 15--8`
+      - P\ :sub:`31 bits 7--0`
+
+.. _v4l2-pix-fmt-raw-csi2-20:
+
+V4L2_PIX_FMT_RAW_CSI2_20
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_20 contains 20-bit packed image data, with four bytes
+containing the top 8 bits of two pixels followed by lowest 4 bits of the pixels
+packed into one byte. This format is typically used by CSI-2 receivers with a
+source that transmits MEDIA_BUS_FMT_RAW_20 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_20.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 19--12`
+      - P\ :sub:`00 bits 11--4`
+      - P\ :sub:`10 bits 19--12`
+      - P\ :sub:`10 bits 11--4`
+      - P\ :sub:`10 bits 3--0` (bits 7--4),
+        P\ :sub:`00 bits 3--0` (bits 3--0)
+      - P\ :sub:`20 bits 19--12`
+      - P\ :sub:`20 bits 11--4`
+      - P\ :sub:`30 bits 19--12`
+      - P\ :sub:`30 bits 11--4`
+      - P\ :sub:`30 bits 3--0` (bits 7--4),
+        P\ :sub:`20 bits 3--0` (bits 3--0)
+    * - start + 10:
+      - P\ :sub:`01 bits 19--12`
+      - P\ :sub:`01 bits 11--4`
+      - P\ :sub:`11 bits 19--12`
+      - P\ :sub:`11 bits 11--4`
+      - P\ :sub:`11 bits 3--0` (bits 7--4),
+        P\ :sub:`01 bits 3--0` (bits 3--0)
+      - P\ :sub:`21 bits 19--12`
+      - P\ :sub:`21 bits 11--4`
+      - P\ :sub:`31 bits 19--12`
+      - P\ :sub:`31 bits 11--4`
+      - P\ :sub:`31 bits 3--0` (bits 7--4),
+        P\ :sub:`21 bits 3--0` (bits 3--0)
+
+.. _v4l2-pix-fmt-raw-24:
+
+V4L2_PIX_FMT_RAW_24
+-------------------
+
+V4L2_PIX_FMT_RAW_24 contains 24-bit packed image data, with each three bytes
+containing the value of one pixel. This format is typically used by CSI-2
+receivers with a source that transmits MEDIA_BUS_FMT_RAW_24 and the CSI-2
+receiver writes the received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_24.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 23--16`
+      - P\ :sub:`00 bits 15--8`
+      - P\ :sub:`00 bits 7--0`
+      - P\ :sub:`10 bits 23--16`
+      - P\ :sub:`10 bits 15--8`
+      - P\ :sub:`10 bits 7--0`
+      - P\ :sub:`20 bits 23--16`
+      - P\ :sub:`20 bits 15--8`
+      - P\ :sub:`20 bits 7--0`
+      - P\ :sub:`30 bits 23--16`
+      - P\ :sub:`30 bits 15--8`
+      - P\ :sub:`30 bits 7--0`
+    * - start + 12:
+      - P\ :sub:`01 bits 23--16`
+      - P\ :sub:`01 bits 15--8`
+      - P\ :sub:`01 bits 7--0`
+      - P\ :sub:`11 bits 23--16`
+      - P\ :sub:`11 bits 15--8`
+      - P\ :sub:`11 bits 7--0`
+      - P\ :sub:`21 bits 23--16`
+      - P\ :sub:`21 bits 15--8`
+      - P\ :sub:`21 bits 7--0`
+      - P\ :sub:`31 bits 23--16`
+      - P\ :sub:`31 bits 15--8`
+      - P\ :sub:`31 bits 7--0`
+
+.. _v4l2-pix-fmt-raw-csi2-28:
+
+V4L2_PIX_FMT_RAW_CSI2_28
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_28 contains 28-bit packed image data, with four bytes
+containing the top 8 bits of two pixels followed by lowest 4 bits of the pixels
+packed into one byte. This format is typically used by CSI-2 receivers with a
+source that transmits MEDIA_BUS_FMT_RAW_28 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_28.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 27--20`
+      - P\ :sub:`00 bits 13--6`
+      - P\ :sub:`10 bits 27--20`
+      - P\ :sub:`10 bits 13--6`
+      - P\ :sub:`00 bits 19--14` (bits 7--2),
+	P\ :sub:`00 bits 1--0` (bits 1--0)
+      - P\ :sub:`00 bits 5--2` (bits 7--4),
+	P\ :sub:`10 bits 17--14` (bits 3--0)
+      - P\ :sub:`10 bits 19--18` (bits 7--6),
+	P\ :sub:`10 bits 5--0` (bits 5--0)
+      - P\ :sub:`20 bits 27--20`
+      - P\ :sub:`20 bits 13--6`
+      - P\ :sub:`30 bits 27--20`
+      - P\ :sub:`30 bits 13--6`
+      - P\ :sub:`20 bits 19--14` (bits 7--2),
+	P\ :sub:`20 bits 1--0` (bits 1--0)
+      - P\ :sub:`20 bits 5--2` (bits 7--4),
+	P\ :sub:`30 bits 17--14` (bits 3--0)
+      - P\ :sub:`30 bits 19--18` (bits 7--6),
+	P\ :sub:`30 bits 5--0` (bits 5--0)
+    * - start + 14:
+      - P\ :sub:`01 bits 27--20`
+      - P\ :sub:`01 bits 13--6`
+      - P\ :sub:`11 bits 27--20`
+      - P\ :sub:`11 bits 13--6`
+      - P\ :sub:`01 bits 19--14` (bits 7--2),
+	P\ :sub:`01 bits 1--0` (bits 1--0)
+      - P\ :sub:`01 bits 5--2` (bits 7--4),
+	P\ :sub:`11 bits 17--14` (bits 3--0)
+      - P\ :sub:`11 bits 19--18` (bits 7--6),
+	P\ :sub:`11 bits 5--0` (bits 5--0)
+      - P\ :sub:`21 bits 27--20`
+      - P\ :sub:`21 bits 13--6`
+      - P\ :sub:`31 bits 27--20`
+      - P\ :sub:`31 bits 13--6`
+      - P\ :sub:`21 bits 19--14` (bits 7--2),
+	P\ :sub:`21 bits 1--0` (bits 1--0)
+      - P\ :sub:`21 bits 5--2` (bits 7--4),
+	P\ :sub:`31 bits 17--14` (bits 3--0)
+      - P\ :sub:`31 bits 19--18` (bits 7--6),
+	P\ :sub:`31 bits 5--0` (bits 5--0)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 8e99cdefead3..9e2d18fe1056 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1438,6 +1438,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_RAW_CSI2_10:	descr = "10-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CSI2_12:	descr = "12-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CSI2_14:	descr = "14-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_16:	descr = "16-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_20:	descr = "20-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_24:	descr = "24-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_28:	descr = "28-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3ba872deeeb9..db172ecb131b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -750,6 +750,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RAW_CSI2_10 v4l2_fourcc('R', 'A', 'C', 'A')
 #define V4L2_PIX_FMT_RAW_CSI2_12 v4l2_fourcc('R', 'A', 'C', 'C')
 #define V4L2_PIX_FMT_RAW_CSI2_14 v4l2_fourcc('R', 'A', 'C', 'E')
+#define V4L2_PIX_FMT_RAW_16 v4l2_fourcc('R', 'A', 'W', 'G')
+#define V4L2_PIX_FMT_RAW_CSI2_20 v4l2_fourcc('R', 'A', 'C', 'K')
+#define V4L2_PIX_FMT_RAW_24 v4l2_fourcc('R', 'A', 'W', 'O')
+#define V4L2_PIX_FMT_RAW_CSI2_28 v4l2_fourcc('R', 'A', 'C', 'S')
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
-- 
2.47.3


