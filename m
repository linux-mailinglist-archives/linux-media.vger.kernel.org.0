Return-Path: <linux-media+bounces-41902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3CB46FAA
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFEBA01EE1
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECB8302168;
	Sat,  6 Sep 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMidsez5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61923301475;
	Sat,  6 Sep 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166871; cv=none; b=Ba6L6wLBKh5V8e5fluvXdbIoTPewItR6iiq+wrHvJ0i65tOQfDoS3LWAFW97vuh45qf7QzO7lSsozBLA2wwJNHqpDgcTrPIcQ3NXNxi4rfiSpQS/7+PhtENCnrx4CfIvLv3oAA711F9o9KE+gGynIjNG6XHpDEuzM/ry26F1ISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166871; c=relaxed/simple;
	bh=pcvsch9equ9U2eg2pRak278y2u7D1KNfIZsN951Ej2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh9eplMH48i93WqvqoKjrFjdgkCBoeVOnV0WxSnYmt4gbzda4NAHUphtonCOqF09zVjmLVHuNDr64JZLE6LVrCjNOhWirCpVCqaX0W0C9Uhi6cC5Dzw52+EtfRYtuSHTnRtyrFCi1o5KPZuEzohYOAT+/gkB7YOyJR40fwEviM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMidsez5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so3196960e87.2;
        Sat, 06 Sep 2025 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166868; x=1757771668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZW7dqJgZ0dYH2mdRsFDOcRUdcwAD8iUPPbmwcwKHGg=;
        b=aMidsez5FLMVKCh+M4u6R3qlXpxoB/YDx9PDUO+rJEh2QTQRFQN5JxAfmdVgLu768J
         As66JT7Pl9AJ/HimmDjAuN8lmXS+Zj+c2qKYiIM3wrNvYDFq2brU97EQ9kJzCk3wHO17
         MDNupLpY7gd9vesv85wzyLqZFsw6tYiYciIM5v8At5Hj3JGrihNueED2U7honTSVk8NL
         SP3ouWUaIErsP/1WBreazoBBGwdGeWlM1jvOW6c+AHHBa0Va+bmxzN4s4q6mfvtoBsMU
         LDdNmldyseceJXDxtufdVZrvFLuqn/3N+S+4pAFTWKiqPZafgUracp+SQZ9oHL3y/OXB
         k0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166868; x=1757771668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZW7dqJgZ0dYH2mdRsFDOcRUdcwAD8iUPPbmwcwKHGg=;
        b=Xzi/6+qpZJhUFgLUBQnC0krEkXUdVaaNKRV2vG+pLC4sRdIZ+zcLKJmhkwj5OFIDp9
         +8iwp1cjPXQjkW+7m3kcFPO7iwlddBWMTuy6osf+I4vUa+XxHNrB3rIkU4PxdwZvmgzh
         bo58JwJzEJL2OuY+tQ260tFxrWmv7AdNLu60FUYhP7v7kstYBxRLgjxvUInrgXrldjZr
         6ZtGor3/2XXA1jD2Wxmock6WuuTVyNCCfSDJUG+d0m9Mqy2kNwkUxdJBWOwoAzWbvgi9
         DxQJ4f9CIgH6lbhsI+HavF4YorDUP2+DNlA7+8hgIl4Un4hzGx438g8HAX8OwqP+VHHf
         03Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUO+bwOBEEHpr9xFavmrB7xgNPYqSQAieLKHtL8H6ZlyEUJIfRLxFCMimX7BCVcyybmuS9u4q6bhlrJ@vger.kernel.org, AJvYcCV/fbJ/VfVDhg8+GfpJGPBJuyXYUvBAN64U3kgbFrMdPB0eVHZmMzAU4PCzJW0zbzq04nWq/JnOIlrVkrQ=@vger.kernel.org, AJvYcCVQ5n2fvhSCyPaPg/Oa5a+qAPz1jM6rVON9PO4l339XJpmKlfZsM51TrjWIgBM+1aK5BCsrT/W4SEeh@vger.kernel.org, AJvYcCX/FLbn1SEe1zR+hP8D8XdeBds7L2v5aYdxbGXpfelTwrwklu/nq2J1DXOBjAa2jF2Dm91hDmesZqyiEbVw@vger.kernel.org, AJvYcCX2/BAEZ6Y3K50DvJm/Djy3xEpvE7SMlUBOrpfg8+SefYos8juHCL7LvGWRafRv7yhgtY8au+p9jtHSSNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztHiEHNUnxpkJW192wLL9FhlQn8UIWyMc5y+y29y5rjDsjsIM/
	Ur288sXRWc7tmgZmat5c+OTvPjxXkkxVfbJZ5asTuTJ2K5xSJpo7P58+
X-Gm-Gg: ASbGnctrN3tQzKa0wd8raRy7dwBVabi3qtZm/5Y9nvRqqjXcLKUzFKS9jFOcUu1Wj7c
	R/7u+dp6IT3QFxbZJKqn4SNNM9ysIbRcBl6Z6p0y3wvvS/jdTmlNN+Jjxidnoie+/okdEshW0MC
	YpOM0W3RyeR36i8iqZ2SP3hqWdkJWd1uudBE1QxJvDN455tq672VUxxIfnU+vEpHvZwOlhvTo/H
	5bRU6cdvPSSEVThLpZ8sjaEF7Ln3ur6ACXmswDRB5F5UqQzhP8x4cd5i7ialvv+yvcUS8w44BeR
	zpZ4YTVzwj8l0BP27zenvqZGXD0E9xHyuQYOg3evbZxRxT0HZU/UIL6PdEGOmxpvTY0RYLqtUU8
	pmsQfj0Yq0Cchi1xm+pE5PT6q
X-Google-Smtp-Source: AGHT+IG+CJZ7iseF3kv/Cj6ge1e/cUIXjhaB91wzpTVojIxeSMhx9A3nDfwz+NAjq7cRrEt97mJS1A==
X-Received: by 2002:a05:6512:3ca1:b0:55f:4a34:e333 with SMTP id 2adb3069b0e04-56261bc58ddmr636666e87.33.1757166867511;
        Sat, 06 Sep 2025 06:54:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:27 -0700 (PDT)
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify format align calculations
Date: Sat,  6 Sep 2025 16:53:37 +0300
Message-ID: <20250906135345.241229-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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
index 6e0b3b728623..781c4e8ec856 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
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
@@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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


