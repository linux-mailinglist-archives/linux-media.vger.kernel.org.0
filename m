Return-Path: <linux-media+bounces-50162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77ECFECEF
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 17:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98ABD30010E9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 16:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3BB35E54D;
	Wed,  7 Jan 2026 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcUvId2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B335E53C
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798565; cv=none; b=UNKbMgUT92F56no0XtohVoH8ZhIOKlXI2f/oZVhIjsZJof+EqBia7PkMx1AAsZm60niGdUN1lOx9WRucC8GgvaG62/XKiJShY9Gyehnh/fdy7iPiRiiGBMRNf/bRKMpWWN2pIzklqyAChjDi/qwWiG+2WsaKkjAJCyR9FQ1UXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798565; c=relaxed/simple;
	bh=xKFsJabEMwnI1MXju9I0t3B+DJrI9n8oUM1d99mUiCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdOqiS6Hve4Vg9JI9W4G4OhgoyvrYfvsEpZ/AgeHp1W4c5aP4MbB5oyeHaeI0s2n3NqQsd1ci80Sk/qwtS++pQ9sClVzdsaBwywhHGHydc67MrOvrB56LxMH/0wydZwh949ykKFHrCYVuZS3dF4cYgHWjeqgfHdjpW5Y2F8JYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcUvId2i; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1727362b3a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 07:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767798563; x=1768403363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvqM+SWBFA3rR7ce2iMSgH9tTLda8L0N8W2RxvU0YTU=;
        b=EcUvId2iXg4x9a7Q2Cw90koM+tvedzeYdkmvvrHk3ZrhB37sIR1U3Fl2Azusp5Q/06
         +a+AKOXo5YCqPL5d5IuSngBbHZTBjGyNfmF7/DD6XkUDC6VwyOza5Xo6+mzPe9jQ5p9G
         j+xOurxRp+W4LOmaRMVEJ5yodTHkCWY4mRnTmNrDSIGHfvfLRO/3u+XxH+WtbzJpBPdF
         2dIBtuteQQ/M7Jw0D6+1CWZ3juMZ0EiFEAjI6OP8V0VpP4x7QIJq8CG6/sQgsHi/abFq
         1PIV50eGNHT+OX3nV7uC+T+KRxLDiq5Bb/JZROcD9+0nUOdyoZD9EVXJVPTlI10MgaIk
         BaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798563; x=1768403363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QvqM+SWBFA3rR7ce2iMSgH9tTLda8L0N8W2RxvU0YTU=;
        b=mJMZZt+3IwPkv53GmKQ3SaDjxGeZSzYPnXYIstcrHQnxm+KCv7NhfqOZS0YQoh2i2U
         Bn4uBRGm6XXrNmvntUn0WV773B2FraGAXChEUnkKZc9J9RUD0BNJ60LbSNT6Zey2py+t
         4j5zByXUlJlFQRLmv9hUNCWv6Ub+6arSnbMbIcrItfUWLxvOJtVXRJ2qHYx8I9zvFYkP
         ZifHqiJNtG9Tc3K3rc5By4LdSmPxG7ezevE93bZ9N/w5D+HsNOnM5xMa7HKLIO4IJPbi
         bJgSIrfQuFZGlxm0jYOeWRisP/QIY/LsHcI03rLl44C5Dl64xVJ1EQ8IdXc+dYUP4amM
         zVwg==
X-Forwarded-Encrypted: i=1; AJvYcCXv7dlx9aaXtouukD8e5stjPq2tN3Tt6ATSpvfTUThLK6jUQvePwnkRay8IHXwSm9A+V0zZTMhqF1W4JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOHGPN6FPdlYCGw0vqzWbM8rJf8LzKek5W/uPODZXDcem0bG/
	ADcovgBBhngqOY8Pdv05fVQMJYUnOFt0BDvuytb7UwL251lA30kCBZ7z
X-Gm-Gg: AY/fxX7z3qdgK9K5bn6uVBBL38z1St6B9ig5tw6eUGD94fc/2UHA0Wkb8t9Z2k3hj/r
	d0cLfJY7OGtX3Kx1T1uJoJx8DKubE7G3+jdZs2FUWowV03JgLa5/2Nl5Om+FoCDlf4dJfp0Nvon
	a3XHNcyXM3dZ6Al7Jw/ZTvwMvGEYrVEtJw5VWypKWjG27KX1iU8NeSt9wsiKFLJ434t+qYNWKp4
	TgMbhhi7VLcBLzMhd8yYbqdqa8z7yUamrUuZjLIxtX5NHohjkadxWioy7z8f5VclcYdDI6apBLX
	lLJWsvrYIXnSY55BJVhWL1cuG8CF+G9NRrDxazTwFfkBp9McC0UelSRasfwAjgKZaQdKoKTuptV
	rOrRY91kDGLFK/EQZVpNBXUV+/EpD0ZvqYYpqKiTfVP1zZx1rNh+4Jmzf2Oe/TWS1N6RReQLeHP
	vMKTpQFyEDnp0=
X-Google-Smtp-Source: AGHT+IEMZL7cDWMK2efRhgrCEhtbkTevVTHEG1U32DuXu98OETg5HHFEdrcXTWamiC55tEBJtwVoxw==
X-Received: by 2002:a05:6a00:3487:b0:819:5db9:6c4c with SMTP id d2e1a72fcca58-81b7d95ee54mr2540288b3a.8.1767798563245;
        Wed, 07 Jan 2026 07:09:23 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm5246114b3a.47.2026.01.07.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:09:22 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v4 1/3] media: atomisp: replace shadow zoom structs with v4l2_rect
Date: Wed,  7 Jan 2026 20:38:56 +0530
Message-ID: <20260107150858.79818-2-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107150858.79818-1-karthikey3608@gmail.com>
References: <20260107150858.79818-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove custom atomisp_zoom_point and atomisp_zoom_region structs

and usage in favor of standard v4l2_rect within atomisp_dz_config.

This aligns the driver with V4L2 standards and removes unnecessary

custom types.

Also standardize the internal ia_css_region struct members to

match V4L2 naming conventions (left, top, width, height) to

facilitate the bridge mapping.

Updates atomisp_cmd.c and sh_css_params.c to use the new

member names.

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
index 327836372..677c460fe 100644
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
+			dz_config->zoom_region.left *
+			eff_res.width / asd->sensor_array_res.width;
+		dz_config->zoom_region.top =
+			dz_config->zoom_region.top *
+			eff_res.height / asd->sensor_array_res.height;
+		dz_config->zoom_region.width =
+			dz_config->zoom_region.width *
+			eff_res.width / asd->sensor_array_res.width;
+		dz_config->zoom_region.height =
+			dz_config->zoom_region.height *
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
+			dz_config->zoom_region.left *
+			eff_res.width /
+			(asd->sensor_array_res.width - 2 * w_offset);
+		dz_config->zoom_region.top =
+			dz_config->zoom_region.top *
+			eff_res.height /
+			(asd->sensor_array_res.height - 2 * h_offset);
+		dz_config->zoom_region.width =
+			dz_config->zoom_region.width *
+			eff_res.width /
+			(asd->sensor_array_res.width - 2 * w_offset);
+		dz_config->zoom_region.height =
+			dz_config->zoom_region.height *
+			eff_res.height /
+			(asd->sensor_array_res.height - 2 * h_offset);
+	}
+
+	if (out_res.width * dz_config->zoom_region.height >
+	    dz_config->zoom_region.width * out_res.height) {
+		dz_config->zoom_region.height =
+			dz_config->zoom_region.width *
+			out_res.height / out_res.width;
 	} else {
-		dz_config->zoom_region.resolution.width =
-		    dz_config->zoom_region.resolution.height
-		    * out_res.width / out_res.height;
+		dz_config->zoom_region.width =
+			dz_config->zoom_region.height *
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


