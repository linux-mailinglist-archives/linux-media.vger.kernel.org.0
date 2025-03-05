Return-Path: <linux-media+bounces-27565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904AA4F9D1
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37E33A6422
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9372040A8;
	Wed,  5 Mar 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Leitf7tg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530DF20409A
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166534; cv=none; b=QTu6m/NPCY5mxrcxQe/ekFG3uKe69zd5NxK951lQfRMyLmnGAyxjuA0dSflEJ+tEpPJSeZuUqW269vYGWE9RKln3gkiQqRwFCIEaNPf7gIff+Ig/k0tqZ+Os/x+QoX400i3xOqRYIjBPD9JYq8sZqRXCU6dUnYqCdvQWGhU4Ay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166534; c=relaxed/simple;
	bh=GEqU4H/1bH5nccIxFoMdi+micYZt2QuPYTV+4KztGZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VJh9Vt8unng+gfynpKwZhKUtyzh0oFbQXja0FoNWEPaibwwjTQd7nW3Yga4TEOTzhG63uCI4uEhSBJqfmmP3VlXxEVbNrb/URBqFlS0KOKjzZPjzIzHP4X3Lq9DFPRXd+333/4xg+rTa46/r/DwutumMAFjE7HJlbmo7R4U9/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Leitf7tg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741166533; x=1772702533;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GEqU4H/1bH5nccIxFoMdi+micYZt2QuPYTV+4KztGZ8=;
  b=Leitf7tgHW6Baw+xaFXxw5SeXsOi3c4dNHUPtys8Y014+ZZUVXuH9ZMd
   7sBuNO9yh8XfPi98qWxe/gqEJl3UlLpQLpjnDBckTSRZjVT9EZAdzqkO6
   OqUKVCxWi7kNoc1x0KdgllXfpuvnYmyLQxdu4NQVQMJXFaxNO6+ZQkw+r
   mb3m32QnBlRoncuad0Zb6RCuhooWP+MsUiSABf/BI2lWKqpij5SfFdJvx
   u5zm+3MlhyYj9mefsOfW4CB8AbsQzLWqqRnligsfJhqJiMg/bZAvCWnwb
   uyr95bwDxXq82KL3BosjdPeVThEV/UhdQLs1Rtzr4+TVCWzHmNYheLtTW
   A==;
X-CSE-ConnectionGUID: DauPNcKuTWGzPfzUlNSUlQ==
X-CSE-MsgGUID: MbI4XcwISJea6U70RNW97Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52321309"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="52321309"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 01:22:09 -0800
X-CSE-ConnectionGUID: SQ5I7P+xQF6BuWqZEFwDqQ==
X-CSE-MsgGUID: h81M2nKCT3+Kty+eAbAa2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118659908"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 01:22:09 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 76C9012237C;
	Wed,  5 Mar 2025 11:22:05 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jason.z.chen@intel.com
Subject: [PATCH 1/1] media: common: Add v4l2_find_nearest_size_conditional()
Date: Wed,  5 Mar 2025 11:22:01 +0200
Message-Id: <20250305092201.459943-1-sakari.ailus@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-common.c | 10 ++++-
 include/media/v4l2-common.h           | 56 +++++++++++++++++++++------
 2 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index e4b2de3833ee..7da4fa937976 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -156,11 +156,14 @@ EXPORT_SYMBOL_GPL(v4l_bound_align_image);
 const void *
 __v4l2_find_nearest_size(const void *array, size_t array_size,
 			 size_t entry_size, size_t width_offset,
-			 size_t height_offset, s32 width, s32 height)
+			 size_t height_offset, s32 width, s32 height,
+			 bool (*func)(const void *array, size_t index,
+				      const void *context),
+			 const void *context)
 {
 	u32 error, min_error = U32_MAX;
 	const void *best = NULL;
-	unsigned int i;
+	size_t i;
 
 	if (!array)
 		return NULL;
@@ -169,6 +172,9 @@ __v4l2_find_nearest_size(const void *array, size_t array_size,
 		const u32 *entry_width = array + width_offset;
 		const u32 *entry_height = array + height_offset;
 
+		if (func && !func(array, i, context))
+			continue;
+
 		error = abs(*entry_width - width) + abs(*entry_height - height);
 		if (error > min_error)
 			continue;
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index fda903bb3674..08725ccbbf72 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -390,25 +390,30 @@ void v4l_bound_align_image(unsigned int *width, unsigned int wmin,
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
@@ -416,12 +421,41 @@ void v4l_bound_align_image(unsigned int *width, unsigned int wmin,
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


