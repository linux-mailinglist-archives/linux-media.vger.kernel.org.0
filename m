Return-Path: <linux-media+bounces-19461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA6099AA3D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 433771F27EE8
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8041D12FB;
	Fri, 11 Oct 2024 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezkrT62H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9E1D0E32;
	Fri, 11 Oct 2024 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667878; cv=none; b=rprTVZ1HVyw1BXytP0y7SbpBf0NUE16Gh4LryPC2tizQC/3DJuyIuimoALUZhVDtAs5dOr54dY3usF/vQHXmmbvJvXF9Ge6ukm4Ex91HA373Z/obNA9MErVpFG16ALiSSYk+/lLhP7rTAppPsBpiqbhW/5+zkkCG46uDKu+Rd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667878; c=relaxed/simple;
	bh=KTwHxJPGGmnTDDeEdfmp2pRlvoDQDpveiol86Up99rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qi05PgFgIvpi1ykILlZGxCJwebtCxL9jIEx4U4K33xb+MrvSViyNoi4iugegaYGYFtAK4/wV/VRCNRxrg56nTlcqb3S2DDhT3VCu9Wi/vAY2+T0ualQWeE9ZMyiezlINZLpYMqT6Jz6yu2HxM2Kf6OwbbLNd5ox4ysTWKJ2Axik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezkrT62H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4311ac1994dso13741315e9.1;
        Fri, 11 Oct 2024 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667874; x=1729272674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wY1XP8VNcmtboxIDcKmmWO6r1IAbBAFqyuHXxooTX1s=;
        b=ezkrT62H2UGCBT6WTc2QlNoD00wUrPTZluamLjRzSOVIBzvbfGSyxyu33heNX/nUxc
         VJLnfooGcQYSegtXhX7CIp1JsR5bRFPRoPEbNJeJVMj+XwSQ4q+cs0YeGFLzqykLkGK/
         p/B5AIccgWmgJDx8DH7oQQMuaeW93R6Pz+4H1pzvihnwfq4w9TqMrPZsqq2jo3ifUx73
         Pn5SSGRziIpbhk5AW5WTt6EKtR3OR0HmRbbJXNRHDbzZIsxsr2ujbRvdGl+Uqum7lbqF
         u/P+VxuHBgfWHmttuqH+umrCGIusj25YCr0xORBjnyMmE2Gnu1UIML46gjunJxyWpB+R
         XyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667874; x=1729272674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wY1XP8VNcmtboxIDcKmmWO6r1IAbBAFqyuHXxooTX1s=;
        b=Ouzqv3WMs/ZAr1ftlCVxxD6+EOzPOhENbwQQZqZghCutnBvijHooGN/EGzEq9Wotsi
         1Tfv7NZFrzm/2dKN5nfsoh/Ka8kCszOKAYMCxf2FkbxqtCgnM/YSlXdkQqVbIt4EPyAJ
         EqfNbVZyF8CV6e42KShOzeu+xiyBoeXe97lEmThjJ+5PWFANQU6njPeeLOXKZNwo8FDs
         IgJt/UN6JbGVph1oDQZirZY5aF3qAg33YMpaAE8W1BPo2LYVa53jyK2g6usAD+WubINO
         fFyO9tYtPw+fQxlPvF0z8EjUPmtaA6ysbhuTH1Q7dmu2aFImNo4LprWLNhrXqqEGKIc4
         7POg==
X-Forwarded-Encrypted: i=1; AJvYcCX+K63XBydhbU9Vk6r5PZ5Bqz5D7z4yzbgmUWhaOhZTNUJeRR/6RTlucyhR9P2RTVvo8qaZZ6vhvjKACqc=@vger.kernel.org, AJvYcCXnZOKXslNtmS+1/CODeFOW54vAfgcG7YdW1jFsGmNYLTIh3Mn9Eh8cv4uImAgQCd1jkb48XbV6HbTXNOcIrMdGRDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/TPLuGICgAGZ3McM/UYgkYWChq2vzfSF74aWnQRpgWeymzl5
	LU2A0uKDRyhcAD9qYcOXUg74dxvQiUuMM5Wg6QuItWmYMs3pTM4v
X-Google-Smtp-Source: AGHT+IHZIUDmlJuISyMwRFfGXogzGdVZAZYFVaboUPmKePD3F2fHpcxSmednmnS2jc53EjJg8QdkTA==
X-Received: by 2002:a5d:63c2:0:b0:37d:52bc:72ed with SMTP id ffacd0b85a97d-37d551c9775mr2361535f8f.14.1728667874316;
        Fri, 11 Oct 2024 10:31:14 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 13/22] media: rzg2l-cru: Simplify handling of supported formats
Date: Fri, 11 Oct 2024 18:30:43 +0100
Message-ID: <20241011173052.1088341-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the handling of supported formats in the RZ/G2L CRU driver by
moving the `rzg2l_cru_ip_format` struct to the common header for reuse
across multiple files and adding `pixelformat` and `bpp` members to it.
This change centralizes format handling, making it easier to manage and
extend.

New helper functions, `rzg2l_cru_ip_format_to_fmt()` and
`rzg2l_cru_ip_index_to_fmt()`, are added to retrieve format information
based on 4CC format and index, respectively. These helpers allow the
removal of the now redundant `rzg2l_cru_format_from_pixel()` function.

The new helpers are used in `rzg2l_cru_format_bytesperline()`,
`rzg2l_cru_format_align()`, and `rzg2l_cru_enum_fmt_vid_cap()`,
streamlining the handling of supported formats and improving code
maintainability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  6 ++++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 22 +++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 33 +++++--------------
 3 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 9b1ba015df3b..327516272e53 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -66,10 +66,14 @@ struct rzg2l_cru_ip {
  * struct rzg2l_cru_ip_format - CRU IP format
  * @code: Media bus code
  * @datatype: MIPI CSI2 data type
+ * @format: 4CC format identifier (V4L2_PIX_FMT_*)
+ * @bpp: bytes per pixel
  */
 struct rzg2l_cru_ip_format {
 	u32 code;
 	u32 datatype;
+	u32 format;
+	u8 bpp;
 };
 
 /**
@@ -161,5 +165,7 @@ void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 8f9683bf31fa..a40b0184b955 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -14,6 +14,8 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
+		.format = V4L2_PIX_FMT_UYVY,
+		.bpp = 2,
 	},
 };
 
@@ -28,6 +30,26 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
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
index 6a4f0455dc9c..a0fa4542ac43 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -812,37 +812,19 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
  * V4L2 stuff
  */
 
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
+	const struct rzg2l_cru_ip_format *fmt;
 
-	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
+	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
 
-	return pix->width * fmt->bpp[0];
+	return pix->width * fmt->bpp;
 }
 
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
-	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
+	if (!rzg2l_cru_ip_format_to_fmt(pix->pixelformat))
 		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
 
 	switch (pix->field) {
@@ -934,10 +916,13 @@ static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
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


