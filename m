Return-Path: <linux-media+bounces-19882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 987479A400D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA961F28B6D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5B4205ADA;
	Fri, 18 Oct 2024 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKfdDsNx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A36205143;
	Fri, 18 Oct 2024 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258525; cv=none; b=dEn6Fwq4H3O19lhbM1HVb3MGlx1Rk7dSx7Nv2CSLxJhSKONgmToIWOjyyrz5HgsWRwlq1GczuCXhWfdaSdspXiA4GwDKp6cxP7FvriY5qeMu3wWQSANPdnzm3JvqMYlDk1W3RxBnfQJW/OAoVbzdI8Et7KSo8I6t3mgJ31bBuSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258525; c=relaxed/simple;
	bh=BPiVuaP7GYbvOOAWHo7KiC1d1w2BNKxjcvojtUwI2BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TX0XtDS1knamozN2VdF3JSdU8i2FFZRNCnYQvv6AScr/eM8jrdEhrFjjpK4Q24qnW4nT6yJ/6SDTmNRVskChwE6qR1gZqAwUSOeLibjMn+XniMyNvRWrFs1phxS11y6DOnqh5W+sUMwfNWt9Oe+FoO1BTxzJHy7qtUp+AON3o0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKfdDsNx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso20168815e9.0;
        Fri, 18 Oct 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258522; x=1729863322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zdVoC1QyRKvNRCTYp7dgVNxaoOkT1LXCY4uVFYfy9s=;
        b=OKfdDsNx+TLYoY/BPrnIHrzL36/xiXZUv7d6Va0fExMvwUGwYNJFohfJx6WuAgt4T4
         nnvBbXA8KsEVZGtFXXk5wwr3HrUhLSzUMDwlb9JJ0OaQ9cO1vGB3KQND950CH1Gi29r0
         dbj+QzP4z3fCy2fpGX2jv7g2wWonMGiT9BAXHU1K3O8kRCn1hFu/sjHWa06wd98Fn4Iw
         p/Kxwezui5n7xGPZvd73+bs11wnQDV56aSLnyXZMh1vWwxTIeHFZnGbbYm4x/CagJmNp
         3w+L9HZBp5FqfCHrqEZhLSqiEWKE1jOFb0WKmZ4pJB9yapJPoobNbApv5ZPFpFxOakS3
         ToZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258522; x=1729863322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zdVoC1QyRKvNRCTYp7dgVNxaoOkT1LXCY4uVFYfy9s=;
        b=RtTSJgHnRkLznYbtM0OuyT/ldHnR35SKu/lAirGlNn+2PbCPmlRwkZD0tq9TtcrWP/
         UGs5JYIH5P/CRR7HlRDNM9uZkJkWnIjNFdFcM/ZJYFq6A2LUQ1o+8LIPYY2AC/+L8N97
         yesBeXhj2MWUXkHC9X95jZVGzoVBbfv+YhgL4OUi68f5uzBh0eYCgvUVw8WEcyG5RRz2
         WEVCsmVA47TuvRh5zIAEUofdkcI/z4Q+omYIGW9nAwHCEWGouKVykvjIEoJ4V/6x8Auy
         pAiJwQgIs8kITCSDchYKDOZlzz1nEZ2C9e1dz1PiEKpyi3BllZdyI8mni6BLx0szi7Bu
         DWew==
X-Forwarded-Encrypted: i=1; AJvYcCX1nSb4ABBvQXzuBWwDG1rqkS+p2fr/xrTER6QDci/93dUznOe0L1aNVVmMy7dvQCZjL/aM8b0xHANBxXg=@vger.kernel.org, AJvYcCX3U8oQII8IDkTkB+mNsopmhJfQbILeQ7PZm8SEk4+G/NlsYCnEDwDehLAUXua5JrgB1pbe5dNWVVWjpFpb9MowCjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDGSlsEzTMq1jlaE3t8Vnc3veVQK2mOUBp9dlfhLMUrqCkeqNA
	q32TqeIxbNrY5kpCHJrb4VlCuHLl1ayyTSYKmxYewp+M4ZuKDbrn
X-Google-Smtp-Source: AGHT+IHDrPpks+NUj0h5ZLD26RD2mVdfRw9BYuMyAuz+3Jr8JrEkw73WoPZcchfq9AQFypZkpGVoag==
X-Received: by 2002:a05:600c:4f42:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-431616a3ac4mr18377475e9.23.1729258521626;
        Fri, 18 Oct 2024 06:35:21 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:21 -0700 (PDT)
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
Subject: [PATCH v6 21/23] media: rzg2l-cru: Add support to capture 8bit raw sRGB
Date: Fri, 18 Oct 2024 14:34:44 +0100
Message-ID: <20241018133446.223516-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support to capture 8bit Bayer formats.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4073452f3a66..881e910dce02 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -188,6 +188,10 @@ struct rzg2l_csi2_format {
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index ad470de440ad..982c996cc777 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -18,6 +18,34 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.bpp = 2,
 		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.format = V4L2_PIX_FMT_SBGGR8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.format = V4L2_PIX_FMT_SGBRG8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.format = V4L2_PIX_FMT_SGRBG8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.format = V4L2_PIX_FMT_SRGGB8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.43.0


