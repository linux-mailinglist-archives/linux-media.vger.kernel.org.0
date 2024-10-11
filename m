Return-Path: <linux-media+bounces-19469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3999AA57
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57830B2342F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBA51E5720;
	Fri, 11 Oct 2024 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB8rEvX7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C8B1D31AE;
	Fri, 11 Oct 2024 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667886; cv=none; b=NBcuQswQpn44MuLDCbvcThiPwlLwE6128xFld8FK6khPH35It4vciBQRWNy1EE0oy+IN5qQFlZ5C9+xK9GBvxwLga4/KIJsaJCK7iDuE2oNODN5zKy72lHwMhQ3u3ixAHnlRlaYU5497ftrui5owi1sYdQA13uzUTSaODau6B3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667886; c=relaxed/simple;
	bh=psuz1kH6lKHsMHp2QzwSzak8zSEeU2tE4jLe2BRBj7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1iNY2Iy9OTngDckkkbUpxeHZ608PTvHtje14YCiR+RamzutMo0ZAVcG6mgGFxjPrIwLdNK4HYcpvWvFdOCokTw/Xuo/cNFEKxPd+CtlI4buSwvOEX4Flb2tLbb7f/59T4UGRJp6j77j9HXlXZjQg3o03neT8J95vKulLHpldlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB8rEvX7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so20598455e9.1;
        Fri, 11 Oct 2024 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667883; x=1729272683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsds6gEZXaV158PTz4H31/UuEAFL6ixFyip3+gMCH3A=;
        b=cB8rEvX7e2uc17yYP5oucd3mkMQkOVB4idxzLd84ESlBlBYXMtgZOxroL4z4cuM1yr
         /E7OHIM3hw83HuIppQKUv81HzgW0PGawUEd1i7fxH+PPUzuCP3PkOiKHxiEiKh1Fhtk+
         xtclxbhnGcPqZUAVQcXfzhL83r+csb9DSv02qoR/WjE2exE488aTjgZXUhyOVtID7s25
         mmpvsf56NHR4fJsh1ITRHRvFJc2UeZBXye4IIp4GS8uKPZ2XytoUKKccayCw1jF97H9f
         NscTGNbx2zlLjCFDwr5ANHh8t6GFOmvPbNmGNfrlmzc16l1k7hMVZTelKXDGwMurz1DI
         /iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667883; x=1729272683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsds6gEZXaV158PTz4H31/UuEAFL6ixFyip3+gMCH3A=;
        b=k1/8PU4Aa/PMEorH0iJShXmkIRGOFzBKBejHAVcUSyflXsITZRLy1cppe+awID3twV
         pH+hGKPUvnK4l3F3L7l3zC/6JDkSA3uuSdJBwaHpAE5stByc4REAw/tdTMomTAX5G+LU
         qBQjcAH4FbkMZPQrZlujx/1KduUc/LnRjOzsbxv+dZ/bceGGpIpHzNOwqlglWaC0UKjG
         jAlsXJG4/UBNZ3f7jHnbBxqejTVrmq8ZoZlQ96jHoWoQvQRUeh1VWBaBOzzcuH5Z/qUh
         RHohvsYHWbqdDjThnO42e+2p54oQM228hL5XuRp91vPFfNtnln4jewe4p10i6clNfvDj
         HE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3B9YNTgbxClpDDZATIqOdXZV/ZHOUMtUFWurrZb+OSfuzZTSmwkq6tabqxpyUfHwcHFobB6kSvQrcXfV4b2/+R6s=@vger.kernel.org, AJvYcCWLsYxqfFLjjclUIlzFsw3H39XVqsYpBhQJzFboAYaRbkXoNlkevqmIiiFv6fi2W4pxZztaDDD8vwYxhnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1B3meKBuVuEDa+LHw39EGlZ05h3RPC3o1RCcrl/U99lvAK1lE
	Thdg0EmoJNNcyAQJpqWtX36jk+WwQ0opzjXkWNK2re5Vx5WdlR9c
X-Google-Smtp-Source: AGHT+IF+0dDYlKXLHb/smlPMuGAdsbf24PYgvdGvqEMWDvD7C5QY8iw9ApNZrIOL+1ml2XtaxQXFlw==
X-Received: by 2002:adf:f449:0:b0:37d:2db5:b50c with SMTP id ffacd0b85a97d-37d5518e16emr2165704f8f.8.1728667883230;
        Fri, 11 Oct 2024 10:31:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:22 -0700 (PDT)
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
Subject: [PATCH v5 21/22] media: rzg2l-cru: Add support to capture 8bit raw sRGB
Date: Fri, 11 Oct 2024 18:30:51 +0100
Message-ID: <20241011173052.1088341-22-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support to capture 8bit Bayer formats.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e21142d3b67d..84230926875a 100644
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


