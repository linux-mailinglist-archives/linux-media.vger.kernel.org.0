Return-Path: <linux-media+bounces-19884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2109A4013
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B08B283B50
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB4320721D;
	Fri, 18 Oct 2024 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pyl+kNbV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1882205AC2;
	Fri, 18 Oct 2024 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258527; cv=none; b=c8o4xgXV7DIWvDfqA9MmUF1lo9p/sa8VyFXkWhyWMm2w90hzsS+dFjimntL6NA/pXf0ysfwzoWXYsHwdkgKeghCcRgccRcr0hKe5Ef601JCDp1+aCYcw4cY2WpTbQILXDT5kSXPTN7eWvHtnqPMzbflAm3VYZVySnx8ES1N03Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258527; c=relaxed/simple;
	bh=9EyKVQGfxkM4TUjIMOXbEc+giGmM+qPAFclUfRsiLC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8ghcmWsLrZ/pLGj6jgxEvJpNcMZVw0RTY0TeN1gtqiBZoqvHUnk6sbqH81OfDfaNYVSyKj9DzodszcKpKw9Om4Ax/vFnfaQvSZ41MLCx78pWQtmD1dXVl8IjMKBB7JapyrK8Etbbg88CKd4RcdlEGezGD8pVfOiKOydLwJQgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pyl+kNbV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43159c9f617so17787245e9.2;
        Fri, 18 Oct 2024 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258524; x=1729863324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXXSJSHNhlnPKdDxv7AsqXdKQPS/9DW+EDxhQqaRwPg=;
        b=Pyl+kNbVqS35tU/epIGhHs8NfkeVe5BFdJEya3Mp060ZGtdiDwBU0LBfYqXOBgI5Tq
         Lyy9ybJvTbbmrz3XDe4f1lf6ZkNiP5IHfKKhpPXlloub5y48DHJ85L3YHh0goRlHd6dQ
         xlvqBUyWgBswqEuihIo1trm2qEFgFcq6AHHSJbPhrHrLFtV/345FOYEm6O3d5VldJfxh
         YoUijqV/OSArcRU1AVNMCGnDjPrik7P4YuCCZkoT0hztDq8NdVkCRvIReiw55Y4rI0Xq
         yWy098oPRTntaW6JbjPCTq9nxYpmI5zTq6Y9OFOH6fGGebTN2HPTKJf9BjNx6xV/b6Em
         ZDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258524; x=1729863324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXXSJSHNhlnPKdDxv7AsqXdKQPS/9DW+EDxhQqaRwPg=;
        b=GnzLXEiItX8VVWa3UEvfgwvYEFcOrSYjzU9k/bRr52SXYyqW737RxcYBdi0cMd7bLY
         5sMj6JMAhi42Mar8Sqo1wzi87pAlhVjLqREpbFj9UiR/7N8MW0Eu6xQYnI57CkuXa/JZ
         n9mO56oGG1Yl0ASK9pYuZ7uVvVpowLUFKYF71Im+VW9ywvC0v0R8cLKb8GiAIeAHb+kO
         I0T0Kbm6i2ivuWkv5Z+yzqONI2G0ySHnstlezQD9tEFZzEqjKAazXTMmAAlLmm+JqJaF
         MavnH70W3i4ZigiEZBVjlXfdfh/lFzwq7v2cFFpNAzEKvBpe+q5+EgydiKKhto4cXLvU
         ThVg==
X-Forwarded-Encrypted: i=1; AJvYcCUyr/7PrCOt1Kwn8pDjAbPfqFFWmHT2X4zyJOyHjaio1S0MCXPM/OgCfOVgQLHzRjObpVL+Mhi9r6FpoAU2q4Mc6/w=@vger.kernel.org, AJvYcCXHJUj0/d6Y6kHyD3Qp51ZlC+odmT0m7lHuaZjKdsFBvm9jVPJoA2Hza+8JtaAyoH3s+CoRKCdOn0YaUIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxquRrxEl8c8XtQWli5y2zIJrFrpmAeCW6PnsWPBPQS70Fmgul
	Fnmv8rVRZUXVtu4YILTcJBg+JBduTKnBXZcN5bOdr1E2GD7gooTc
X-Google-Smtp-Source: AGHT+IHJMxHpFEdcW9IKa5n+g65KS3gTMOwo8H4sVtrnj8ptd1W1tUyE2m1L4gaxXDxe8EqhOXAwng==
X-Received: by 2002:a05:600c:1e04:b0:42f:4f6:f8f3 with SMTP id 5b1f17b1804b1-4316162297emr17617955e9.7.1729258523801;
        Fri, 18 Oct 2024 06:35:23 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:23 -0700 (PDT)
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
Subject: [PATCH v6 23/23] media: renesas: rzg2l-cru: Add 'yuv' flag to IP format structure
Date: Fri, 18 Oct 2024 14:34:46 +0100
Message-ID: <20241018133446.223516-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a 'yuv' flag to the `rzg2l_cru_ip_format` structure to indicate
whether a given format is YUV-based and update the `rzg2l_cru_ip_formats`
array with this flag appropriately. This change enables a more efficient
way to check if the input and output formats use the same colorspace.

With this change, we can eliminate the use of `v4l2_format_info()` in
`rzg2l_cru_initialize_image_conv()` as the necessary details for the source
and destination formats are already available through the `yuv` flag.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 ++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 5 +++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 +-----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index a83e78d9b0be..8b898ce05b84 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -69,6 +69,7 @@ struct rzg2l_cru_ip {
  * @format: 4CC format identifier (V4L2_PIX_FMT_*)
  * @icndmr: ICnDMR register value
  * @bpp: bytes per pixel
+ * @yuv: Flag to indicate whether the format is YUV-based.
  */
 struct rzg2l_cru_ip_format {
 	u32 code;
@@ -76,6 +77,7 @@ struct rzg2l_cru_ip_format {
 	u32 format;
 	u32 icndmr;
 	u8 bpp;
+	bool yuv;
 };
 
 /**
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index d935d981f9d3..76a2b451f1da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -18,6 +18,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.format = V4L2_PIX_FMT_UYVY,
 		.bpp = 2,
 		.icndmr = ICnDMR_YCMODE_UYVY,
+		.yuv = true,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -25,6 +26,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.bpp = 1,
 		.icndmr = 0,
+		.yuv = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
@@ -32,6 +34,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.bpp = 1,
 		.icndmr = 0,
+		.yuv = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
@@ -39,6 +42,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.bpp = 1,
 		.icndmr = 0,
+		.yuv = false,
 	},
 	{
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
@@ -46,6 +50,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.datatype = MIPI_CSI2_DT_RAW8,
 		.bpp = 1,
 		.icndmr = 0,
+		.yuv = false,
 	},
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a4dc3689599c..e980afc32504 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -210,7 +210,6 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
-	const struct v4l2_format_info *src_finfo, *dst_finfo;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -225,11 +224,8 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 		return -EINVAL;
 	}
 
-	src_finfo = v4l2_format_info(cru_ip_fmt->format);
-	dst_finfo = v4l2_format_info(cru->format.pixelformat);
-
 	/* If input and output use same colorspace, do bypass mode */
-	if (v4l2_is_format_yuv(src_finfo) == v4l2_is_format_yuv(dst_finfo))
+	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
 		rzg2l_cru_write(cru, ICnMC,
 				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
 	else
-- 
2.43.0


