Return-Path: <linux-media+bounces-10130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B88B2AB1
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4358C1C2157A
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BE6155A5B;
	Thu, 25 Apr 2024 21:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rksjq5hn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2300D155A4E
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080452; cv=none; b=oSD/Mqa0xj1guPsocs0Tqlkpvva7gbV/uVcQmPe1u3A/EuksRvy2WCFmnvoGWAd2tzk+reZE39Ow5pOCn2sqkn1/CZ73fDvXASAZLwLBEvoLtKzu4HHzxFGtEQN0YFuZw2G2p1ZuND+hVHGigVT5k+TLh4mgydqQwZXtyezXwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080452; c=relaxed/simple;
	bh=UiIFWJxyjKwA54XIiHVimZILpi5BbamlszO5RvS0mWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ein4K2o9r0cP71bFikhCz6+jYj8F1LwXS37IM+9n8P66rnsO6vHRobKN9JYKZrbutfVWApnA328NGXcfk8By7jANhWcVeJYFOnZ1lFgpFHTg9Bk27Q+6cproo973unhbAVUK7QT9RdJaxAtHj7K9NKwsWHbOG8mXWR8LO0JEjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rksjq5hn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080451; x=1745616451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UiIFWJxyjKwA54XIiHVimZILpi5BbamlszO5RvS0mWA=;
  b=Rksjq5hnQ+M0yxr5Ot4fv0/gZRtzhVBVkBA8o99D5PIBoA3b5YBkkXtq
   Y/5i2leDo1PUE882ehHeEhLB6+ravbiiLl9ktm9Bak1fcIgkVoTYXSQ+L
   nY46VsOZO8Ce+f/XnwBrf9p1RrdDRSlv6RZUcUFCXBxVvCKBpSes5sBBg
   3CC/OpzOV/DKiQXp/q8lNldCTVc8A4UH6nKKDS0dJh+Skqvt8UUmjQMYy
   +sZtm4noV7lrloDqAg8rKWGDUiWjOHUUBF0Egr7cz9JmsMJPhPPIykmp7
   t7D1Z6lwsvjFW0q/PDTqEGpyMRs6P3jtHCTgwuT2+2DOsN6lO2yXVSJ4N
   w==;
X-CSE-ConnectionGUID: uzD8FlCLQnuRW6R+SCKnFQ==
X-CSE-MsgGUID: lpwFpUjnSw23Y0Je43DQKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016688"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016688"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:29 -0700
X-CSE-ConnectionGUID: 6l9i4fhqRvKvPAOhd1uptw==
X-CSE-MsgGUID: fzPPJY1cSPCJ6Q5aAGGfnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620912"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:27 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 720FF12027E;
	Fri, 26 Apr 2024 00:27:23 +0300 (EEST)
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
Subject: [PATCH v2 06/14] media: v4l: Support line-based metadata capture
Date: Fri, 26 Apr 2024 00:27:03 +0300
Message-Id: <20240425212711.928300-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
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


