Return-Path: <linux-media+bounces-41891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A9B46F6D
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5963A5A300A
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842A82F90C4;
	Sat,  6 Sep 2025 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzJUZdsA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FC2F7AAC;
	Sat,  6 Sep 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166853; cv=none; b=S086tVD0JizWD+NeQS3x/esvsiD0xgWVgRl/ch03mOFKss8oKF/aWn1+8LTSXgMZWFTXdSMaZS2CRzmOBx0qWkgG91NhZyb3Vttv+1o2YcF9bAlI1SmOoJ331hDxrC4nFIwpuVXnzpmfJfUknl9CH8S4PY0F9ABGKMmEXry2r2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166853; c=relaxed/simple;
	bh=KdlSvSgWUeoiyYo7Qunfj3lmupp9OJT/t3CZIweNWBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqpgwKa8GJPvTIIPrjsS3mZz33k11GuZQF7r6xdE3TeaHYv+DcQo0EWu95Myjn+cXnZSR6Bg4nrI6GIc9EoBEU367RP8s942qeZ2UXTsuBjOZTOCIn5of9H4qcG8BV5yGH28QKfIvi5kLRVeMHLJd1FfDWV0UhathczuWlF9aFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzJUZdsA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-560888dc903so508656e87.2;
        Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166850; x=1757771650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ticHo2J3iHomlRkxHXHmDMnz/mVEYrKRSjwtAcYd4Zg=;
        b=mzJUZdsAnwqWC1rv82dc6Q7WoPdFhLx9fTiGV/lyrFYH83XPWl/qfBxftnBc4ZPO4B
         QK5fkdFvtYkIkaXhjSFCMMbj4UgZ8rnD3T4sHu+o8+vYflEJM0gQhSHd0QMno+qPtyml
         hECTf1PmV6ww+d97bZ5/Y+XWKfCVyfFDNUZTcs12R9XydVu6aoKo4NsgvVSXl+MKRH9H
         wd/fHDsfniTL98JX+cP/m4m1+t37g5u9PULrt/h0gAEWUZGkiByX0ZZpXzGV9SOTs5L8
         2eDadPfmoeArcWqUTPlTiV9+Neh9nVJKzbyl3fe97hbHXcBGwGT5UOtGwX3t0VBTGIgY
         TUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166850; x=1757771650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ticHo2J3iHomlRkxHXHmDMnz/mVEYrKRSjwtAcYd4Zg=;
        b=oCQPxbUXRs/LSaWXdNTvsh6MLtOfJvSXs1nAQIlaTQKPXadQfj/fjCB+ywO7WlEEbq
         /iCC5rJ8UwUaj2+sN+76M/3cQ3hZJKPVha9SEIPfJnzRG35XeaB+EyLIW7tfUqnYyWzC
         GBuP2k5DGRFwxnzZa6WIyn7yQMECjx/Zl33p1zXNOmPrp9yaDHGu6g7iqd23Fhwd+5Wa
         8UM2teS5IXI9l50qQE+Ebw3u9jwLoFaMs/Righx25E98QPHJnFJ3AYVGJZ/4mydKHvG0
         xqxuUOLroWaKZZkZB+s6tmty/6qaUgfNkEllOu2T/NX7Jn4JyUXSpPIJRyNXg0YipM6a
         GROg==
X-Forwarded-Encrypted: i=1; AJvYcCVlgzk0z5vd+1Pl0Q1Efhk6mpZNAyAwFUA6jOjBBjJQBz+J0CcPW+TdBR0+MS+FWLGBc/wh+Or7+U3YC3s=@vger.kernel.org, AJvYcCVsFuLuOoHx0vXYUF5+a1srjHUZffwAzxXH+QiCTKxkzfq6vcRfjbB3Z2/ucrJyGcoLtnWcqM8VK/PC@vger.kernel.org, AJvYcCVxsuuKJa/f17KyHpUJvA7licZs6qQG2J+i88lso3PTbwm2dz8Cup2wvh/6Lr3o9KHovxww2UpNevhU@vger.kernel.org, AJvYcCWhx3keMiNZOjsc2WH8U7VH6xFa75tPBvzP1VCtWgujGTm1EVtJ0oGwBA1qcZWVUaOtkdCGDdi3Rb4nhwk=@vger.kernel.org, AJvYcCWzCmTGVhnhEfU66KrSlV7FX4Y0j6SiUfIgVNficddmPAlP848nO0qVvTwjo0WQP+YTbeQUoqT74Num5/54@vger.kernel.org
X-Gm-Message-State: AOJu0YzLMt1stlbFo2yOJr4estiI8UDkApaJhgA9rbTxuS5SJY1G4rqI
	ElQOSI6TxwO/23ACKnenG8xr869lN0/RqIECZK3/oNrLhLNZ78fWeXnM
X-Gm-Gg: ASbGncvTL28RhQw3krfxOAmYZXPVQDzDjrLUWlAw7TZf4B7Vh21j2OwZp1wXnG+LcxV
	40gVBlXJ+OuwTbboXu7sMW4YneqvSn6xFj//D4uEC/tAeAMttx3kCQoU4q3Je21vjGD01lUc/JV
	p3gQO1DB11DK1l+L9Q/U3prXld+TplqVkCsPsXt5g5W3nE/+9LZ+7+QuTGI1E5R5paxLAt9WHWy
	Yppx010Rurz/L8cF3evaO41zDHWfuqwLm3kpqKq6b2zj99lq/3gqo6KJv28bm20HDgVV0wdVVcJ
	kcCksHmbkueQR/goU06fHodrGMY3WmoaRPLxSHqk0WWLeq88Mi7cwZWzPOWF6+hBAo5fiO4jq7f
	UFlrZdVucOo/eK76A5e94mJVIuHek/CGW1nM=
X-Google-Smtp-Source: AGHT+IEraTYTltF3wywtp3NkE6/6iVWl/Axk/+8aEN1z75HCvzKoiL0+m5CBiVO5QfedG+gwNKnWSA==
X-Received: by 2002:a05:6512:12d6:b0:55b:8f1a:1276 with SMTP id 2adb3069b0e04-56261cbecd8mr637299e87.19.1757166850062;
        Sat, 06 Sep 2025 06:54:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:09 -0700 (PDT)
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
Subject: [PATCH v2 05/23] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Sat,  6 Sep 2025 16:53:26 +0300
Message-ID: <20250906135345.241229-6-clamor95@gmail.com>
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

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 4 ++--
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..7c44a3448588 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1956,7 +1956,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..6fe8d5301b9c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -123,7 +123,7 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..34397b73bb61 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,12 +263,12 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
-- 
2.48.1


