Return-Path: <linux-media+bounces-50744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB97D2242A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 04:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A54433047DBF
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 03:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017FF28A3EF;
	Thu, 15 Jan 2026 03:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1UKJUuS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56528750A
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 03:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768446745; cv=none; b=AEg7gWEpqC5F2ggkkErcpDX/il/x4SUmzcPUd5HCsd6VI2v4eQvUT683DxkBXCg7S2JkXGAL3O16kdCaAKOXJOoyhW7MhggKj/U9Wud/N3cyPM3gYRhMiy0RqYrMcc2GYjYvPpvpnEZt2oRFDZQgMXCjFtSpbOBWKh7hUrMNahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768446745; c=relaxed/simple;
	bh=bfY21wb9zreAqw4/f1hTl74rQI5Z5S4Zxq4SgQ9SBpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rpMvWIvC7AbqPPpTMrJyhwTHGHytleYp+rJbW64O3NXG2E0IwPjwbkaP1UYuZ97qrb7rF0ZmQSEk0iOEbz2RLWRm+TtYWU4KafSxUGI37iReap4Mgr2pvxB4poRygYaO2aFmJxRUcDgVtCEcgMpXOiCHMIK0DmO1WROeu6u+ZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1UKJUuS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0834769f0so3183195ad.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 19:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768446743; x=1769051543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDVMaWbq7186xlbZBkIwTp4VvT95HkeR2Fa3C7B6kc8=;
        b=d1UKJUuSXXjJSORa7tTnZmA/liHZeDELbCZZwgWgUiAeJ0zG/krI3OlAM9ZfXEDu7v
         HFfBSriBrVyG6Wq1W3OCEFNIadlIOT+Lh44C+vxGFae9QE51G0WxBb1KVfLiQa1Xfwoe
         S6C4jGzsTM1KIPiNDxYVGctlTf+ggRhuC9+fTRlT/avd9LZLDv7DFq8HY4FsX3DZ8GS6
         SXWPRg1TcZt5KQISVViSi8ds8z8MfjOFsLOh2vrSzfVfTehBph98J7lDDlhn1V69eYEw
         kh2TlOf4NK8w4l6lPnhfUhA1CfvIcYrfBvOncifDxZMuVZRlq1EooUH56fOyZblMZhcj
         B0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768446743; x=1769051543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDVMaWbq7186xlbZBkIwTp4VvT95HkeR2Fa3C7B6kc8=;
        b=spHww3l+aMwsJIbNz6kbUCzNF+GiFLqyc+mRWnVDfureBoLhoBkx8ccdDOena4WXK2
         m1QvnUi2IjDF8KUdc2K9ZPOvHYKlOefj86rR6JpOdK/5/ERsGprIhObJ7u+msZnU4ati
         fgWAQy7TLKy/FucW/WlHkZxOH4n3DDHxEIbLPsCTLeVIdTdun/Bh7PjWHWQHvZyCxzt0
         ee88kuE50pMweQ0dJ3heLQXG0sik/ay/eZ2gAE4tHP9kikn85oZZZqrRtn3Xz1ZVmFE+
         5vvhzW7MQDSSN+/I1mBrBfrVGDNv730PewqM41GCJncTGIat8EDxXXVqvcXKp+8y7qXu
         R+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTRy18oR2yiJUukEqkHnkfgkb+MEw3OXUkXAqB3BN384mGC6W3QtFd1u+ywDUQJ+VxLAHbKq0ybPbNnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlSRAAmHLLh6PcgIz3JL5yowSmhghq5I/lYMUfYqVBaBhwv6HH
	90cBZHzOQPZL2vI+PtV35GF6QDGL6xZFTTCOCUbdusk6OTmU30dYLBPh
X-Gm-Gg: AY/fxX7HWzrPd/7ejSNrmffmDirL75VLby/0HN5xtPQiqcBQOClmmHWF92JQq8MsqNp
	zxVr4B2Zm0F4W4eF0359fXu9abTAIzaKMmsDoDUyWDoO6e25oS1WqpeFe70vSdF2NTMxN21ebvY
	mUuZ8wdmMruvjiusMb2U4zsMSZ/h1hJge7RezTtcCuNpO9t43tIkcOmgQxHAqwxj2aDin9qIjlZ
	xNMi0kkPM46AgMT4VmidPI4GAbDllppUuHCCD+TSnpRt71EJTRD5AuBLGz7Lyq/sj36GPcgi6Ha
	jg+vnF51B1qEGBb0xyr29fJBsXpomF5IRHewwicvMlADecTPYhdls4Hnc71YLbl+uArDoWp9lYI
	ypkrGK+/Q0QYOIBACKljX63VVDmjS7IoGzpCxPWbucNfexYKUj7BN+zFKBe0qaq02cwV0oYzBi3
	ZDLGzUyO8DBK92zUAfagiGb9n5BCxC5g==
X-Received: by 2002:a17:902:e784:b0:2a0:c58b:ed6 with SMTP id d9443c01a7336-2a599e347d0mr49824425ad.29.1768446742812;
        Wed, 14 Jan 2026 19:12:22 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d81sm237392495ad.81.2026.01.14.19.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 19:12:22 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	karthikey3608@gmail.com
Subject: [PATCH v4] media: atomisp: replace ia_css_region with v4l2_rect
Date: Thu, 15 Jan 2026 08:42:07 +0530
Message-ID: <20260115031207.52840-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct ia_css_region definition is redundant as struct v4l2_rect
provides the same functionality (left, top, width, height) and is the
standard V4L2 type.

Replace usage of ia_css_region with v4l2_rect in ia_css_dz_config
and remove the definition of ia_css_region from ia_css_types.h.

Also remove historical comments referencing the addition of zoom_region
and include <linux/videodev2.h> to support the v4l2_rect type.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
Changes in v4:
- Reverted unrelated Dev_dbg removal and indentation changes in atomisp_cmd.c.
- Fixed struct initializer in sh_css_params.c to be flat (fixes static analysis warnings).
- Fixed line wrap issues and operator placement in atomisp_cmd.c (fixes checkpatch warnings), ensuring no unrelated lines were touched.
- Added blank line after <linux/videodev2.h> in ia_css_types.h.
Changes in v3:
- Rebased on linux-media/next to resolve conflict with nested structs.
- Replaced usage of zoom_region.origin/resolution with direct members.
Changes in v2:
- Removed unrelated changes to drivers/staging/sm750fb/ddk750_swi2c.c.
- Removed historical comments in ia_css_types.h.
- Corrected header ordering.

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 122 +++++++++---------
 .../staging/media/atomisp/pci/ia_css_types.h  |  14 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  18 +--
 3 files changed, 69 insertions(+), 85 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..1651ef4eafe1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1762,15 +1762,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	if (dz_config->zoom_region.resolution.width
-	    == asd->sensor_array_res.width
-	    || dz_config->zoom_region.resolution.height
-	    == asd->sensor_array_res.height) {
+	if (dz_config->zoom_region.width == asd->sensor_array_res.width ||
+	    dz_config->zoom_region.height == asd->sensor_array_res.height) {
 		/*no need crop region*/
-		dz_config->zoom_region.origin.x = 0;
-		dz_config->zoom_region.origin.y = 0;
-		dz_config->zoom_region.resolution.width = eff_res.width;
-		dz_config->zoom_region.resolution.height = eff_res.height;
+		dz_config->zoom_region.left = 0;
+		dz_config->zoom_region.top = 0;
+		dz_config->zoom_region.width = eff_res.width;
+		dz_config->zoom_region.height = eff_res.height;
 		return 0;
 	}
 
@@ -1781,18 +1779,14 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	 */
 
 	if (!IS_ISP2401) {
-		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
-						  * eff_res.width
-						  / asd->sensor_array_res.width;
-		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
-						  * eff_res.height
-						  / asd->sensor_array_res.height;
-		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
-							  * eff_res.width
-							  / asd->sensor_array_res.width;
-		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
-							  * eff_res.height
-							  / asd->sensor_array_res.height;
+		dz_config->zoom_region.left = dz_config->zoom_region.left *
+					      eff_res.width / asd->sensor_array_res.width;
+		dz_config->zoom_region.top = dz_config->zoom_region.top *
+					     eff_res.height / asd->sensor_array_res.height;
+		dz_config->zoom_region.width = dz_config->zoom_region.width *
+					       eff_res.width / asd->sensor_array_res.width;
+		dz_config->zoom_region.height = dz_config->zoom_region.height *
+						eff_res.height / asd->sensor_array_res.height;
 		/*
 		 * Set same ratio of crop region resolution and current pipe output
 		 * resolution
@@ -1819,62 +1813,62 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 				   - asd->sensor_array_res.width
 				   * out_res.height / out_res.width;
 			h_offset = h_offset / 2;
-			if (dz_config->zoom_region.origin.y < h_offset)
-				dz_config->zoom_region.origin.y = 0;
+			if (dz_config->zoom_region.top < h_offset)
+				dz_config->zoom_region.top = 0;
 			else
-				dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y - h_offset;
+				dz_config->zoom_region.top =
+					dz_config->zoom_region.top - h_offset;
 			w_offset = 0;
 		} else {
 			w_offset = asd->sensor_array_res.width
 				   - asd->sensor_array_res.height
 				   * out_res.width / out_res.height;
 			w_offset = w_offset / 2;
-			if (dz_config->zoom_region.origin.x < w_offset)
-				dz_config->zoom_region.origin.x = 0;
+			if (dz_config->zoom_region.left < w_offset)
+				dz_config->zoom_region.left = 0;
 			else
-				dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x - w_offset;
+				dz_config->zoom_region.left =
+					dz_config->zoom_region.left - w_offset;
 			h_offset = 0;
 		}
-		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
-						  * eff_res.width
-						  / (asd->sensor_array_res.width - 2 * w_offset);
-		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
-						  * eff_res.height
-						  / (asd->sensor_array_res.height - 2 * h_offset);
-		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
-						  * eff_res.width
-						  / (asd->sensor_array_res.width - 2 * w_offset);
-		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
-						  * eff_res.height
-						  / (asd->sensor_array_res.height - 2 * h_offset);
-	}
-
-	if (out_res.width * dz_config->zoom_region.resolution.height
-	    > dz_config->zoom_region.resolution.width * out_res.height) {
-		dz_config->zoom_region.resolution.height =
-		    dz_config->zoom_region.resolution.width
-		    * out_res.height / out_res.width;
+		dz_config->zoom_region.left = dz_config->zoom_region.left *
+			eff_res.width /
+			(asd->sensor_array_res.width - 2 * w_offset);
+		dz_config->zoom_region.top = dz_config->zoom_region.top *
+			eff_res.height /
+			(asd->sensor_array_res.height - 2 * h_offset);
+		dz_config->zoom_region.width = dz_config->zoom_region.width *
+			eff_res.width /
+			(asd->sensor_array_res.width - 2 * w_offset);
+		dz_config->zoom_region.height = dz_config->zoom_region.height *
+			eff_res.height /
+			(asd->sensor_array_res.height - 2 * h_offset);
+	}
+
+	if (out_res.width * dz_config->zoom_region.height >
+	    dz_config->zoom_region.width * out_res.height) {
+		dz_config->zoom_region.height = dz_config->zoom_region.width *
+						out_res.height / out_res.width;
 	} else {
-		dz_config->zoom_region.resolution.width =
-		    dz_config->zoom_region.resolution.height
-		    * out_res.width / out_res.height;
+		dz_config->zoom_region.width = dz_config->zoom_region.height *
+					       out_res.width / out_res.height;
 	}
 	dev_dbg(asd->isp->dev,
 		"%s crop region:(%d,%d),(%d,%d) eff_res(%d, %d) array_size(%d,%d) out_res(%d, %d)\n",
-		__func__, dz_config->zoom_region.origin.x,
-		dz_config->zoom_region.origin.y,
-		dz_config->zoom_region.resolution.width,
-		dz_config->zoom_region.resolution.height,
+		__func__, dz_config->zoom_region.left,
+		dz_config->zoom_region.top,
+		dz_config->zoom_region.width,
+		dz_config->zoom_region.height,
 		eff_res.width, eff_res.height,
 		asd->sensor_array_res.width,
 		asd->sensor_array_res.height,
 		out_res.width, out_res.height);
 
-	if ((dz_config->zoom_region.origin.x +
-	     dz_config->zoom_region.resolution.width
+	if ((dz_config->zoom_region.left +
+	     dz_config->zoom_region.width
 	     > eff_res.width) ||
-	    (dz_config->zoom_region.origin.y +
-	     dz_config->zoom_region.resolution.height
+	    (dz_config->zoom_region.top +
+	     dz_config->zoom_region.height
 	     > eff_res.height))
 		return -EINVAL;
 
@@ -1899,10 +1893,10 @@ static bool atomisp_check_zoom_region(
 
 	config.width = asd->sensor_array_res.width;
 	config.height = asd->sensor_array_res.height;
-	w = dz_config->zoom_region.origin.x +
-	    dz_config->zoom_region.resolution.width;
-	h = dz_config->zoom_region.origin.y +
-	    dz_config->zoom_region.resolution.height;
+	w = dz_config->zoom_region.left +
+	    dz_config->zoom_region.width;
+	h = dz_config->zoom_region.top +
+	    dz_config->zoom_region.height;
 
 	if ((w <= config.width) && (h <= config.height) && w > 0 && h > 0)
 		flag = true;
@@ -1910,10 +1904,10 @@ static bool atomisp_check_zoom_region(
 		/* setting error zoom region */
 		dev_err(asd->isp->dev,
 			"%s zoom region ERROR:dz_config:(%d,%d),(%d,%d)array_res(%d, %d)\n",
-			__func__, dz_config->zoom_region.origin.x,
-			dz_config->zoom_region.origin.y,
-			dz_config->zoom_region.resolution.width,
-			dz_config->zoom_region.resolution.height,
+			__func__, dz_config->zoom_region.left,
+			dz_config->zoom_region.top,
+			dz_config->zoom_region.width,
+			dz_config->zoom_region.height,
 			config.width, config.height);
 
 	return flag;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 676d7e20b282..2b7db9cda23a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -15,6 +15,8 @@
  * directly but still need to forward parameters for it.
  */
 
+#include <linux/videodev2.h>
+
 #include <type_support.h>
 
 #include "ia_css_frac.h"
@@ -427,14 +429,6 @@ struct ia_css_point {
 	s32 y; /** y coordinate */
 };
 
-/**
- * This specifies the region
- */
-struct ia_css_region {
-	struct ia_css_point origin; /** Starting point coordinates for the region */
-	struct ia_css_resolution resolution; /** Region resolution */
-};
-
 /**
  * Digital zoom:
  * This feature is currently available only for video, but will become
@@ -442,7 +436,7 @@ struct ia_css_region {
  * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
  * factor will be 64/x.
  * Setting dx or dy to 0 disables digital zoom for that direction.
- * New API change for Digital zoom:(added struct ia_css_region zoom_region)
+ *
  * zoom_region specifies the origin of the zoom region and width and
  * height of that region.
  * origin : This is the coordinate (x,y) within the effective input resolution
@@ -455,7 +449,7 @@ struct ia_css_region {
 struct ia_css_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct ia_css_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 /* The still capture mode, this can be RAW (simply copy sensor input to DDR),
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c908..23e08142bf09 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -657,11 +657,7 @@ static const int zoom_table[4][HRT_GDC_N] = {
 static const struct ia_css_dz_config default_dz_config = {
 	HRT_GDC_N,
 	HRT_GDC_N,
-	{
-		\
-		{0, 0}, \
-		{0, 0}, \
-	}
+	{ 0, 0, 0, 0 }
 };
 
 static const struct ia_css_vector default_motion_config = {
@@ -1210,8 +1206,8 @@ ia_css_process_zoom_and_motion(
 		}
 
 		assert(stage->stage_num < SH_CSS_MAX_STAGES);
-		if (params->dz_config.zoom_region.resolution.width == 0 &&
-		    params->dz_config.zoom_region.resolution.height == 0) {
+		if (params->dz_config.zoom_region.width == 0 &&
+		    params->dz_config.zoom_region.height == 0) {
 			sh_css_update_uds_and_crop_info(
 			    &info->sp,
 			    &binary->in_frame_info,
@@ -4096,10 +4092,10 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
 	assert(motion_vector);
 	assert(uds);
 	assert(sp_out_crop_pos);
-	x0 = zoom->zoom_region.origin.x;
-	y0 = zoom->zoom_region.origin.y;
-	x1 = zoom->zoom_region.resolution.width + x0;
-	y1 = zoom->zoom_region.resolution.height + y0;
+	x0 = zoom->zoom_region.left;
+	y0 = zoom->zoom_region.top;
+	x1 = zoom->zoom_region.width + x0;
+	y1 = zoom->zoom_region.height + y0;
 
 	if ((x0 > x1) || (y0 > y1) || (x1 > pipe_in_res.width) || (y1 > pipe_in_res.height))
 		return -EINVAL;
-- 
2.43.0


