Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E03A213E4C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 19:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgGCRKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 13:10:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46034 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgGCRKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 13:10:32 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id DA8622A65BF
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 2/7] v4l2: add support for colorspace conversion API (CSC) for video capture
Date:   Fri,  3 Jul 2020 19:10:14 +0200
Message-Id: <20200703171019.19270-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For video capture it is the driver that reports the colorspace,
Y'CbCr/HSV encoding, quantization range and transfer function
used by the video, and there is no way to request something
different, even though many HDTV receivers have some sort of
colorspace conversion capabilities.

For output video this feature already exists since the application
specifies this information for the video format it will send out, and
the transmitter will enable any available CSC if a format conversion has
to be performed in order to match the capabilities of the sink.

For video capture we propose adding new v4l2_pix_format flag:
V4L2_PIX_FMT_FLAG_SET_CSC. The flag is set by the application,
the driver will interpret the colorspace, ycbcr_enc/hsv_enc, quantization
and xfer_func fields as the requested colorspace information and will
attempt to do the conversion it supports.

Drivers set the flags
V4L2_FMT_FLAG_CSC_COLORSPACE,
V4L2_FMT_FLAG_CSC_YCBCR_ENC,
V4L2_FMT_FLAG_CSC_HSV_ENC,
V4L2_FMT_FLAG_CSC_QUANTIZATION,
V4L2_FMT_FLAG_CSC_XFER_FUNC,
in the flags field of the struct v4l2_fmtdesc during enumeration to
indicate that they support colorspace conversion for the respective field.

Drivers do not have to actually look at the flags. If the flags are not
set, then the fields 'colorspace', 'ycbcr_enc/hsv_enc', 'quantization'
and 'xfer_func' are set to the default values by the core, i.e. just
pass on the received format without conversion.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../media/v4l/pixfmt-v4l2-mplane.rst          | 16 ++---
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   | 64 +++++++++++++++++--
 .../media/v4l/vidioc-enum-fmt.rst             | 35 ++++++++++
 .../media/videodev2.h.rst.exceptions          |  5 ++
 include/uapi/linux/videodev2.h                |  6 ++
 5 files changed, 109 insertions(+), 17 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
index 444b4082684c..66f3365d7b72 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
@@ -105,29 +105,21 @@ describing all planes of that format.
     * - __u8
       - ``ycbcr_enc``
       - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
-        This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	See struct :c:type:`v4l2_pix_format`.
     * - __u8
       - ``hsv_enc``
       - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
-        This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	See struct :c:type:`v4l2_pix_format`.
     * - }
       -
     * - __u8
       - ``quantization``
       - Quantization range, from enum :c:type:`v4l2_quantization`.
-        This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	See struct :c:type:`v4l2_pix_format`.
     * - __u8
       - ``xfer_func``
       - Transfer function, from enum :c:type:`v4l2_xfer_func`.
-        This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	See struct :c:type:`v4l2_pix_format`.
     * - __u8
       - ``reserved[7]``
       - Reserved for future extensions. Should be zeroed by drivers and
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
index 56a2952de873..d9f8f7eb7098 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
@@ -116,7 +116,14 @@ Single-planar format structure
       - Image colorspace, from enum :c:type:`v4l2_colorspace`.
         This information supplements the ``pixelformat`` and must be set
 	by the driver for capture streams and by the application for
-	output streams, see :ref:`colorspaces`.
+	output streams, see :ref:`colorspaces`. If the application sets the
+	flag ``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set
+	this field for a capture stream to request a specific colorspace
+	for the captured image data. If the driver cannot handle requested
+	conversion, it will return another supported colorspace.
+	The driver indicates that colorspace conversion is supported by setting
+	the flag V4L2_FMT_FLAG_CSC_COLORSPACE in the corresponding struct
+	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`.
     * - __u32
       - ``priv``
       - This field indicates whether the remaining fields of the
@@ -153,13 +160,29 @@ Single-planar format structure
       - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
         This information supplements the ``colorspace`` and must be set by
 	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	streams, see :ref:`colorspaces`. If the application sets the
+	flag ``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set
+	this field for a capture stream to request a specific Y'CbCr encoding
+	for the captured image data. If the driver cannot handle requested
+	conversion, it will return another supported encoding.
+	This field is ignored for HSV pixelformats. The driver indicates that
+	ycbcr_enc conversion is supported by setting the flag
+	V4L2_FMT_FLAG_CSC_YCBCR_ENC in the corresponding struct
+	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`.
     * - __u32
       - ``hsv_enc``
       - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
         This information supplements the ``colorspace`` and must be set by
 	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	streams, see :ref:`colorspaces`. If the application sets the flag
+	``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set this
+	field for a capture stream to request a specific HSV encoding for the
+	captured image data. If the driver cannot handle requested
+	conversion, it will return another supported encoding.
+	This field is ignored for non-HSV pixelformats. The driver indicates
+	that hsv_enc conversion is supported by setting the flag
+	V4L2_FMT_FLAG_CSC_HSV_ENC in the corresponding struct
+	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`.
     * - }
       -
     * - __u32
@@ -167,13 +190,27 @@ Single-planar format structure
       - Quantization range, from enum :c:type:`v4l2_quantization`.
         This information supplements the ``colorspace`` and must be set by
 	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	streams, see :ref:`colorspaces`. If the application sets the flag
+	``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set
+	this field for a capture stream to request a specific quantization
+	range for the captured image data. If the driver cannot handle requested
+	conversion, it will return another supported encoding.
+	The driver indicates that quantization conversion is supported by setting
+	the flag V4L2_FMT_FLAG_CSC_QUANTIZATION in the corresponding struct
+	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`.
     * - __u32
       - ``xfer_func``
       - Transfer function, from enum :c:type:`v4l2_xfer_func`.
         This information supplements the ``colorspace`` and must be set by
 	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	streams, see :ref:`colorspaces`. If the application sets the flag
+	``V4L2_PIX_FMT_FLAG_SET_CSC`` then the application can set
+	this field for a capture stream to request a specific Transfer function
+	for the captured image data. If the driver cannot handle requested
+	conversion, it will return another supported Transfer function.
+	The driver indicates that xfer_func conversion is supported by setting
+	the flag V4L2_FMT_FLAG_CSC_XFER_FUNC in the corresponding struct
+	:c:type:`v4l2_fmtdesc` during enumeration. See :ref:`fmtdesc-flags`.
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
@@ -191,3 +228,20 @@ Single-planar format structure
 	by RGBA values (128, 192, 255, 128), the same pixel described with
 	premultiplied colors would be described by RGBA values (64, 96,
 	128, 128)
+    * .. _`v4l2-pix-fmt-flag-set-csc`:
+
+      - ``V4L2_PIX_FMT_FLAG_SET_CSC``
+      - 0x00000002
+      - Set by the application. It is only used for capture and is
+        ignored for output streams. If set, then request the device to do
+	colorspace conversion from the received colorspace to the requested
+	colorspace values. If colorimetry field (``colorspace``, ``ycbcr_enc``,
+	``hsv_enc``, ``quantization`` or ``xfer_func``) is set to 0, then that
+	colorimetry setting will remain unchanged from what was received. So to
+	change the quantization only the ``quantization`` field shall be set to
+	non-zero values (``V4L2_QUANTIZATION_FULL_RANGE`` or
+	``V4L2_QUANTIZATION_LIM_RANGE``) and all other colorimetry fields shall
+	be set to 0.
+
+	To check which conversions are supported by the hardware for the current
+	pixel format, see :ref:`fmtdesc-flags`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 05835e04c20b..98595dd48557 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -198,6 +198,41 @@ the ``mbus_code`` field is handled differently:
 	This flag can only be used in combination with the
 	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
         compressed formats only. This flag is valid for stateful encoders only.
+    * - ``V4L2_FMT_FLAG_CSC_COLORSPACE``
+      - 0x0020
+      - The driver allows the application to try to change the default
+	colorspace. This flag is relevant only for capture devices.
+	The application can ask to configure the colorspace of the capture device
+	when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
+	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_CSC_YCBCR_ENC``
+      - 0x0040
+      - The driver allows the application to try to change the default
+	Y'CbCr encoding. This flag is relevant only for capture devices.
+	The application can ask to configure the ycbcr_enc of the capture device
+	when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
+	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_CSC_HSV_ENC``
+      - 0x0040
+      - The driver allows the application to try to change the default
+	HSV encoding. This flag is relevant only for capture devices.
+	The application can ask to configure the hsv_enc of the capture device
+	when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
+	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_CSC_QUANTIZATION``
+      - 0x0080
+      - The driver allows the application to try to change the default
+	quantization. This flag is relevant only for capture devices.
+	The application can ask to configure the quantization of the capture
+	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
+	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_CSC_XFER_FUNC``
+      - 0x0100
+      - The driver allows the application to try to change the default
+	quantization. This flag is relevant only for capture devices.
+	The application can ask to configure the quantization of the capture
+	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
+	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
 
 
 Return Value
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 659799cc1eca..faa19e7d241b 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -188,6 +188,11 @@ replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
 replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
 replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
 replace define V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL fmtdesc-flags
+replace define V4L2_FMT_FLAG_CSC_COLORSPACE fmtdesc-flags
+replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
+replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
+replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
+replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 303805438814..76610509d670 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -776,6 +776,7 @@ struct v4l2_pix_format {
 
 /* Flags */
 #define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA	0x00000001
+#define V4L2_PIX_FMT_FLAG_SET_CSC	0x00000002
 
 /*
  *	F O R M A T   E N U M E R A T I O N
@@ -795,6 +796,11 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
 #define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
 #define V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL	0x0010
+#define V4L2_FMT_FLAG_CSC_COLORSPACE		0x0020
+#define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0040
+#define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
+#define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0080
+#define V4L2_FMT_FLAG_CSC_XFER_FUNC		0x0100
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.17.1

