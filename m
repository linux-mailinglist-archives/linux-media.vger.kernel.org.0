Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84A22C5545
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390015AbgKZN1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:27:33 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42685 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389827AbgKZN1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:27:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHIrkPCQhN7XgiHJ3kYrXQ; Thu, 26 Nov 2020 14:27:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606397249; bh=Rb4hBMEWy+6oDDiKe1lUA6ficTVlXyyANHld9UnkiA4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Zdw5NJ4jC3WJDNbFSi91Jz9eWNAlsXKsJ1XLcWQzvuVP7GHr3hStYP3Lc+VyRtH8Z
         KeVFkXXPXPchQttOMNLAD5cBDlMZJzAqQrLQArXrjWf4PrRuLTxSxo7HO2xzA7MGOg
         lXov9/yObM90xKD0d6uCodvi4iwF3IkNB6dl5LYE71FkDwpSOVp7XeCyQYdUfi5+dp
         2mVZNiNC4ZfW+wpm0yQwKYL5+l1Md5vcaCbkWm2LYQka3g69+s+jCxUSP4Jjc1/5Ak
         xULV6UhxtG4SUMJNWcH9Thpf2BqXb4KU3vWX9a9WvQvL6r6B4TtEe2SaQoaokOaItt
         +NMRTv1PjZqUA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/6] vicodec: add V4L2_ prefix before FWHT_VERSION and FWHT_FL_*
Date:   Thu, 26 Nov 2020 14:27:12 +0100
Message-Id: <20201126132717.1216907-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPKsg8oJiWG9OdslvPLewlhgUU054b3LqQP4rktgPBMGRZ8Vt+F3eBeqw9An1OHSIcFptow873r56aX/AXRSfpyhXVJzRDqTBTgWN9Ju6qgMMGIUt7XO
 kwR0j9UCgbt4kSaXBB01jErLR3coCvr79UTQNEIWPSLLduvWok59M+dZdkaWIhYNcgMFW1t80qamJGURsRZukDP5QoxBOgU1+UTkZBdy9bdSm4AVcL5MMW9M
 eyW5ERt/fFhsJtsRcAaIWYi8fl1Ghq/Yr73IUxQFFHM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No other changes. This patch is preparation for promoting the
stateless FWHT codec API as a stable public API.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/ext-ctrls-codec.rst             | 32 +++----
 .../media/test-drivers/vicodec/codec-fwht.c   | 12 +--
 .../media/test-drivers/vicodec/codec-fwht.h   | 40 ++++-----
 .../test-drivers/vicodec/codec-v4l2-fwht.c    | 88 +++++++++----------
 .../media/test-drivers/vicodec/vicodec-core.c | 40 ++++-----
 5 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e815fffd1cd8..34173ed326fc 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2284,52 +2284,52 @@ FWHT Flags
     :stub-columns: 0
     :widths:       3 1 4
 
-    * - ``FWHT_FL_IS_INTERLACED``
+    * - ``V4L2_FWHT_FL_IS_INTERLACED``
       - 0x00000001
       - Set if this is an interlaced format
-    * - ``FWHT_FL_IS_BOTTOM_FIRST``
+    * - ``V4L2_FWHT_FL_IS_BOTTOM_FIRST``
       - 0x00000002
       - Set if this is a bottom-first (NTSC) interlaced format
-    * - ``FWHT_FL_IS_ALTERNATE``
+    * - ``V4L2_FWHT_FL_IS_ALTERNATE``
       - 0x00000004
       - Set if each 'frame' contains just one field
-    * - ``FWHT_FL_IS_BOTTOM_FIELD``
+    * - ``V4L2_FWHT_FL_IS_BOTTOM_FIELD``
       - 0x00000008
-      - If FWHT_FL_IS_ALTERNATE was set, then this is set if this 'frame' is the
+      - If V4L2_FWHT_FL_IS_ALTERNATE was set, then this is set if this 'frame' is the
 	bottom field, else it is the top field.
-    * - ``FWHT_FL_LUMA_IS_UNCOMPRESSED``
+    * - ``V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED``
       - 0x00000010
       - Set if the luma plane is uncompressed
-    * - ``FWHT_FL_CB_IS_UNCOMPRESSED``
+    * - ``V4L2_FWHT_FL_CB_IS_UNCOMPRESSED``
       - 0x00000020
       - Set if the cb plane is uncompressed
-    * - ``FWHT_FL_CR_IS_UNCOMPRESSED``
+    * - ``V4L2_FWHT_FL_CR_IS_UNCOMPRESSED``
       - 0x00000040
       - Set if the cr plane is uncompressed
-    * - ``FWHT_FL_CHROMA_FULL_HEIGHT``
+    * - ``V4L2_FWHT_FL_CHROMA_FULL_HEIGHT``
       - 0x00000080
       - Set if the chroma plane has the same height as the luma plane,
 	else the chroma plane is half the height of the luma plane
-    * - ``FWHT_FL_CHROMA_FULL_WIDTH``
+    * - ``V4L2_FWHT_FL_CHROMA_FULL_WIDTH``
       - 0x00000100
       - Set if the chroma plane has the same width as the luma plane,
 	else the chroma plane is half the width of the luma plane
-    * - ``FWHT_FL_ALPHA_IS_UNCOMPRESSED``
+    * - ``V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED``
       - 0x00000200
       - Set if the alpha plane is uncompressed
-    * - ``FWHT_FL_I_FRAME``
+    * - ``V4L2_FWHT_FL_I_FRAME``
       - 0x00000400
       - Set if this is an I-frame
-    * - ``FWHT_FL_COMPONENTS_NUM_MSK``
+    * - ``V4L2_FWHT_FL_COMPONENTS_NUM_MSK``
       - 0x00070000
       - A 4-values flag - the number of components - 1
-    * - ``FWHT_FL_PIXENC_YUV``
+    * - ``V4L2_FWHT_FL_PIXENC_YUV``
       - 0x00080000
       - Set if the pixel encoding is YUV
-    * - ``FWHT_FL_PIXENC_RGB``
+    * - ``V4L2_FWHT_FL_PIXENC_RGB``
       - 0x00100000
       - Set if the pixel encoding is RGB
-    * - ``FWHT_FL_PIXENC_HSV``
+    * - ``V4L2_FWHT_FL_PIXENC_HSV``
       - 0x00180000
       - Set if the pixel encoding is HSV
 
diff --git a/drivers/media/test-drivers/vicodec/codec-fwht.c b/drivers/media/test-drivers/vicodec/codec-fwht.c
index 31faf319e508..5dbf76fd8185 100644
--- a/drivers/media/test-drivers/vicodec/codec-fwht.c
+++ b/drivers/media/test-drivers/vicodec/codec-fwht.c
@@ -920,7 +920,7 @@ bool fwht_decode_frame(struct fwht_cframe *cf, u32 hdr_flags,
 	if (!decode_plane(cf, &rlco, height, width, ref->luma, ref_stride,
 			  ref->luma_alpha_step, dst->luma, dst_stride,
 			  dst->luma_alpha_step,
-			  hdr_flags & FWHT_FL_LUMA_IS_UNCOMPRESSED,
+			  hdr_flags & V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED,
 			  end_of_rlco_buf))
 		return false;
 
@@ -928,21 +928,21 @@ bool fwht_decode_frame(struct fwht_cframe *cf, u32 hdr_flags,
 		u32 h = height;
 		u32 w = width;
 
-		if (!(hdr_flags & FWHT_FL_CHROMA_FULL_HEIGHT))
+		if (!(hdr_flags & V4L2_FWHT_FL_CHROMA_FULL_HEIGHT))
 			h /= 2;
-		if (!(hdr_flags & FWHT_FL_CHROMA_FULL_WIDTH))
+		if (!(hdr_flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH))
 			w /= 2;
 
 		if (!decode_plane(cf, &rlco, h, w, ref->cb, ref_chroma_stride,
 				  ref->chroma_step, dst->cb, dst_chroma_stride,
 				  dst->chroma_step,
-				  hdr_flags & FWHT_FL_CB_IS_UNCOMPRESSED,
+				  hdr_flags & V4L2_FWHT_FL_CB_IS_UNCOMPRESSED,
 				  end_of_rlco_buf))
 			return false;
 		if (!decode_plane(cf, &rlco, h, w, ref->cr, ref_chroma_stride,
 				  ref->chroma_step, dst->cr, dst_chroma_stride,
 				  dst->chroma_step,
-				  hdr_flags & FWHT_FL_CR_IS_UNCOMPRESSED,
+				  hdr_flags & V4L2_FWHT_FL_CR_IS_UNCOMPRESSED,
 				  end_of_rlco_buf))
 			return false;
 	}
@@ -951,7 +951,7 @@ bool fwht_decode_frame(struct fwht_cframe *cf, u32 hdr_flags,
 		if (!decode_plane(cf, &rlco, height, width, ref->alpha, ref_stride,
 				  ref->luma_alpha_step, dst->alpha, dst_stride,
 				  dst->luma_alpha_step,
-				  hdr_flags & FWHT_FL_ALPHA_IS_UNCOMPRESSED,
+				  hdr_flags & V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED,
 				  end_of_rlco_buf))
 			return false;
 	return true;
diff --git a/drivers/media/test-drivers/vicodec/codec-fwht.h b/drivers/media/test-drivers/vicodec/codec-fwht.h
index b6fec2b1cbca..78e2841762fb 100644
--- a/drivers/media/test-drivers/vicodec/codec-fwht.h
+++ b/drivers/media/test-drivers/vicodec/codec-fwht.h
@@ -56,37 +56,37 @@
 #define FWHT_MAGIC1 0x4f4f4f4f
 #define FWHT_MAGIC2 0xffffffff
 
-#define FWHT_VERSION 3
+#define V4L2_FWHT_VERSION 3
 
 /* Set if this is an interlaced format */
-#define FWHT_FL_IS_INTERLACED		BIT(0)
+#define V4L2_FWHT_FL_IS_INTERLACED		BIT(0)
 /* Set if this is a bottom-first (NTSC) interlaced format */
-#define FWHT_FL_IS_BOTTOM_FIRST		BIT(1)
+#define V4L2_FWHT_FL_IS_BOTTOM_FIRST		BIT(1)
 /* Set if each 'frame' contains just one field */
-#define FWHT_FL_IS_ALTERNATE		BIT(2)
+#define V4L2_FWHT_FL_IS_ALTERNATE		BIT(2)
 /*
- * If FWHT_FL_IS_ALTERNATE was set, then this is set if this
+ * If V4L2_FWHT_FL_IS_ALTERNATE was set, then this is set if this
  * 'frame' is the bottom field, else it is the top field.
  */
-#define FWHT_FL_IS_BOTTOM_FIELD		BIT(3)
+#define V4L2_FWHT_FL_IS_BOTTOM_FIELD		BIT(3)
 /* Set if this frame is uncompressed */
-#define FWHT_FL_LUMA_IS_UNCOMPRESSED	BIT(4)
-#define FWHT_FL_CB_IS_UNCOMPRESSED	BIT(5)
-#define FWHT_FL_CR_IS_UNCOMPRESSED	BIT(6)
-#define FWHT_FL_CHROMA_FULL_HEIGHT	BIT(7)
-#define FWHT_FL_CHROMA_FULL_WIDTH	BIT(8)
-#define FWHT_FL_ALPHA_IS_UNCOMPRESSED	BIT(9)
-#define FWHT_FL_I_FRAME			BIT(10)
+#define V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED	BIT(4)
+#define V4L2_FWHT_FL_CB_IS_UNCOMPRESSED	BIT(5)
+#define V4L2_FWHT_FL_CR_IS_UNCOMPRESSED	BIT(6)
+#define V4L2_FWHT_FL_CHROMA_FULL_HEIGHT	BIT(7)
+#define V4L2_FWHT_FL_CHROMA_FULL_WIDTH	BIT(8)
+#define V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED	BIT(9)
+#define V4L2_FWHT_FL_I_FRAME			BIT(10)
 
 /* A 4-values flag - the number of components - 1 */
-#define FWHT_FL_COMPONENTS_NUM_MSK	GENMASK(18, 16)
-#define FWHT_FL_COMPONENTS_NUM_OFFSET	16
+#define V4L2_FWHT_FL_COMPONENTS_NUM_MSK	GENMASK(18, 16)
+#define V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET	16
 
-#define FWHT_FL_PIXENC_MSK	GENMASK(20, 19)
-#define FWHT_FL_PIXENC_OFFSET	19
-#define FWHT_FL_PIXENC_YUV	(1 << FWHT_FL_PIXENC_OFFSET)
-#define FWHT_FL_PIXENC_RGB	(2 << FWHT_FL_PIXENC_OFFSET)
-#define FWHT_FL_PIXENC_HSV	(3 << FWHT_FL_PIXENC_OFFSET)
+#define V4L2_FWHT_FL_PIXENC_MSK	GENMASK(20, 19)
+#define V4L2_FWHT_FL_PIXENC_OFFSET	19
+#define V4L2_FWHT_FL_PIXENC_YUV	(1 << V4L2_FWHT_FL_PIXENC_OFFSET)
+#define V4L2_FWHT_FL_PIXENC_RGB	(2 << V4L2_FWHT_FL_PIXENC_OFFSET)
+#define V4L2_FWHT_FL_PIXENC_HSV	(3 << V4L2_FWHT_FL_PIXENC_OFFSET)
 
 /*
  * A macro to calculate the needed padding in order to make sure
diff --git a/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c b/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c
index b6e39fbd8ad5..0c83678fcdad 100644
--- a/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c
+++ b/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c
@@ -11,34 +11,34 @@
 #include "codec-v4l2-fwht.h"
 
 static const struct v4l2_fwht_pixfmt_info v4l2_fwht_pixfmts[] = {
-	{ V4L2_PIX_FMT_YUV420,  1, 3, 2, 1, 1, 2, 2, 3, 3, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_YVU420,  1, 3, 2, 1, 1, 2, 2, 3, 3, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_YUV422P, 1, 2, 1, 1, 1, 2, 1, 3, 3, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_NV12,    1, 3, 2, 1, 2, 2, 2, 3, 2, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_NV21,    1, 3, 2, 1, 2, 2, 2, 3, 2, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_NV16,    1, 2, 1, 1, 2, 2, 1, 3, 2, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_NV61,    1, 2, 1, 1, 2, 2, 1, 3, 2, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_NV24,    1, 3, 1, 1, 2, 1, 1, 3, 2, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_NV42,    1, 3, 1, 1, 2, 1, 1, 3, 2, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_YUYV,    2, 2, 1, 2, 4, 2, 1, 3, 1, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_YVYU,    2, 2, 1, 2, 4, 2, 1, 3, 1, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_UYVY,    2, 2, 1, 2, 4, 2, 1, 3, 1, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_VYUY,    2, 2, 1, 2, 4, 2, 1, 3, 1, FWHT_FL_PIXENC_YUV},
-	{ V4L2_PIX_FMT_BGR24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_RGB24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_HSV24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_HSV},
-	{ V4L2_PIX_FMT_BGR32,   4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_XBGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_ABGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_RGB32,   4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_XRGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_ARGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_BGRX32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_BGRA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_RGBX32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_RGBA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_HSV32,   4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_HSV},
-	{ V4L2_PIX_FMT_GREY,    1, 1, 1, 1, 0, 1, 1, 1, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_YUV420,  1, 3, 2, 1, 1, 2, 2, 3, 3, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_YVU420,  1, 3, 2, 1, 1, 2, 2, 3, 3, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_YUV422P, 1, 2, 1, 1, 1, 2, 1, 3, 3, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_NV12,    1, 3, 2, 1, 2, 2, 2, 3, 2, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_NV21,    1, 3, 2, 1, 2, 2, 2, 3, 2, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_NV16,    1, 2, 1, 1, 2, 2, 1, 3, 2, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_NV61,    1, 2, 1, 1, 2, 2, 1, 3, 2, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_NV24,    1, 3, 1, 1, 2, 1, 1, 3, 2, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_NV42,    1, 3, 1, 1, 2, 1, 1, 3, 2, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_YUYV,    2, 2, 1, 2, 4, 2, 1, 3, 1, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_YVYU,    2, 2, 1, 2, 4, 2, 1, 3, 1, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_UYVY,    2, 2, 1, 2, 4, 2, 1, 3, 1, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_VYUY,    2, 2, 1, 2, 4, 2, 1, 3, 1, V4L2_FWHT_FL_PIXENC_YUV},
+	{ V4L2_PIX_FMT_BGR24,   3, 3, 1, 3, 3, 1, 1, 3, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGB24,   3, 3, 1, 3, 3, 1, 1, 3, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_HSV24,   3, 3, 1, 3, 3, 1, 1, 3, 1, V4L2_FWHT_FL_PIXENC_HSV},
+	{ V4L2_PIX_FMT_BGR32,   4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_XBGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_ABGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGB32,   4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_XRGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_ARGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_BGRX32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_BGRA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGBX32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGBA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_HSV32,   4, 4, 1, 4, 4, 1, 1, 4, 1, V4L2_FWHT_FL_PIXENC_HSV},
+	{ V4L2_PIX_FMT_GREY,    1, 1, 1, 1, 0, 1, 1, 1, 1, V4L2_FWHT_FL_PIXENC_RGB},
 };
 
 bool v4l2_fwht_validate_fmt(const struct v4l2_fwht_pixfmt_info *info,
@@ -251,25 +251,25 @@ int v4l2_fwht_encode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
 	p_hdr = (struct fwht_cframe_hdr *)p_out;
 	p_hdr->magic1 = FWHT_MAGIC1;
 	p_hdr->magic2 = FWHT_MAGIC2;
-	p_hdr->version = htonl(FWHT_VERSION);
+	p_hdr->version = htonl(V4L2_FWHT_VERSION);
 	p_hdr->width = htonl(state->visible_width);
 	p_hdr->height = htonl(state->visible_height);
-	flags |= (info->components_num - 1) << FWHT_FL_COMPONENTS_NUM_OFFSET;
+	flags |= (info->components_num - 1) << V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET;
 	flags |= info->pixenc;
 	if (encoding & FWHT_LUMA_UNENCODED)
-		flags |= FWHT_FL_LUMA_IS_UNCOMPRESSED;
+		flags |= V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED;
 	if (encoding & FWHT_CB_UNENCODED)
-		flags |= FWHT_FL_CB_IS_UNCOMPRESSED;
+		flags |= V4L2_FWHT_FL_CB_IS_UNCOMPRESSED;
 	if (encoding & FWHT_CR_UNENCODED)
-		flags |= FWHT_FL_CR_IS_UNCOMPRESSED;
+		flags |= V4L2_FWHT_FL_CR_IS_UNCOMPRESSED;
 	if (encoding & FWHT_ALPHA_UNENCODED)
-		flags |= FWHT_FL_ALPHA_IS_UNCOMPRESSED;
+		flags |= V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED;
 	if (!(encoding & FWHT_FRAME_PCODED))
-		flags |= FWHT_FL_I_FRAME;
+		flags |= V4L2_FWHT_FL_I_FRAME;
 	if (rf.height_div == 1)
-		flags |= FWHT_FL_CHROMA_FULL_HEIGHT;
+		flags |= V4L2_FWHT_FL_CHROMA_FULL_HEIGHT;
 	if (rf.width_div == 1)
-		flags |= FWHT_FL_CHROMA_FULL_WIDTH;
+		flags |= V4L2_FWHT_FL_CHROMA_FULL_WIDTH;
 	p_hdr->flags = htonl(flags);
 	p_hdr->colorspace = htonl(state->colorspace);
 	p_hdr->xfer_func = htonl(state->xfer_func);
@@ -299,9 +299,9 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
 	info = state->info;
 
 	version = ntohl(state->header.version);
-	if (!version || version > FWHT_VERSION) {
+	if (!version || version > V4L2_FWHT_VERSION) {
 		pr_err("version %d is not supported, current version is %d\n",
-		       version, FWHT_VERSION);
+		       version, V4L2_FWHT_VERSION);
 		return -EINVAL;
 	}
 
@@ -317,10 +317,10 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
 	flags = ntohl(state->header.flags);
 
 	if (version >= 2) {
-		if ((flags & FWHT_FL_PIXENC_MSK) != info->pixenc)
+		if ((flags & V4L2_FWHT_FL_PIXENC_MSK) != info->pixenc)
 			return -EINVAL;
-		components_num = 1 + ((flags & FWHT_FL_COMPONENTS_NUM_MSK) >>
-				FWHT_FL_COMPONENTS_NUM_OFFSET);
+		components_num = 1 + ((flags & V4L2_FWHT_FL_COMPONENTS_NUM_MSK) >>
+				V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET);
 	}
 
 	if (components_num != info->components_num)
@@ -333,8 +333,8 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
 	cf.rlc_data = (__be16 *)p_in;
 	cf.size = ntohl(state->header.size);
 
-	hdr_width_div = (flags & FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
-	hdr_height_div = (flags & FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
+	hdr_width_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
+	hdr_height_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
 	if (hdr_width_div != info->width_div ||
 	    hdr_height_div != info->height_div)
 		return -EINVAL;
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 0e115683f8da..084b75c226c5 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -200,14 +200,14 @@ static void copy_cap_to_ref(const u8 *cap, const struct v4l2_fwht_pixfmt_info *i
 
 static bool validate_by_version(unsigned int flags, unsigned int version)
 {
-	if (!version || version > FWHT_VERSION)
+	if (!version || version > V4L2_FWHT_VERSION)
 		return false;
 
 	if (version >= 2) {
 		unsigned int components_num = 1 +
-			((flags & FWHT_FL_COMPONENTS_NUM_MSK) >>
-			 FWHT_FL_COMPONENTS_NUM_OFFSET);
-		unsigned int pixenc = flags & FWHT_FL_PIXENC_MSK;
+			((flags & V4L2_FWHT_FL_COMPONENTS_NUM_MSK) >>
+			 V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET);
+		unsigned int pixenc = flags & V4L2_FWHT_FL_PIXENC_MSK;
 
 		if (components_num == 0 || components_num > 4 || !pixenc)
 			return false;
@@ -219,18 +219,18 @@ static bool validate_stateless_params_flags(const struct v4l2_ctrl_fwht_params *
 					    const struct v4l2_fwht_pixfmt_info *cur_info)
 {
 	unsigned int width_div =
-		(params->flags & FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
+		(params->flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
 	unsigned int height_div =
-		(params->flags & FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
+		(params->flags & V4L2_FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
 	unsigned int components_num = 3;
 	unsigned int pixenc = 0;
 
 	if (params->version < 3)
 		return false;
 
-	components_num = 1 + ((params->flags & FWHT_FL_COMPONENTS_NUM_MSK) >>
-			      FWHT_FL_COMPONENTS_NUM_OFFSET);
-	pixenc = (params->flags & FWHT_FL_PIXENC_MSK);
+	components_num = 1 + ((params->flags & V4L2_FWHT_FL_COMPONENTS_NUM_MSK) >>
+			      V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET);
+	pixenc = (params->flags & V4L2_FWHT_FL_PIXENC_MSK);
 	if (v4l2_fwht_validate_fmt(cur_info, width_div, height_div,
 				    components_num, pixenc))
 		return true;
@@ -278,7 +278,7 @@ static int device_process(struct vicodec_ctx *ctx,
 		 * set the reference buffer from the reference timestamp
 		 * only if this is a P-frame
 		 */
-		if (!(ntohl(ctx->state.header.flags) & FWHT_FL_I_FRAME)) {
+		if (!(ntohl(ctx->state.header.flags) & V4L2_FWHT_FL_I_FRAME)) {
 			struct vb2_buffer *ref_vb2_buf;
 			int ref_buf_idx;
 			struct vb2_queue *vq_cap =
@@ -331,7 +331,7 @@ static int device_process(struct vicodec_ctx *ctx,
 			copy_cap_to_ref(p_dst, ctx->state.info, &ctx->state);
 
 		vb2_set_plane_payload(&dst_vb->vb2_buf, 0, q_dst->sizeimage);
-		if (ntohl(ctx->state.header.flags) & FWHT_FL_I_FRAME)
+		if (ntohl(ctx->state.header.flags) & V4L2_FWHT_FL_I_FRAME)
 			dst_vb->flags |= V4L2_BUF_FLAG_KEYFRAME;
 		else
 			dst_vb->flags |= V4L2_BUF_FLAG_PFRAME;
@@ -480,16 +480,16 @@ static const struct v4l2_fwht_pixfmt_info *
 info_from_header(const struct fwht_cframe_hdr *p_hdr)
 {
 	unsigned int flags = ntohl(p_hdr->flags);
-	unsigned int width_div = (flags & FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
-	unsigned int height_div = (flags & FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
+	unsigned int width_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
+	unsigned int height_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
 	unsigned int components_num = 3;
 	unsigned int pixenc = 0;
 	unsigned int version = ntohl(p_hdr->version);
 
 	if (version >= 2) {
-		components_num = 1 + ((flags & FWHT_FL_COMPONENTS_NUM_MSK) >>
-				FWHT_FL_COMPONENTS_NUM_OFFSET);
-		pixenc = (flags & FWHT_FL_PIXENC_MSK);
+		components_num = 1 + ((flags & V4L2_FWHT_FL_COMPONENTS_NUM_MSK) >>
+				V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET);
+		pixenc = (flags & V4L2_FWHT_FL_PIXENC_MSK);
 	}
 	return v4l2_fwht_find_nth_fmt(width_div, height_div,
 				     components_num, pixenc, 0);
@@ -522,8 +522,8 @@ static void update_capture_data_from_header(struct vicodec_ctx *ctx)
 	const struct fwht_cframe_hdr *p_hdr = &ctx->state.header;
 	const struct v4l2_fwht_pixfmt_info *info = info_from_header(p_hdr);
 	unsigned int flags = ntohl(p_hdr->flags);
-	unsigned int hdr_width_div = (flags & FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
-	unsigned int hdr_height_div = (flags & FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
+	unsigned int hdr_width_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
+	unsigned int hdr_height_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
 
 	/*
 	 * This function should not be used by a stateless codec since
@@ -657,8 +657,8 @@ static int job_ready(void *priv)
 	if (!is_header_valid(&ctx->state.header) && ctx->comp_has_frame)
 		return 1;
 	flags = ntohl(ctx->state.header.flags);
-	hdr_width_div = (flags & FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
-	hdr_height_div = (flags & FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
+	hdr_width_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_WIDTH) ? 1 : 2;
+	hdr_height_div = (flags & V4L2_FWHT_FL_CHROMA_FULL_HEIGHT) ? 1 : 2;
 
 	if (ntohl(ctx->state.header.width) != q_dst->visible_width ||
 	    ntohl(ctx->state.header.height) != q_dst->visible_height ||
-- 
2.29.2

