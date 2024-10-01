Return-Path: <linux-media+bounces-18939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FDE98BF3F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EAFCB255FB
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6CB1C9ECF;
	Tue,  1 Oct 2024 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJt+pIVI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F31C9DDA;
	Tue,  1 Oct 2024 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791792; cv=none; b=hbohQ20qXvnbSfIEcEgxfkxsXnWZgksfDxFfg9if0fZLv9pnmiX/siA8+GgjXP9GYQjtSaUm6TGmShIsbvl3ddRL2VUAp2wRlmWUJXSfNErfubVwaM3ifpwic92T2c+OkeNP+IJT2JkD4qnhH8DxePybbE+Zq2VBVk/GKNzRHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791792; c=relaxed/simple;
	bh=FDCqAhigboXh+lvBCMW8Lr8WpJWigvwF/AQc5NA+uFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiame4Y3q4NoDjAsVFUmhyj6a4IaiIx03yfilyH7WqtAPOSfZxBG+6N2EmIgccVjRo/bTusC/kpWg4O8qs28xIX3UT7QclSKcTe8epSa2PoYZMotg7ZtRPwt2PkUBtjWw2LM2au3uaspJv7VAoI+vaUxytIjR7LQWbfWQZ5m+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJt+pIVI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so967729566b.1;
        Tue, 01 Oct 2024 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791789; x=1728396589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTbLXk38akqgbpAuRjhASLHWWMVER3Vvkn5beqqlMhc=;
        b=jJt+pIVIqsY9ZeQoTvGmAxlD42fbCnAj1VYuhxbxKt4257HDadjDn7IxC/RmVgeIfi
         9LoL2pbYkGllEvo4mA5OXTCMbBsDiVD+vffPKMPgJ+QMG5gOP5SYvsSTzy3C39WgoyNd
         Gxu6zgom7YpO92w86h80/mbAypgCXD5zj/0hbjZiX1HREHfmGR2C7M5YPxdNus6AY6/L
         vJrHxVVoZPcfZQRQY0q0ZdE0yew4Ou1O9qKXJfhwwFKFMWTx05yIaH34YSl0tDHh7i07
         PMfwOwluZQC1Xog/qOkrQZ8dLqpVtPtxsLkjiDZ5A8lTu/b1JdwodkdPvZ5rNoyoRHQB
         axcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791789; x=1728396589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTbLXk38akqgbpAuRjhASLHWWMVER3Vvkn5beqqlMhc=;
        b=gGKeqJK2H1vMYrQ/H853HBsxfcf42Li/YE5H3JrYCmBavrnkeDMrAa+KiX0mdOcuAD
         qZcl9EspYfjH6gMrUmJOHzKA1OvVVMeWGd5S4/6akng8w3vJ+cOVUynPBo3A99OL+X7T
         w/qhv0tIdpqk9w4Pv0mLfHRdlEr4fxHoyd2kHwUv25+AxXf8wGtrvLoeA3Z+J4axnGiy
         7l/PhvwHF93mBJOlGBgyTZOqbr4hK2AxXKeO6+qFichMlMCP+ybph/r0kgEJHG+L5aE3
         +CvyWA9VOUOMRg3bUm4yc8ASK+dDVpULllx0rsdoWAaXEiBF7f4lFQYB4lZ+sGye9d3r
         9Ndw==
X-Forwarded-Encrypted: i=1; AJvYcCUqW0gjFypY3HJJObWhCyaF3cw/8U/e4MWEEmwMpia87lyhap1DzqCmSBPuhalBfm8PaC6X2gxFabFGW0vIbfmsuBQ=@vger.kernel.org, AJvYcCWnzA+9HSex/RblVeTKfEda2cObZDmgdMBReFtG8BgQfIvPJ0olvz0tnNwO5ZouYGOCaweonNLiyDzvJ8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzh4s6dEhqRDaO7LmUyoexHyA5pZu+IQ+UbG1NnkfPbsOLlp2K
	dQAIxjNMQXYhiTMAIGHAO6UpxV289RuK9Pkg942IRQHevzi5RwwC5MywkQ==
X-Google-Smtp-Source: AGHT+IGDHW0f25ZYiuUxImZ4VW1qBbJsVC3zLnNMPmL4QuBV/JQVZjA2Nqz9tMPrd1mId7Y1bf5byQ==
X-Received: by 2002:a17:907:6d15:b0:a91:158c:8057 with SMTP id a640c23a62f3a-a93c4aeb8bbmr1728682466b.54.1727791788840;
        Tue, 01 Oct 2024 07:09:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:48 -0700 (PDT)
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
Subject: [PATCH v3 10/17] media: rzg2l-cru: Simplify handling of supported formats
Date: Tue,  1 Oct 2024 15:09:12 +0100
Message-ID: <20241001140919.206139-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- Updated subject line and commit message
- Implemented rzg2l_cru_ip_format_to_fmt() and rzg2l_cru_ip_index_to_fmt()
- Dropped checking fmt in rzg2l_cru_initialize_image_conv()

v1->v2
- New patch
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 35 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 67 ++++++-------------
 3 files changed, 68 insertions(+), 54 deletions(-)

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
index 7b006a0bfaae..12aac9d6cb4b 100644
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
 
@@ -27,6 +31,25 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
 	return NULL;
 }
 
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
+		if (rzg2l_cru_ip_formats[i].format == format)
+			return &rzg2l_cru_ip_formats[i];
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


