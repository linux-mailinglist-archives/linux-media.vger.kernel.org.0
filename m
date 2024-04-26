Return-Path: <linux-media+bounces-10179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD08B3348
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41FE51F2314B
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC9D13D299;
	Fri, 26 Apr 2024 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj8JTcUZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455F13C903
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121451; cv=none; b=Q+AX8udNsC998+OtumaTaQrz95q8JWRb1L/sxSw2/Cvhkk35z/eI+sBd5RjPm6j2xyzly/58qKwacnjizvH8FQtJQaOKAIQlDMyakW2MJbAw1hOtBQ/2qtgdEY/CEhFoUNZaYZS27ThABPV75e3deaDnNprvvCBJQKRqgr/Xgqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121451; c=relaxed/simple;
	bh=hPkWuebURDTnjgrDczHg74a8jgVwuwoW30hYjRm6jPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pVUOz40cQ17F4LfU3O080TZctIZcw3SjrVqHsVpNI0f+RzG+5ecmC72iZyVMq4Lsb9I3t2P4N0pvwsCp0VtpKhFpHtcyorlSHYkL5wwlaiWRt8R2C1lwZzdyHz0742BxcwsCJ+LSii9xIhHq2z7scONCjlzUeRdi92Bbtxt/Zuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj8JTcUZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121450; x=1745657450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hPkWuebURDTnjgrDczHg74a8jgVwuwoW30hYjRm6jPQ=;
  b=Tj8JTcUZSC5BYnGnS+mReAVtUu2ATZ58dNzzr4REHn3qw55NJsI8c8dt
   ysfToofgjAuat/4PQ6Iv2KHa3Ye730lNP/AUwJk/Sp3JBxL0jUwjiYCIj
   eB/Q+2HAt4W153XYbvr6ktDIRPwcQWxFVlMC7/7RiuHOKZ8B0Rel7al8t
   GMK1kCsEw/3fbbEL7dejhIvqCfhLuf7YpHZgZy9R41C+n2OMgwn/g8ya4
   bMzpIubXqKxPdskw1pLnFS/t+GO32PMT9Q8FUB2WPC9UIpZKVGm8bIGk3
   p+ZtJ7/gyL+Vg6CFQmjYS5aaPspa1edIm5q//pg+l02u0JdswHv3fLUcl
   A==;
X-CSE-ConnectionGUID: 94NYwvtITeCf3oYLJegJ3w==
X-CSE-MsgGUID: HSxRgyXgQXqvWiV4cmgDOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683798"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683798"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:50 -0700
X-CSE-ConnectionGUID: FsUQGfEySQSI7cIVCBx4Mg==
X-CSE-MsgGUID: HqNU2MNlRS+uiJ+SmgZgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598506"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:47 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0698112067F;
	Fri, 26 Apr 2024 11:50:43 +0300 (EEST)
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
Subject: [PATCH v3 04/14] media: uapi: Document which mbus format fields are valid for metadata
Date: Fri, 26 Apr 2024 11:50:28 +0300
Message-Id: <20240426085038.943733-5-sakari.ailus@linux.intel.com>
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
index c2cebf61d528..d2a6cd2e1eb2 100644
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


