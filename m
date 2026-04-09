Return-Path: <linux-media+bounces-58439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNg5BVgJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB343CF4ED
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECDFE303A975
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FF0346FAB;
	Thu,  9 Apr 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSxDXTQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE434751E
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765736; cv=none; b=WL2v3YUxxws46kUsORNom4FexPBMsU5RI1DAF+dYXeS1XmX7dHSUD9LiTXXZHEKcpwkOoP6Q3E/1smxZ2uZwFM73euRjtbZV3UdogaF3c93/EyoQ/ySZu+Bf7bb4CiDk5bD0BTWERwZGhZ8QF8g78SW4386m/fHgmnxvj7u/UnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765736; c=relaxed/simple;
	bh=gulW1dzIwWpc+ISFZK0Loy/aQHOvUskSDaHX1PkCUfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LW+wvRxYN7Fmbq0K2ulhEdH4juTdmzWvOLei71J+4yQkHwi5p2pR24UVp4zde0lbTb8+ZfYQMEHMhUCbWh3SzzqxJvrl9c0cNmsY0edkrEqOP50W0415IFeIBEMBJx1ssWEQUs95WZ5Voq2E9yVU71kmT4YX+KlkLoJOVh+IYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSxDXTQ2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765734; x=1807301734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gulW1dzIwWpc+ISFZK0Loy/aQHOvUskSDaHX1PkCUfo=;
  b=dSxDXTQ2nnn8od3cOrzjwxJ8uyWS8jiiaRmFlmTTrbH1PV/40pqLXhDx
   +lbEfqWUZZvGC1qT8glqrXD4SnbcVsyu2LBQhD0o1A72sHmcRU5/V8Kl6
   U1f1v9wBbNegBuXX+IcUZTP0w8r9duaOETUu96TL34W4BwaO0Rw8L6yuy
   xt48U1r/wQf0HTx0FIq7L1jm++so6rlKL2tZ8ukZ9xW0f++4QImQ/m1/L
   2VKrf+E28gl2IUgHRYMMnycYyFZOQ1XssdJwop9xGzz+Xx93dXCOv4F59
   KWq5eFypediLDSOEO/uF/AKf27FFG/bIaZzUanoU0I/di13+qiiZZa1pP
   Q==;
X-CSE-ConnectionGUID: ddAdPFOhRbKZxey47Ak6Lw==
X-CSE-MsgGUID: 9wl0AX1hRxSPDb4/scO15g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409155"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:18 -0700
X-CSE-ConnectionGUID: lZqm+jdKQFCMuOne2o0OTA==
X-CSE-MsgGUID: A/4J1YfDQ+6NT5xnoLTOKQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C18E1226BD;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lh-3a1y;
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
Subject: [PATCH v12 16/86] media: uapi: Correct generic CSI-2 metadata format 4cc
Date: Thu,  9 Apr 2026 23:13:51 +0300
Message-ID: <20260409201501.975242-17-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58439-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: CCB343CF4ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rework the pixelformat 4cc for CSI-2 generic metadata, the 16- and 24-bit
variants are not specific to CSI-2. This can be done as no driver uses
this yet and the interface is disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/metafmt-generic.rst             | 40 +++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  8 ++--
 include/uapi/linux/videodev2.h                | 12 +++---
 4 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 7226b4810088..07147b4d0dd2 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -2,7 +2,7 @@
 .. c:namespace:: V4L
 
 ********************************************************************************************************************************************************************************************************************************************************************************
-V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
+V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_META_FMT_GENERIC_CSI2_12 ('MECC'), V4L2_META_FMT_GENERIC_CSI2_14 ('MECE'), V4L2_META_FMT_GENERIC_16 ('METG'), V4L2_META_FMT_GENERIC_CSI2_20 ('MECK'), V4L2_META_FMT_GENERIC_24 ('METO')
 ********************************************************************************************************************************************************************************************************************************************************************************
 
 
@@ -29,7 +29,7 @@ is used on CSI-2 for 8 bits per :term:`Data Unit`.
 
 Additionally it is used for 16 bits per Data Unit when two bytes of metadata are
 packed into one 16-bit Data Unit. Otherwise the 16 bits per pixel dataformat is
-:ref:`V4L2_META_FMT_GENERIC_CSI2_16 <v4l2-meta-fmt-generic-csi2-16>`.
+:ref:`V4L2_META_FMT_GENERIC_16 <v4l2-meta-fmt-generic-16>`.
 
 **Byte Order Of V4L2_META_FMT_GENERIC_8.**
 Each cell is one byte. "M" denotes a byte of metadata.
@@ -112,8 +112,8 @@ the data is defined in the MIPI CCS specification.
 
 This format is also used in conjunction with 24 bits per :term:`Data Unit`
 formats that pack two bytes of metadata into one Data Unit. Otherwise the
-24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_CSI2_24
-<v4l2-meta-fmt-generic-csi2-24>`.
+24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_24
+<v4l2-meta-fmt-generic-24>`.
 
 This format is little endian.
 
@@ -185,16 +185,15 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
       - x
       - x
 
-.. _v4l2-meta-fmt-generic-csi2-16:
+.. _v4l2-meta-fmt-generic-16:
 
-V4L2_META_FMT_GENERIC_CSI2_16
------------------------------
+V4L2_META_FMT_GENERIC_16
+------------------------
 
-V4L2_META_FMT_GENERIC_CSI2_16 contains 8-bit generic metadata packed in 16-bit
-Data Units, with one padding byte after every byte of metadata. This format is
-typically used by CSI-2 receivers with a source that transmits
-MEDIA_BUS_FMT_META_16 and the CSI-2 receiver writes the received data to memory
-as-is.
+V4L2_META_FMT_GENERIC_16 contains 8-bit generic metadata packed in 16-bit Data
+Units, with one padding byte after every byte of metadata. This format is also
+used by CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_16 and
+the CSI-2 receiver writes the received data to memory as-is.
 
 The packing of the data follows the MIPI CSI-2 specification and the padding of
 the data is defined in the MIPI CCS specification.
@@ -205,7 +204,7 @@ Some devices support more efficient packing of metadata in conjunction with
 
 This format is little endian.
 
-**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
+**Byte Order Of V4L2_META_FMT_GENERIC_16.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
 .. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
@@ -287,16 +286,15 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
       - x
       - x
 
-.. _v4l2-meta-fmt-generic-csi2-24:
+.. _v4l2-meta-fmt-generic-24:
 
-V4L2_META_FMT_GENERIC_CSI2_24
------------------------------
+V4L2_META_FMT_GENERIC_24
+------------------------
 
-V4L2_META_FMT_GENERIC_CSI2_24 contains 8-bit generic metadata packed in 24-bit
-Data Units, with two padding bytes after every byte of metadata. This format is
-typically used by CSI-2 receivers with a source that transmits
-MEDIA_BUS_FMT_META_24 and the CSI-2 receiver writes the received data to memory
-as-is.
+V4L2_META_FMT_GENERIC_24 contains 8-bit generic metadata packed in 24-bit Data
+Units, with two padding bytes after every byte of metadata. This format is also
+used by CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_24 and
+the CSI-2 receiver writes the received data to memory as-is.
 
 The packing of the data follows the MIPI CSI-2 specification and the padding of
 the data is defined in the MIPI CCS specification.
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 3ac48d2076da..cf0eef64e503 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -105,7 +105,7 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12, true },
-	{ V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16,
+	{ V4L2_META_FMT_GENERIC_16, 16, 16, MEDIA_BUS_FMT_META_16,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 };
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5fda3835f680..8e99cdefead3 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1489,9 +1489,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
-	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_16:	descr = "8-bit Generic Meta, 16b"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
-	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_24:	descr = "8-bit Generic Meta, 24b"; break;
 
 	default:
 		/* Compressed formats */
@@ -1579,9 +1579,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_META_FMT_GENERIC_CSI2_10:
 		case V4L2_META_FMT_GENERIC_CSI2_12:
 		case V4L2_META_FMT_GENERIC_CSI2_14:
-		case V4L2_META_FMT_GENERIC_CSI2_16:
+		case V4L2_META_FMT_GENERIC_16:
 		case V4L2_META_FMT_GENERIC_CSI2_20:
-		case V4L2_META_FMT_GENERIC_CSI2_24:
+		case V4L2_META_FMT_GENERIC_24:
 			fmt->flags |= V4L2_FMT_FLAG_META_LINE_BASED;
 			break;
 		default:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 901c2b788edd..fe5bb00ffe91 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -901,12 +901,12 @@ struct v4l2_pix_format {
  * adding new ones!
  */
 #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
-#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_16	v4l2_fourcc('M', 'E', 'T', 'G') /* Generic 16-bit 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_24	v4l2_fourcc('M', 'E', 'T', 'O') /* Generic 24-bit 8-bit metadata */
 #endif
 
 /* priv field value to indicates that subsequent fields are valid. */
-- 
2.47.3


