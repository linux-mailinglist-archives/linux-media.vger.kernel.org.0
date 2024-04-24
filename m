Return-Path: <linux-media+bounces-10010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F98B0938
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E92AB25370
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8186315B0ED;
	Wed, 24 Apr 2024 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nd4x+y/n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1815959E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961382; cv=none; b=LbbYFMj5R/Pld2CBmLeNly7x3XgYC63U1QRGDGvE1xgHDoiTl094Df6YMYwdyoD8JbprvQnsgxx7QbWWaJ5zZFs3ha/S7oDrYuO1yzHjJ62IoVgFBZvUvqrh8FUdRnMPkseZhIWScKB72QVYYI7bPzZUbqA4TANaQM3lFoKqLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961382; c=relaxed/simple;
	bh=ph6A/sxqcHsQJH9XQZk51be2N7iQVO4zi6bYs7v3LIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nZFVmpGIVCUhVjuR+PJJVmMaWDBJS7Ga2MeomOgStg7w2Jqv692gMEXAE6UdMKDeBD9rEKVQZI1QRBvnC5MASmeR5Q9sjCqU3Nu1/5aEOIstQ0QOf3Fy2i3nSL6J3xLu8ThNqxtfaQQun0B8YuRPI5vohHgy1wEtf47M//6/JcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nd4x+y/n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713961381; x=1745497381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ph6A/sxqcHsQJH9XQZk51be2N7iQVO4zi6bYs7v3LIY=;
  b=nd4x+y/nxf1eCExLNHcjfCdz7a2Eudno3ZUbs3dCH7X8Y7ltDNm5PYMc
   nshOZ9aDewQCTFggKUOaJngkrc3idZCgN0sz81ICd/aBBB5+Ve13gCkaZ
   LRuMOZLbadszk6LQ4mokPEjKavUAGxpUAApG1UMLfTdZom0CB/DyI1tPu
   IYbE+pl3MahLtG2oS+FDILvCjmhMiwelb7o2UXVJfXMNbJsO0ZaSgSjXo
   sBRnCx6mZdMIv2NPoYtGxbuBJIIXiowNvQznkvBwXo5hmXnXot+obzLOw
   Lb54DhXGzmQx/RM3o8KpTb1IRjwxPN21M+xtHjSWAYfGtYuusW9H5NawE
   w==;
X-CSE-ConnectionGUID: XCPcnqPeSe6ubwik1pne6g==
X-CSE-MsgGUID: OtbxtiT0RJuDOwUkW+A+Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9809593"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9809593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:52 -0700
X-CSE-ConnectionGUID: SH4Z+pjLSZirVPhr98S7Jw==
X-CSE-MsgGUID: jmbn+NaiSVOgT360c1uRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29512811"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 05:22:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8907C11F855;
	Wed, 24 Apr 2024 15:22:45 +0300 (EEST)
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
Subject: [PATCH 04/14] media: uapi: Document which mbus format fields are valid for metadata
Date: Wed, 24 Apr 2024 15:22:27 +0300
Message-Id: <20240424122237.875000-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that metadata mbus formats have been added, it is necessary to define
which fields in struct v4l2_mbus_format are applicable to them (not many).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/subdev-formats.rst | 15 ++++++++-------
 include/uapi/linux/v4l2-mediabus.h             | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d9a5ee954cdd..25ba4c788ca0 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -33,7 +33,7 @@ Media Bus Formats
     * - __u32
       - ``field``
       - Field order, from enum :c:type:`v4l2_field`. See
-	:ref:`field-order` for details.
+	:ref:`field-order` for details. Zero for metadata mbus codes.
     * - __u32
       - ``colorspace``
       - Image colorspace, from enum :c:type:`v4l2_colorspace`.
@@ -45,7 +45,7 @@ Media Bus Formats
 	conversion is supported by setting the flag
 	V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
-	See :ref:`v4l2-subdev-mbus-code-flags`.
+	See :ref:`v4l2-subdev-mbus-code-flags`. Zero for metadata mbus codes.
     * - union {
       - (anonymous)
     * - __u16
@@ -61,7 +61,7 @@ Media Bus Formats
 	that ycbcr_enc conversion is supported by setting the flag
 	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
-	See :ref:`v4l2-subdev-mbus-code-flags`.
+	See :ref:`v4l2-subdev-mbus-code-flags`. Zero for metadata mbus codes.
     * - __u16
       - ``hsv_enc``
       - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
@@ -75,7 +75,7 @@ Media Bus Formats
 	that hsv_enc conversion is supported by setting the flag
 	V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
-	See :ref:`v4l2-subdev-mbus-code-flags`
+	See :ref:`v4l2-subdev-mbus-code-flags`. Zero for metadata mbus codes.
     * - }
       -
     * - __u16
@@ -90,8 +90,8 @@ Media Bus Formats
 	The driver indicates that quantization conversion is supported by
 	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION in the
 	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
-	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
-
+	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`. Zero for
+	metadata mbus codes.
     * - __u16
       - ``xfer_func``
       - Transfer function, from enum :c:type:`v4l2_xfer_func`.
@@ -104,7 +104,8 @@ Media Bus Formats
 	The driver indicates that the transfer function conversion is supported by
 	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC in the
 	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
-	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
+	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`. Zero for
+	metadata mbus codes.
     * - __u16
       - ``flags``
       - flags See:  :ref:v4l2-mbus-framefmt-flags
diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
index 6b07b73473b5..946520bc49f1 100644
--- a/include/uapi/linux/v4l2-mediabus.h
+++ b/include/uapi/linux/v4l2-mediabus.h
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
-- 
2.39.2


