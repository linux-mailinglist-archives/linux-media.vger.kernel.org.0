Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9CF7AB388
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbjIVOXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbjIVOW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:22:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE56AB
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392573; x=1726928573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IUm42fmekmMuZUlwhbf+2Nf/J7pOVxmL53D0Qvv7xWk=;
  b=ceq1oDH6odAV4kiTkpwr7ynMB2eAcjlA7yBYsq4o6SKp07u4kBpbcdWS
   fY43oUIVs5yn9URy7R9pfzlenkCq+2uxGKuTrh+J5eDLPabG9BHYTBT3J
   CzzlPyke9qQeXWffgSUoVWq+3SQpLnVOn2Hr4rmOFlTqkceycCUOgRUky
   UqTDA359/j5FiOd9msYQkAbVNwfhRGh7+3gEbLpgA0dVCCLQB9V94vCJt
   jfUgi4wh/rSTC5dgDCPFSuccxeTcZxl3zEQicQz865YAOnjkt6mmMHneo
   B/MZETtLDywCyF4TdPqikFgg/uh4V41By3S2H4FK1GcLIZnfpSllAIymK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218859"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218859"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112367"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112367"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7001A1209B0;
        Fri, 22 Sep 2023 17:22:45 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 04/23] media: uapi: Add generic 8-bit metadata format definitions
Date:   Fri, 22 Sep 2023 17:22:20 +0300
Message-Id: <20230922142239.259425-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index 9b1de54ce379..ce4b3929ff5f 100644
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
index c3d4e490ce7c..2b16b06ad278 100644
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

