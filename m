Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5893E16AE0D
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 18:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgBXRwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 12:52:38 -0500
Received: from mx1.emlix.com ([188.40.240.192]:50054 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727854AbgBXRwi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 12:52:38 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 7A9F75F96E;
        Mon, 24 Feb 2020 18:52:36 +0100 (CET)
From:   =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        Jouni Ukkonen <jouni.ukkonen@intel.com>,
        =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [PATCH 1/3] media: v4l: Add 14-bit raw bayer pixel formats
Date:   Mon, 24 Feb 2020 18:52:20 +0100
Message-Id: <20200224175222.1875-1-dg@emlix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

The formats added by this patch are:

	V4L2_PIX_FMT_SBGGR14
	V4L2_PIX_FMT_SGBRG14
	V4L2_PIX_FMT_SGRBG14
	V4L2_PIX_FMT_SRGGB14

Signed-off-by: Jouni Ukkonen <jouni.ukkonen@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
[dg@emlix.com: rebased onto current media_tree]
Signed-off-by: Daniel Glöckner <dg@emlix.com>
---
 Documentation/media/uapi/v4l/pixfmt-bayer.rst |  1 +
 .../media/uapi/v4l/pixfmt-srggb14.rst         | 82 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
 include/uapi/linux/videodev2.h                |  4 +
 4 files changed, 91 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb14.rst

diff --git a/Documentation/media/uapi/v4l/pixfmt-bayer.rst b/Documentation/media/uapi/v4l/pixfmt-bayer.rst
index cfa2f4e3e114..807ab34ba93b 100644
--- a/Documentation/media/uapi/v4l/pixfmt-bayer.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-bayer.rst
@@ -34,5 +34,6 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb10-ipu3
     pixfmt-srggb12
     pixfmt-srggb12p
+    pixfmt-srggb14
     pixfmt-srggb14p
     pixfmt-srggb16
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb14.rst b/Documentation/media/uapi/v4l/pixfmt-srggb14.rst
new file mode 100644
index 000000000000..3420d4d1825e
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-srggb14.rst
@@ -0,0 +1,82 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/media/uapi/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _V4L2-PIX-FMT-SRGGB14:
+.. _v4l2-pix-fmt-sbggr14:
+.. _v4l2-pix-fmt-sgbrg14:
+.. _v4l2-pix-fmt-sgrbg14:
+
+
+***************************************************************************************************************************
+V4L2_PIX_FMT_SRGGB14 ('RG14'), V4L2_PIX_FMT_SGRBG14 ('GR14'), V4L2_PIX_FMT_SGBRG14 ('GB14'), V4L2_PIX_FMT_SBGGR14 ('BG14'),
+***************************************************************************************************************************
+
+
+14-bit Bayer formats expanded to 16 bits
+
+
+Description
+===========
+
+These four pixel formats are raw sRGB / Bayer formats with 14 bits per
+colour. Each sample is stored in a 16-bit word, with two unused high
+bits filled with zeros. Each n-pixel row contains n/2 green samples
+and n/2 blue or red samples, with alternating red and blue rows. Bytes
+are stored in memory in little endian order. They are conventionally
+described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is an
+example of a small V4L2_PIX_FMT_SBGGR14 image:
+
+**Byte Order.**
+Each cell is one byte, the two most significant bits in the high bytes are
+zero.
+
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       2 1 1 1 1 1 1 1 1
+
+
+    * - start + 0:
+      - B\ :sub:`00low`
+      - B\ :sub:`00high`
+      - G\ :sub:`01low`
+      - G\ :sub:`01high`
+      - B\ :sub:`02low`
+      - B\ :sub:`02high`
+      - G\ :sub:`03low`
+      - G\ :sub:`03high`
+    * - start + 8:
+      - G\ :sub:`10low`
+      - G\ :sub:`10high`
+      - R\ :sub:`11low`
+      - R\ :sub:`11high`
+      - G\ :sub:`12low`
+      - G\ :sub:`12high`
+      - R\ :sub:`13low`
+      - R\ :sub:`13high`
+    * - start + 16:
+      - B\ :sub:`20low`
+      - B\ :sub:`20high`
+      - G\ :sub:`21low`
+      - G\ :sub:`21high`
+      - B\ :sub:`22low`
+      - B\ :sub:`22high`
+      - G\ :sub:`23low`
+      - G\ :sub:`23high`
+    * - start + 24:
+      - G\ :sub:`30low`
+      - G\ :sub:`30high`
+      - R\ :sub:`31low`
+      - R\ :sub:`31high`
+      - G\ :sub:`32low`
+      - G\ :sub:`32high`
+      - R\ :sub:`33low`
+      - R\ :sub:`33high`
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index aaf83e254272..2558ffe4e3cb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1306,6 +1306,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
 	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
+	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
 	case V4L2_PIX_FMT_SBGGR14P:	descr = "14-bit Bayer BGBG/GRGR Packed"; break;
 	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5f9357dcb060..8429e5ab2d94 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -662,6 +662,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')
 #define V4L2_PIX_FMT_SGRBG12P v4l2_fourcc('p', 'g', 'C', 'C')
 #define V4L2_PIX_FMT_SRGGB12P v4l2_fourcc('p', 'R', 'C', 'C')
+#define V4L2_PIX_FMT_SBGGR14 v4l2_fourcc('B', 'G', '1', '4') /* 14  BGBG.. GRGR.. */
+#define V4L2_PIX_FMT_SGBRG14 v4l2_fourcc('G', 'B', '1', '4') /* 14  GBGB.. RGRG.. */
+#define V4L2_PIX_FMT_SGRBG14 v4l2_fourcc('G', 'R', '1', '4') /* 14  GRGR.. BGBG.. */
+#define V4L2_PIX_FMT_SRGGB14 v4l2_fourcc('R', 'G', '1', '4') /* 14  RGRG.. GBGB.. */
 	/* 14bit raw bayer packed, 7 bytes for every 4 pixels */
 #define V4L2_PIX_FMT_SBGGR14P v4l2_fourcc('p', 'B', 'E', 'E')
 #define V4L2_PIX_FMT_SGBRG14P v4l2_fourcc('p', 'G', 'E', 'E')
-- 
2.17.1

