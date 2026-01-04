Return-Path: <linux-media+bounces-49868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A2CF125C
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 17:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A6A7300BBB0
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 16:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E551922D7B0;
	Sun,  4 Jan 2026 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcKO9sZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E0225416
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767544861; cv=none; b=cN6zEW7rpfLTQU8gxCfph8mwzqnEGCSC6oMN91vhRjMtV91JGIBiZJCTa82xDo4eTKjybmDTM0OW80Bk9EAGX1WZjt4DL03EsWoenV2GNbrhISkr8DPW8hziVbKO+bP5UeHkNikmRbZryg+sMfIUyS8+NtFf8QNIebDtzVSPT9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767544861; c=relaxed/simple;
	bh=k53koRSntlun2LVw5JaRvIyqbv0ckrOPfN5URiiCN6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gs5B1Cf5vWh0XGTFbPZ6vEugQQrkPm79zxYOrwV1Y50kHalc9u0Hem2OQJakXcCR08C/zmsXIMRxTt2KN0rF/Zf+pacd7P53jDhwaAfi6KUZYM+l3ONiZIV3cL3eWm2KjTtuYv6dJf/4xaxVavgN5dzpnLN/87skRRq7h7N9nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcKO9sZ0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so17219850a91.1
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767544859; x=1768149659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ValU0jfB+Ih7l4plfULIl8u7AO5mD9dRY4CULizC5OM=;
        b=WcKO9sZ0Xc65CXBEBD3LmQ1NuQjxpYXqKvdYKZaebvbSYC6lNAVZemSwa+68bIYMQy
         H0LhG9Qhw7ZGe/ZJ8sPDcbt1U+N1BQwOfMZLzq3niPWJ9qJ3Dfoa3/0Pf8km+BbmhSo0
         y1xrkY/Or4kTFASVCxHA8Bf7XP5WbmvKClZlSQ4qHkvIdzzSnfuiJHm2T/GbZdM7huGx
         8lOY+MOzLpfeSg1ow5+t9ddJ81+L0Sf9xiU/KgIjyqB6uHZJYOxag4pgTEBeTD2xFBvb
         lsinc7FGSTcqGQkzwKz8XrzMjPe3Ml8fWesCxen5+OHm1y4rTiiiI8Rf/IoPjP2wGnsP
         ke4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767544859; x=1768149659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ValU0jfB+Ih7l4plfULIl8u7AO5mD9dRY4CULizC5OM=;
        b=GFp6t+jv4zGw+hl4npPi+20ajU+i3yabXbB6uObuoaKBtFjIYdnkNRIwtAOz0A6RuY
         +im+iLkyr61NSyc/KtFb19R3klICmswCMtuJW19GMHJ6xAuINJb13NQSfYnsaof7Xqgj
         5ETz3wfgaQn3+D8TADjreqZbRtC+OzkboZCcgdGQS9J2tKgOp851aWduHHIKudpVknwr
         +DIPfiE4CLAKxDHLXecmxhZBesfMsLJxxiGh3d9XoI9kakZZHvnD1MNAhXqBk/nwDbu1
         +eCDIFS2enc317iFLyH44AmaM3Br/xS0DgKWpytgsNLJw+xjEous1dwVnvIVrmH9NqRp
         ShTA==
X-Forwarded-Encrypted: i=1; AJvYcCUXtoEfAMJxFTiQum4+T5QfvIg67rr+1Bt7jWmKQafgXqtI8Y+mWoY8dLJ8SCO3SIs1o/CzGMf0FV17FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKC94PcUzNLD19LAeM5LezXX5L14ZEh37wxYEjnfnp8KL3Zqq
	zZwZEjJcQYjUChY8ftCASPUN5t71LpRU8Yccu7qCPKjHjvgHJ/4ll9+N
X-Gm-Gg: AY/fxX6lSUy0HfsJDOM7pNuKjQSiQvlG8BGo6Jj0wx2XaNBVsr12Ol9JREoHcaCE+9W
	mceUT+L5qquJlKd7zqvu/x86V7aIMK0McM/rhZ3WjoO2MTCk69i9b3Rq6Ft+8hi2GsA11zAnbVT
	UeuWW2XyBFQfoFRyguE1yl+gK+O/TKcFrfPIO/649+Bh/Z4rPb4WPHRkhDNSERqp16Ejk0VNPgF
	QfOKf37D6CN0ySNYyaknNkTex0PvrnRyuQwOwTDd+BEsOESKVxQFla/mdnwdlw8km7C9TOU2A2G
	2spmJ8sTem7m0Gubl0WYwZI0MRiNBpvkeVwBagX5KgskRYobKEdxZLO5VAVY6bfhPmcec/hCmbQ
	Moqs0gVU66/GuIyyXMY+CBBzKaxbY5mWOGDl+nzPQmU/jQsKwfxCi5w4w6m/NmjyUKf5GRv5Ewl
	uHg+hzmeF3PIJMV77rq/fzNQ==
X-Google-Smtp-Source: AGHT+IEgjVWJw7E4o4I8dCUB6c5x0fXBP6717aIN4dFWRLq7pV8GPO8SjyBk3kdeQttASAYwBpBi0g==
X-Received: by 2002:a05:6a20:2450:b0:364:144a:d21c with SMTP id adf61e73a8af0-376a8cbe311mr42600076637.26.1767544858622;
        Sun, 04 Jan 2026 08:40:58 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f45be4a21sm2581375a91.1.2026.01.04.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 08:40:58 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] media: atomisp: replace shadow zoom structs with v4l2_rect and fix error paths
Date: Sun,  4 Jan 2026 22:10:37 +0530
Message-ID: <20260104164037.18176-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses a TODO graduation blocker by removing private zoom
structures (`atomisp_zoom_point` and `atomisp_zoom_region`) in favor of
standard V4L2 types (`v4l2_rect`).

It also improves error propagation for IRQs and XNR configuration, ensuring
that failures are detected and reported. Additionally, it consolidates
memory allocation boilerplate into a safer helper function
(`atomisp_alloc_stat_bufs_list`) that includes a proper error-unwind path
to prevent memory leaks during partial allocation failures.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 144 ++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 147 +++++++++++++-----
 3 files changed, 183 insertions(+), 127 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index fcf116cc4..e86f636d2 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -326,27 +326,14 @@ struct atomisp_resolution {
 	u32 height; /** Height */
 };
 
-/*
- * This specifies the coordinates (x,y)
- */
-struct atomisp_zoom_point {
-	s32 x; /** x coordinate */
-	s32 y; /** y coordinate */
-};
+#include <linux/videodev2.h>
 
-/*
- * This specifies the region
- */
-struct atomisp_zoom_region {
-	struct atomisp_zoom_point
-		origin; /* Starting point coordinates for the region */
-	struct atomisp_resolution resolution; /* Region resolution */
-};
+/* Use v4l2_rect instead of shadow structures */
 
 struct atomisp_dz_config {
 	u32 dx; /** Horizontal zoom factor */
 	u32 dy; /** Vertical zoom factor */
-	struct atomisp_zoom_region zoom_region; /** region for zoom */
+	struct v4l2_rect zoom_region; /** region for zoom */
 };
 
 struct atomisp_parm {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 327836372..76a65f379 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +927,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1199,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
@@ -1764,15 +1765,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
 
@@ -1783,18 +1782,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
@@ -1821,62 +1820,67 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 				   - asd->sensor_array_res.width
 				   * out_res.height / out_res.width;
 			h_offset = h_offset / 2;
-			if (dz_config->zoom_region.origin.y < h_offset)
-				dz_config->zoom_region.origin.y = 0;
+			if (dz_config->zoom_region.top < h_offset)
+				dz_config->zoom_region.top = 0;
 			else
-				dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y - h_offset;
+				dz_config->zoom_region.top = dz_config->zoom_region.top - h_offset;
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
 
@@ -1901,10 +1905,10 @@ static bool atomisp_check_zoom_region(
 
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
@@ -1912,10 +1916,10 @@ static bool atomisp_check_zoom_region(
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
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 5c0a1d92b..bb277f5a3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -678,13 +678,104 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt_cap(file, fh, f);
 }
 
+static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
+					u16 stream_id,
+					struct list_head *head,
+					int count,
+					int type)
+{
+	struct atomisp_s3a_buf *s3a_buf;
+	struct atomisp_dis_buf *dis_buf;
+	struct atomisp_metadata_buf *md_buf;
+	int ret;
+
+	while (count--) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
+			if (!s3a_buf)
+				goto error;
+
+			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
+								s3a_buf, NULL,
+								NULL);
+			if (ret) {
+				kfree(s3a_buf);
+				goto error;
+			}
+			list_add_tail(&s3a_buf->list, head);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
+			if (!dis_buf)
+				goto error;
+
+			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
+								NULL, dis_buf,
+								NULL);
+			if (ret) {
+				kfree(dis_buf);
+				goto error;
+			}
+			list_add_tail(&dis_buf->list, head);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
+			if (!md_buf)
+				goto error;
+
+			ret = atomisp_css_allocate_stat_buffers(asd, stream_id,
+								NULL, NULL,
+								md_buf);
+			if (ret) {
+				kfree(md_buf);
+				goto error;
+			}
+			list_add_tail(&md_buf->list, head);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+
+error:
+	while (!list_empty(head)) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = list_entry(head->next,
+					     struct atomisp_s3a_buf, list);
+			atomisp_css_free_3a_buffer(s3a_buf);
+			list_del(&s3a_buf->list);
+			kfree(s3a_buf);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = list_entry(head->next,
+					     struct atomisp_dis_buf, list);
+			atomisp_css_free_dis_buffer(dis_buf);
+			list_del(&dis_buf->list);
+			kfree(dis_buf);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = list_entry(head->next,
+					    struct atomisp_metadata_buf, list);
+			atomisp_css_free_metadata_buffer(md_buf);
+			list_del(&md_buf->list);
+			kfree(md_buf);
+			break;
+		}
+	}
+	return -ENOMEM;
+}
+
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				uint16_t stream_id)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf;
-	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf;
-	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
+	struct atomisp_dis_buf *dis_buf, *_dis_buf;
+	struct atomisp_s3a_buf *s3a_buf, *_s3a_buf;
+	struct atomisp_metadata_buf *md_buf, *_md_buf;
 	int count;
 	struct ia_css_dvs_grid_info *dvs_grid_info =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
@@ -695,37 +786,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		count = ATOMISP_CSS_Q_DEPTH +
 			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
 		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
-		while (count--) {
-			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
-			if (!s3a_buf)
-				goto error;
-
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, s3a_buf, NULL, NULL)) {
-				kfree(s3a_buf);
-				goto error;
-			}
-
-			list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->s3a_stats, count,
+						 IA_CSS_BUFFER_TYPE_3A_STATISTICS))
+			goto error;
 	}
 
 	if (list_empty(&asd->dis_stats) && dvs_grid_info &&
 	    dvs_grid_info->enable) {
 		count = ATOMISP_CSS_Q_DEPTH + 1;
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
-		while (count--) {
-			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
-			if (!dis_buf)
-				goto error;
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, NULL, dis_buf, NULL)) {
-				kfree(dis_buf);
-				goto error;
-			}
-
-			list_add_tail(&dis_buf->list, &asd->dis_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->dis_stats, count,
+						 IA_CSS_BUFFER_TYPE_DIS_STATISTICS))
+			goto error;
 	}
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
@@ -736,19 +810,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				ATOMISP_METADATA_QUEUE_DEPTH_FOR_HAL;
 			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
 				count, i);
-			while (count--) {
-				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
-						 GFP_KERNEL);
-				if (!md_buf)
-					goto error;
-
-				if (atomisp_css_allocate_stat_buffers(
-					asd, stream_id, NULL, NULL, md_buf)) {
-					kfree(md_buf);
-					goto error;
-				}
-				list_add_tail(&md_buf->list, &asd->metadata[i]);
-			}
+			if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+							 &asd->metadata[i], count,
+							 IA_CSS_BUFFER_TYPE_METADATA))
+				goto error;
 		}
 	}
 	return 0;
-- 
2.43.0


