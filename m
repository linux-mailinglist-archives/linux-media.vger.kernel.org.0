Return-Path: <linux-media+bounces-50142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE4CFE10B
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 14:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59CC33003185
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15303314D9;
	Wed,  7 Jan 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYWoSomd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F0B3314D0
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793754; cv=none; b=dPX2fa9EVrT/UWI/+3SysccJSNxYJyb1IeVzF3MsUJgrcpBS/dIm47qt9Ajie76FDCDc9LdCpRHXmkMPAtm4qESSlRPt+3DZISFNgKahjLILMfCDYueTwNK00INvaE0MozJiK87aQaK6ModJWl1r7reQxW3OFMar/6wvPF4SYL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793754; c=relaxed/simple;
	bh=TKIKwvBOWkccmdrv2iMfjupuseLH7sbcozqajmk2NEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMSDxofX3CR5gF9qtkuPJganVDPpVDLaIBnQBX8LRPd/cSZu8QdXuLzgSJxE27p50123YGKq/+fb6rRwwbxPrCkmgml4S6DgbIncX9xNclPbpBCva1VzIZ7YI6tplpp6SBrO1uR662qRC/rePyBe7KOa6TFj4OPAOg/zRS8XiMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYWoSomd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-803474aaa8bso501589b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793751; x=1768398551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w43P1JW4wQheNkrfXzMs1sXhL7mJiuv4h8HUQUHGvjE=;
        b=TYWoSomdteo5bClMZf4MKCH2GGvcW6HZFY7GXzs39bg9zE46eodTrlS9qHRsM4sTse
         wkYuATdN9I2bcgNluh8wr1RrSF6VZ4PLtYbuXT9Lb7p0uksYc2BVcd10+323h9piM0Rw
         7HLN4HwO3oA8EFmF95pUJDCMd1A6j1oT/RBdRGIvTaDnHYidL6qqk1jtD50sQeTWDHtM
         NWRGb6GsxE2CkRsG1DacNzbYM9I1w4t0vBBgGNHIdhxGD7NGxj0zKT9wT+3/e06xEhXY
         4mnwEKgVJduGksnwrDiExoC89dXWwhx8ebNseSUQHhU8hfy2ehLUbhim5XW0h/U6lpZi
         4qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793751; x=1768398551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w43P1JW4wQheNkrfXzMs1sXhL7mJiuv4h8HUQUHGvjE=;
        b=Scrg1F5W+YAPh7EPwPK2Ky8vlMRrODxOjHuzVvnOgQiaEbu41Ccqu9ZlVjI62OdBhW
         EQ4Z1RZfyJ6KwQefcP6dw7PBKpkImQ25p4Zhl8jZypVV2FC+VgbT0C5kxpO+he7LWwMV
         /e3frKfQV448zLieSN8tPaRvHm/ouSPp7GzVcvAQL9iPY+u3Ok0z+8Qd15lfm6UY+Hv2
         4mWYF2sFxFFWa46cTHBlOWviBzgEjiJpn4vdHyEAM60uPpzlc8UtU4qJnFtYuJY8Xftr
         X/0zBrQbSOlYoDuStjF+Rz1Ei3wEaVdVTK4C2BYmaR7wsl/imGElbohNc8OwJXeCF6Sc
         /Owg==
X-Forwarded-Encrypted: i=1; AJvYcCUNdSntKP/K6+c5FlKNokKVJMFfSe3qdvKypwU7EokI/Z1EYyA9+67l6bmWknkn31tLJMWD+tlv36rgrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjBsZusjfzPJBDXAoOfbxPfwDEqVyEIKTvkegI4Kjpwg7BIFaf
	B6T7PjYrG7qtZprfMLhuKNFL17pIry2uAPx1YNbAGrOD52IXJzBgqRW3
X-Gm-Gg: AY/fxX4y79JkoByjNriwZ4gwEfr5z3BWP2aA5qv+nMKI5UgXxM/E645XqJ2kMt3myq8
	3NSuw0k1zUqeGmEHz7/s5fr0I6YBohAwlww0i7Yay98MAumfifzG7xqHLSdpV6RlBAWOFC3f2I3
	XT8/bs18UAbWXlBBgs0qYibPU49pv6gmtD/hkkG1XauAZYddIqXfsc0a0NAdxDh6kTJakkmG9Wi
	QBqMXdEcLR5GJCjEAEmxOBmNjYVCMTQkJL++Cnr5LNKMPPDAZi1a11Mi9c3fjvXSX4FYLOtlSwv
	hiTRxaedbjIooEHNGH5j6SUsaLDKLGQ2ZLwCf046vhgV+hBFAKKJtk+l4Q8/DK5dzex9/dBxliU
	WW742bggFiJpPghaEVvnbJNX/tByBuuWFhguHz7NIR88+qL8N7XMuML9kCJuruY+BIL23sZRsgH
	tcsjzTsrGQd4orJwcuPuhk0g==
X-Google-Smtp-Source: AGHT+IFQ4GDmNAoC50jk0wNrLfNYdKjs2GMJ5j6/dQToki8zi994DWS8NNBarDyaS4anHOX2nPSk2A==
X-Received: by 2002:a05:6a00:908e:b0:81b:1a87:9eb8 with SMTP id d2e1a72fcca58-81b789a9c08mr2586363b3a.28.1767793751268;
        Wed, 07 Jan 2026 05:49:11 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:10 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND v2 1/3] media: atomisp: replace shadow zoom structs with v4l2_rect
Date: Wed,  7 Jan 2026 19:18:42 +0530
Message-ID: <20260107134844.68074-2-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove custom atomisp_zoom_point and atomisp_zoom_region structs and

usage in favor of standard v4l2_rect within atomisp_dz_config.

This aligns the driver with V4L2 standards and removes unnecessary

custom types.

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
index 327836372..4ed6b8aea 100644
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
+			(s32)((long long)dz_config->zoom_region.left *
+			      eff_res.width / asd->sensor_array_res.width);
+		dz_config->zoom_region.top =
+			(s32)((long long)dz_config->zoom_region.top *
+			      eff_res.height / asd->sensor_array_res.height);
+		dz_config->zoom_region.width =
+			(u32)((long long)dz_config->zoom_region.width *
+			      eff_res.width / asd->sensor_array_res.width);
+		dz_config->zoom_region.height =
+			(u32)((long long)dz_config->zoom_region.height *
+			      eff_res.height / asd->sensor_array_res.height);
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
+			(s32)((long long)dz_config->zoom_region.left *
+			      eff_res.width /
+			      (asd->sensor_array_res.width - 2 * w_offset));
+		dz_config->zoom_region.top =
+			(s32)((long long)dz_config->zoom_region.top *
+			      eff_res.height /
+			      (asd->sensor_array_res.height - 2 * h_offset));
+		dz_config->zoom_region.width =
+			(u32)((long long)dz_config->zoom_region.width *
+			      eff_res.width /
+			      (asd->sensor_array_res.width - 2 * w_offset));
+		dz_config->zoom_region.height =
+			(u32)((long long)dz_config->zoom_region.height *
+			      eff_res.height /
+			      (asd->sensor_array_res.height - 2 * h_offset));
+	}
+
+	if ((long long)out_res.width * dz_config->zoom_region.height >
+	    (long long)dz_config->zoom_region.width * out_res.height) {
+		dz_config->zoom_region.height =
+			(u32)((long long)dz_config->zoom_region.width *
+			      out_res.height / out_res.width);
 	} else {
-		dz_config->zoom_region.resolution.width =
-		    dz_config->zoom_region.resolution.height
-		    * out_res.width / out_res.height;
+		dz_config->zoom_region.width =
+			(u32)((long long)dz_config->zoom_region.height *
+			      out_res.width / out_res.height);
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


