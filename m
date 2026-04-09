Return-Path: <linux-media+bounces-58410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJKdBvIJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:20:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC713CF63F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68782308002F
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5656033DEFC;
	Thu,  9 Apr 2026 20:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVy5ii5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC433CEA7
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765725; cv=none; b=Ayb9WjeFRaSZKCe/bEPeWmFa8caHKQB8dZguMYL6UwUVlJjSjCOD6OpykZZ+d0i5+g7NjXgyQAgcD6NC4FaYR08/sTPNtXuBq2zmOZ8rb4fPWZq6OmxPDNPGDbRW8nDMDArA5rb6pJz93kYraFyLQApJfrW92vu2F+kxmdp3ixY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765725; c=relaxed/simple;
	bh=4I6GdTy3yn4a4WACl2C68P/ld2VbTNIz4u/MgZMPLUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFfvWmQIO78juzb/eE7JSfp5ZGhnSRaIgQThgq5nmyS76A+ue7l4LwZTqav7Dt+GEt5asJgl5tpYoC2BPkYZDAWHRYQ76knkaVeBRDL2+MKkwsBsZeZmFwT5Z4iunU+D2BF38Zez85ihc0GVtRoBdmkbgfGQ/SALH9oKpu2o60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVy5ii5t; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765724; x=1807301724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4I6GdTy3yn4a4WACl2C68P/ld2VbTNIz4u/MgZMPLUY=;
  b=nVy5ii5tmeSooUEyHOzHc0dSY3IBXsx8Unj0o9+GlipBfeGqg6TrViLN
   9P5idP8g4QdoKvNrsfrrd1wdsRbJ3nv3n6oZvSYsQpLLXK1ECbVp2fGv+
   RyLUjTAfasLuRCpWN/kTpT1NBILkRROW8f+L/TgzU7FuQMntjkANWE/4/
   8+SymU4wu0ATM12NXEpt6ar1B6yVo3UnF+3Ejbn6jZX1l9jOevn7t0PHu
   s42R4G6P63v4ta+OTA0hikhzpgct3oQezSDauqwzU9wnnzGLhYv6ZmVUe
   khBhT0jzkSgml6fH7X6ddghDs0uKN8IqT1HiSIA5+5FSvs6ocYVQ3Anzx
   g==;
X-CSE-ConnectionGUID: rpzkXvshRPmvC2BOMO4DDg==
X-CSE-MsgGUID: yVQTO/sTQqCfMyQGhtuz9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408972"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408972"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: x2+9xIPTRu+Jz13ulPE5tg==
X-CSE-MsgGUID: 8VFOmKTsT9KJUoWADBmZmA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 35138121883;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045kn-2be4;
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
Subject: [PATCH v12 02/86] media: uapi: Add generic CSI-2 raw pixelformats
Date: Thu,  9 Apr 2026 23:13:37 +0300
Message-ID: <20260409201501.975242-3-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58410-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACC713CF63F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add generic raw pixelformats for bit depths 8, 10, 12 and 14. These
formats are CSI-2 packed, apart from the 8-bit format.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 175 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 4 files changed, 186 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
new file mode 100644
index 000000000000..254f8f18c7c5
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -0,0 +1,175 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE')
+************************************************************************************************************************************
+
+
+Generic line-based raw image data formats
+
+
+Description
+===========
+
+These generic raw image data formats define the memory layout of the data without
+defining the order of the colour components or even the colour components
+themselves.
+
+.. _v4l2-pix-fmt-raw-8:
+
+V4L2_PIX_FMT_RAW_8
+------------------
+
+The V4L2_PIX_FMT_RAW_8 format is a plain 8-bit raw pixel data format. This
+format is used on CSI-2 for 8 bits per :term:`Data Unit`.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_8.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00`
+      - P\ :sub:`10`
+      - P\ :sub:`20`
+      - P\ :sub:`30`
+    * - start + 4:
+      - P\ :sub:`01`
+      - P\ :sub:`11`
+      - P\ :sub:`21`
+      - P\ :sub:`31`
+
+.. _v4l2-pix-fmt-raw-csi2-10:
+
+V4L2_PIX_FMT_RAW_CSI2_10
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four bytes
+containing the top 8 bits of the pixels followed by lowest 2 bits of the pixels
+packed into one byte. This format is typically used by CSI-2 receivers with
+a source that transmits MEDIA_BUS_FMT_RAW_10 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 9--2`
+      - P\ :sub:`10 bits 9--2`
+      - P\ :sub:`20 bits 9--2`
+      - P\ :sub:`30 bits 9--2`
+      - P\ :sub:`00 bits 1--0` (bits 1--0),
+        P\ :sub:`10 bits 1--0` (bits 3--2),
+        P\ :sub:`20 bits 1--0` (bits 5--4),
+        P\ :sub:`30 bits 1--0` (bits 7--6)
+    * - start + 5:
+      - P\ :sub:`01 bits 9--2`
+      - P\ :sub:`11 bits 9--2`
+      - P\ :sub:`21 bits 9--2`
+      - P\ :sub:`31 bits 9--2`
+      - P\ :sub:`01 bits 1--0` (bits 1--0),
+        P\ :sub:`11 bits 1--0` (bits 3--2),
+        P\ :sub:`21 bits 1--0` (bits 5--4),
+        P\ :sub:`31 bits 1--0` (bits 7--6)
+
+.. _v4l2-pix-fmt-raw-csi2-12:
+
+V4L2_PIX_FMT_RAW_CSI2_12
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_12 contains 12-bit packed image data, with two bytes
+containing the top 8 bits of the pixels followed by lowest 4 bits of the pixels
+packed into 1 byte. This format is typically used by CSI-2 receivers with
+a source that transmits MEDIA_BUS_FMT_RAW_12 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_12.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 11--4`
+      - P\ :sub:`10 bits 11--4`
+      - P\ :sub:`00 bits 3--0` (bits 3--0),
+        P\ :sub:`10 bits 3--0` (bits 7--4)
+      - P\ :sub:`20 bits 11--4`
+      - P\ :sub:`30 bits 11--4`
+      - P\ :sub:`20 bits 3--0` (bits 3--0),
+        P\ :sub:`30 bits 3--0` (bits 7--4)
+    * - start + 6:
+      - P\ :sub:`01 bits 11--4`
+      - P\ :sub:`11 bits 11--4`
+      - P\ :sub:`01 bits 3--0` (bits 3--0),
+        P\ :sub:`11 bits 3--0` (bits 7--4)
+      - P\ :sub:`21 bits 11--4`
+      - P\ :sub:`31 bits 11--4`
+      - P\ :sub:`21 bits 3--0` (bits 3--0),
+        P\ :sub:`31 bits 3--0` (bits 7--4)
+
+.. _v4l2-pix-fmt-raw-csi2-14:
+
+V4L2_PIX_FMT_RAW_CSI2_14
+------------------------
+
+V4L2_PIX_FMT_RAW_CSI2_14 contains 14-bit packed image data, with four bytes
+containing the top 8 bits of the pixels followed by lowest 6 bits of the pixels
+packed into three bytes. This format is typically used by CSI-2 receivers with a
+source that transmits MEDIA_BUS_FMT_RAW_14 and the CSI-2 receiver writes the
+received data to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification.
+
+**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_14.**
+Each cell is one byte. "P" denotes a pixel.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{2cm}|p{2cm}|p{2cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 13--6`
+      - P\ :sub:`10 bits 13--6`
+      - P\ :sub:`20 bits 13--6`
+      - P\ :sub:`30 bits 13--6`
+      - P\ :sub:`10 bits 1--0` (bits 7--6),
+        P\ :sub:`00 bits 5--0` (bits 5--0)
+      - P\ :sub:`20 bits 3--0` (bits 7--4),
+        P\ :sub:`10 bits 5--2` (bits 3--0)
+      - P\ :sub:`30 bits 5--0` (bits 7--2),
+        P\ :sub:`20 bits 5--4` (bits 1--0)
+    * - start + 7:
+      - P\ :sub:`01 bits 13--6`
+      - P\ :sub:`11 bits 13--6`
+      - P\ :sub:`21 bits 13--6`
+      - P\ :sub:`31 bits 13--6`
+      - P\ :sub:`11 bits 1--0` (bits 7--6),
+        P\ :sub:`01 bits 5--0` (bits 5--0)
+      - P\ :sub:`21 bits 3--0` (bits 7--4),
+        P\ :sub:`11 bits 5--2` (bits 3--0)
+      - P\ :sub:`31 bits 5--0` (bits 7--2),
+        P\ :sub:`21 bits 5--4` (bits 1--0)
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 71b29267488f..520a8ec438c9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -26,6 +26,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     pixfmt-indexed
     pixfmt-rgb
     pixfmt-bayer
+    pixfmt-raw-generic
     yuv-formats
     hsv-formats
     depth-formats
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 37d33d4a363d..5fda3835f680 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_RAW_8:	descr = "8-bit Raw"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_10:	descr = "10-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_12:	descr = "12-bit Raw, CSI-2 Packed"; break;
+	case V4L2_PIX_FMT_RAW_CSI2_14:	descr = "14-bit Raw, CSI-2 Packed"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..901c2b788edd 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -745,6 +745,12 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
 
+/* Generic CSI-2 packed raw pixel formats */
+#define V4L2_PIX_FMT_RAW_8 v4l2_fourcc('R', 'A', 'W', '8')
+#define V4L2_PIX_FMT_RAW_CSI2_10 v4l2_fourcc('R', 'A', 'C', 'A')
+#define V4L2_PIX_FMT_RAW_CSI2_12 v4l2_fourcc('R', 'A', 'C', 'C')
+#define V4L2_PIX_FMT_RAW_CSI2_14 v4l2_fourcc('R', 'A', 'C', 'E')
+
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
 #define V4L2_PIX_FMT_HSV32 v4l2_fourcc('H', 'S', 'V', '4')
-- 
2.47.3


