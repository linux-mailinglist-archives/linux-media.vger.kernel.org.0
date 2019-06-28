Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140C15963C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 10:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfF1Ihz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 04:37:55 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48785 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726056AbfF1Ihz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 04:37:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0E0F920CB3;
        Fri, 28 Jun 2019 04:37:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 28 Jun 2019 04:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1FQYyb1o1Zboma/43
        TrSXmFkhhRGemdjZP4pNCruGUk=; b=BgPPAd1k5b+EaQZ3/vUOz3Ufscz55QP7Z
        aX8u0IWKbQ0l0/hh9JWRl5tV/icpBXRZIqqu0fBj5If7NxnRn2xBwz3K/QM2tHMf
        DQ09k0eMhKnWZcpZs+JLuGlqzSlnmkUaQzMDbcX1B93aTYiYeXij+sAeyU2wlowf
        hi7VOQeoo0PZmLu5ugH3zdfIwkcrMl/Y6j0AnTh1S16r+K+OiEH8EpLcj44sT7S9
        sv+/Dc+ro0j93ZfiuIO0gcirq7pJ4sIZyhGmc4asZAeaOV3Hi7HnFRK6yaw2oldT
        lPFdidxPJVAX3St31OxyvWkObSmiUlL9qo1ANZvx9dom3VO5I5OUg==
X-ME-Sender: <xms:4dEVXaXoqHdF_jowwAWpWX2Z-I6GlZN5mCCI8tNtYxQx_ATkVP86yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvddtgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepgfgughgrrhcuvfhh
    ihgvrhcuoehinhhfohesvggughgrrhhthhhivghrrdhnvghtqeenucffohhmrghinhepvg
    hmvhgrrdhorhhgpdhvihhsihhonhhonhhlihhnvgdrohhrghenucfkphepfedurddvtdel
    rdelhedrvdegvdenucfrrghrrghmpehmrghilhhfrhhomhepihhnfhhosegvughgrghrth
    hhihgvrhdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:4dEVXYekz2yprvZRyidk8eeRiD8rBZfnbq2xx91Tyz3MMfwI7_wVLQ>
    <xmx:4dEVXTiJDJL_rYQiGHQMgOxmgak3QlpCKcS61VFvDyqBT-YrbchB4g>
    <xmx:4dEVXRgmEMxpz5f26p1XivmCkHbu1vJsq3DbTHSG4HfE0amjL07P2w>
    <xmx:4tEVXXkuAvwlEOl7yitUQ0CxFopKFkLuj5csjXbRM31c08WDDIXWJQ>
Received: from localhost.localdomain (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA id D51FF380085;
        Fri, 28 Jun 2019 04:37:52 -0400 (EDT)
From:   Edgar Thier <info@edgarthier.net>
To:     laurent.pinchart@ideasonboard.com
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 1/2] v4l: Add Genicam 12-bit bayer packed formats
Date:   Fri, 28 Jun 2019 10:37:40 +0200
Message-Id: <20190628083740.21315-1-info@edgarthier.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These formats are compressed 12-bit raw bayer formats with four different
pixel orders. They are similar to 10-bit bayer formats 'IPU3'.
The naming and pixel structure follow
the Genicam Pixel Format Naming Convention (PFNC).

Signed-off-by: Edgar Thier <info@edgarthier.net>
---
 .../media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst | 61 +++++++++++++++++++
 Documentation/media/uapi/v4l/pixfmt-rgb.rst   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 ++
 include/uapi/linux/videodev2.h                |  7 +++
 4 files changed, 73 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst

diff --git a/Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst b/Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst
new file mode 100644
index 000000000000..6d294cf89353
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-pfnc-bayerrg12p.rst
@@ -0,0 +1,61 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-pfnc-bayergr12p:
+.. _v4l2-pix-fmt-pfnc-bayerrg12p:
+.. _v4l2-pix-fmt-pfnc-bayerbg12p:
+.. _v4l2-pix-fmt-pfnc-bayergb12p:
+
+**********************************************************************************************************************************************************
+V4L2_PIX_FMT_PFNC_BAYERBG12P ('BGCp'), V4L2_PIX_FMT_PFNC_BAYERGB12P ('GBCp'), V4L2_PIX_FMT_PFNC_BAYERGR12P ('GRCp'), V4L2_PIX_FMT_PFNC_BAYERRG12P ('RGCp')
+**********************************************************************************************************************************************************
+
+12-bit Bayer formats
+
+Description
+===========
+
+These four pixel formats are used by industrial cameras, often in conjunction
+with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
+
+The naming is in accordance to the Genicam Pixel Format Naming Convention
+(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
+
+They are raw sRGB / Bayer formats with 12 bits
+per sample with 3 bytes for every 2 pixels.
+
+The format is little endian.
+
+In other respects this format is similar to :ref:`v4l2-pix-fmt-ipu3-sbggr10`.
+Below is an example of a small image in V4L2_PIX_FMT_PFNC_BAYERBG12P format.
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
+
+    * - start + 6:
+      - G\ :sub:`02low`
+      - R\ :sub:`03low`\ (bits 7--4)
+        G\ :sub:`02high`\ (bits 0--3)
+      - R\ :sub:`03high`
+
+    * - start + 12:
+      - B\ :sub:`04low`
+      - G\ :sub:`05low`\ (bits 7--4)
+        B\ :sub:`04high`\ (bits 0--3)
+      - G\ :sub:`05high`
+
+    * - start + 24:
+      - G\ :sub:`06low`
+      - R\ :sub:`07low`\ (bits 7--4)
+        G\ :sub:`06high`\ (bits 0--3)
+      - R\ :sub:`07high`
+
diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
index 48ab80024835..157a6a3a1e49 100644
--- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
@@ -26,5 +26,6 @@ RGB Formats
     pixfmt-srggb10-ipu3
     pixfmt-srggb12
     pixfmt-srggb12p
+    pixfmt-pfnc-bayerrg12p
     pixfmt-srggb14p
     pixfmt-srggb16
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ac87c3e37280..8fab2f3fcbe5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1275,6 +1275,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_PFNC_BAYERBG12P: descr = "12-bit Bayer BGBG/GRGR PFNC Packed"; break;
+	case V4L2_PIX_FMT_PFNC_BAYERGB12P: descr = "12-bit Bayer GBGB/RGRG PFNC Packed"; break;
+	case V4L2_PIX_FMT_PFNC_BAYERGR12P: descr = "12-bit Bayer GRGR/BGBG PFNC Packed"; break;
+	case V4L2_PIX_FMT_PFNC_BAYERRG12P: descr = "12-bit Bayer RGRG/GBGB PFNC Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..2f0b7e821cc8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -646,6 +646,13 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
+
+	/* 12bit raw bayer simple packed, 6 bytes for every 4 pixels */
+#define V4L2_PIX_FMT_PFNC_BAYERBG12P v4l2_fourcc('B', 'G', 'C', 'p')
+#define V4L2_PIX_FMT_PFNC_BAYERGB12P v4l2_fourcc('G', 'B', 'C', 'p')
+#define V4L2_PIX_FMT_PFNC_BAYERGR12P v4l2_fourcc('G', 'R', 'C', 'p')
+#define V4L2_PIX_FMT_PFNC_BAYERRG12P v4l2_fourcc('R', 'G', 'C', 'p')
+
 	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
 #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
 #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')
--
2.20.1
