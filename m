Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4CD254F0F
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 21:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgH0Tqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 15:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbgH0Tq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 15:46:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CA2C061232
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 12:46:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 6855829A974
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v7 4/6] v4l2: extend the CSC API to subdevice.
Date:   Thu, 27 Aug 2020 21:46:10 +0200
Message-Id: <20200827194612.13502-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827194612.13502-1-dafna.hirschfeld@collabora.com>
References: <20200827194612.13502-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch extends the CSC API in video devices to be supported
also on sub-devices. The flag V4L2_MBUS_FRAMEFMT_SET_CSC set by
the application when calling VIDIOC_SUBDEV_S_FMT ioctl.
The flags:

V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE,
V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC,
V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC/V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC
V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION

are set by the driver in the VIDIOC_SUBDEV_ENUM_MBUS_CODE ioctl.

New 'flags' fields were added to the structs
v4l2_subdev_mbus_code_enum, v4l2_mbus_framefmt which are borrowed
from the 'reserved' field

The patch also replaces the 'ycbcr_enc' field in
'struct v4l2_mbus_framefmt' with a union that includes 'hsv_enc'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../media/v4l/subdev-formats.rst              | 95 +++++++++++++++++--
 .../v4l/vidioc-subdev-enum-mbus-code.rst      | 51 +++++++++-
 include/uapi/linux/v4l2-mediabus.h            | 15 ++-
 include/uapi/linux/v4l2-subdev.h              | 10 +-
 4 files changed, 157 insertions(+), 14 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 9a4d61b0d76f..73ee5ee12f00 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -41,32 +41,107 @@ Media Bus Formats
 	:ref:`field-order` for details.
     * - __u32
       - ``colorspace``
-      - Image colorspace, from enum
-	:c:type:`v4l2_colorspace`. See
-	:ref:`colorspaces` for details.
+      - Image colorspace, from enum :c:type:`v4l2_colorspace`.
+        Must be set by the driver for subdevices. If the application sets the
+	flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set this
+	field on the source pad to request a specific colorspace for the media
+	bus data. If the driver cannot handle the requested conversion, it will
+	return another supported colorspace. The driver indicates that colorspace
+	conversion is supported by setting the flag
+	V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
+	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
+	See :ref:`v4l2-subdev-mbus-code-flags`.
+    * - union {
+      - (anonymous)
     * - __u16
       - ``ycbcr_enc``
       - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
         This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	the driver for subdevices, see :ref:`colorspaces`. If the application
+	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
+	this field on a source pad to request a specific Y'CbCr encoding
+	for the media bus data. If the driver cannot handle the requested
+	conversion, it will return another supported encoding.
+	This field is ignored for HSV media bus formats. The driver indicates
+	that ycbcr_enc conversion is supported by setting the flag
+	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
+	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
+	See :ref:`v4l2-subdev-mbus-code-flags`.
+    * - __u16
+      - ``hsv_enc``
+      - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
+        This information supplements the ``colorspace`` and must be set by
+	the driver for subdevices, see :ref:`colorspaces`. If the application
+	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
+	this field on a source pad to request a specific HSV encoding
+	for the media bus data. If the driver cannot handle the requested
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
         This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	the driver for subdevices, see :ref:`colorspaces`. If the application
+	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
+	this field on a source pad to request a specific quantization
+	for the media bus data. If the driver cannot handle the requested
+	conversion, it will return another supported quantization.
+	The driver indicates that quantization conversion is supported by
+	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION in the
+	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
+	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
+
     * - __u16
       - ``xfer_func``
       - Transfer function, from enum :c:type:`v4l2_xfer_func`.
         This information supplements the ``colorspace`` and must be set by
-	the driver for capture streams and by the application for output
-	streams, see :ref:`colorspaces`.
+	the driver for subdevices, see :ref:`colorspaces`. If the application
+	sets the flag ``V4L2_MBUS_FRAMEFMT_SET_CSC`` then the application can set
+	this field on a source pad to request a specific transfer
+	function for the media bus data. If the driver cannot handle the requested
+	conversion, it will return another supported transfer function.
+	The driver indicates that the transfer function conversion is supported by
+	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC in the
+	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
+	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
     * - __u16
-      - ``reserved``\ [11]
+      - ``flags``
+      - flags See:  :ref:v4l2-mbus-framefmt-flags
+    * - __u16
+      - ``reserved``\ [10]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
+.. _v4l2-mbus-framefmt-flags:
+
+.. flat-table:: v4l2_mbus_framefmt Flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * .. _`mbus-framefmt-set-csc`:
+
+      - ``V4L2_MBUS_FRAMEFMT_SET_CSC``
+      - 0x0001
+      - Set by the application. It is only used for source pads and is
+	ignored for sink pads. If set, then request the subdevice to do
+	colorspace conversion from the received colorspace to the requested
+	colorspace values. If the colorimetry field (``colorspace``, ``xfer_func``,
+	``ycbcr_enc``, ``hsv_enc`` or ``quantization``) is set to ``*_DEFAULT``,
+	then that colorimetry setting will remain unchanged from what was received.
+	So in order to change the quantization, only the ``quantization`` field shall
+	be set to non default value (``V4L2_QUANTIZATION_FULL_RANGE`` or
+	``V4L2_QUANTIZATION_LIM_RANGE``) and all other colorimetry fields shall
+	be set to ``*_DEFAULT``.
+
+	To check which conversions are supported by the hardware for the current
+	media bus frame format, see :ref:`v4l2-subdev-mbus-code-flags`.
 
 
 .. _v4l2-mbus-pixelcode:
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 35b8607203a4..d9bb12ac2145 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -79,11 +79,60 @@ information about the try formats.
       - Media bus format codes to be enumerated, from enum
 	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
     * - __u32
-      - ``reserved``\ [8]
+      - ``flags``
+      - See :ref:`v4l2-subdev-mbus-code-flags`
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
 
+
+.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{7.7cm}|
+
+.. _v4l2-subdev-mbus-code-flags:
+
+.. flat-table:: Subdev Media Bus Code Enumerate Flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE
+      - 0x00000001
+      - The driver allows the application to try to change the default colorspace
+	encoding. The application can ask to configure the colorspace of the
+	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
+	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
+	See :ref:`v4l2-mbus-format` on how to do this.
+    * - V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC
+      - 0x00000002
+      - The driver allows the application to try to change the default transform function.
+	The application can ask to configure the transform function of
+	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
+	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
+	See :ref:`v4l2-mbus-format` on how to do this.
+    * - V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
+      - 0x00000004
+      - The driver allows the application to try to change the default Y'CbCr
+	encoding. The application can ask to configure the Y'CbCr encoding of the
+	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
+	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
+	See :ref:`v4l2-mbus-format` on how to do this.
+    * - V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC
+      - 0x00000004
+      - The driver allows the application to try to change the default HSV
+	encoding. The application can ask to configure the HSV encoding of the
+	subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
+	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
+	See :ref:`v4l2-mbus-format` on how to do this.
+    * - V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION
+      - 0x00000008
+      - The driver allows the application to try to change the default
+	quantization. The application can ask to configure the quantization of
+	the subdevice when calling the :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`
+	ioctl with :ref:`V4L2_MBUS_FRAMEFMT_SET_CSC <mbus-framefmt-set-csc>` set.
+	See :ref:`v4l2-mbus-format` on how to do this.
+
 Return Value
 ============
 
diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
index 123a231001a8..903e67b16711 100644
--- a/include/uapi/linux/v4l2-mediabus.h
+++ b/include/uapi/linux/v4l2-mediabus.h
@@ -16,6 +16,8 @@
 #include <linux/types.h>
 #include <linux/videodev2.h>
 
+#define V4L2_MBUS_FRAMEFMT_SET_CSC	0x0001
+
 /**
  * struct v4l2_mbus_framefmt - frame format on the media bus
  * @width:	image width
@@ -24,8 +26,11 @@
  * @field:	used interlacing type (from enum v4l2_field)
  * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
  * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
+ * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
  * @quantization: quantization of the data (from enum v4l2_quantization)
  * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
+ * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
+ * @reserved:  reserved bytes that can be later used
  */
 struct v4l2_mbus_framefmt {
 	__u32			width;
@@ -33,10 +38,16 @@ struct v4l2_mbus_framefmt {
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
-	__u16			reserved[11];
+	__u16			flags;
+	__u16			reserved[10];
 };
 
 #ifndef __KERNEL__
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 5d2a1dab7911..00850b98078a 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -65,19 +65,27 @@ struct v4l2_subdev_crop {
 	__u32 reserved[8];
 };
 
+#define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
+#define V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC	0x00000002
+#define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000004
+#define V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
+#define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000008
+
 /**
  * struct v4l2_subdev_mbus_code_enum - Media bus format enumeration
  * @pad: pad number, as reported by the media API
  * @index: format index during enumeration
  * @code: format code (MEDIA_BUS_FMT_ definitions)
  * @which: format type (from enum v4l2_subdev_format_whence)
+ * @flags: flags set by the driver, (V4L2_SUBDEV_MBUS_CODE_*)
  */
 struct v4l2_subdev_mbus_code_enum {
 	__u32 pad;
 	__u32 index;
 	__u32 code;
 	__u32 which;
-	__u32 reserved[8];
+	__u32 flags;
+	__u32 reserved[7];
 };
 
 /**
-- 
2.17.1

