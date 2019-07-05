Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA36C60518
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 13:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfGELHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 07:07:49 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55985 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727066AbfGELHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jul 2019 07:07:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 3838C4DC;
        Fri,  5 Jul 2019 07:07:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 05 Jul 2019 07:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A4upV78wronQpeOg/
        bwyrt1Wq8W9ulzBqRuG0BXA3m8=; b=ac9NUROJ/BdOb9G5HNyyarcaBmDf7NA9Y
        KqlUH2q+QGE12axEZdrpGQQzKgR99IRTMSBTTzhAo/jdG3mNA1ORMpHxcnFAuiX3
        eqzMoRSrwzJuaTJxhjaSZNpqfxLNF39nYuAjrxnFwYtRjBqGOwbIieoBI8wJ95uj
        vVV/gsNQ7kq0FWS2YUfNTaATZe8Qkh4/Uh1hEpdLS7OTuB2wsu2sV1KXvbkCN7M2
        FHQEt0JKLB/iR55mboP3xPAwmllgMra/OXJXoChZbTxeghkfw3pcWr9Qf8cJoSnZ
        1crvMNsYkYFktx8O+gXyd0UeOFn+4M8yOzFg8zCs3XcNob6ma2VBg==
X-ME-Sender: <xms:gi8fXTaBmj4NCgK3sjyX09Rvt7tuPKMj17J1ne6MDHizXCoP2VIf5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeeggdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepgfgughgrrhcuvfhh
    ihgvrhcuoehinhhfohesvggughgrrhhthhhivghrrdhnvghtqeenucffohhmrghinhepvg
    hmvhgrrdhorhhgpdhvihhsihhonhhonhhlihhnvgdrohhrghenucfkphepfedurddvtdel
    rdelhedrvdegvdenucfrrghrrghmpehmrghilhhfrhhomhepihhnfhhosegvughgrghrth
    hhihgvrhdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:gi8fXeeQ7JS1cAMvDXqI-H7v_4GLaAHuY4H5G78S2nrDrv5SeThlpw>
    <xmx:gi8fXb72e3D3t1SL4vdFSjpjJcu6XaG_9NHP8cJRoFZSS_KMLYknTg>
    <xmx:gi8fXanQ8HU2-c3HTc8CrUY5jZsHn7tVB5YDCDjQB27v7Gug6ZbGew>
    <xmx:gy8fXSKR6bd-xZhHeGhJAh78VYKwxyJJQrgkWndB3rjtB2NevO5C5g>
Received: from localhost.localdomain (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1D89A380076;
        Fri,  5 Jul 2019 07:07:46 -0400 (EDT)
From:   Edgar Thier <info@edgarthier.net>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 1/2] v4l: Add 12-bit raw bayer linear packed formats
Date:   Fri,  5 Jul 2019 13:07:23 +0200
Message-Id: <20190705110723.29685-1-info@edgarthier.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These formats are compressed 12-bit raw bayer formats with four different
pixel orders. The pixel follow one another without any padding,
thus are packed in a 'linear' fashion.

Signed-off-by: Edgar Thier <info@edgarthier.net>
---
 Documentation/media/uapi/v4l/pixfmt-rgb.rst   |  1 +
 .../media/uapi/v4l/pixfmt-srggb12lp.rst       | 60 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 ++
 include/uapi/linux/videodev2.h                |  7 +++
 4 files changed, 72 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst

diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
index 48ab80024835..9efa500c02dc 100644
--- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
@@ -26,5 +26,6 @@ RGB Formats
     pixfmt-srggb10-ipu3
     pixfmt-srggb12
     pixfmt-srggb12p
+    pixfmt-srggb12lp
     pixfmt-srggb14p
     pixfmt-srggb16
diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
new file mode 100644
index 000000000000..13d32ad92c73
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
@@ -0,0 +1,60 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-sgrbg12lp:
+.. _v4l2-pix-fmt-srggb12lp:
+.. _v4l2-pix-fmt-sbggr12lp:
+.. _v4l2-pix-fmt-sgbrg12lp:
+
+**********************************************************************************************************************************
+V4L2_PIX_FMT_SBGGR12LP ('BGCp'), V4L2_PIX_FMT_SGBRG12LP ('GBCp'), V4L2_PIX_FMT_SGRBG12LP ('GRCp'), V4L2_PIX_FMT_SRGGB12LP ('RGCp')
+**********************************************************************************************************************************
+
+12-bit Bayer formats
+
+Description
+===========
+
+These four pixel formats are used by industrial cameras, often in conjunction
+with UsbVision (see https://www.visiononline.org/userAssets/aiaUploads/file/USB3_Vision_Specification_v1-0-1.pdf).
+
+The formats are equal to the Genicam PFNC Bayer12p formats
+(see https://www.emva.org/wp-content/uploads/GenICam_PFNC_2_3.pdf).
+
+They are raw sRGB / Bayer formats with 12 bits
+per sample with 3 bytes for every 2 pixels.
+
+The format is little endian.
+
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
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ac87c3e37280..98c3c7fde046 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1275,6 +1275,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SGBRG12LP:	descr = "12-bit Bayer GBGB/RGRG Linear Packed"; break;
+	case V4L2_PIX_FMT_SGRBG12LP:	descr = "12-bit Bayer GRGR/BGBG Linear Packed"; break;
+	case V4L2_PIX_FMT_SBGGR12LP:	descr = "12-bit Bayer BGBG/GRGR Linear Packed"; break;
+	case V4L2_PIX_FMT_SRGGB12LP:	descr = "12-bit Bayer RGRG/GBGB Linear Packed"; break;
 	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
 	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
 	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..f0b81b870f29 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -646,6 +646,13 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG12 v4l2_fourcc('G', 'B', '1', '2') /* 12  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG12 v4l2_fourcc('B', 'A', '1', '2') /* 12  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB12 v4l2_fourcc('R', 'G', '1', '2') /* 12  RGRG.. GBGB.. */
+
+	/* 12bit raw bayer simple packed, 6 bytes for every 4 pixels */
+#define V4L2_PIX_FMT_SBGGR12LP v4l2_fourcc('B', 'G', 'C', 'p')
+#define V4L2_PIX_FMT_SGBRG12LP v4l2_fourcc('G', 'B', 'C', 'p')
+#define V4L2_PIX_FMT_SGRBG12LP v4l2_fourcc('G', 'R', 'C', 'p')
+#define V4L2_PIX_FMT_SRGGB12LP v4l2_fourcc('R', 'G', 'C', 'p')
+
 	/* 12bit raw bayer packed, 6 bytes for every 4 pixels */
 #define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')
 #define V4L2_PIX_FMT_SGBRG12P v4l2_fourcc('p', 'G', 'C', 'C')
-- 
2.20.1

