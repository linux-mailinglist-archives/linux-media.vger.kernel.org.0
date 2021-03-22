Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61B3344996
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCVPr2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:47:28 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56527 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230081AbhCVPrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:47:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OMlelxHbZ4XAGOMlilYPSZ; Mon, 22 Mar 2021 16:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616428022; bh=ZtGd2IDDljQ+5itM9BmMHh09aoyixRB00HWqYQIOk3s=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=NtvkPI5PTtlCCLuE+S2BXqtiYoAZx0+U5jw63DMF4f4+pHU+BkWAxddaNAhD5HNDN
         5w2C7iDPgb2DjN6AIZq/SBijc72UiWOkiz6Evqzbu1JkMpnemzEP30+6Mk8DCO41CY
         StfU0B9NvsVwBpMf08mslMlqOYVgXmHcBnR4bwFbcoRRiU9EldN7A06z20dTAepvAz
         hV/+Ge0DZSvPnOGqAjWdJGyCs8iQZYMYfLiECkDsvr7y0E2CH3TMHT2wdsk3hxnZtN
         MEzEuSWpl4Pztf1+py1lrfanZ2lsijM48bEECGdoqyI2FHHKE31iIDsYSFY2MzHtnn
         8pji9hBY8BSxQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Edgar Thier <info@edgarthier.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 1/3] v4l: Add 12-bit raw bayer linear packed formats
Date:   Mon, 22 Mar 2021 16:46:56 +0100
Message-Id: <20210322154658.1409391-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
References: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKxNnVhm/ns9fQZY7nTtooHC/ljqR/ZbmX/1gBYkibWDC5s7UBNZ5LE+bC3WKMcOfiZlA6JvgrHssojvcEMJOplESQIw7uOn9mazApB5CuWKZWdVzQiL
 yKmAIpR9G0bBBrcVeSJkubM8+nZ8fjV90Hj2WG8JtQ5QRwZOOugTXvOSs5AZntJhIviEdIp7desQe5bgjVZ3MyGDs7i1gKEjgY/kOsRIi3hL24jZc2Bvz0tz
 IU/B8r20i79dvAJGBVu9wFaoIDGSdzmtGNxBCHKSbjjHOiFoeVrnYRL4W4D9txmw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Edgar Thier <info@edgarthier.net>

These formats are compressed 12-bit raw bayer formats with four different
pixel orders. The pixels follow one another without any padding,
thus are packed in a 'linear' fashion.

Signed-off-by: Edgar Thier <info@edgarthier.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
 .../media/v4l/pixfmt-srggb12lp.rst            | 74 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
 include/uapi/linux/videodev2.h                |  7 ++
 4 files changed, 86 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index 2500413e5f43..8bd9743d93c2 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -26,6 +26,7 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb10dpcm8
     pixfmt-srggb10-ipu3
     pixfmt-srggb12
+    pixfmt-srggb12lp
     pixfmt-srggb12p
     pixfmt-srggb14
     pixfmt-srggb14p
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst
new file mode 100644
index 000000000000..6aac60f0c995
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _V4L2-PIX-FMT-SBGGR12LP:
+.. _v4l2-pix-fmt-sgbrg12lp:
+.. _v4l2-pix-fmt-sgrbg12lp:
+.. _v4l2-pix-fmt-srggb12lp:
+
+**********************************************************************************************************************************
+V4L2_PIX_FMT_SBGGR12LP ('BGCp'), V4L2_PIX_FMT_SGBRG12LP ('GBCp'), V4L2_PIX_FMT_SGRBG12LP ('GRCp'), V4L2_PIX_FMT_SRGGB12LP ('RGCp')
+**********************************************************************************************************************************
+
+12-bit Linear Packed Bayer Formats
+
+Description
+===========
+
+These packed Bayer formats are used by industrial cameras, often in conjunction
+with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
+
+The formats are equal to the Genicam PFNC Bayer12p formats
+(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
+
+They are raw sRGB / Bayer formats with 12 bits
+per sample with 3 bytes for every 2 pixels.
+
+Below is an example of a small image in V4L2_PIX_FMT_SBGGR12LP format.
+
+**Byte Order.**
+Each cell is one byte.
+
+.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|p{4.0cm}|
+
+.. flat-table::
+
+    * - start + 0:
+      - B\ :sub:`00low`
+      - G\ :sub:`01low`\ (bits 7--4)
+        B\ :sub:`00high`\ (bits 0--3)
+      - G\ :sub:`01high`\
+      - B\ :sub:`02low`
+      - G\ :sub:`03low`\ (bits 7--4)
+        B\ :sub:`02high`\ (bits 0--3)
+      - G\ :sub:`03high`\
+
+    * - start + 6:
+      - G\ :sub:`10low`
+      - R\ :sub:`11low`\ (bits 7--4)
+        G\ :sub:`10high`\ (bits 0--3)
+      - R\ :sub:`11high`
+      - G\ :sub:`12low`
+      - R\ :sub:`13low`\ (bits 7--4)
+        G\ :sub:`12high`\ (bits 0--3)
+      - R\ :sub:`13high`
+
+    * - start + 12:
+      - B\ :sub:`20low`
+      - G\ :sub:`21low`\ (bits 7--4)
+        B\ :sub:`20high`\ (bits 0--3)
+      - G\ :sub:`21high`
+      - B\ :sub:`22low`
+      - G\ :sub:`21low`\ (bits 7--4)
+        B\ :sub:`22high`\ (bits 0--3)
+      - G\ :sub:`21high`
+
+    * - start + 18:
+      - G\ :sub:`30low`
+      - R\ :sub:`31low`\ (bits 7--4)
+        G\ :sub:`30high`\ (bits 0--3)
+      - R\ :sub:`31high`
+      - G\ :sub:`32low`
+      - R\ :sub:`33low`\ (bits 7--4)
+        G\ :sub:`32high`\ (bits 0--3)
+      - R\ :sub:`33high`
+
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6a5d1c6d11d6..9ac8a1512c6b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1361,6 +1361,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR12LP:	descr = "12-bit Bayer BGGR Linear Packed"; break;
+	case V4L2_PIX_FMT_SGBRG12LP:	descr = "12-bit Bayer GBRG Linear Packed"; break;
+	case V4L2_PIX_FMT_SGRBG12LP:	descr = "12-bit Bayer GRBG Linear Packed"; break;
+	case V4L2_PIX_FMT_SRGGB12LP:	descr = "12-bit Bayer RGGB Linear Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8d15f6ccc4b4..233d952f90ec 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -655,6 +655,13 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
+
+	/* 12bit raw bayer linearly packed, 6 bytes for every 4 pixels */
+#define V4L2_PIX_FMT_SBGGR12LP v4l2_fourcc('B', 'G', 'C', 'p')
+#define V4L2_PIX_FMT_SGBRG12LP v4l2_fourcc('G', 'B', 'C', 'p')
+#define V4L2_PIX_FMT_SGRBG12LP v4l2_fourcc('G', 'R', 'C', 'p')
+#define V4L2_PIX_FMT_SRGGB12LP v4l2_fourcc('R', 'G', 'C', 'p')
+
 	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
 #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
 #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')
-- 
2.30.1

