Return-Path: <linux-media+bounces-10036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D58B0E0A
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9665B249BF
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E4115FA70;
	Wed, 24 Apr 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mCSebmxK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD115FA63
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972162; cv=none; b=uxU1iZXTSVmkrn0T7rugwRjmZnsaWfFijJ9cFxMe79JUT3Yf5zFbQWhwX6H4hWDUbT+SPt6mxTaMl1Gjl6FhpNfdlJdaEIqCKdjHnRzkPZ0r0u7Or/30oD0AMh9f7dU7R3UbmM6lHaSkxKtDNgAjEjrv4kfXccnwtV7MJG9RGKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972162; c=relaxed/simple;
	bh=JvpVIbRcBVZazrqLdp24EqEeBTPEgfsJgeK5MM5z6Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGFMiml792z+bVB8xpuKPKRKDILPTYT1JJPR2WyKXYopFmmmhC/pzQPDwkAfe8hkq++tTWL4Gr2BiFxCr0tNp7boKkqFEa6qpUrX6HsfjrGc8GjEClBprZS+f+TAJ4Iq8sa6q3TMgL9zOWnXaWVpieiQ4qVaLjskEoUBhkHbyrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mCSebmxK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8153182A;
	Wed, 24 Apr 2024 17:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972106;
	bh=JvpVIbRcBVZazrqLdp24EqEeBTPEgfsJgeK5MM5z6Zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mCSebmxK5NwKiUI74heZni0L1UgLir38h5xkUZT1bWwJ0S94hPOOqz23HX+KMAcXW
	 mOekVKCip+A4gCBm6+ugv1yAQkzohThNJCSar+YvN4+dEA/uQmhVAHpnu0yIWbrUrs
	 vDpMDYmsfr6RML908qVnHcZhOtscz60Km1/gy5pc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH v2 1/7] v4l-utils: sync-with-kernel
Date: Wed, 24 Apr 2024 18:22:24 +0300
Message-ID: <20240424152230.31923-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
References: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update v4l-utils to the kernel headers coming from the Unicam v11
branch.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 contrib/freebsd/include/linux/videodev2.h | 26 ++++++++++++++++++++++-
 contrib/test/ioctl_32.h                   |  4 ++--
 contrib/test/ioctl_64.h                   |  4 ++--
 include/linux/dvb/frontend.h              |  2 +-
 include/linux/media-bus-format.h          |  9 ++++++++
 include/linux/v4l2-mediabus.h             | 18 ++++++++++------
 include/linux/v4l2-subdev.h               | 13 +++++++++---
 include/linux/videodev2.h                 | 26 ++++++++++++++++++++++-
 lib/include/libdvbv5/dvb-frontend.h       |  2 +-
 utils/common/v4l2-pix-formats.h           |  9 ++++++++
 utils/v4l2-tracer/retrace-gen.cpp         | 14 +++++++++++-
 utils/v4l2-tracer/trace-gen.cpp           |  5 ++++-
 utils/v4l2-tracer/v4l2-tracer-info-gen.h  |  3 +++
 13 files changed, 116 insertions(+), 19 deletions(-)

diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 4815944b0b8c..752035421389 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -606,6 +606,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
 #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
+#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
+#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW14 packed */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
@@ -846,6 +848,18 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/*
+ * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
+ * adding new ones!
+ */
+#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
@@ -876,6 +890,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -1824,7 +1839,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering_display;
 		void *ptr;
-	};
+	} __attribute__ ((packed));
 } __attribute__ ((packed));
 
 struct v4l2_ext_controls {
@@ -2394,10 +2409,19 @@ struct v4l2_sdr_format {
  * struct v4l2_meta_format - metadata format definition
  * @dataformat:		little endian four character code (fourcc)
  * @buffersize:		maximum size in bytes required for data
+ * @width:		number of data units of data per line (valid for line
+ *			based formats only, see format documentation)
+ * @height:		number of lines of data per buffer (valid for line based
+ *			formats only)
+ * @bytesperline:	offset between the beginnings of two adjacent lines in
+ *			bytes (valid for line based formats only)
  */
 struct v4l2_meta_format {
 	uint32_t				dataformat;
 	uint32_t				buffersize;
+	uint32_t				width;
+	uint32_t				height;
+	uint32_t				bytesperline;
 } __attribute__ ((packed));
 
 /**
diff --git a/contrib/test/ioctl_32.h b/contrib/test/ioctl_32.h
index 97f58676fce1..42997b76cf8d 100644
--- a/contrib/test/ioctl_32.h
+++ b/contrib/test/ioctl_32.h
@@ -103,7 +103,7 @@
 #define CMD32_VIDIOC_SUBDEV_G_EDID 0xc0245628
 #define CMD32_VIDIOC_SUBDEV_G_FMT 0xc0585604
 #define CMD32_VIDIOC_SUBDEV_G_FRAME_INTERVAL 0xc0305615
-#define CMD32_VIDIOC_SUBDEV_G_ROUTING 0xc0285626
+#define CMD32_VIDIOC_SUBDEV_G_ROUTING 0xc0405626
 #define CMD32_VIDIOC_SUBDEV_G_SELECTION 0xc040563d
 #define CMD32_VIDIOC_SUBDEV_G_STD 0x80085617
 #define CMD32_VIDIOC_SUBDEV_QUERYCAP 0x80405600
@@ -115,7 +115,7 @@
 #define CMD32_VIDIOC_SUBDEV_S_EDID 0xc0245629
 #define CMD32_VIDIOC_SUBDEV_S_FMT 0xc0585605
 #define CMD32_VIDIOC_SUBDEV_S_FRAME_INTERVAL 0xc0305616
-#define CMD32_VIDIOC_SUBDEV_S_ROUTING 0xc0285627
+#define CMD32_VIDIOC_SUBDEV_S_ROUTING 0xc0405627
 #define CMD32_VIDIOC_SUBDEV_S_SELECTION 0xc040563e
 #define CMD32_VIDIOC_SUBDEV_S_STD 0x40085618
 #define CMD32_VIDIOC_SUBSCRIBE_EVENT 0x4020565a
diff --git a/contrib/test/ioctl_64.h b/contrib/test/ioctl_64.h
index 2bad335dab60..8539622cf329 100644
--- a/contrib/test/ioctl_64.h
+++ b/contrib/test/ioctl_64.h
@@ -103,7 +103,7 @@
 #define CMD64_VIDIOC_SUBDEV_G_EDID 0xc0285628
 #define CMD64_VIDIOC_SUBDEV_G_FMT 0xc0585604
 #define CMD64_VIDIOC_SUBDEV_G_FRAME_INTERVAL 0xc0305615
-#define CMD64_VIDIOC_SUBDEV_G_ROUTING 0xc0285626
+#define CMD64_VIDIOC_SUBDEV_G_ROUTING 0xc0405626
 #define CMD64_VIDIOC_SUBDEV_G_SELECTION 0xc040563d
 #define CMD64_VIDIOC_SUBDEV_G_STD 0x80085617
 #define CMD64_VIDIOC_SUBDEV_QUERYCAP 0x80405600
@@ -115,7 +115,7 @@
 #define CMD64_VIDIOC_SUBDEV_S_EDID 0xc0285629
 #define CMD64_VIDIOC_SUBDEV_S_FMT 0xc0585605
 #define CMD64_VIDIOC_SUBDEV_S_FRAME_INTERVAL 0xc0305616
-#define CMD64_VIDIOC_SUBDEV_S_ROUTING 0xc0285627
+#define CMD64_VIDIOC_SUBDEV_S_ROUTING 0xc0405627
 #define CMD64_VIDIOC_SUBDEV_S_SELECTION 0xc040563e
 #define CMD64_VIDIOC_SUBDEV_S_STD 0x40085618
 #define CMD64_VIDIOC_SUBSCRIBE_EVENT 0x4020565a
diff --git a/include/linux/dvb/frontend.h b/include/linux/dvb/frontend.h
index 392171a7d651..844762889343 100644
--- a/include/linux/dvb/frontend.h
+++ b/include/linux/dvb/frontend.h
@@ -854,7 +854,7 @@ struct dtv_stats {
 	union {
 		__u64 uvalue;	/* for counters and relative scales */
 		__s64 svalue;	/* for 0.001 dB measures */
-	};
+	}  __attribute__ ((packed));
 } __attribute__ ((packed));
 
 
diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
index f05f747e444d..d4c1d991014b 100644
--- a/include/linux/media-bus-format.h
+++ b/include/linux/media-bus-format.h
@@ -174,4 +174,13 @@
  */
 #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
 
+/* Generic line based metadata formats for serial buses. Next is 0x8008. */
+#define MEDIA_BUS_FMT_META_8			0x8001
+#define MEDIA_BUS_FMT_META_10			0x8002
+#define MEDIA_BUS_FMT_META_12			0x8003
+#define MEDIA_BUS_FMT_META_14			0x8004
+#define MEDIA_BUS_FMT_META_16			0x8005
+#define MEDIA_BUS_FMT_META_20			0x8006
+#define MEDIA_BUS_FMT_META_24			0x8007
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
diff --git a/include/linux/v4l2-mediabus.h b/include/linux/v4l2-mediabus.h
index 2c318de10485..097ef73924f8 100644
--- a/include/linux/v4l2-mediabus.h
+++ b/include/linux/v4l2-mediabus.h
@@ -19,12 +19,18 @@
  * @width:	image width
  * @height:	image height
  * @code:	data format code (from enum v4l2_mbus_pixelcode)
- * @field:	used interlacing type (from enum v4l2_field)
- * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
- * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding)
- * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding)
- * @quantization: quantization of the data (from enum v4l2_quantization)
- * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func)
+ * @field:	used interlacing type (from enum v4l2_field), zero for metadata
+ *		mbus codes
+ * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
+ *		metadata mbus codes
+ * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
+ *		for metadata mbus codes
+ * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero for
+ *		metadata mbus codes
+ * @quantization: quantization of the data (from enum v4l2_quantization), zero
+ *		for metadata mbus codes
+ * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
+ *		for metadata mbus codes
  * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
  * @reserved:  reserved bytes that can be later used
  */
diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
index 7048c51581c6..6a39128d0606 100644
--- a/include/linux/v4l2-subdev.h
+++ b/include/linux/v4l2-subdev.h
@@ -50,6 +50,10 @@ struct v4l2_subdev_format {
  * @rect: pad crop rectangle boundaries
  * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
+ *
+ * The subdev crop API is an obsolete interface and may be removed in the
+ * future. It is superseded by the selection API. No new extensions to this
+ * structure will be accepted.
  */
 struct v4l2_subdev_crop {
 	__u32 which;
@@ -224,15 +228,18 @@ struct v4l2_subdev_route {
  * struct v4l2_subdev_routing - Subdev routing information
  *
  * @which: configuration type (from enum v4l2_subdev_format_whence)
- * @num_routes: the total number of routes in the routes array
+ * @len_routes: the length of the routes array, in routes
  * @routes: pointer to the routes array
+ * @num_routes: the total number of routes, possibly more than fits in the
+ *		routes array
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_routing {
 	__u32 which;
-	__u32 num_routes;
+	__u32 len_routes;
 	__u64 routes;
-	__u32 reserved[6];
+	__u32 num_routes;
+	__u32 reserved[11];
 };
 
 /*
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index b21e7f2c67cd..34cc419b6b5a 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -572,6 +572,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
 #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
+#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
+#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW14 packed */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
@@ -812,6 +814,18 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/*
+ * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
+ * adding new ones!
+ */
+#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
@@ -842,6 +856,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -1790,7 +1805,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering_display;
 		void *ptr;
-	};
+	} __attribute__ ((packed));
 } __attribute__ ((packed));
 
 struct v4l2_ext_controls {
@@ -2360,10 +2375,19 @@ struct v4l2_sdr_format {
  * struct v4l2_meta_format - metadata format definition
  * @dataformat:		little endian four character code (fourcc)
  * @buffersize:		maximum size in bytes required for data
+ * @width:		number of data units of data per line (valid for line
+ *			based formats only, see format documentation)
+ * @height:		number of lines of data per buffer (valid for line based
+ *			formats only)
+ * @bytesperline:	offset between the beginnings of two adjacent lines in
+ *			bytes (valid for line based formats only)
  */
 struct v4l2_meta_format {
 	__u32				dataformat;
 	__u32				buffersize;
+	__u32				width;
+	__u32				height;
+	__u32				bytesperline;
 } __attribute__ ((packed));
 
 /**
diff --git a/lib/include/libdvbv5/dvb-frontend.h b/lib/include/libdvbv5/dvb-frontend.h
index 392171a7d651..844762889343 100644
--- a/lib/include/libdvbv5/dvb-frontend.h
+++ b/lib/include/libdvbv5/dvb-frontend.h
@@ -854,7 +854,7 @@ struct dtv_stats {
 	union {
 		__u64 uvalue;	/* for counters and relative scales */
 		__s64 svalue;	/* for 0.001 dB measures */
-	};
+	}  __attribute__ ((packed));
 } __attribute__ ((packed));
 
 
diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
index e8d2e441fdfc..96a11f34f53c 100644
--- a/utils/common/v4l2-pix-formats.h
+++ b/utils/common/v4l2-pix-formats.h
@@ -52,6 +52,8 @@
 	case V4L2_PIX_FMT_Y10BPACK: return "10-bit Greyscale (Packed)";
 	case V4L2_PIX_FMT_Y10P: return "10-bit Greyscale (MIPI Packed)";
 	case V4L2_PIX_FMT_IPU3_Y10: return "10-bit greyscale (IPU3 Packed)";
+	case V4L2_PIX_FMT_Y12P: return "12-bit Greyscale (MIPI Packed)";
+	case V4L2_PIX_FMT_Y14P: return "14-bit Greyscale (MIPI Packed)";
 	case V4L2_PIX_FMT_Y8I: return "Interleaved 8-bit Greyscale";
 	case V4L2_PIX_FMT_Y12I: return "Interleaved 12-bit Greyscale";
 	case V4L2_PIX_FMT_Z16: return "16-bit Depth";
@@ -192,6 +194,13 @@
 	case V4L2_PIX_FMT_Y210: return "10-bit YUYV Packed";
 	case V4L2_PIX_FMT_Y212: return "12-bit YUYV Packed";
 	case V4L2_PIX_FMT_Y216: return "16-bit YUYV Packed";
+	case V4L2_META_FMT_GENERIC_8: return "8-bit Generic Metadata";
+	case V4L2_META_FMT_GENERIC_CSI2_10: return "8-bit Generic Meta, 10b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_12: return "8-bit Generic Meta, 12b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_14: return "8-bit Generic Meta, 14b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_16: return "8-bit Generic Meta, 16b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_20: return "8-bit Generic Meta, 20b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_24: return "8-bit Generic Meta, 24b CSI-2";
 	case V4L2_PIX_FMT_MJPEG: return "Motion-JPEG";
 	case V4L2_PIX_FMT_JPEG: return "JFIF JPEG";
 	case V4L2_PIX_FMT_DV: return "1394";
diff --git a/utils/v4l2-tracer/retrace-gen.cpp b/utils/v4l2-tracer/retrace-gen.cpp
index 08ed96164c28..52323a0b0d4d 100644
--- a/utils/v4l2-tracer/retrace-gen.cpp
+++ b/utils/v4l2-tracer/retrace-gen.cpp
@@ -4101,7 +4101,7 @@ struct v4l2_ext_control *retrace_v4l2_ext_control_gen(json_object *parent_obj, s
 	//struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll_info;
 	//struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering_display;
 	//void *ptr;
-	//end of union 	};
+	//end of union 	} __attribute__ ((packed));
 	return p;
 }
 struct v4l2_ext_controls *retrace_v4l2_ext_controls_gen(json_object *parent_obj, std::string key_name = "")
@@ -4930,6 +4930,18 @@ struct v4l2_meta_format *retrace_v4l2_meta_format_gen(json_object *parent_obj, s
 	if (json_object_object_get_ex(v4l2_meta_format_obj, "buffersize", &buffersize_obj))
 		p->buffersize = (__u32) json_object_get_int64(buffersize_obj);
 
+	json_object *width_obj;
+	if (json_object_object_get_ex(v4l2_meta_format_obj, "width", &width_obj))
+		p->width = (__u32) json_object_get_int64(width_obj);
+
+	json_object *height_obj;
+	if (json_object_object_get_ex(v4l2_meta_format_obj, "height", &height_obj))
+		p->height = (__u32) json_object_get_int64(height_obj);
+
+	json_object *bytesperline_obj;
+	if (json_object_object_get_ex(v4l2_meta_format_obj, "bytesperline", &bytesperline_obj))
+		p->bytesperline = (__u32) json_object_get_int64(bytesperline_obj);
+
 	return p;
 }
 struct v4l2_format *retrace_v4l2_format_gen(json_object *parent_obj, std::string key_name = "")
diff --git a/utils/v4l2-tracer/trace-gen.cpp b/utils/v4l2-tracer/trace-gen.cpp
index fd58d9182905..c1075e771078 100644
--- a/utils/v4l2-tracer/trace-gen.cpp
+++ b/utils/v4l2-tracer/trace-gen.cpp
@@ -2245,7 +2245,7 @@ void trace_v4l2_ext_control_gen(void *arg, json_object *parent_obj, std::string
 	//struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll_info;
 	//struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering_display;
 	//void *ptr;
-	//end of union 	};
+	//end of union 	} __attribute__ ((packed));
 
 	if (key_name.empty())
 		json_object_object_add(parent_obj, "v4l2_ext_control", v4l2_ext_control_obj);
@@ -2736,6 +2736,9 @@ void trace_v4l2_meta_format_gen(void *arg, json_object *parent_obj, std::string
 
 	json_object_object_add(v4l2_meta_format_obj, "dataformat", json_object_new_int64(p->dataformat));
 	json_object_object_add(v4l2_meta_format_obj, "buffersize", json_object_new_int64(p->buffersize));
+	json_object_object_add(v4l2_meta_format_obj, "width", json_object_new_int64(p->width));
+	json_object_object_add(v4l2_meta_format_obj, "height", json_object_new_int64(p->height));
+	json_object_object_add(v4l2_meta_format_obj, "bytesperline", json_object_new_int64(p->bytesperline));
 
 	if (key_name.empty())
 		json_object_object_add(parent_obj, "v4l2_meta_format", v4l2_meta_format_obj);
diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
index 022c435c34cf..1ed43074407e 100644
--- a/utils/v4l2-tracer/v4l2-tracer-info-gen.h
+++ b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
@@ -1288,6 +1288,8 @@ constexpr val_def v4l2_pix_fmt_val_def[] = {
 	{ V4L2_PIX_FMT_Y10BPACK,	"V4L2_PIX_FMT_Y10BPACK" },
 	{ V4L2_PIX_FMT_Y10P,	"V4L2_PIX_FMT_Y10P" },
 	{ V4L2_PIX_FMT_IPU3_Y10,	"V4L2_PIX_FMT_IPU3_Y10" },
+	{ V4L2_PIX_FMT_Y12P,	"V4L2_PIX_FMT_Y12P" },
+	{ V4L2_PIX_FMT_Y14P,	"V4L2_PIX_FMT_Y14P" },
 	{ V4L2_PIX_FMT_PAL8,	"V4L2_PIX_FMT_PAL8" },
 	{ V4L2_PIX_FMT_UV8,	"V4L2_PIX_FMT_UV8" },
 	{ V4L2_PIX_FMT_YUYV,	"V4L2_PIX_FMT_YUYV" },
@@ -1482,6 +1484,7 @@ constexpr flag_def v4l2_fmt_flag_def[] = {
 	{ V4L2_FMT_FLAG_CSC_YCBCR_ENC, "V4L2_FMT_FLAG_CSC_YCBCR_ENC" },
 	{ V4L2_FMT_FLAG_CSC_HSV_ENC, "V4L2_FMT_FLAG_CSC_HSV_ENC" },
 	{ V4L2_FMT_FLAG_CSC_QUANTIZATION, "V4L2_FMT_FLAG_CSC_QUANTIZATION" },
+	{ V4L2_FMT_FLAG_META_LINE_BASED, "V4L2_FMT_FLAG_META_LINE_BASED" },
 	{ 0, "" }
 };
 
-- 
Regards,

Laurent Pinchart


