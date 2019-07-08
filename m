Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4191A61A83
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 08:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfGHGCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 02:02:45 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:38039 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727218AbfGHGCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 02:02:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A0350671;
        Mon,  8 Jul 2019 02:02:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 08 Jul 2019 02:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f1h8WjsdJ0PzZfOht
        MZ0xUwI3eF+7OSG/WXp6wFIuDE=; b=GRhfyP7xxMCvVbIuNMaEcOlBqA4N7oVZa
        k9XUOm97rc5fF6RRwch0QIiArQAK2rl7Qwq/C7dBkovwBRRmfpNsqOG5jqJo9MV0
        ShhTksZQoBcbiVbQSslIyuUbhCGnZ2trtjpQ6ME5j4gN88jtKnv/CPq9kELyYd9q
        h66u5VyTDzV/rhVQYcf4aVo0+NjcIj5SMFQUnHXfi2PLj5xfuI3M6hweRYf/1uvF
        x9HAJfFoRD1D+BvuZzDHWxC68BVfccZOj3FlFMbban9LIoZ2mS+bdU7MDAx7bB2R
        SXZ2WaXydKvV9cy8cflipybJ/5XBu6gPzDQHEOFOJ0cTQ1/MyfIqQ==
X-ME-Sender: <xms:gtwiXTdSXWN3BrYMaCz4R-qdbgnpHcpfnTR3s8VwGHx93j-95_vrUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeelgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefgughgrghrucfv
    hhhivghruceoihhnfhhosegvughgrghrthhhihgvrhdrnhgvtheqnecuffhomhgrihhnpe
    gvmhhvrgdrohhrghdpvhhishhiohhnohhnlhhinhgvrdhorhhgnecukfhppeefuddrvddt
    ledrleehrddvgedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehinhhfohesvggughgrrh
    hthhhivghrrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gtwiXddgckRIWSFT1LJvkK0Pcq4aySiAgBOGTheSKMLLtsZpvCLI_Q>
    <xmx:gtwiXXhSk2FVgWXjGsr0LOSI6fEB9SLS4KYQDLpHwc_BniA1kDcRKQ>
    <xmx:gtwiXZT2cA0Q9f0h7ZSMdImr-RnSpCTgWxu0-aO1pm424peJTQJtLg>
    <xmx:g9wiXWRFW97U6uetNYAVf0yM38ryOk-oFoIIgOi9-aD_uqJzAaOnQg>
Received: from localhost.localdomain (unknown [31.209.95.242])
        by mail.messagingengine.com (Postfix) with ESMTPA id 960B980060;
        Mon,  8 Jul 2019 02:02:41 -0400 (EDT)
From:   Edgar Thier <info@edgarthier.net>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi
Cc:     Edgar Thier <info@edgarthier.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH v2 1/2] v4l: Add 12-bit raw bayer linear packed formats
Date:   Mon,  8 Jul 2019 08:02:25 +0200
Message-Id: <20190708060225.5172-1-info@edgarthier.net>
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
 .../media/uapi/v4l/pixfmt-srggb12lp.rst       | 76 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
 include/uapi/linux/videodev2.h                |  7 ++
 4 files changed, 88 insertions(+)
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
index 000000000000..08d73cfdc42d
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-srggb12lp.rst
@@ -0,0 +1,76 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-sbggr12lp:
+.. _v4l2-pix-fmt-sgbrg12lp:
+.. _v4l2-pix-fmt-sgrbg12lp:
+.. _v4l2-pix-fmt-srggb12lp:
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
+These packed Bayer formats are used by industrial cameras, often in conjunction
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
index ac87c3e37280..0cef797e4989 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1275,6 +1275,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index 1050a75fb7ef..adee353d5913 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -646,6 +646,13 @@ struct v4l2_pix_format {
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
2.20.1

