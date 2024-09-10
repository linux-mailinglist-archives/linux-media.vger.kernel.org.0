Return-Path: <linux-media+bounces-18128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DBB974153
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B654C1C25326
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375981AB53F;
	Tue, 10 Sep 2024 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVwzqveA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC6D1AB502;
	Tue, 10 Sep 2024 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990873; cv=none; b=TCuMvR9vWF0coYmfArUb59LJoqrgMP6XJlgZs/laMN4+N9VVCRa5wlxWY7ubTyYgM7eiK1rD/Iyttl4ni3DqxezrigDgZ/9kEO291sEgt6c+HekBpPh1plgKAvPJUXJiAXqd1DSXp/L322dug5k4BgMUvMp28hJd3kuXRCBZ0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990873; c=relaxed/simple;
	bh=ECKbYASNIC0ZAqt/EshKY0e3wAJyaGWoWbbT4UY/AI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ivK8ZN8fizqT4vjfpbPxIc9sqZUlR/8P9Pu+fk46UEtNP/lKdgxs62H+jrr+VigpE6ZgiIrvJ0lybfFqtb4GsKKjZYheXp+8oGz47V4Hfp80MgJdciRuH8Db6+h22wNtzqq2XbxOXjBBE+fKS9BK2GcxEz9SfU2dN2JMt+YubjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVwzqveA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428e1915e18so49992545e9.1;
        Tue, 10 Sep 2024 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990870; x=1726595670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Msje048Z+e5hW9A6nOJl8RR5mB2zk5tG570BFows/LY=;
        b=FVwzqveAbNAjXfB1FxJI/N13hnXNhL+NiPjHw475sorswY8p0/spnpZrFeY5Eqye+J
         Km7lj76Rm7I04iEAe4aZadbukxPRUitR1BykvBJyjBuz0B+K44ctxWUeSd/TVLbwGIZc
         H6fN6X0yHCurr2O0uHIJzciH7byIC9WIm4vnRMaI884SLHDs8+pexb5xWzqGsZjguyXm
         G0UC4EHueWRXMKsnzh8KKJ99kxnVQPt5UgNHQBssh7KVGlKbawLw5qyAIpuUPnhleSPQ
         /OlDQsoZIu89WJrS+UQhltPAELx/uzynrvChGgrRiQt8r9Q4LcI411ME+Bv48h9OlNHB
         CWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990870; x=1726595670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Msje048Z+e5hW9A6nOJl8RR5mB2zk5tG570BFows/LY=;
        b=WAAWbXccPAO7Jzf4h0bujnsEAz+XAv268dadOuu85XYLhD+mwCaZilzqQJzRCULHit
         3srKPpHEkHx6sin4W22QlDAMwlIcjcZHFZwDERdG0sUTj1kV1RDitjvMOTL1YROguVPL
         N0323bL804FLE0yvbxD8fya6IHLPAlZiR1WEgwO19QCIizJWICO7UToDYReYJSdh/i7B
         HlC1M0BOe1sJwj6ZGvPZ3Tx4zoMAhGXRVmmkz56SXYyzSvwPAD1PfvsThqRhXl7JXQKh
         uk9GRG2Tc2RLLVWO9FfzRCouOQ31J1fYnw4Tk4jzaqj7DdwRy2Wq3nGze5ppKuJ5EydA
         xR8w==
X-Forwarded-Encrypted: i=1; AJvYcCWr13vGQdM3T6VV6i3mzVuYznJOSuSl4/3H9zQg4w5LpacJLl3pdjAJnzYyR0gKc5MObIawty9fq6ZD9MA=@vger.kernel.org, AJvYcCX6B1mZR54DAbIpt1IcKdEgC7hzOko5TD+S/MszGMO5eUt4HDZw/ftkDh1zozpunJZAuLsy9VAfUDujj34bbop8fSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1T4xnpTp/d7jfWA7A0K5WoKo/sRzxFbIBdreX19uKAaiWgUq
	I5Dl6VesojLovcd+UqGtolTMAexmoIWrmdvgsi1NLArNmZvccm5JX4bIvw==
X-Google-Smtp-Source: AGHT+IGgSaRZU+W2fP4Cg9IX+mu5pLOo9YTvMr46JPHadZJn3BBxiuVfkRgNsQRx26i2SXOdsuqsNA==
X-Received: by 2002:a5d:558f:0:b0:36b:bb84:33e2 with SMTP id ffacd0b85a97d-378896a3fb0mr10127547f8f.37.1725990869968;
        Tue, 10 Sep 2024 10:54:29 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 10/16] media: platform: rzg2l-cru: Simplify handling of supported formats
Date: Tue, 10 Sep 2024 18:53:51 +0100
Message-Id: <20240910175357.229075-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
  `rzg2l_cru_ip_pix_fmt_to_bpp()`, and
  `rzg2l_cru_ip_index_to_pix_fmt()` to streamline format lookups.
- Refactored the `rzg2l_cru_csi2_setup` and format alignment functions
  to utilize the new helpers.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    | 20 +++++-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 35 +++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 71 +++++++------------
 3 files changed, 72 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 4fe24bdde5b2..24097df14881 100644
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
+u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);
+int rzg2l_cru_ip_index_to_pix_fmt(u32 index);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index cc297e137f3e..2d3b985b7b0d 100644
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
 
+u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
+		if (rzg2l_cru_ip_formats[i].format == format)
+			return rzg2l_cru_ip_formats[i].bpp;
+
+	return 0;
+}
+
+int rzg2l_cru_ip_index_to_pix_fmt(u32 index)
+{
+	if (index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
+		return -EINVAL;
+
+	return rzg2l_cru_ip_formats[index].format;
+}
+
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_subdev_state *state;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index de88c0fab961..014c0ff2721b 100644
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
 
@@ -328,17 +317,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
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
+	if (!cru_ip_fmt)
+		return -EINVAL;
+
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
@@ -347,7 +342,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	}
 
 	/* If input and output use same colorspace, do bypass mode */
-	if (output_is_yuv == input_is_yuv)
+	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))
 		rzg2l_cru_write(cru, ICnMC,
 				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
 	else
@@ -810,35 +805,16 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
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
+	u8 bpp;
 
-	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
+	bpp = rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat);
 
-	if (WARN_ON(!fmt))
-		return -EINVAL;
+	if (WARN_ON(!bpp))
+		return 0;
 
-	return pix->width * fmt->bpp[0];
+	return pix->width * bpp;
 }
 
 static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
@@ -849,7 +825,7 @@ static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
-	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
+	if (!rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat))
 		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
 
 	switch (pix->field) {
@@ -941,10 +917,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
 static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
+	int ret;
+
+	ret = rzg2l_cru_ip_index_to_pix_fmt(f->index);
+	if (ret < 0)
 		return -EINVAL;
 
-	f->pixelformat = rzg2l_cru_formats[f->index].format;
+	f->pixelformat = ret;
 
 	return 0;
 }
-- 
2.34.1


