Return-Path: <linux-media+bounces-10180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC38B3349
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CE19B21028
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C7C13D525;
	Fri, 26 Apr 2024 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dlje8p0N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036113D29B
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121454; cv=none; b=n3SEBm+RL0LgGB7lnoD05PZTJIbwOBmDlJ+ALeWBLPm6AjS5TGueH67vYquWXxtEwdRX+U6K7GM539H5XU5GvGbxMBIUgcipaPn5fzhTZ68KPLhZZxLS8ohmzZSKPV7Onvs3bcdDDYsJrTLOfSTBvBdhbBramogRs9h34Yt45Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121454; c=relaxed/simple;
	bh=jUjiv2SseKlh5j2L5lBn1Yitd0lrTXuXJsn0aSHAq7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LAoTKj8HjPpjKBl+JIqx+BMTrnL/BRcD9xNzv5jQ52XehwLAk2VJAkdz0CyTTOx1wQ2XOxMS/cgt+cav3IP1Ml0VxUK4ejaEHG4B97nKuqhT0GII7OEJ5KLDEZ5FAIZihZrVF6aShs2B6NZP+aaQFtmWtexA+wYAuJ6YsDlDc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dlje8p0N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121452; x=1745657452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jUjiv2SseKlh5j2L5lBn1Yitd0lrTXuXJsn0aSHAq7g=;
  b=Dlje8p0NAQOKkcYv3sjq4N3U1Sffz8YOltEIzc3ZKTuJeGgmja8LP8p6
   sjA75GQ4wJTEipwhIDsTmZGV9UfMA2HcszwZNByEtpdC318LI4GFuGdhI
   vHCcM6yK/c/UXSWz0BaOfy7MLMzpgLP2OiBiK/JwlraR0/RHu8oSqeNnQ
   KDOvqp3uvW7VqcCGO9vF1MHvZaT9uqIqWQxzkeud2EAf1mSmrJuHEbfS2
   Y8MnwGLR0O/xLMIG5ldnMo/RnuZD1AjACr6fwldfIq7qG05sfpHCGngIb
   ZSDeQ7zVib9E6YxIbUvOcYKGg6+I5FW3pBr8xVqlca7ilv2DbEeKYhY2u
   g==;
X-CSE-ConnectionGUID: g8PReRpzRaKidfT74P+pQw==
X-CSE-MsgGUID: VZI5dm0VRlm1rXCZG5A6qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683803"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:52 -0700
X-CSE-ConnectionGUID: R4L5iSJcR0eUowZPWexYkQ==
X-CSE-MsgGUID: tzHq3bi2T9WqQepBWtvr7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598510"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8CF9011F855;
	Fri, 26 Apr 2024 11:50:45 +0300 (EEST)
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
Subject: [PATCH v3 05/14] media: uapi: v4l: Add generic 8-bit metadata format definitions
Date: Fri, 26 Apr 2024 11:50:29 +0300
Message-Id: <20240426085038.943733-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
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
to memory without knowing a large number of device-specific formats.

These formats may be used only in conjunction with a Media Controller
pipeline where the internal pad of the source sub-device defines the
specific format of the data (using an mbus code).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../userspace-api/media/v4l/meta-formats.rst  |   3 +-
 .../media/v4l/metafmt-generic.rst             | 340 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   7 +
 include/uapi/linux/videodev2.h                |   8 +
 5 files changed, 359 insertions(+), 1 deletion(-)
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
index 0bb61fc5bc00..c23aac823d2c 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -13,9 +13,10 @@ These formats are used for the :ref:`metadata` interface only.
     :maxdepth: 1
 
     metafmt-d4xx
+    metafmt-generic
     metafmt-intel-ipu3
     metafmt-rkisp1
     metafmt-uvc
+    metafmt-vivid
     metafmt-vsp1-hgo
     metafmt-vsp1-hgt
-    metafmt-vivid
diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
new file mode 100644
index 000000000000..78ab56b21682
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -0,0 +1,340 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+********************************************************************************************************************************************************************************************************************************************************************************
+V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
+********************************************************************************************************************************************************************************************************************************************************************************
+
+
+Generic line-based metadata formats
+
+
+Description
+===========
+
+These generic line-based metadata formats define the memory layout of the data
+without defining the format or meaning of the metadata itself.
+
+.. _v4l2-meta-fmt-generic-8:
+
+V4L2_META_FMT_GENERIC_8
+-----------------------
+
+The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format. This format
+is used on CSI-2 for 8 bits per :term:`Data Unit`.
+
+Additionally it is used for 16 bits per Data Unit when two bytes of metadata are
+packed into one 16-bit Data Unit. Otherwise the 16 bits per pixel dataformat is
+:ref:`V4L2_META_FMT_GENERIC_CSI2_16 <v4l2-meta-fmt-generic-csi2-16>`.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_8.**
+Each cell is one byte. "M" denotes a byte of metadata.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
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
+V4L2_META_FMT_GENERIC_CSI2_10 contains 8-bit generic metadata packed in 10-bit
+Data Units, with one padding byte after every four bytes of metadata. This
+format is typically used by CSI-2 receivers with a source that transmits
+MEDIA_BUS_FMT_META_10 and the CSI-2 receiver writes the received data to memory
+as-is.
+
+The packing of the data follows the MIPI CSI-2 specification and the padding of
+the data is defined in the MIPI CCS specification.
+
+This format is also used in conjunction with 20 bits per :term:`Data Unit`
+formats that pack two bytes of metadata into one Data Unit. Otherwise the
+20 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_CSI2_20
+<v4l2-meta-fmt-generic-csi2-20>`.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
+Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - x
+    * - start + 5:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - x
+
+.. _v4l2-meta-fmt-generic-csi2-12:
+
+V4L2_META_FMT_GENERIC_CSI2_12
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_12 contains 8-bit generic metadata packed in 12-bit
+Data Units, with one padding byte after every two bytes of metadata. This format
+is typically used by CSI-2 receivers with a source that transmits
+MEDIA_BUS_FMT_META_12 and the CSI-2 receiver writes the received data to memory
+as-is.
+
+The packing of the data follows the MIPI CSI-2 specification and the padding of
+the data is defined in the MIPI CCS specification.
+
+This format is also used in conjunction with 24 bits per :term:`Data Unit`
+formats that pack two bytes of metadata into one Data Unit. Otherwise the
+24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_CSI2_24
+<v4l2-meta-fmt-generic-csi2-24>`.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
+Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - x
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - x
+    * - start + 6:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - x
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - x
+
+.. _v4l2-meta-fmt-generic-csi2-14:
+
+V4L2_META_FMT_GENERIC_CSI2_14
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_14 contains 8-bit generic metadata packed in 14-bit
+Data Units, with three padding bytes after every four bytes of metadata. This
+format is typically used by CSI-2 receivers with a source that transmits
+MEDIA_BUS_FMT_META_14 and the CSI-2 receiver writes the received data to memory
+as-is.
+
+The packing of the data follows the MIPI CSI-2 specification and the padding of
+the data is defined in the MIPI CCS specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
+Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - x
+      - x
+      - x
+    * - start + 7:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - x
+      - x
+      - x
+
+.. _v4l2-meta-fmt-generic-csi2-16:
+
+V4L2_META_FMT_GENERIC_CSI2_16
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_16 contains 8-bit generic metadata packed in 16-bit
+Data Units, with one padding byte after every byte of metadata. This format is
+typically used by CSI-2 receivers with a source that transmits
+MEDIA_BUS_FMT_META_16 and the CSI-2 receiver writes the received data to memory
+as-is.
+
+The packing of the data follows the MIPI CSI-2 specification and the padding of
+the data is defined in the MIPI CCS specification.
+
+Some devices support more efficient packing of metadata in conjunction with
+16-bit image data. In that case the dataformat is
+:ref:`V4L2_META_FMT_GENERIC_8 <v4l2-meta-fmt-generic-8>`.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
+Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - x
+      - M\ :sub:`10`
+      - x
+      - M\ :sub:`20`
+      - x
+      - M\ :sub:`30`
+      - x
+    * - start + 8:
+      - M\ :sub:`01`
+      - x
+      - M\ :sub:`11`
+      - x
+      - M\ :sub:`21`
+      - x
+      - M\ :sub:`31`
+      - x
+
+.. _v4l2-meta-fmt-generic-csi2-20:
+
+V4L2_META_FMT_GENERIC_CSI2_20
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_20 contains 8-bit generic metadata packed in 20-bit
+Data Units, with alternating one or two padding bytes after every byte of
+metadata. This format is typically used by CSI-2 receivers with a source that
+transmits MEDIA_BUS_FMT_META_20 and the CSI-2 receiver writes the received data
+to memory as-is.
+
+The packing of the data follows the MIPI CSI-2 specification and the padding of
+the data is defined in the MIPI CCS specification.
+
+Some devices support more efficient packing of metadata in conjunction with
+16-bit image data. In that case the dataformat is
+:ref:`V4L2_META_FMT_GENERIC_CSI2_10 <v4l2-meta-fmt-generic-csi2-10>`.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
+Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - x
+      - M\ :sub:`10`
+      - x
+      - x
+      - M\ :sub:`20`
+      - x
+      - M\ :sub:`30`
+      - x
+      - x
+    * - start + 10:
+      - M\ :sub:`01`
+      - x
+      - M\ :sub:`11`
+      - x
+      - x
+      - M\ :sub:`21`
+      - x
+      - M\ :sub:`31`
+      - x
+      - x
+
+.. _v4l2-meta-fmt-generic-csi2-24:
+
+V4L2_META_FMT_GENERIC_CSI2_24
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_24 contains 8-bit generic metadata packed in 24-bit
+Data Units, with two padding bytes after every byte of metadata. This format is
+typically used by CSI-2 receivers with a source that transmits
+MEDIA_BUS_FMT_META_24 and the CSI-2 receiver writes the received data to memory
+as-is.
+
+The packing of the data follows the MIPI CSI-2 specification and the padding of
+the data is defined in the MIPI CCS specification.
+
+Some devices support more efficient packing of metadata in conjunction with
+16-bit image data. In that case the dataformat is
+:ref:`V4L2_META_FMT_GENERIC_CSI2_12 <v4l2-meta-fmt-generic-csi2-12>`.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
+Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
+
+.. flat-table:: Sample 4x2 Metadata Frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - x
+      - x
+      - M\ :sub:`10`
+      - x
+      - x
+      - M\ :sub:`20`
+      - x
+      - x
+      - M\ :sub:`30`
+      - x
+      - x
+    * - start + 12:
+      - M\ :sub:`01`
+      - x
+      - x
+      - M\ :sub:`11`
+      - x
+      - x
+      - M\ :sub:`21`
+      - x
+      - x
+      - M\ :sub:`31`
+      - x
+      - x
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5aeff5519407..ae2dca7f2817 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1460,6 +1460,13 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
+	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index bf12860d570a..0f44b8486ea8 100644
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


