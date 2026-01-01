Return-Path: <linux-media+bounces-49826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EA9CED2D2
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 17:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D36263007FD4
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 16:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EF72EDD78;
	Thu,  1 Jan 2026 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jH14ez4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3551C84AB
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767285688; cv=none; b=SdqtYA3df8G26YR+XCvvJcp/rby4v/paFS3SUg5PJXxW1xUo9ltHg3u0xsEeuEXpuBF7RuhcDV0IEGbjcLkbpq1xXFU1zJ24A/6N0CNrqRCBmJG1xR7pCDD7wPoe2r2/kCD77d9wTStIzdm2J0oxJ4rMZGmznF/fDgasU4vgOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767285688; c=relaxed/simple;
	bh=NQEfzUm8CoXDEDaIg+I/sw4HQyVJ5kOYQMNLSWHizCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgTMKjjsnx1clMuEEZBmBUo5Eo7vw6w7QMdYWMxNGifSEARvWfXqYYhHYJ4ODWlS1KTh/WrWrNsIGzUwvOa4nD4fVg0Sm4B5pO2w+YA/gRhnay5y+8N0gISMIdHwXXJt4yT+OtqnNyPO0BQaXLemoUr493OjiwWOTTK4FDKv/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jH14ez4C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so35372745e9.3
        for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767285685; x=1767890485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFn5mZZ1GFrLX+zltD0NdQ5QIlUaqG+YHTjhL+HRPtI=;
        b=jH14ez4CGYlAuJPeerdc2xSYo+P9DWkt9sHPTEDCvB+Zb60pl1NWdCEUCU3m/RmdqH
         8OMpzYLBJ49xGovlqMuy0Pt0n1jFxMfw+GGArMHOEaEbNvZ6+4lc3x2b69rgm0Q7s495
         o0WBGayAFwBuwmnhvr9R8PaoOoOWiTgbvuycG29OzTA6Ce6H7IGu0AGOlzG7QvTlttVh
         uKiEDk94/pVsg4MHd9QqQbzELwORK/Wjq9Fk9jvsBwas2OePNv8a3hF7uZ5UX1SQoZvE
         AsPQpIw1Re7CpKQ8fEE8OCupYL20eYyhtGtrzY6/vFUP181oXSwRU8i8PvoHsVY48wnE
         0viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767285685; x=1767890485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFn5mZZ1GFrLX+zltD0NdQ5QIlUaqG+YHTjhL+HRPtI=;
        b=Oipk4KGksxDVJrbVJsKLp3D9Uhg+tvKTAdgIgx6l6duFl8rZg2SXkvTp76zUUGV5Dv
         FP029KpkUS0cvosUW8H98C8d1JKJ4arNDFFvs7rdexyWBfVXwwcyWCQV2tuR5CcaqyCK
         pDC3Pc0EcaTaUSk/xjECBhZyq4EPnKdAgOBNqqFPk8A1egEaptvgbJhWI/amtOAPDd2A
         bk/DWwJIpx6Bc2dfpiWIHN4ZaGLOdYajKSAw1yQtJoOqcS65ICDrxS63pazxuoy5Z0sJ
         1Ny8cTLMzrNRdrtDagYnJXGpJZshsIV4BJIFz+S3R1F3rX5wug9HxZI9rFIMe78/treC
         vi+A==
X-Forwarded-Encrypted: i=1; AJvYcCX4wjTEcTY031CnXeuOvd99BW90X6Lenqsr6NTPh7LdZc1ZoSxmmjAZJmLYpTbkBJWUAwiiMehxWR/o+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvI9nF7v5mPRWzUKlhuPWNmnYIHaVeNp8WZqb1QhK3u+Y8Wv7
	wmwh+MnDCf0Zlyeo9p/3P5c9hxm+ExZ6SdVKvTluONVbgRXneFsOqMKJ
X-Gm-Gg: AY/fxX6Jr2t+b50U04V+pYH4glLjBAvWi/BjtqZk/VG1rh83OHObO4CSPOzPu1sX7xf
	h5oB9vYakG7bkSdONj5SmfNkwln1uBQpC+zv7TUQcvbfpkI18di4YXa+aFclPPdwSng+5Flxc2G
	mQLZy99A2lPoSoqZ9CmUgIwrkl12Z8BkP65hv7ecQWKWTmnDQumKFKpIO1n+EQr8LjdXAtSZFq9
	Qj92euxmgwRQx1Is+iIFUC67VQpuxmskZWUBXvqoiCB3UCxEfrhf+j9rGJ01T16lMMAP1uGOqtP
	Yp6GpHtjHWBVh2cBTYM2TbTHCkN5IX8uMMaMzUUteb1H0QfYsjDoDVEqc3iznaIldHkPDcRSVRg
	WhvUcDpFWpUlQWBo0SqNxr3UGt5dmTkfDCBw4MIqEjm+WDHOzIEc4Yc17HKWaewnOQ6ZAK01ecf
	YJZjvOZ9MZ5KAgRySK42gJw9Pa
X-Google-Smtp-Source: AGHT+IFvVQu4Gd5ZRQSV1t2Koilx6EPmTM0D/s54QwT1w/8bMlds5wzVPAa25EjjdjImABNxaa+7tg==
X-Received: by 2002:a05:600c:4fd4:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47d1955b744mr452339575e9.6.1767285684569;
        Thu, 01 Jan 2026 08:41:24 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm80995853f8f.0.2026.01.01.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 08:41:24 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] media: atomisp: Fix block comment coding style in sh_css_param_shading.c
Date: Thu,  1 Jan 2026 21:41:17 +0500
Message-ID: <20260101164117.14292-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings in sh_css_param_shading.c regarding block
comment formatting.

The warning was:
- Block comments use a trailing */ on a separate line

This change also moves text from the first line of block comments to
subsequent lines to adhere to the standard Linux kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../media/atomisp/pci/sh_css_param_shading.c   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 513e272f2fdc..b5e9d11b28a6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -20,7 +20,8 @@
 
 #include "platform_support.h"
 
-/* Bilinear interpolation on shading tables:
+/*
+ * Bilinear interpolation on shading tables:
  * For each target point T, we calculate the 4 surrounding source points:
  * ul (upper left), ur (upper right), ll (lower left) and lr (lower right).
  * We then calculate the distances from the T to the source points: x0, x1,
@@ -116,8 +117,10 @@ crop_and_interpolate(unsigned int cropped_width,
 		 */
 		ty = out_start_row + i * out_cell_size;
 
-		/* calculate closest source points in shading table and
-		   make sure they fall within the table */
+		/*
+		 * calculate closest source points in shading table and
+		 * make sure they fall within the table
+		 */
 		src_y0 = ty / (int)in_cell_size;
 		if (in_cell_size < out_cell_size)
 			src_y1 = (ty + out_cell_size) / in_cell_size;
@@ -173,7 +176,8 @@ crop_and_interpolate(unsigned int cropped_width,
 			dx0 = tx - sx0;
 			dx1 = sx1 - tx;
 			divx = sx1 - sx0;
-			/* if we're at the edge, we just use the closest
+			/*
+			 * if we're at the edge, we just use the closest
 			 * point still in the grid. We make up for the divider
 			 * in this case by setting the distance to
 			 * out_cell_size, since it's actually 0.
@@ -291,8 +295,10 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 	input_width  = min(input_width,  in_table->sensor_width);
 	input_height = min(input_height, in_table->sensor_height);
 
-	/* This prepare_shading_table() function is called only in legacy API (not in new API).
-	   Then, the legacy shading table width and height should be used. */
+	/*
+	 * This prepare_shading_table() function is called only in legacy API (not in new API).
+	 * Then, the legacy shading table width and height should be used.
+	 */
 	table_width  = binary->sctbl_width_per_color;
 	table_height = binary->sctbl_height;
 
-- 
2.47.3


