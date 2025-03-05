Return-Path: <linux-media+bounces-27585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09EA4FC63
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4F8188A0AF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F8420AF8D;
	Wed,  5 Mar 2025 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fg3lcsAw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD2820ADCF
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170859; cv=none; b=GI06GT/1ziig/kfuiviUCki79ury96UtisOFkjBmaXxefpMHGZk+ysDN//eNFrFto3olBtCLB4+//XLJM1BkM6ergGywtf2a/P9w3lBFsRHuKvn8TADiilwkO/X1FPfrGJ8v82r4IJWYwgr2A3s+8nmtl/3/ford9iNM1py18Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170859; c=relaxed/simple;
	bh=OfJLEcnweIv0xo79G/rNOACa56X6UulOD2lO3fyhuKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q2t4OAcjiNtd3Kv1aYy4tQDifKKbwwjJGj4RzhPKO2MeJympIhD3zCfZzZnDTai6c0Qw7ajCY5dp9fERzMM26rUXJ0TjeQl3Gj3CVUV6qXRGC1jm5Yjy1sXRxsk9VO9IblFme/ZEMGmcAo3x6CJTnoz0wl+F4AOpclKSP2L/uc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fg3lcsAw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741170858; x=1772706858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OfJLEcnweIv0xo79G/rNOACa56X6UulOD2lO3fyhuKg=;
  b=Fg3lcsAw0dfeI0LQ9pMRxzzaRcRP6/zPeMl+7uz9tXz+5JREaxmmu1Mf
   EnxFUbxUZzOd8Sc+ItQ2NALwFVvbJn768YeWyIuRr5rK2BeA0k6F4gSVz
   p0SVRqgdjplDWaylcyhl7KasZUzRkp86Tg7q0RFPI68lFypUd3MfyNU5o
   mEZS5S+mUjd1ecoh79thaWUB4Xn/hTdw3sAIDz/gNdrR/8d8eA/XZ9fqA
   CC2pxx1r7EE3gqXVF8tMDMcjMUx5b2nV/FTqFfX0gXI+ltb+e7+VTDxI3
   VTH782j13Bj+f6iUeorIqv6/p/g7/8GJe5D9GcgIE9XtV7YcF690AdUDU
   A==;
X-CSE-ConnectionGUID: +poN21/rSL6qsJji1CFr1Q==
X-CSE-MsgGUID: nu14IoX/RWWo9D0Mxkpm+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46052595"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="46052595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:34:17 -0800
X-CSE-ConnectionGUID: opZJw9tjRG+umlnRdrDHAg==
X-CSE-MsgGUID: t2mfWaQjT860a81lpK2lqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118574922"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:34:16 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3321512034A;
	Wed,  5 Mar 2025 12:34:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tpm4r-00FDhe-0R;
	Wed, 05 Mar 2025 12:34:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jason.z.chen@intel.com
Subject: [PATCH v2 1/1] media: common: Add v4l2_find_nearest_size_conditional()
Date: Wed,  5 Mar 2025 12:34:03 +0200
Message-Id: <20250305103403.3627586-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_find_nearest_size() returns a mode from sensor driver's mode list
that is a best match width and height wise for the sensor. Some drivers
have different set of available modes depending on the number of lanes.
While this could be handled within a driver by providing different lists
of modes, provide a helper v4l2_find_nearest_size_conditional() to ignore
modes that aren't available.

Also use size_t for the array index and remove extra commas while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Fix function naming in v4l2-common.c to make it compile.

 drivers/media/v4l2-core/v4l2-common.c | 18 ++++++---
 include/media/v4l2-common.h           | 58 +++++++++++++++++++++------
 2 files changed, 59 insertions(+), 17 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index e4b2de3833ee..06d2f468e1af 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -154,13 +154,18 @@ void v4l_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
 EXPORT_SYMBOL_GPL(v4l_bound_align_image);
 
 const void *
-__v4l2_find_nearest_size(const void *array, size_t array_size,
-			 size_t entry_size, size_t width_offset,
-			 size_t height_offset, s32 width, s32 height)
+__v4l2_find_nearest_size_conditional(const void *array, size_t array_size,
+				     size_t entry_size, size_t width_offset,
+				     size_t height_offset, s32 width,
+				     s32 height,
+				     bool (*func)(const void *array,
+						  size_t index,
+						  const void *context),
+				     const void *context)
 {
 	u32 error, min_error = U32_MAX;
 	const void *best = NULL;
-	unsigned int i;
+	size_t i;
 
 	if (!array)
 		return NULL;
@@ -169,6 +174,9 @@ __v4l2_find_nearest_size(const void *array, size_t array_size,
 		const u32 *entry_width = array + width_offset;
 		const u32 *entry_height = array + height_offset;
 
+		if (func && !func(array, i, context))
+			continue;
+
 		error = abs(*entry_width - width) + abs(*entry_height - height);
 		if (error > min_error)
 			continue;
@@ -181,7 +189,7 @@ __v4l2_find_nearest_size(const void *array, size_t array_size,
 
 	return best;
 }
-EXPORT_SYMBOL_GPL(__v4l2_find_nearest_size);
+EXPORT_SYMBOL_GPL(__v4l2_find_nearest_size_conditional);
 
 int v4l2_g_parm_cap(struct video_device *vdev,
 		    struct v4l2_subdev *sd, struct v4l2_streamparm *a)
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index fda903bb3674..df59f291a9b8 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -390,38 +390,72 @@ void v4l_bound_align_image(unsigned int *width, unsigned int wmin,
 			   unsigned int salign);
 
 /**
- * v4l2_find_nearest_size - Find the nearest size among a discrete
- *	set of resolutions contained in an array of a driver specific struct.
+ * v4l2_find_nearest_size_conditional - Find the nearest size among a discrete
+ *	set of resolutions contained in an array of a driver specific struct,
+ *	with conditionally exlusion of certain modes
  *
  * @array: a driver specific array of image sizes
  * @array_size: the length of the driver specific array of image sizes
  * @width_field: the name of the width field in the driver specific struct
  * @height_field: the name of the height field in the driver specific struct
- * @width: desired width.
- * @height: desired height.
+ * @width: desired width
+ * @height: desired height
+ * @func: ignores mode if returns false
+ * @context: context for the function
  *
  * Finds the closest resolution to minimize the width and height differences
  * between what requested and the supported resolutions. The size of the width
  * and height fields in the driver specific must equal to that of u32, i.e. four
- * bytes.
+ * bytes. @func is called for each mode considered, a mode is ignored if @func
+ * returns false for it.
  *
  * Returns the best match or NULL if the length of the array is zero.
  */
-#define v4l2_find_nearest_size(array, array_size, width_field, height_field, \
-			       width, height)				\
+#define v4l2_find_nearest_size_conditional(array, array_size, width_field, \
+					   height_field, width, height, \
+					   func, context) \
 	({								\
 		BUILD_BUG_ON(sizeof((array)->width_field) != sizeof(u32) || \
 			     sizeof((array)->height_field) != sizeof(u32)); \
-		(typeof(&(array)[0]))__v4l2_find_nearest_size(		\
+		(typeof(&(array)[0]))__v4l2_find_nearest_size_conditional( \
 			(array), array_size, sizeof(*(array)),		\
 			offsetof(typeof(*(array)), width_field),	\
 			offsetof(typeof(*(array)), height_field),	\
-			width, height);					\
+			width, height, func, context);			\
 	})
 const void *
-__v4l2_find_nearest_size(const void *array, size_t array_size,
-			 size_t entry_size, size_t width_offset,
-			 size_t height_offset, s32 width, s32 height);
+__v4l2_find_nearest_size_conditional(const void *array, size_t array_size,
+				     size_t entry_size, size_t width_offset,
+				     size_t height_offset, s32 width,
+				     s32 height,
+				     bool (*func)(const void *array,
+						  size_t index,
+						  const void *context),
+				     const void *context);
+
+/**
+ * v4l2_find_nearest_size - Find the nearest size among a discrete set of
+ *	resolutions contained in an array of a driver specific struct
+ *
+ * @array: a driver specific array of image sizes
+ * @array_size: the length of the driver specific array of image sizes
+ * @width_field: the name of the width field in the driver specific struct
+ * @height_field: the name of the height field in the driver specific struct
+ * @width: desired width
+ * @height: desired height
+ *
+ * Finds the closest resolution to minimize the width and height differences
+ * between what requested and the supported resolutions. The size of the width
+ * and height fields in the driver specific must equal to that of u32, i.e. four
+ * bytes.
+ *
+ * Returns the best match or NULL if the length of the array is zero.
+ */
+#define v4l2_find_nearest_size(array, array_size, width_field,		\
+			       height_field, width, height)		\
+	v4l2_find_nearest_size_conditional(array, array_size, width_field, \
+					   height_field, width, height, NULL, \
+					   NULL);
 
 /**
  * v4l2_g_parm_cap - helper routine for vidioc_g_parm to fill this in by
-- 
2.39.5


