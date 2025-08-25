Return-Path: <linux-media+bounces-40946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0CB33BE0
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2891B2798C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B820F2D77ED;
	Mon, 25 Aug 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2G3O6OF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8252D7390
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115499; cv=none; b=nVmdiNKSI/og6cMSHrOY7HvIszlikWAIKu2J/AOZj2uq3SyRQndwGO6RyLTwrbN2eISGO7P6vA4RsdnxWdsSgx+URT6w4TlJpOuUsJicagAAzv9Gh5YE2MUvaAOvj83Xuaqqk8Crm6XaVl5doHxDIGtxneyYAEhO8GuQHuKDh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115499; c=relaxed/simple;
	bh=r48BCv8u7QrBiX5ufb6fG52P1PKHgyD532I8yygeI+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfTIAqqoqChbvfDZLf0qTXFRvAdNrd5nfW/kdqzcAz08DyHk1b601jRq9R9o0/PIoD+BBXnbcVAErNzFF6NRlHLmcgKPgYAUj4dRfkxeE4NScM2HnyuiUIIjifW3TCcO2aaVWssmTzlS2pMxLVAtO2+OnS79PN4CI1KH2uVP+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2G3O6OF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115497; x=1787651497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r48BCv8u7QrBiX5ufb6fG52P1PKHgyD532I8yygeI+w=;
  b=J2G3O6OFyVRb9IgtFwdWVdrQG5oFGMLeKR/TbJzz5bRfTJWBrMHw/dPG
   nS6Xp7w76ukABnczV56TnSUmCmNmdw+F2JiyPhWBgVngm3dakr214fmrj
   sP9YTyuXiTeNuCBh2AzCunctngRxltQGw6NzfqNyAn+UPtsrOpkO8P/yJ
   dWN3XsdENq+pDTxC1GCh9Os74NSO4zvKIEp9F8gwTskRl7IXQb+9u6vec
   5zJY4A60gVoBg6rVDWlQMpgrbIGrQQNTep4nNlcXwFi6JYExY31TFfhqA
   Qvrx2YlwlFXkp/+n5OFYvhYI5WM3NIKsnWDbk9EFItFqIlxbTeaxcbZhU
   g==;
X-CSE-ConnectionGUID: MaV1HHPuSL2Nm+MSZ3Qhhg==
X-CSE-MsgGUID: VzjUBzfrQU+4pF2WcrbBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69695952"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69695952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:35 -0700
X-CSE-ConnectionGUID: mupBPoMyRpG5Z78/lZZ4uw==
X-CSE-MsgGUID: N2UWCZhQTP+AG0Pu1G3NmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200195492"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:28 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4411A121FAC;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005aeP-10as;
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
Subject: [PATCH v11 15/66] media: uapi: Add generic CSI-2 raw pixelformats
Date: Mon, 25 Aug 2025 12:50:16 +0300
Message-ID: <20250825095107.1332313-16-sakari.ailus@linux.intel.com>
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

Add generic raw pixelformats for bit depths 8, 10, 12 and 14. These
formats are CSI-2 packed, apart from the 8-bit format.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/pixfmt-raw-generic.rst          | 175 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
 include/uapi/linux/videodev2.h                |   6 +
 4 files changed, 186 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
new file mode 100644
index 000000000000..9fda7a36cd3a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
@@ -0,0 +1,175 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+************************************************************************************************************************************************************************************************************************************************************************************
+V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
+************************************************************************************************************************************************************************************************************************************************************************************
+
+
+Generic line-based image data formats
+
+
+Description
+===========
+
+These generic raw image data formats define the memory layout of the data
+without defining the order of the pixels in the format or even the CFA (Colour
+Filter Array) itself. See also :ref:`source routes <subdev-routing>`.
+
+.. _v4l2-pix-fmt-raw-8:
+
+V4L2_PIX_FMT_RAW_8
+------------------
+
+The V4L2_PIX_FMT_GENERIC_8 format is a plain 8-bit raw pixel data format. This
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
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
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
+      - P\ :sub:`00 bits 1--0` (bits 1--0)
+        P\ :sub:`10 bits 1--0` (bits 3--2)
+        P\ :sub:`20 bits 1--0` (bits 5--4)
+        P\ :sub:`30 bits 1--0` (bits 7--6)
+    * - start + 5:
+      - P\ :sub:`01 bits 9--2`
+      - P\ :sub:`11 bits 9--2`
+      - P\ :sub:`21 bits 9--2`
+      - P\ :sub:`31 bits 9--2`
+      - P\ :sub:`01 bits 1--0` (bits 1--0)
+        P\ :sub:`11 bits 1--0` (bits 3--2)
+        P\ :sub:`21 bits 1--0` (bits 5--4)
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
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
+
+.. flat-table:: Sample 4x2 Image Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8
+
+    * - start + 0:
+      - P\ :sub:`00 bits 11--4`
+      - P\ :sub:`10 bits 11--4`
+      - P\ :sub:`00 bits 3--0` (bits 3--0)
+        P\ :sub:`10 bits 3--0` (bits 7--4)
+      - P\ :sub:`20 bits 11--4`
+      - P\ :sub:`30 bits 11--4`
+      - P\ :sub:`20 bits 3--0` (bits 3--0)
+        P\ :sub:`30 bits 3--0` (bits 7--4)
+    * - start + 6:
+      - P\ :sub:`01 bits 11--4`
+      - P\ :sub:`11 bits 11--4`
+      - P\ :sub:`01 bits 3--0` (bits 3--0)
+        P\ :sub:`11 bits 3--0` (bits 7--4)
+      - P\ :sub:`21 bits 11--4`
+      - P\ :sub:`31 bits 11--4`
+      - P\ :sub:`21 bits 3--0` (bits 3--0)
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
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.8cm}|p{1.8cm}|
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
+      - P\ :sub:`10 bits 1--0` (bits 7--6)
+        P\ :sub:`00 bits 5--0` (bits 5--0)
+      - P\ :sub:`20 bits 3--0` (bits 7--4)
+        P\ :sub:`10 bits 5--2` (bits 3--0)
+      - P\ :sub:`30 bits 5--0` (bits 7--2)
+        P\ :sub:`20 bits 5--4` (bits 1--0)
+    * - start + 7:
+      - P\ :sub:`01 bits 13--6`
+      - P\ :sub:`11 bits 13--6`
+      - P\ :sub:`21 bits 13--6`
+      - P\ :sub:`31 bits 13--6`
+      - P\ :sub:`11 bits 1--0` (bits 7--6)
+        P\ :sub:`01 bits 5--0` (bits 5--0)
+      - P\ :sub:`21 bits 3--0` (bits 7--4)
+        P\ :sub:`11 bits 5--2` (bits 3--0)
+      - P\ :sub:`31 bits 5--0` (bits 7--2)
+        P\ :sub:`21 bits 5--4` (bits 1--0)
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..d917190c717d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -25,6 +25,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     pixfmt-indexed
     pixfmt-rgb
     pixfmt-bayer
+    pixfmt-raw-generic
     yuv-formats
     hsv-formats
     depth-formats
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33..e538c1230631 100644
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
index 3dd9fa45dde1..c4c4f3eb67e1 100644
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
2.47.2


