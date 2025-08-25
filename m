Return-Path: <linux-media+bounces-40971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43805B33BDE
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E7116833C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2F02DF3EC;
	Mon, 25 Aug 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2ID3oOp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680902DE70B
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115512; cv=none; b=LXRj5Sr7z4HmGVt1BsuvyAnpyH4os58g/m7MeVChMfckCoh9bzAIVNK1IgXaHzPiXuKWy/2Mi9nKlH6BKeGsvEm2xpEpRGpFKfKU3fghcB8nCvlKxaTt+Vqt6xjswxJ/y0PkzR7ZLW6YudIMwXuf52nTzxsKdYB8nYqpCJYLBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115512; c=relaxed/simple;
	bh=9ZeRhst3sBMQs76ISNCdICn3TdorePkaXnXQpTSEaVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFDkBFG0Famt+jNaJ+hOydFfQy6/2H738/E4j9P2uI6jeyzZmFIBVawSPGM8yhXjxmT4Q7oSJfZpD4lqolIDNkNBxJEC/T3895F9QInys6/tH5ccb7uMbQJhdSHO+xtzmoWVLW9gQ/VQaDmQg8209sFLoB2aWR6i5Op5rO//Dck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2ID3oOp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115511; x=1787651511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ZeRhst3sBMQs76ISNCdICn3TdorePkaXnXQpTSEaVw=;
  b=W2ID3oOpUBtKOu6qQ8T4wZqAPrOcfC0agcGVnjlDlWJrosvJJ/jLwi2R
   Iu38ZnmQV/3PHukSnYi0dQCNm4jyjuXTFFzMvfLwRnkkRS9AdMBxJHP+N
   xvaIVLlDCDRvPNfzjUQ/nFAfr+jtdy6B1K88Kn7SKbkFSem4MILdfIHM2
   p2Tn2F1B9fNggF7dbBicolN0cuQ6Fr1on2N6e7KxUYzm13WpCf5Mlq9Bd
   A1FRi4C3NCDWpIqfdOrTBHUJVULmifG1KrIG7Nexykt+xtpqHF5MFIQHA
   1isuTUIFEp2JC0jUnAnm87of5hP/wS22JEYC9lHsoNThYO29PVX9B0LKa
   g==;
X-CSE-ConnectionGUID: ILac0Yq3QN+fzLN6QoADXg==
X-CSE-MsgGUID: cSLu3BOQR2+lljAhgo16QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032240"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: R8ZKbiIrR6qSiSXjgLhWkw==
X-CSE-MsgGUID: N/5TtOwuR2SAwYBnkXJjFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431082"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9C47A121FEC;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agB-2X5l;
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
Subject: [PATCH v11 37/66] media: uapi: Correct generic CSI-2 metadata format 4cc
Date: Mon, 25 Aug 2025 12:50:38 +0300
Message-ID: <20250825095107.1332313-38-sakari.ailus@linux.intel.com>
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

Rework the pixelformat 4cc for CSI-2 generic metadata, the 16- and 24-bit
variants are not specific to CSI-2. This can be done as no driver uses
this yet and the interface is disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/metafmt-generic.rst             | 37 +++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |  8 ++--
 include/uapi/linux/videodev2.h                | 12 +++---
 4 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index e8824b5a65d6..ca960907efde 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
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
 
@@ -185,14 +185,14 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
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
+V4L2_META_FMT_GENERIC_16 contains 8-bit generic metadata packed in 16-bit Data
+Units, with one padding byte after every byte of metadata. This format is
+also used by CSI-2 receivers with a source that transmits
 MEDIA_BUS_FMT_META_16 and the CSI-2 receiver writes the received data to memory
 as-is.
 
@@ -205,7 +205,7 @@ Some devices support more efficient packing of metadata in conjunction with
 
 This format is little endian.
 
-**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
+**Byte Order Of V4L2_META_FMT_GENERIC_16.**
 Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
 
 .. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
@@ -287,16 +287,15 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
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
index f3f3bc0615e5..e1306b9510e7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -91,7 +91,7 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10, true },
 	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12, true },
-	{ V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16,
+	{ V4L2_META_FMT_GENERIC_16, 16, 16, MEDIA_BUS_FMT_META_16,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 };
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e538c1230631..d197002d640d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1487,9 +1487,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
@@ -1576,9 +1576,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index c4c4f3eb67e1..6a5d9ac7bdb9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -896,12 +896,12 @@ struct v4l2_pix_format {
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
2.47.2


