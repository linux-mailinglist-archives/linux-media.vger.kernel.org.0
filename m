Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FF32A36BC
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgKBWmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:42:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42350 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgKBWmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:42:15 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D52D1AAE;
        Mon,  2 Nov 2020 23:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356923;
        bh=tJWOaqIl77E2yg0sDbeby8WaXzJDiVBRnfUlVWXVxSk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xz/L20CqWWdAveDWiWCHj4ixvadkreQVecbu76jB/hk5SRF8Js2yy2vYNPOeTub+y
         LuDm5BO1k9CKZZUqq+ybvIP8cT2vwhXfijvEyeQNkz2Tt9IYkB4/pC53fKyKwvCpp5
         Qop2rgku/SKN45zQJgN4bDHeYsevGHI6Ku4CIFpQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 17/19] media: v4l2: Add 10-, 12- and 16-bpc 4:4:4 packed VUY formats
Date:   Tue,  3 Nov 2020 00:41:00 +0200
Message-Id: <20201102224102.30292-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add three new formats storing packed YUV 4:4:4 in 10-, 12- and 16-bpc
variants, with component order VUY. They are used by the Xilinx Video
Frame Buffer Read/Write IP cores.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Interleave component names and number of bits
---
 .../media/v4l/pixfmt-packed-yuv.rst           | 56 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  3 +
 2 files changed, 59 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 6824898122aa..7f66d5ba8cfa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -257,6 +257,62 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
       applications and drivers.
 
 
+The next table lists the packed YUV 4:4:4 formats with more than 8 bits per
+component. They are named similarly to the formats with less than 8 bits per
+components, based on the order of the Y, Cb and Cr components as seen in a
+word, which is then stored in memory in little endian byte order, and on the
+number of bits for each component. The component names and the corresponding
+number of bits are interleaved for clarity.
+
+.. flat-table:: Packed YUV Image Formats (more than 8bpc)
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      - Byte 0
+      - Byte 1
+      - Byte 2
+      - Byte 3
+      - Byte 4
+      - Byte 5
+
+    * .. _V4L2-PIX-FMT-X2V10U10Y10:
+
+      - ``V4L2_PIX_FMT_X2V10U10Y10``
+      - 'VY30'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`5-0` Y'\ :sub:`9-8`
+      - Cr\ :sub:`3-0` Cb\ :sub:`9-6`
+      - `-`\ :sub:`1-0` Cr\ :sub:`9-4`
+      -
+
+    * .. _V4L2-PIX-FMT-X4V12U12Y12:
+
+      - ``V4L2_PIX_FMT_X4V12U12Y12``
+      - 'VY36'
+
+      - Y'\ :sub:`7-0`
+      - Cb\ :sub:`3-0` Y'\ :sub:`11-8`
+      - Cb\ :sub:`11-4`
+      - Cr\ :sub:`7-0`
+      - `-`\ :sub:`3-0` Cr\ :sub:`11-8`
+      -
+
+    * .. _V4L2-PIX-FMT-V16U16Y16:
+
+      - ``V4L2_PIX_FMT_V16U16Y16``
+      - 'VY40'
+
+      - Y'\ :sub:`7-0`
+      - Y'\ :sub:`15-8`
+      - Cb\ :sub:`7-0`
+      - Cb\ :sub:`15-8`
+      - Cr\ :sub:`7-0`
+      - Cr\ :sub:`15-8`
+
+
 4:2:2 Subsampling
 =================
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index afe3619bc77c..5cdbd1a2fddb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -602,6 +602,9 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
 #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
 #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
+#define V4L2_PIX_FMT_X2V10U10Y10 v4l2_fourcc('V', 'Y', '3', '0') /* 32  XVUY-2-10-10-10 */
+#define V4L2_PIX_FMT_X4V12U12Y12 v4l2_fourcc('V', 'Y', '3', '6') /* 40  XVUY-4-12-12-12 */
+#define V4L2_PIX_FMT_V16U16Y16 v4l2_fourcc('V', 'Y', '4', '8') /* 48  VUY-16-16-16 */
 
 /* two planes -- one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
-- 
Regards,

Laurent Pinchart

