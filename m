Return-Path: <linux-media+bounces-8320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F10894814
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1E6CB21D09
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE537399;
	Tue,  2 Apr 2024 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XEfgfD4x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377722107
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016053; cv=none; b=WJyz/APGFqLAP90ifHYP28qlQSj85x45szKdaVxdNlBBmE3qjiIOEEcPgBZk2feDlLNFo4DDAS/OXplmDSxhALL8sbEdpHw/5ptdJnIF/BdUYm6dZGQAdLf8lisFMmhusrz9nNIV4lhj4DtfKGWbnzchD1eyRnz/iXfAduWa3KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016053; c=relaxed/simple;
	bh=QCYAWpSdrf8uI5tsRFYCzKyg/Z7g/WJGLhS0VLDKReA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghR1wy9QNDrFRrr6KXMK2dUaa6CPXhE8WKtPtrpumQckGDnI0ZKLZx2vyFw9HQ6jJXBOaZRdrsoNl/sbHCkJC/vM02UGL9eC4ysG67DW4bJXbnqtFUg5kwi38+BV5pP9cMS+Cfay6rU5dVKKWwzyDUQAyWFAmjW8Wpk8SGZn0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XEfgfD4x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E82F7E1;
	Tue,  2 Apr 2024 02:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016011;
	bh=QCYAWpSdrf8uI5tsRFYCzKyg/Z7g/WJGLhS0VLDKReA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEfgfD4xUQ1rNd2GvVJGtvCG4hc38rbIqgOqnKMZ8YCoIERGZRNclH2AwiM3QklEY
	 X4CNfXbBYfmwOr7B7twe5HMLgjkRKeGDVq4/eLrnxUDi2eUePmSxvPNv+Sc11F3gPi
	 a8weaaESIGrPDqASs/9ffOGUaH1WpF+e1IJXGeFM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 3/8] v4l-utils: sync-with-kernel
Date: Tue,  2 Apr 2024 03:00:28 +0300
Message-ID: <20240402000033.4007-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update v4l-utils to the latest kernel headers, taken from the metadata
API v8..

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 contrib/freebsd/include/linux/videodev2.h | 20 ++++++++++++++++++++
 contrib/test/ioctl_32.h                   |  4 ++--
 contrib/test/ioctl_64.h                   |  4 ++--
 include/linux/media-bus-format.h          | 13 +++++++++++++
 include/linux/media.h                     |  1 +
 include/linux/v4l2-mediabus.h             | 18 ++++++++++++------
 include/linux/v4l2-subdev.h               | 14 +++++++++++---
 include/linux/videodev2.h                 | 20 ++++++++++++++++++++
 utils/common/v4l2-pix-formats.h           |  9 +++++++++
 utils/v4l2-tracer/retrace-gen.cpp         | 12 ++++++++++++
 utils/v4l2-tracer/trace-gen.cpp           |  3 +++
 utils/v4l2-tracer/v4l2-tracer-info-gen.h  |  4 ++++
 12 files changed, 109 insertions(+), 13 deletions(-)

diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 4815944b0b8c..5d3fb63f2c9f 100644
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
@@ -846,6 +848,14 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
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
 
@@ -876,6 +886,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -2394,10 +2405,19 @@ struct v4l2_sdr_format {
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
diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
index f05f747e444d..13e68c2ccb61 100644
--- a/include/linux/media-bus-format.h
+++ b/include/linux/media-bus-format.h
@@ -174,4 +174,17 @@
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
+/* Specific metadata formats. Next is 0x9003. */
+#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
+#define MEDIA_BUS_FMT_OV2740_EMBEDDED		0x9002
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
diff --git a/include/linux/media.h b/include/linux/media.h
index b5a77bbf4062..4a733b9beb27 100644
--- a/include/linux/media.h
+++ b/include/linux/media.h
@@ -206,6 +206,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
diff --git a/include/linux/v4l2-mediabus.h b/include/linux/v4l2-mediabus.h
index 2c318de10485..0651b09dee68 100644
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
+ * @field:	used interlacing type (from enum v4l2_field), zero on metadata
+ *		mbus codes
+ * @colorspace:	colorspace of the data (from enum v4l2_colorspace), zero on
+ *		metadata mbus codes
+ * @ycbcr_enc:	YCbCr encoding of the data (from enum v4l2_ycbcr_encoding), zero
+ *		on metadata mbus codes
+ * @hsv_enc:	HSV encoding of the data (from enum v4l2_hsv_encoding), zero on
+ *		metadata mbus codes
+ * @quantization: quantization of the data (from enum v4l2_quantization), zero
+ *		on metadata mbus codes
+ * @xfer_func:  transfer function of the data (from enum v4l2_xfer_func), zero
+ *		on metadata mbus codes
  * @flags:	flags (V4L2_MBUS_FRAMEFMT_*)
  * @reserved:  reserved bytes that can be later used
  */
diff --git a/include/linux/v4l2-subdev.h b/include/linux/v4l2-subdev.h
index 7048c51581c6..7e501cb45e4e 100644
--- a/include/linux/v4l2-subdev.h
+++ b/include/linux/v4l2-subdev.h
@@ -200,6 +200,11 @@ struct v4l2_subdev_capability {
  * on a video node.
  */
 #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
+/*
+ * Is the route immutable. The ACTIVE flag of an immutable route may not be
+ * changed.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
@@ -224,15 +229,18 @@ struct v4l2_subdev_route {
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
index b21e7f2c67cd..b2424a44b0ef 100644
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
@@ -812,6 +814,14 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
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
 
@@ -842,6 +852,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -2360,10 +2371,19 @@ struct v4l2_sdr_format {
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
diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
index e8d2e441fdfc..90c1b31257b2 100644
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
+	case V4L2_META_FMT_GENERIC_CSI2_10: return "8b Generic Meta, 10b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_12: return "8b Generic Meta, 12b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_14: return "8b Generic Meta, 14b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_16: return "8b Generic Meta, 16b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_20: return "8b Generic Meta, 20b CSI-2";
+	case V4L2_META_FMT_GENERIC_CSI2_24: return "8b Generic Meta, 24b CSI-2";
 	case V4L2_PIX_FMT_MJPEG: return "Motion-JPEG";
 	case V4L2_PIX_FMT_JPEG: return "JFIF JPEG";
 	case V4L2_PIX_FMT_DV: return "1394";
diff --git a/utils/v4l2-tracer/retrace-gen.cpp b/utils/v4l2-tracer/retrace-gen.cpp
index 08ed96164c28..514fbcf47b2b 100644
--- a/utils/v4l2-tracer/retrace-gen.cpp
+++ b/utils/v4l2-tracer/retrace-gen.cpp
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
index fd58d9182905..82b5f3a76813 100644
--- a/utils/v4l2-tracer/trace-gen.cpp
+++ b/utils/v4l2-tracer/trace-gen.cpp
@@ -2736,6 +2736,9 @@ void trace_v4l2_meta_format_gen(void *arg, json_object *parent_obj, std::string
 
 	json_object_object_add(v4l2_meta_format_obj, "dataformat", json_object_new_int64(p->dataformat));
 	json_object_object_add(v4l2_meta_format_obj, "buffersize", json_object_new_int64(p->buffersize));
+	json_object_object_add(v4l2_meta_format_obj, "width", json_object_new_int64(p->width));
+	json_object_object_add(v4l2_meta_format_obj, "height", json_object_new_int64(p->height));
+	json_object_object_add(v4l2_meta_format_obj, "bytesperline", json_object_new_int64(p->bytesperline));
 
 	if (key_name.empty())
 		json_object_object_add(parent_obj, "v4l2_meta_format", v4l2_meta_format_obj);
diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
index 022c435c34cf..51eeb7b7ec60 100644
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
 
@@ -1849,6 +1852,7 @@ constexpr flag_def media_pad_flag_def[] = {
 	{ MEDIA_PAD_FL_SINK, "MEDIA_PAD_FL_SINK" },
 	{ MEDIA_PAD_FL_SOURCE, "MEDIA_PAD_FL_SOURCE" },
 	{ MEDIA_PAD_FL_MUST_CONNECT, "MEDIA_PAD_FL_MUST_CONNECT" },
+	{ MEDIA_PAD_FL_INTERNAL, "MEDIA_PAD_FL_INTERNAL" },
 	{ 0, "" }
 };
 
-- 
Regards,

Laurent Pinchart


