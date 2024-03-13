Return-Path: <linux-media+bounces-6941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8787A36C
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F751C21676
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC35D168D0;
	Wed, 13 Mar 2024 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egZJQU1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044112B6F
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314753; cv=none; b=M1oA1zd7/vwpqaJxzCJFKWukOEf0UIMKY9JcWfnDjWTuICCqLSBbx5/fD1tl+Akl/cJIwkOfaf8+25/0pxM68TqlcZVYACcLZy/rukX4eNVRXEesCshnyhW+EG4b8+jHR002tZ063nWqioZXDE+MEerOqgO1EFsLT1a5nNdIFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314753; c=relaxed/simple;
	bh=wZBCxXVX/lewPWaqflZvfTBlxVnh60pwwHhvkDEtpL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lHl3ME+IVN+es9deDth0nHXNcU/n4sQKWUcEXwQsjGgp0Wf1XiQ0EQhFCN6DxbUxcL2UgYSJCeU9G0n07caZkUU6CQ3+rVOBEZpnjKceIgpcaU9dy9C/O+C3z0/jNewpC3bxwuu90lqx9kflXkfX9nn+VuP6YWWXuySjyR989HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egZJQU1L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314751; x=1741850751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZBCxXVX/lewPWaqflZvfTBlxVnh60pwwHhvkDEtpL8=;
  b=egZJQU1LRTQGdflKjjnROKt0nGj3vO1KASELP0pkmka0bQNw6mZkJHir
   Uq2pKV0T/qxvhekRNmo5+eHFFWcu8SGL1gRU9ivk9KQ/ZzKn5rv1rzNo7
   bxbOq217ivOdBbPcTkTpXNEfNQEFldb4CH+e9OxZX+rJq576qj0E2VA2C
   g7sikgc7gJuXxllCJckx2HwfISqiuEitjXwA+OHMw3W4/vWme9JII+ds6
   zI4gu5PG5EmzDiRcbxm9ctDvQYQcP6ROXfwGPaiifAtlCI4NK9uyxfjTS
   lJWvuusoFLSeRG7mbpcuBmuymHClX3nA7F0JFbnXBYUYIRodaRPplEFd0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575530"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816341"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A1CED11F853;
	Wed, 13 Mar 2024 09:25:25 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 05/38] media: uapi: Add generic 8-bit metadata format definitions
Date: Wed, 13 Mar 2024 09:24:43 +0200
Message-Id: <20240313072516.241106-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generic 8-bit metadata formats define the in-memory data layout but not
the format of the data itself. The reasoning for having such formats is to
allow CSI-2 receiver drivers to receive and DMA drivers to write the data
to memory without knowing a large number of device specific formats.

These formats may be used only in conjunction of a Media controller
pipeline where the internal pad of the source sub-device defines the
specific format of the data (using an mbus code).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-generic.rst             | 304 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   7 +
 include/uapi/linux/videodev2.h                |   8 +
 5 files changed, 322 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 43988516acdd..f375b820ab68 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -506,6 +506,8 @@ source pads.
 
     subdev-formats
 
+.. _subdev-routing:
+
 Streams, multiplexed media pads and internal routing
 ----------------------------------------------------
 
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0bb61fc5bc00..919f595576b9 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -19,3 +19,4 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
     metafmt-vivid
+    metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
new file mode 100644
index 000000000000..2ebab1f895e0
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -0,0 +1,304 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+**************************************************************************************************************************************************************************************************************************************************************************************************************************
+V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
+**************************************************************************************************************************************************************************************************************************************************************************************************************************
+
+
+Generic line-based metadata formats
+
+
+Description
+===========
+
+These generic line-based metadata formats define the memory layout of the data
+without defining the format or meaning of the metadata itself. These formats may
+only be used with a Media controller pipeline where the more specific format is
+defined in an :ref:`internal source pad <MEDIA-PAD-FL-INTERNAL>` of the source
+sub-device. See also :ref:`source routes <subdev-routing>`.
+
+.. _v4l2-meta-fmt-generic-8:
+
+V4L2_META_FMT_GENERIC_8
+-----------------------
+
+The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
+
+This format is also used on CSI-2 for both 8 bits per ``Data unit
+<media-glossary-data-unit>`` as well as for 16 bits per Data unit when two bytes
+of metadata are packed into one 16-bit Data unit.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_8.**
+Each cell is one byte. "M" denotes a byte of metadata.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+    * - start + 4:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+
+.. _v4l2-meta-fmt-generic-csi2-10:
+
+V4L2_META_FMT_GENERIC_CSI2_10
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_10 contains packed 8-bit generic metadata, 10 bits
+for each 8 bits of data. Every four bytes of metadata is followed by a single
+byte of padding. The way the data is packed follows the MIPI CSI-2 specification
+and the padding is defined in the MIPI CCS specification.
+
+This format is also used in conjunction with 20 bits per ``Data unit
+<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
+Data unit.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
+Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - X
+    * - start + 5:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - X
+
+.. _v4l2-meta-fmt-generic-csi2-12:
+
+V4L2_META_FMT_GENERIC_CSI2_12
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_12 contains packed 8-bit generic metadata, 12 bits
+for each 8 bits of data. Every four bytes of metadata is followed by a single
+byte of padding. The way the data is packed follows the MIPI CSI-2 specification
+and the padding is defined in the MIPI CCS specification.
+
+This format is also used in conjunction with 24 bits per ``Data unit
+<media-glossary-data-unit>`` formats that pack two bytes of metadata into one
+Data unit.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
+Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - X
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - X
+    * - start + 6:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - X
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - X
+
+.. _v4l2-meta-fmt-generic-csi2-14:
+
+V4L2_META_FMT_GENERIC_CSI2_14
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_14 contains packed 8-bit generic metadata, 14 bits
+for each 8 bits of data. Every four bytes of metadata is followed by three bytes
+of padding. The way the data is packed follows the MIPI CSI-2 specification and
+the padding is defined in the MIPI CCS specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
+Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - X
+      - X
+      - X
+    * - start + 7:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - X
+      - X
+      - X
+
+.. _v4l2-meta-fmt-generic-csi2-16:
+
+V4L2_META_FMT_GENERIC_CSI2_16
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_16 contains packed 8-bit generic metadata, 16 bits
+for each 8 bits of data. Every byte of metadata is followed by one byte of
+padding. The way the data is packed follows the MIPI CSI-2 specification and the
+padding is defined in the MIPI CCS specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
+Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - X
+      - M\ :sub:`10`
+      - X
+      - M\ :sub:`20`
+      - X
+      - M\ :sub:`30`
+      - X
+    * - start + 8:
+      - M\ :sub:`01`
+      - X
+      - M\ :sub:`11`
+      - X
+      - M\ :sub:`21`
+      - X
+      - M\ :sub:`31`
+      - X
+
+.. _v4l2-meta-fmt-generic-csi2-20:
+
+V4L2_META_FMT_GENERIC_CSI2_20
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_20 contains packed 8-bit generic metadata, 20 bits
+for each 8 bits of data. Every byte of metadata is followed by alternating one
+and two bytes of padding. The way the data is packed follows the MIPI CSI-2
+specification and the padding is defined in the MIPI CCS specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
+Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - X
+      - M\ :sub:`10`
+      - X
+      - X
+      - M\ :sub:`20`
+      - X
+      - M\ :sub:`30`
+      - X
+      - X
+    * - start + 10:
+      - M\ :sub:`01`
+      - X
+      - M\ :sub:`11`
+      - X
+      - X
+      - M\ :sub:`21`
+      - X
+      - M\ :sub:`31`
+      - X
+      - X
+
+.. _v4l2-meta-fmt-generic-csi2-24:
+
+V4L2_META_FMT_GENERIC_CSI2_24
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_24 contains packed 8-bit generic metadata, 24 bits
+for each 8 bits of data. Every byte of metadata is followed by two bytes of
+padding. The way the data is packed follows the MIPI CSI-2 specification and the
+padding is defined in the MIPI CCS specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
+Each cell is one byte. "M" denotes a byte of metadata and "X" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - X
+      - X
+      - M\ :sub:`10`
+      - X
+      - X
+      - M\ :sub:`20`
+      - X
+      - X
+      - M\ :sub:`30`
+      - X
+      - X
+    * - start + 12:
+      - M\ :sub:`01`
+      - X
+      - X
+      - M\ :sub:`11`
+      - X
+      - X
+      - M\ :sub:`21`
+      - X
+      - X
+      - M\ :sub:`31`
+      - X
+      - X
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 33076af4dfdb..7cb6063f7056 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1452,6 +1452,13 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8b Generic Meta, 10b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8b Generic Meta, 12b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8b Generic Meta, 14b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8b Generic Meta, 16b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8b Generic Meta, 20b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8b Generic Meta, 24b CSI-2"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a8015e5e7fa4..6a4f8ae30186 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -839,6 +839,14 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.39.2


