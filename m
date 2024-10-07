Return-Path: <linux-media+bounces-19179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FD19936B3
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B59FB22377
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5571DF25C;
	Mon,  7 Oct 2024 18:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IERbQSUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57D1DEFF2;
	Mon,  7 Oct 2024 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326945; cv=none; b=mNCf3M6Lu6itxmM/CKY4tBRl60RnrmqPaanxaO7xs5ECWMILR18q21qdfCgJyYStDBmUGfwJ37S6io4pZCuR09Tv7IEHU3/YDqzKnYsI00he+XqN3f1axssQhBGUUcurkuE7WYVaQbr74/oUvHFu/+uZ90fxbULvn3vtjn0gQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326945; c=relaxed/simple;
	bh=488+LUtpmZFyb0j7et6+0vpPmSYwAsojtYgsemh5mrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9WDUwgF/urpcZhkiULBQLq2gpM24YeMO+MNFgrGQojc94spduBbK9t0qRrstEKiIV5w1tKb65igGV2/Zjm6ppGto1YPKBQqMf1V4ijkoSRxs/IuUD/ME4Vf1fvOx2l6N0/Gcbj8D1hzlR5t58UYBWNHm18bEnNSsc4WXgegbUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IERbQSUi; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso5407030a12.2;
        Mon, 07 Oct 2024 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326942; x=1728931742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/udlwEixqqFqQfbWVud6W35aJwXwj+rVRaObdZr/hWU=;
        b=IERbQSUiPZ+l3h7OOjucCU6M5NFri08vM7qHdY0GUJJVqNa4QusnK8CcNwmoiy62AP
         nQokL8xCPzerC2vU3ld5GSDTjaR23UUN8u7OwsC91aaMPcYWt9zTWDDA/d+6gs5MdNih
         OCD/tbZLX3mAVyuLny2gNC8vNvHpny9806GUt4w8Kq0ynla8kfZLGNdrEJ/8SmmdKMZ9
         T66vjOv8IpV65nRxRnvvz+WYJFqrQSoHP7l4bk6Y3OfKf6MEsaEHDpxtJC2ENK5nqQOi
         IRyZBV1ymRgDWmJCDsTqCerGnZs+4MAThRCKLqcN9Om5vZHDAzbxMvl9aG8VLK1Fs3Ig
         amRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326942; x=1728931742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/udlwEixqqFqQfbWVud6W35aJwXwj+rVRaObdZr/hWU=;
        b=og1p8tZPBXJ9RemaPJ4ZTAacFelzAAg9nZYYRiEBnCSvloEY9V06Am7cEBixoC7c3J
         DnzwMRxxNDnkHQ6MkVqWAa/JQqnz6YGP/FeGpOh1cy9p8zZSRm6d2VQYCrD3ILHnLHJn
         GA2b+Pd9vrRK4CnLWBgWEdBuSSuTUrrELzQKVlH1gBXjUvO1A10lcsY8lWdjIoErLmt5
         R3YELOLf1uXdENW1sD0+In0lp4frW4yHdP+1zTzqJLdQnhhzmmPNVLzgEXOi+s31PTxH
         qia7Tc4n0tlk8ul6SIJokTf9PQgL+YkeVWEK4Tuq/IRFkmE6NeUdc89qzlIv8ngcLeW9
         BxTg==
X-Forwarded-Encrypted: i=1; AJvYcCVm4bfdOe8ed3MZpkGIDE5mR5iKzBYr3mytnqwNDAJpnjL+cKM7Y6CPIOuDo7mT3N7JByWVmttmTxEoyRdVKSp1dYw=@vger.kernel.org, AJvYcCX30kAW9ANWftLP8InzIjh1Kg2v99EJdkBYn3Udn8k+1e0CaxWeH+tqB53pJF6hErZX3EGugj8T4N3c4k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAbDUG7R5+pOL4aQCQzuAYp5zF6/BTfM8zat4Q83kYec5Cx1K
	QVG0Z//TICIxTHpJcPQ0aPCMxiMpsrzEoq772wnvvPsLqsa6Q7OB
X-Google-Smtp-Source: AGHT+IF11cOjb1tj8XDeaXhFGlkiLXEqRUCRLK2emjWbVg0XG6DJQZy2SpklgkqZ4zUgkwELdkgW1A==
X-Received: by 2002:a17:907:728f:b0:a99:409a:ee6d with SMTP id a640c23a62f3a-a99409af37cmr788413966b.16.1728326941895;
        Mon, 07 Oct 2024 11:49:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 10/17] media: rzg2l-cru: Simplify handling of supported formats
Date: Mon,  7 Oct 2024 19:48:32 +0100
Message-ID: <20241007184839.190519-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the handling of supported formats in the RZ/G2L CRU driver by
moving the `rzg2l_cru_ip_format` struct to the common header to allow
reuse across multiple files and adding pixelformat and bpp members to it.
This change centralizes format handling, making it easier to manage and
extend.

- Moved the `rzg2l_cru_ip_format` struct to `rzg2l-cru.h` for better
  accessibility.
- Added format, datatype and bpp members to `rzg2l_cru_ip_format` struct
- Dropped rzg2l_cru_formats
- Introduced helper functions `rzg2l_cru_ip_code_to_fmt()`,
  `rzg2l_cru_ip_format_to_fmt()`, and
  `rzg2l_cru_ip_index_to_fmt()` to streamline format lookups.
- Refactored the `rzg2l_cru_csi2_setup` and format alignment functions
  to utilize the new helpers.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 36 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 67 ++++++-------------
 3 files changed, 69 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 4fe24bdde5b2..39296a59b3da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -62,6 +62,20 @@ struct rzg2l_cru_ip {
 	struct v4l2_subdev *remote;
 };
 
+/**
+ * struct rzg2l_cru_ip_format - CRU IP format
+ * @code: Media bus code
+ * @format: 4CC format identifier (V4L2_PIX_FMT_*)
+ * @datatype: MIPI CSI2 data type
+ * @bpp: bytes per pixel
+ */
+struct rzg2l_cru_ip_format {
+	u32 code;
+	u32 format;
+	u32 datatype;
+	u8 bpp;
+};
+
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
@@ -144,10 +158,12 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
 irqreturn_t rzg2l_cru_irq(int irq, void *data);
 
-const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
-
 int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 7b006a0bfaae..fde6f4781cfb 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -6,17 +6,21 @@
  */
 
 #include <linux/delay.h>
-#include "rzg2l-cru.h"
 
-struct rzg2l_cru_ip_format {
-	u32 code;
-};
+#include <media/mipi-csi2.h>
+
+#include "rzg2l-cru.h"
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.format = V4L2_PIX_FMT_UYVY,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.bpp = 2,
+	},
 };
 
-static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
 
@@ -27,6 +31,26 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
 	return NULL;
 }
 
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
+		if (rzg2l_cru_ip_formats[i].format == format)
+			return &rzg2l_cru_ip_formats[i];
+	}
+
+	return NULL;
+}
+
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
+{
+	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
+		return NULL;
+
+	return &rzg2l_cru_ip_formats[index];
+}
+
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_subdev_state *state;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index de88c0fab961..ceb9012c9d70 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,21 +300,10 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
-				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
+static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, u8 csi_vc,
+				 u32 csi2_datatype)
 {
-	u32 icnmc;
-
-	switch (ip_sd_fmt->code) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
-		*input_is_yuv = true;
-		break;
-	default:
-		*input_is_yuv = false;
-		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
-		break;
-	}
+	u32 icnmc = ICnMC_INF(csi2_datatype);
 
 	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
 
@@ -328,17 +317,20 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
-	bool output_is_yuv = false;
-	bool input_is_yuv = false;
+	const struct v4l2_format_info *src_finfo, *dst_finfo;
+	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 	u32 icndmr;
 
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
+	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
+	rzg2l_cru_csi2_setup(cru, csi_vc, cru_ip_fmt->datatype);
+
+	src_finfo = v4l2_format_info(cru_ip_fmt->format);
+	dst_finfo = v4l2_format_info(cru->format.pixelformat);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
 	case V4L2_PIX_FMT_UYVY:
 		icndmr = ICnDMR_YCMODE_UYVY;
-		output_is_yuv = true;
 		break;
 	default:
 		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
@@ -347,7 +339,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	}
 
 	/* If input and output use same colorspace, do bypass mode */
-	if (output_is_yuv == input_is_yuv)
+	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))
 		rzg2l_cru_write(cru, ICnMC,
 				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
 	else
@@ -810,35 +802,15 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 /* -----------------------------------------------------------------------------
  * V4L2 stuff
  */
-
-static const struct v4l2_format_info rzg2l_cru_formats[] = {
-	{
-		.format = V4L2_PIX_FMT_UYVY,
-		.bpp[0] = 2,
-	},
-};
-
-const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_formats); i++)
-		if (rzg2l_cru_formats[i].format == format)
-			return rzg2l_cru_formats + i;
-
-	return NULL;
-}
-
 static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
 {
-	const struct v4l2_format_info *fmt;
-
-	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
+	const struct rzg2l_cru_ip_format *fmt;
 
+	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
 	if (WARN_ON(!fmt))
-		return -EINVAL;
+		return 0;
 
-	return pix->width * fmt->bpp[0];
+	return pix->width * fmt->bpp;
 }
 
 static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
@@ -849,7 +821,7 @@ static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
-	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
+	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
 		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
 
 	switch (pix->field) {
@@ -941,10 +913,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
 static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
+	const struct rzg2l_cru_ip_format *fmt;
+
+	fmt = rzg2l_cru_ip_index_to_fmt(f->index);
+	if (!fmt)
 		return -EINVAL;
 
-	f->pixelformat = rzg2l_cru_formats[f->index].format;
+	f->pixelformat = fmt->format;
 
 	return 0;
 }
-- 
2.43.0


