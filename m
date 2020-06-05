Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9911EFEC7
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 19:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgFER1B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 13:27:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38990 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgFER05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 13:26:57 -0400
Received: from localhost.localdomain (p200300cb871f5b0030b619f331cc239b.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:30b6:19f3:31cc:239b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C2D542A5091;
        Fri,  5 Jun 2020 18:26:55 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
Subject: [RFC v4 8/8] media: v4l2: add support for the CSC API for hsv_enc on mediabus
Date:   Fri,  5 Jun 2020 19:26:25 +0200
Message-Id: <20200605172625.19777-9-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the flag V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC that drivers
can set when enumerating the supported mediabus formats
on subdevices to indicate that the userspace can ask to
set the 'hsv_enc'. The patch also replaces the 'ycbcr_enc'
field in 'struct v4l2_mbus_framefmt' with a union that
includes 'hsv_enc'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../media/v4l/subdev-formats.rst              | 22 +++++++++++++++++--
 include/uapi/linux/v4l2-mediabus.h            |  8 ++++++-
 include/uapi/linux/v4l2-subdev.h              |  1 +
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 75eb7f8bb4c5..d06d1ac95452 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -44,6 +44,8 @@ Media Bus Formats
       - Image colorspace, from enum
 	:c:type:`v4l2_colorspace`. See
 	:ref:`colorspaces` for details.
+    * - union {
+      - (anonymous)
     * - __u16
       - ``ycbcr_enc``
       - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
@@ -59,7 +61,23 @@ Media Bus Formats
 	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
 	See :ref:`v4l2-subdev-mbus-code-flags`
-
+    * - __u16
+      - ``hsv_enc``
+      - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
+        This information supplements the ``colorspace`` and must be set by
+	the driver for capture streams and by the application for output
+	streams, see :ref:`colorspaces`. If the application sets the
+	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
+	this field for a capture stream to request a specific HSV encoding
+	for the media bus data. If the driver cannot handle requested
+	conversion, it will return another supported encoding.
+	This field is ignored for Y'CbCr media bus formats. The driver indicates
+	that hsv_enc conversion is supported by setting the flag
+	V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC in the corresponding struct
+	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
+	See :ref:`v4l2-subdev-mbus-code-flags`
+    * - }
+      -
     * - __u16
       - ``quantization``
       - Quantization range, from enum :c:type:`v4l2_quantization`.
@@ -103,7 +121,7 @@ Media Bus Formats
       - Set by the application. It is only used for capture and is
 	ignored for output streams. If set, then request the subdevice to do
 	colorspace conversion from the received colorspace to the requested
-	colorspace values. If colorimetry field (``ycbcr_enc`` or
+	colorspace values. If colorimetry field (``ycbcr_enc``, ``hsv_enc`` or
 	``quantization``) is set to 0, then that colorimetry setting will remain
 	unchanged from what was received. So to change the quantization, only the
 	``quantization`` field shall be set to non-zero values
diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
index 0f916278137a..9c4a10d21a49 100644
--- a/include/uapi/linux/v4l2-mediabus.h
+++ b/include/uapi/linux/v4l2-mediabus.h
@@ -26,6 +26,7 @@
  * @field:	used interlacing type (from enum v4l2_field)
  * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
  * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
+ * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
  * @quantization: quantization of the data (from enum v4l2_quantization)
  * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
  */
@@ -35,7 +36,12 @@ struct v4l2_mbus_framefmt {
 	__u32			code;
 	__u32			field;
 	__u32			colorspace;
-	__u16			ycbcr_enc;
+	union {
+		/* enum v4l2_ycbcr_encoding */
+		__u16			ycbcr_enc;
+		/* enum v4l2_hsv_encoding */
+		__u16			hsv_enc;
+	};
 	__u16			quantization;
 	__u16			xfer_func;
 	__u16			flags;
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 972e64d8b54e..685f920de5c7 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -66,6 +66,7 @@ struct v4l2_subdev_crop {
 };
 
 #define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000001
+#define V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC	0x00000001
 #define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000002
 /**
  * struct v4l2_subdev_mbus_code_enum - Media bus format enumeration
-- 
2.17.1

