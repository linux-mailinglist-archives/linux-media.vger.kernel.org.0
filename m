Return-Path: <linux-media+bounces-10182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9A8B334B
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80647B21459
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3EC13D535;
	Fri, 26 Apr 2024 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/8RYxxq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A313C9DE
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121455; cv=none; b=Qn4lD1Kj6EdtVM/R8GrSwN8l4+gGfPZA1PJxkOsHVcH5IaR3Pyn6vzTx6hV/YLyLTGf/HHBi28ZKw5rOt3LmINECZ8Wow6sPR2+5FiZ6PvirBzqQ4K9ca4maM4AU2NZQQVSeT/jPRzr2V5xvL4XYgB6fBQx5DNgweHzoM0ROat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121455; c=relaxed/simple;
	bh=UiIFWJxyjKwA54XIiHVimZILpi5BbamlszO5RvS0mWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S9AIWr2cdvtmzzzBoqJKnBq62PZRiXgAHmv92WnuTIX1yViL/qiVMqVPKuNpiM5LoF8Erb8MRDYRw6QRE7dUx6QJqu1uqtiFT6VpYeVrbMjzZ3IujPpIuqxfZFWllwglNOe31ZiPXvpfVV5bEaaWZvl2dzApWH+uisDqqCpaLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/8RYxxq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121455; x=1745657455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UiIFWJxyjKwA54XIiHVimZILpi5BbamlszO5RvS0mWA=;
  b=N/8RYxxqQu2ULsTCWf3ISL5+JxDu4pGXd6xM6gsHEr2+cIHPGbNxeKMS
   L4EowV8+wmSBW/SlWhi3pprCsIHCWTgLcmU2MZPAIBw1KxlW5gSyHwKPb
   r7GeirzFbQ6r0j8ILYqtK24DoUuZoJU1xJW/gse/UJYcMJ0B9FH0AWQju
   WS57FnYLnpilyXAOzX+P+7XR4Hfo+7gr5fkmionh4NnsjneigjAdD6fpP
   4oQNxnMjrqngLRMQARZTQ0DfC3N39Ua64z0V+4bXu9FR5J8D8fW6pv3O5
   CWdfV7PK5LLVFTIbJnqcOQCCG/MaFMxuLC2d3CfF1GtYwv0m3IWJZprKC
   Q==;
X-CSE-ConnectionGUID: HFxq8UmuRPWkxkgpIs4n8g==
X-CSE-MsgGUID: FRfMgfNvREi3COkhoXwDqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683808"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683808"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:52 -0700
X-CSE-ConnectionGUID: 5iWYr0oeSjOmk10EUqlqEQ==
X-CSE-MsgGUID: 1VNb6/WOSwOyW76J6xYWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598512"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0BDF611FA8A;
	Fri, 26 Apr 2024 11:50:46 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 06/14] media: v4l: Support line-based metadata capture
Date: Fri, 26 Apr 2024 11:50:30 +0300
Message-Id: <20240426085038.943733-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many camera sensors, among other devices, transmit embedded data and image
data for each CSI-2 frame. This embedded data typically contains register
configuration of the sensor that has been used to capture the image data
of the same frame.

The embedded data is received by the CSI-2 receiver and has the same
properties as the image data, including that it is line based: it has
width, height and bytesperline (stride).

Add these fields to struct v4l2_meta_format and document them.

Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
line-based i.e. these fields of struct v4l2_meta_format are valid for it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-meta.rst      | 21 +++++++++++++++++++
 .../media/v4l/vidioc-enum-fmt.rst             |  7 +++++++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +++--
 include/uapi/linux/videodev2.h                | 10 +++++++++
 5 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
index 0e7e1ee1471a..5eee9ab60395 100644
--- a/Documentation/userspace-api/media/v4l/dev-meta.rst
+++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
@@ -47,6 +47,12 @@ member of the ``fmt`` union as needed per the desired operation. Both drivers
 and applications must set the remainder of the :c:type:`v4l2_format` structure
 to 0.
 
+Devices that capture metadata by line have the struct v4l2_fmtdesc
+``V4L2_FMT_FLAG_META_LINE_BASED`` flag set for :c:func:`VIDIOC_ENUM_FMT`. Such
+devices can typically also :ref:`capture image data <capture>`. This primarily
+involves devices that receive the data from a different devices such as a camera
+sensor.
+
 .. c:type:: v4l2_meta_format
 
 .. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
@@ -65,3 +71,18 @@ to 0.
       - ``buffersize``
       - Maximum buffer size in bytes required for data. The value is set by the
         driver.
+    * - __u32
+      - ``width``
+      - Width of a line of metadata in Data Units. Valid when
+	:c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set,
+	otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
+    * - __u32
+      - ``height``
+      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
+	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
+	:c:func:`VIDIOC_ENUM_FMT`.
+    * - __u32
+      - ``bytesperline``
+      - Offset in bytes between the beginning of two consecutive lines. Valid
+	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
+	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 000c154b0f98..3adb3d205531 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
 	The application can ask to configure the quantization of the capture
 	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
 	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
+      - 0x0200
+      - The metadata format is line-based. In this case the ``width``,
+	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
+	valid. The buffer consists of ``height`` lines, each having ``width``
+	Data Units of data and the offset (in bytes) between the beginning of
+	each two consecutive lines is ``bytesperline``.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3e58aac4ef0b..bdc628e8c1d6 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -215,6 +215,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
+replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ae2dca7f2817..2cfc9106857a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -343,8 +343,9 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		meta = &p->fmt.meta;
 		pixelformat = meta->dataformat;
-		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
-			&pixelformat, meta->buffersize);
+		pr_cont(", dataformat=%p4cc, buffersize=%u, width=%u, height=%u, bytesperline=%u\n",
+			&pixelformat, meta->buffersize, meta->width,
+			meta->height, meta->bytesperline);
 		break;
 	}
 }
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 0f44b8486ea8..647ce3419bd8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -877,6 +877,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -2424,10 +2425,19 @@ struct v4l2_sdr_format {
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
-- 
2.39.2


