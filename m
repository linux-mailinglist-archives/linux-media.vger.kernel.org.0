Return-Path: <linux-media+bounces-9557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A88A74DA
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 841601C2228F
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F39139CF4;
	Tue, 16 Apr 2024 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a95Idoie"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A64139589
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296016; cv=none; b=Er9H6OtjuP6Lk0SBE2hKhMlkiSPFxbzULAW/nyU6DNAD2OZwO1a4kDhlM4XLoFhcuMPsUViMbMbXMiY0qrTPQhyItDyEI7/LoxSJMN9Cl62dCb0zz7F5Vh3l/z2cOZaLUUJ7qDbc1Z/JwxDZ5qsWJx4Y99DIhiuakrZUXyBvtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296016; c=relaxed/simple;
	bh=SN/HDWcbC3YsAH+6GLCq/oErRQx4jnOmhS4V3WLOXN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KbbKAD8S9/rhWx95WKhWuMS7SqdPM1kjBljHWZLqjJya2W5hfh9KcFkz6ED4vQrRgNAZvwTzV7OSLcxtSMatycHWKlxCgMsQYT3ISftWcSg0ZW+wqW5o1e9jNkoJ4TkbRwqqu6y40Naq6vhTYz5Ky9T1/HwWj3CPJVZ9U6z56Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a95Idoie; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296014; x=1744832014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SN/HDWcbC3YsAH+6GLCq/oErRQx4jnOmhS4V3WLOXN8=;
  b=a95IdoieF38ARFIOSBc1+zWDSOAW/0E7Ow4dBTdnErkPfL40g9+lJk3/
   uAnIJaZvZV/kgVkOWoYy4t4E3y54UcUPSSGkb0o/8HqHUQY7WFQ3miNw8
   Wsrp9meSCS/9NJ9Eddlmf+JQc3Rd6CWzBY6Wbl4I8rL4hBEMWOCHsDxVu
   UuAe3YulcsaJrIBhVbggO+wf7IpHoz2YFCoJeikq4AsW1nthj5u1yM4kU
   UfJxlGCcS5QFWjLK99Uvfxto1q8sNzJRIzo5g2hnxD1tlazHrU1UBSqdc
   C4mqWcfGWwVJTtqPaTab3+cSbmx+34ElPQWR6AjG6d1jsPAgYlVgai2eI
   A==;
X-CSE-ConnectionGUID: +YEnKpKXTl+fHhWveYvvYQ==
X-CSE-MsgGUID: OTEdHgaiSxiNq6SMNCgZsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8621210"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8621210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:34 -0700
X-CSE-ConnectionGUID: 7nzYzrKqRPes3RU7Mz5cTg==
X-CSE-MsgGUID: F5VB+SAiTCiJT3NMmoPLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22430732"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DAFD811F879;
	Tue, 16 Apr 2024 22:33:27 +0300 (EEST)
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
Subject: [PATCH v9 05/46] media: uapi: Document which mbus format fields are valid for metadata
Date: Tue, 16 Apr 2024 22:32:38 +0300
Message-Id: <20240416193319.778192-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
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
---
 .../userspace-api/media/v4l/subdev-formats.rst | 15 ++++++++-------
 include/uapi/linux/v4l2-mediabus.h             | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d9a5ee954cdd..0547f2733ee3 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -33,7 +33,7 @@ Media Bus Formats
     * - __u32
       - ``field``
       - Field order, from enum :c:type:`v4l2_field`. See
-	:ref:`field-order` for details.
+	:ref:`field-order` for details. Zero on metadata mbus codes.
     * - __u32
       - ``colorspace``
       - Image colorspace, from enum :c:type:`v4l2_colorspace`.
@@ -45,7 +45,7 @@ Media Bus Formats
 	conversion is supported by setting the flag
 	V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
-	See :ref:`v4l2-subdev-mbus-code-flags`.
+	See :ref:`v4l2-subdev-mbus-code-flags`. Zero on metadata mbus codes.
     * - union {
       - (anonymous)
     * - __u16
@@ -61,7 +61,7 @@ Media Bus Formats
 	that ycbcr_enc conversion is supported by setting the flag
 	V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
-	See :ref:`v4l2-subdev-mbus-code-flags`.
+	See :ref:`v4l2-subdev-mbus-code-flags`. Zero on metadata mbus codes.
     * - __u16
       - ``hsv_enc``
       - HSV encoding, from enum :c:type:`v4l2_hsv_encoding`.
@@ -75,7 +75,7 @@ Media Bus Formats
 	that hsv_enc conversion is supported by setting the flag
 	V4L2_SUBDEV_MBUS_CODE_CSC_HSV_ENC in the corresponding struct
 	:c:type:`v4l2_subdev_mbus_code_enum` during enumeration.
-	See :ref:`v4l2-subdev-mbus-code-flags`
+	See :ref:`v4l2-subdev-mbus-code-flags`. Zero on metadata mbus codes.
     * - }
       -
     * - __u16
@@ -90,8 +90,8 @@ Media Bus Formats
 	The driver indicates that quantization conversion is supported by
 	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION in the
 	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
-	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
-
+	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`. Zero on
+	metadata mbus codes.
     * - __u16
       - ``xfer_func``
       - Transfer function, from enum :c:type:`v4l2_xfer_func`.
@@ -104,7 +104,8 @@ Media Bus Formats
 	The driver indicates that the transfer function conversion is supported by
 	setting the flag V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC in the
 	corresponding struct :c:type:`v4l2_subdev_mbus_code_enum`
-	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`.
+	during enumeration. See :ref:`v4l2-subdev-mbus-code-flags`. Zero on
+	metadata mbus codes.
     * - __u16
       - ``flags``
       - flags See:  :ref:v4l2-mbus-framefmt-flags
diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
index 6b07b73473b5..de1d6161bf62 100644
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
-- 
2.39.2


