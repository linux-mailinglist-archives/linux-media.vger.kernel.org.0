Return-Path: <linux-media+bounces-50154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A757CFE62B
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839CF30D7ACA
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFE134EF08;
	Wed,  7 Jan 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRmaUcHB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6790034EF03
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796998; cv=none; b=OVhIADNLtp5N4VlTu9cZVk8wSLGbq2g/0+FFFnLaXQ4jhRZusZy641mL3aAVjE7+WF5GI95fSlD9XzS1GgVFUkuBDH/pFIo1od9Fh2LRFwVg6RvMtGJ9K+WSBYu49OGlZyT0ytl/ZsiKtaEgYoRS8rSAx4wTy7YsQz2zSi00/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796998; c=relaxed/simple;
	bh=cXUAVc/AvyJ8r0B7qpIrE37AZuq+6fbbTkMbJbdR/pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u17LzgcCkMSnSqjSesHIDGCvMWTwqmBvtU/KIzXi3KguUPBGgApGGq8yq7IXcbk4BxQZhtYfISvYYMmbhn0SShXMC5V+Jka5gOeYrRc2zxO0VahFtuDdyiCRxoQztsq9m1QshfUcMJKcnqrepLveot5AfrJmpSZYiUwiemV329U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRmaUcHB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1444677b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767796996; x=1768401796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmyuDSwLNtWwhhF1d3uL9GDstNtI6pYYUQfJBzCE6uk=;
        b=LRmaUcHBIPG9g8mr1VXbqKu2MxX32A2YslKs8sfdWzkU/R5+cqtP3Jqiq3PC0dspCU
         oxLsO8O4okoIDzLmERVBsTVftSYRvFNNShHOnefM3P5wSea7jJUKNe+MVAHsjPOT+jCK
         OFmL4JS3dXMJJdMK+WGg45dFjmgH8ltEAZusLFEGtCUatKcTnhQTRQCH1DxYMWeJT6TB
         XA9iEmEAiD81geRZJ1X5Nrj3EtSznEnU34N5EK4CGfuKhT5wEBBEdeZShQn3xw3/5FCY
         hRBmYZs+rqh8nrMaOwwEK/r3TGxmjUt8ccK4cLWFPfIsQm2kBQAZpFDvPkTBADdiD8H+
         Fuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796996; x=1768401796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmyuDSwLNtWwhhF1d3uL9GDstNtI6pYYUQfJBzCE6uk=;
        b=ndvX4UdVy3GlrbwX5NMTWthZnL6MlME7o2WvjmLcrNJN1ct69Y5Ek0l+oYIZLejB6L
         FhNslrqbw9UqJ2euuwDZOOWDFHbPX9eMOdDN6ZWKsxCy7bC0C1GWepbBKYTrupBdymOr
         K3H/MwgphCYI1WkoBaDBBUomhkQI5GRVvmMO54vDKDfZIla9eOMuENp8HsMtYpbx9CqO
         +QPPRD4jbwSxpVaxHQuX46HbzJ/fohjGD3yScDnxVsGq1yO0rSQp0WJwpXwvw8RQHbNI
         pn93+8sTGpZatH81VIoWfuWDQcsMhHSmXfvbhfGOE/VlKmPzeRGYwvISLKnwI3CZ71xS
         MaAg==
X-Forwarded-Encrypted: i=1; AJvYcCWWpNmjh8Nmgu4p9HQzKRAevqLwzmNMsUyVmsHxhoHqKKTY9KuuI/e2EsxWhd7uU8mCLykdu0Fp4qXPDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmMO7gF0GGq+rTsJkMpAOPRr3tmZgNYGIe7BB01juTrmm60aX
	YXJg6C5SuE2oSkT4L8h6f2dwFTMfYYslLQDwPkJHwnyijsUPYtizM8xk
X-Gm-Gg: AY/fxX5mtbaW3F/LuAWqI5UlKzcnUti2AuTEi5ufhV6gmUtHEGzZppneUcQvguqeCm2
	F7EcA5a8Pm1Yblr5bdePxxQPlReVSK896mFZO5cUsvdRRQYYSpE9wb/twN52UaIno/4q+4BkbO9
	FyNmkZUl8bej6PJUS9LxR7t8qVCMD3m8/xA1LJZolhO1L5XHRywDnGCzDJo8wd9qxjrBU64Tc/W
	2TsKyYUEG825mseH75Uc3rgCEfUZmxCvjk//+lWks5kMoqSvLdDXvo1XEZdrnP+iuZXYFm58SvE
	uPhLOz4vEG3K93ucEBBw4OuhV7KoEkyyizVw/jyqrzx99L9bctxVL2BE/4EHemv5csDq4/KEtrx
	ORKIlCiPKtFN7NKJWmcLDVAR4xikygH4mVfQVTWUXcwTdvu//6tcl6qhoQXovANOCltCPIQg6FK
	4Ib2BcqBAlR1xOjSHqOSk4SQ==
X-Google-Smtp-Source: AGHT+IFpMcn9Q3hz/Qljz9x+bkzpj0ZDU0R6UbjDE+8Evn5mh7RI/sTVRxFHDAQU55YW/ALIfmtTDQ==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-81b806c99f9mr2418706b3a.41.1767796995618;
        Wed, 07 Jan 2026 06:43:15 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm5168936b3a.46.2026.01.07.06.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:43:15 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 1/3] media: atomisp: replace shadow zoom structs with v4l2_rect
Date: Wed,  7 Jan 2026 20:12:50 +0530
Message-ID: <20260107144252.74666-2-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107144252.74666-1-karthikey3608@gmail.com>
References: <20260107144252.74666-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove custom atomisp_zoom_point and atomisp_zoom_region structs and usage

in favor of standard v4l2_rect within atomisp_dz_config.

This aligns the driver with V4L2 standards and removes unnecessary custom

types.

Also standardizes the internal ia_css_region struct members to match

V4L2 naming conventions (left, top, width, height) to facilitate the

bridge mapping.

Updates atomisp_cmd.c and sh_css_params.c to use the new member names

and ensures safe math using long long casts to prevent overflow during

resolution scaling.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 130 +++++++++---------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +--
 4 files changed, 79 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index fcf116cc4..b5cce12c1 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -326,27 +326,12 @@ struct atomisp_resolution {
 	u32 height; /** Height */
 };
 
-/*
- * This specifies the coordinates (x,y)
- */
-struct atomisp_zoom_point {
-	s32 x; /** x coordinate */
-	s32 y; /** y coordinate */
-};
-
-/*
- * This specifies the region
- */
-struct atomisp_zoom_region {
-	struct atomisp_zoom_point
-		origin; /* Starting point coordinates for the region */
-	struct atomisp_resolution resolution; /* Region resolution */
-};
+#include <linux/videodev2.h>
 
 struct atomisp_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct atomisp_zoom_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 struct atomisp_parm {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 327836372..58201dedf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1764,15 +1764,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
 
@@ -1783,18 +1781,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
+		dz_config->zoom_region.left =
+			(long long)dz_config->zoom_region.left *
+			eff_res.width / asd->sensor_array_res.width;
+		dz_config->zoom_region.top =
+			(long long)dz_config->zoom_region.top *
+			eff_res.height / asd->sensor_array_res.height;
+		dz_config->zoom_region.width =
+			(long long)dz_config->zoom_region.width *
+			eff_res.width / asd->sensor_array_res.width;
+		dz_config->zoom_region.height =
+			(long long)dz_config->zoom_region.height *
+			eff_res.height / asd->sensor_array_res.height;
 		/*
 		 * Set same ratio of crop region resolution and current pipe output
 		 * resolution
@@ -1821,62 +1819,66 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 				   - asd->sensor_array_res.width
 				   * out_res.height / out_res.width;
 			h_offset = h_offset / 2;
-			if (dz_config->zoom_region.origin.y < h_offset)
-				dz_config->zoom_region.origin.y = 0;
+			if (dz_config->zoom_region.top < h_offset)
+				dz_config->zoom_region.top = 0;
 			else
-				dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y - h_offset;
+				dz_config->zoom_region.top -= h_offset;
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
+				dz_config->zoom_region.left -= w_offset;
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
+		dz_config->zoom_region.left =
+			(long long)dz_config->zoom_region.left *
+			eff_res.width /
+			(asd->sensor_array_res.width - 2 * w_offset);
+		dz_config->zoom_region.top =
+			(long long)dz_config->zoom_region.top *
+			eff_res.height /
+			(asd->sensor_array_res.height - 2 * h_offset);
+		dz_config->zoom_region.width =
+			(long long)dz_config->zoom_region.width *
+			eff_res.width /
+			(asd->sensor_array_res.width - 2 * w_offset);
+		dz_config->zoom_region.height =
+			(long long)dz_config->zoom_region.height *
+			eff_res.height /
+			(asd->sensor_array_res.height - 2 * h_offset);
+	}
+
+	if ((long long)out_res.width * dz_config->zoom_region.height >
+	    (long long)dz_config->zoom_region.width * out_res.height) {
+		dz_config->zoom_region.height =
+			(long long)dz_config->zoom_region.width *
+			out_res.height / out_res.width;
 	} else {
-		dz_config->zoom_region.resolution.width =
-		    dz_config->zoom_region.resolution.height
-		    * out_res.width / out_res.height;
+		dz_config->zoom_region.width =
+			(long long)dz_config->zoom_region.height *
+			out_res.width / out_res.height;
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
 
@@ -1901,10 +1903,10 @@ static bool atomisp_check_zoom_region(
 
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
@@ -1912,10 +1914,10 @@ static bool atomisp_check_zoom_region(
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
index 676d7e20b..5c21a5415 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -431,8 +431,10 @@ struct ia_css_point {
  * This specifies the region
  */
 struct ia_css_region {
-	struct ia_css_point origin; /** Starting point coordinates for the region */
-	struct ia_css_resolution resolution; /** Region resolution */
+	s32 left; /** Starting point coordinates for the region */
+	s32 top;
+	s32 width; /** Region resolution */
+	s32 height;
 };
 
 /**
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c..0435f20a7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -658,9 +658,7 @@ static const struct ia_css_dz_config default_dz_config = {
 	HRT_GDC_N,
 	HRT_GDC_N,
 	{
-		\
-		{0, 0}, \
-		{0, 0}, \
+		0, 0, 0, 0
 	}
 };
 
@@ -1210,8 +1208,8 @@ ia_css_process_zoom_and_motion(
 		}
 
 		assert(stage->stage_num < SH_CSS_MAX_STAGES);
-		if (params->dz_config.zoom_region.resolution.width == 0 &&
-		    params->dz_config.zoom_region.resolution.height == 0) {
+		if (params->dz_config.zoom_region.width == 0 &&
+		    params->dz_config.zoom_region.height == 0) {
 			sh_css_update_uds_and_crop_info(
 			    &info->sp,
 			    &binary->in_frame_info,
@@ -4096,10 +4094,10 @@ sh_css_update_uds_and_crop_info_based_on_zoom_region(
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


