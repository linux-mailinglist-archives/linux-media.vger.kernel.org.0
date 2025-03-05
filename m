Return-Path: <linux-media+bounces-27636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE5A50117
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D3F18944F9
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AFE245025;
	Wed,  5 Mar 2025 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBSTyZZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CEA5D8F0
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182629; cv=none; b=tLwTEi2mwnE3sbffD1bKo/U4IMYF4D/7UrJ8wkQis4NI5jNBcuCWaoOixjFQ0X3n+R+E3kghs54T3txbQ6RRPx4O5BCB+rJa/LO7B0Mm70OOLFXsCPQFply+0t1/85U775io4WgdlFu0guI/eOT7VX7gh9hs93MIDqKMvR35u7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182629; c=relaxed/simple;
	bh=9uacs6ioB2rO7SZ3IA+JH4OT124iqa9FXaWqmF0N7Lc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kioRn0mAEMgB/HJndHjykl7hI8JIKkIbnDDLZpXIuRFaztApi+bE7fI82SwqE4ioVAKxVC5REPRmL6JBcuneARlYmL7IpIym4sTlZJ3yUjhCT9a+RiOjpNvu/+GQxMWYmSv1yO/bzEMPgvjQ3Y4B0dsT11kLzdtNBCMhp2h+1bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBSTyZZ7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182628; x=1772718628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9uacs6ioB2rO7SZ3IA+JH4OT124iqa9FXaWqmF0N7Lc=;
  b=FBSTyZZ7LE3Eq55ostM/C08HPYtIlCdnL9+0V291LPPy35UTH4Y7kwoJ
   DgEC3Zg+RVhUm2Wth1X27tdYimK7o9ZwCEh/HHT8sc+5peO0BhwIeQLbL
   1UctcP+/SlApcLC/2z+sOv0vB9zdgSwdfmD1nhU68Y7WRqm/fIK4psROy
   EdqY3WodlMRidqXBgCTs4hvcpPu0o50stx9gSjA/gnsvPEhI8hJC8MrZ0
   cokM7x2nIcredDMqmsNdxbwnTxn0tom4FHGaHapPfgTNVdM05pE+a8SW1
   qknb6Pe4OCmT5BpyVBIwPCJNecQZh7Ia3OaPGjx/YVBvwGBLulTpjxdUt
   A==;
X-CSE-ConnectionGUID: w5O9iGeZT4C2GZYrWcLFMA==
X-CSE-MsgGUID: Xkxe48GZRnydwQ2DaFiQMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64588414"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="64588414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:50:27 -0800
X-CSE-ConnectionGUID: UyxQQcIgSdGSxNcJfMgYiA==
X-CSE-MsgGUID: L4wh4/zKSGm7udqNid7jZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123897958"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:50:25 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 82BF011F7E5;
	Wed,  5 Mar 2025 15:50:22 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tpp8g-00GPR4-1Q;
	Wed, 05 Mar 2025 15:50:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jason.z.chen@intel.com
Subject: [PATCH v3 1/1] media: common: Add v4l2_find_nearest_size_conditional()
Date: Wed,  5 Mar 2025 15:50:12 +0200
Message-Id: <20250305135012.3911014-1-sakari.ailus@linux.intel.com>
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
since v2:

- Remove the leftover semicolon from v4l2_find_nearest_size() macro
  definition.

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
index fda903bb3674..0a43f56578bc 100644
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
+					   NULL)
 
 /**
  * v4l2_g_parm_cap - helper routine for vidioc_g_parm to fill this in by
-- 
2.39.5


