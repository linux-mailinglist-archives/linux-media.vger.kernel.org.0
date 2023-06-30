Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A78C74436E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbjF3Un7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbjF3Un6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:58 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1F03C0B
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157836; x=1719693836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6req4PQTPGl6xKGwlf8PUjvyjR6Ca39HsmUDCvOt2Zs=;
  b=mOHeXV8KTcrAMlpwe/0Q1B141MsaFRsoawnRpLqI//i6jiuRw1DRqCxA
   ye16mIlIw2j3i98kPtgP3p8WdWmwHqcKs45f8sN/KxyETxFtx+Qa60OK/
   3ftWcipogyqXQ/JNIKNQ+P4fy9LozHeWpt6+TihCnCviuKvOPNYt8l1K7
   3Z0NsOk/zOcBBoHhAc+D6QAUc32SnbDs2ojj92zDlLeQyQu7t7U9wogmC
   KwEZu6GDiLWIkRwVoe6N8rUmigEh7I0Q4MQvKjRPL3bIH0FfVz0OkcAju
   +ZxY5bdfvfUNwsen1ZNIZkH5oblKAui417p64g46dsjJgOJQOJH8akG0K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866726"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866726"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987225"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987225"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:54 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D254812078C;
        Fri, 30 Jun 2023 23:43:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 6/7] media: uapi: Add generic 8-bit metadata format definitions
Date:   Fri, 30 Jun 2023 23:43:37 +0300
Message-Id: <20230630204338.126583-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-generic.rst             | 331 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   8 +
 include/uapi/linux/videodev2.h                |   9 +
 4 files changed, 349 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst

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
index 000000000000..a27bfc721edf
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -0,0 +1,331 @@
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+
+**************************************************************************************************************************************************************************************************************************************************************************************************************************
+V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O'), V4L2_META_FMT_GENERIC_CSI2_2_24 ('MC2O')
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
+sub-device. See also :ref:`source routes <v4l2-subdev-source-routes>`.
+
+.. _v4l2-meta-fmt-generic-8:
+
+V4L2_META_FMT_GENERIC_8
+-----------------------
+
+The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
+
+This format is also used on CSI-2 on both 8 bits per sample as well as on
+16 bits per sample when two bytes of metadata are packed into one sample.
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
+byte of padding. The way the data is stored follows the CSI-2 specification.
+
+This format is also used on CSI-2 on 20 bits per sample format that packs two
+bytes of metadata into one sample.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
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
+      - p
+    * - start + 5:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - p
+
+.. _v4l2-meta-fmt-generic-csi2-12:
+
+V4L2_META_FMT_GENERIC_CSI2_12
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_12 contains packed 8-bit generic metadata, 12 bits
+for each 8 bits of data. Every four bytes of metadata is followed by two bytes
+of padding. The way the data is stored follows the CSI-2 specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
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
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - p
+      - p
+    * - start + 6:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - p
+      - p
+
+.. _v4l2-meta-fmt-generic-csi2-14:
+
+V4L2_META_FMT_GENERIC_CSI2_14
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_14 contains packed 8-bit generic metadata, 14 bits
+for each 8 bits of data. Every four bytes of metadata is followed by three
+bytes of padding. The way the data is stored follows the CSI-2 specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
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
+      - p
+      - p
+      - p
+    * - start + 7:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - p
+      - p
+      - p
+
+.. _v4l2-meta-fmt-generic-csi2-16:
+
+V4L2_META_FMT_GENERIC_CSI2_16
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_16 contains packed 8-bit generic metadata, 16 bits
+for each 8 bits of data. Every byte of metadata is followed by one byte of
+padding. The way the data is stored follows the CSI-2 specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
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
+      - p
+      - M\ :sub:`10`
+      - p
+      - M\ :sub:`20`
+      - p
+      - M\ :sub:`30`
+      - p
+    * - start + 8:
+      - M\ :sub:`01`
+      - p
+      - M\ :sub:`11`
+      - p
+      - M\ :sub:`21`
+      - p
+      - M\ :sub:`31`
+      - p
+
+.. _v4l2-meta-fmt-generic-csi2-20:
+
+V4L2_META_FMT_GENERIC_CSI2_20
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_20 contains packed 8-bit generic metadata, 20 bits
+for each 8 bits of data. Every byte of metadata is followed by alternating one
+and two bytes of padding. The way the data is stored follows the CSI-2
+specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
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
+      - p
+      - M\ :sub:`10`
+      - p
+      - p
+      - M\ :sub:`20`
+      - p
+      - M\ :sub:`30`
+      - p
+      - p
+    * - start + 10:
+      - M\ :sub:`01`
+      - p
+      - M\ :sub:`11`
+      - p
+      - p
+      - M\ :sub:`21`
+      - p
+      - M\ :sub:`31`
+      - p
+      - p
+
+.. _v4l2-meta-fmt-generic-csi2-24:
+
+V4L2_META_FMT_GENERIC_CSI2_24
+-----------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_24 contains packed 8-bit generic metadata, 24 bits
+for each 8 bits of data. Every byte of metadata is followed by two bytes of
+padding. The way the data is stored follows the CSI-2 specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_24.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
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
+      - p
+      - p
+      - M\ :sub:`10`
+      - p
+      - p
+      - M\ :sub:`20`
+      - p
+      - p
+      - M\ :sub:`30`
+      - p
+      - p
+    * - start + 12:
+      - M\ :sub:`01`
+      - p
+      - p
+      - M\ :sub:`11`
+      - p
+      - p
+      - M\ :sub:`21`
+      - p
+      - p
+      - M\ :sub:`31`
+      - p
+      - p
+
+.. _v4l2-meta-fmt-generic-csi2-2-24:
+
+V4L2_META_FMT_GENERIC_CSI2_2_24
+-------------------------------
+
+V4L2_META_FMT_GENERIC_CSI2_2_24 contains packed 8-bit generic metadata, 24 bits
+for each two times 8 bits of data. Every two bytes of metadata are followed by
+one byte of padding. The way the data is stored follows the CSI-2
+specification.
+
+This format is little endian.
+
+**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_2_24.**
+Each cell is one byte. "M" denotes a byte of metadata and "p" a byte of padding.
+
+.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 8 8 8 8 8 8
+
+    * - start + 0:
+      - M\ :sub:`00`
+      - M\ :sub:`10`
+      - p
+      - M\ :sub:`20`
+      - M\ :sub:`30`
+      - p
+    * - start + 6:
+      - M\ :sub:`01`
+      - M\ :sub:`11`
+      - p
+      - M\ :sub:`21`
+      - M\ :sub:`31`
+      - p
+
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a858acea6547..7781b0bd3e7d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1451,6 +1451,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
+	case V4L2_META_FMT_GENERIC_CSI2_2_24:	descr = "2x8b Generic Meta, 24b CSI-2"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5d8bd754c69f..13d404699842 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -834,6 +834,15 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_2_24	v4l2_fourcc('M', 'C', '2', 'O') /* 2 bytes of 8-bit metadata, 24-bit CSI-2 packed */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.39.2

