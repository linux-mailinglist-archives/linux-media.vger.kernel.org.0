Return-Path: <linux-media+bounces-40269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0058B2C348
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062A05A715A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6951D34AAE1;
	Tue, 19 Aug 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8UPAtsT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2091345758;
	Tue, 19 Aug 2025 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605826; cv=none; b=P36T3LQSCroEHXF+xE3y2FgWNebjFH4LSDPTNC75gzCwbaHLqtxbzvuMKgnEzIl7MWlq7j5VJJ4h158fGMhjYYKCGKlyh2cAUP9VRHD95lF3xGhO5rXovRhAGj1wdrySBrklLRLi1+oItU0GsR5i/aJEGBYiyAlca4N81CeiEvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605826; c=relaxed/simple;
	bh=A9t86rGpVySjyq4/FJppXm7S3ER1Y8c6X6OjQIOGIlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nj3ZpF0SQgmvOqSNVIDfud6VYYNM5QpupgzgePvE2oaWwZ+Ix3QPQC7yPS8RC5lG5OD40EvWBaOxL+YR/ypgzcu0AFZZYtMnlEPUkO8j/G2n6CDqg85y2yf91GVEqOMgzTqqrPPbgYRKa5ccz8slOzW6AmHXXVuxuMU4HbnjGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8UPAtsT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afca41c7d7fso1055559566b.1;
        Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605823; x=1756210623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7nPdsPtcAgjunV6X7jhJIj/ZKqq5EgnoWj7gjO7V+Y=;
        b=F8UPAtsTGDLW3ioPe58/ZuxltSGZrbKgzxu2TY+dKPHjD0UjzrUwNPpzqA07P0IIKK
         b09/Nr3q/tR3AVjUy7qkQWpB8aj2ylniTYWQodfv52xqO1laveqYp5gt6LIbiZ3HbrqA
         jlQCcb4KLQoPlQmV4pFjMyQQ9qev6femDd2tm0miA/GPJWTKMf5TeWN6PNIP4JUxKR69
         Afzbqvb7eUHRTxSDAxE6fBWV2dUIPernc3Ie0y4EZArEinwg4kRw3sqWwjRALCGVaD0Q
         +/jqQ6ovXlFSSPfRf88Lh/3jJvckOM+qT3+EldJWDKtKxuJFd8w9SPqTdEe6o3GND3ql
         QG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605823; x=1756210623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7nPdsPtcAgjunV6X7jhJIj/ZKqq5EgnoWj7gjO7V+Y=;
        b=bbV1Iie8XAyS1/RRkfke1ZAFUX0SWWa5e430l2UdzoNHoAC98iO5Pdigu9i06xMR9k
         bCdqe0jjgNcCK4B9TsLpY5gGi6GClrCeOWsMkQPsd7mEF3O63jHHXW7KllFGQZ0xH/1P
         g46etWQXNOjKaz4io5AFfn4rTW2bncfO3tctd1fCM+WiVt6Pr39ODouzWxGL5pSY8iPy
         i54gV/cgKk/nZ//flNsH1yTbhz3eoQSW5J/x5F/4Hn4BqqCudG65E9GuJP1i7BIQY3QT
         PuOIw9C5ct9Iko1KaDepPzJ3LUKmYgX1p6gF8w8JytFIxES13WA9FGlLPbRP96ovRAx2
         4Feg==
X-Forwarded-Encrypted: i=1; AJvYcCUYYMUBORm0T7XiAzE7moJD7WuiX6mI+Zuju+Z9T2OkS8b4SNzc+eHyQn8UC+8UJ5jEx8lNFMfka0xx@vger.kernel.org, AJvYcCX+UtGlZc2tSJBTlnblFdM8CJr3EqaEOj7ZvTmZJlyLy63vGkDPQwr3Wotlu7CORRnIh1zTu39jBZ3Ryu0z@vger.kernel.org, AJvYcCXoQM79x0OMmUO/O8U8SrKu6DMoj2EXNO28PDVaDu3p6/syosJqDtX71U6gSqVHNSNOz3qz+5oN/k2a@vger.kernel.org, AJvYcCXuiqBV2u5b9JN52DAir4W0wyytEToa2NAOOFxYKrAyPSc/ROal15xpn5Nk/MUsaAsaCWbT6ggzPOcgzTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYEsqLl4cVPVCA0b+JGwer3jx8fCxi+wOjeGGyGX5wfJOm0Ry
	Vj8WND3TbdFbhoQqOZb4MxzW+f1APUSegACSDi/7X2DY6pLIYj6AIYCK
X-Gm-Gg: ASbGncsyRp2jQ9O6fP3HD2lioYxug9WyrOCXcXHFQXWB1F5cuP7v/ucOF2UDkbHazpH
	qDb1/NWjWawwnAEyUcam6HpbR/0kFAuzF1o8N+hHMcz3m4D2op3M+sXWzMOdMXYCpYEuMGhSfdz
	CIKpbDVYIJAF7Xh5F9ybicL3cgaxzVVlGmbefXM3RwX3+X5hHdWtLJg6ozb6IuPD1sRXicytviY
	29+ILJT0wPtp3N2J6KhbUUaSNArdX+IHLjydWoLvOnWHhk2Ly1YmE1qerW8lGeaIaW+hR6ilMnU
	YEJhxF5FDHdC17SaPsoOHui1aMt7e7y8fLZXORTuZgVr0lhFJUMWOWN+PaeVG/lr4CfsebjqL38
	2B5GN3kE5mfYrDw==
X-Google-Smtp-Source: AGHT+IEI4wu112muy0eGgPKtJeKpcn9FInkstfnVtc9qNv6q6tgCe+us6rrc7oSTRUrJxnYtpqfh7w==
X-Received: by 2002:a17:907:86a0:b0:af7:fd29:c5e4 with SMTP id a640c23a62f3a-afddebca776mr252056766b.2.1755605823220;
        Tue, 19 Aug 2025 05:17:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 12/19] staging: media: tegra-video: tegra20: simplify format align calculations
Date: Tue, 19 Aug 2025 15:16:24 +0300
Message-ID: <20250819121631.84280-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify format align calculations by slightly modifying supported formats
structure.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 54512d1ecf83..735611c3c47d 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -279,20 +279,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
-	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
-		break;
-	}
+	pix->bytesperline = DIV_ROUND_UP(pix->width * bpp, 8);
+	pix->sizeimage = pix->bytesperline * pix->height;
 }
 
 /*
@@ -575,20 +563,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.48.1


