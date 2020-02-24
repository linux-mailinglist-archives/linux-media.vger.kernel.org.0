Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C262D16AE0F
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 18:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgBXRwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 12:52:41 -0500
Received: from mx1.emlix.com ([188.40.240.192]:50064 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727426AbgBXRwl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 12:52:41 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id F3ADD5F97F;
        Mon, 24 Feb 2020 18:52:38 +0100 (CET)
From:   =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [PATCH 2/3] media: v4l: Add 14-bit raw greyscale pixel format
Date:   Mon, 24 Feb 2020 18:52:21 +0100
Message-Id: <20200224175222.1875-2-dg@emlix.com>
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

The new format is called V4L2_PIX_FMT_Y14. Like V4L2_PIX_FMT_Y10 and
V4L2_PIX_FMT_Y12 it is stored in two bytes per pixel but has only two
unused bits at the top.

Signed-off-by: Daniel Glöckner <dg@emlix.com>
---
 Documentation/media/uapi/v4l/pixfmt-y14.rst  | 72 ++++++++++++++++++++
 Documentation/media/uapi/v4l/yuv-formats.rst |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c         |  1 +
 include/uapi/linux/videodev2.h               |  1 +
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-y14.rst

diff --git a/Documentation/media/uapi/v4l/pixfmt-y14.rst b/Documentation/media/uapi/v4l/pixfmt-y14.rst
new file mode 100644
index 000000000000..5c260f8da088
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-y14.rst
@@ -0,0 +1,72 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/media/uapi/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _V4L2-PIX-FMT-Y14:
+
+*************************
+V4L2_PIX_FMT_Y14 ('Y14 ')
+*************************
+
+
+Grey-scale image
+
+
+Description
+===========
+
+This is a grey-scale image with a depth of 14 bits per pixel. Pixels are
+stored in 16-bit words with unused high bits padded with 0. The least
+significant byte is stored at lower memory addresses (little-endian).
+
+**Byte Order.**
+Each cell is one byte.
+
+
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00low`
+      - Y'\ :sub:`00high`
+      - Y'\ :sub:`01low`
+      - Y'\ :sub:`01high`
+      - Y'\ :sub:`02low`
+      - Y'\ :sub:`02high`
+      - Y'\ :sub:`03low`
+      - Y'\ :sub:`03high`
+    * - start + 8:
+      - Y'\ :sub:`10low`
+      - Y'\ :sub:`10high`
+      - Y'\ :sub:`11low`
+      - Y'\ :sub:`11high`
+      - Y'\ :sub:`12low`
+      - Y'\ :sub:`12high`
+      - Y'\ :sub:`13low`
+      - Y'\ :sub:`13high`
+    * - start + 16:
+      - Y'\ :sub:`20low`
+      - Y'\ :sub:`20high`
+      - Y'\ :sub:`21low`
+      - Y'\ :sub:`21high`
+      - Y'\ :sub:`22low`
+      - Y'\ :sub:`22high`
+      - Y'\ :sub:`23low`
+      - Y'\ :sub:`23high`
+    * - start + 24:
+      - Y'\ :sub:`30low`
+      - Y'\ :sub:`30high`
+      - Y'\ :sub:`31low`
+      - Y'\ :sub:`31high`
+      - Y'\ :sub:`32low`
+      - Y'\ :sub:`32high`
+      - Y'\ :sub:`33low`
+      - Y'\ :sub:`33high`
diff --git a/Documentation/media/uapi/v4l/yuv-formats.rst b/Documentation/media/uapi/v4l/yuv-formats.rst
index 867470e5f9e1..3b259e31b7a1 100644
--- a/Documentation/media/uapi/v4l/yuv-formats.rst
+++ b/Documentation/media/uapi/v4l/yuv-formats.rst
@@ -35,6 +35,7 @@ to brightness information.
     pixfmt-grey
     pixfmt-y10
     pixfmt-y12
+    pixfmt-y14
     pixfmt-y10b
     pixfmt-y10p
     pixfmt-y16
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2558ffe4e3cb..7fdb4e87325f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1222,6 +1222,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
 	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8429e5ab2d94..5c54183c2630 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -565,6 +565,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y6      v4l2_fourcc('Y', '0', '6', ' ') /*  6  Greyscale     */
 #define V4L2_PIX_FMT_Y10     v4l2_fourcc('Y', '1', '0', ' ') /* 10  Greyscale     */
 #define V4L2_PIX_FMT_Y12     v4l2_fourcc('Y', '1', '2', ' ') /* 12  Greyscale     */
+#define V4L2_PIX_FMT_Y14     v4l2_fourcc('Y', '1', '4', ' ') /* 14  Greyscale     */
 #define V4L2_PIX_FMT_Y16     v4l2_fourcc('Y', '1', '6', ' ') /* 16  Greyscale     */
 #define V4L2_PIX_FMT_Y16_BE  v4l2_fourcc_be('Y', '1', '6', ' ') /* 16  Greyscale BE  */
 
-- 
2.17.1

