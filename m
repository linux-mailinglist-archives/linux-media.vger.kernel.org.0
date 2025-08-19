Return-Path: <linux-media+bounces-40262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A9B2C330
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A77721E51
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C46F342C80;
	Tue, 19 Aug 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3VTm8fk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711A340DBF;
	Tue, 19 Aug 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605814; cv=none; b=IfAswkm49L40laoBEy168A4WrklJY+QOyXYB3C223JGa/JtVMz3XxZB/iyLDabpa7hb4molC1rxHJtUc0l9s2jjy7qcl1e7cHMcXM7EQd8YggU1kIyolvOwvWri75rGpMB6fOMIqBA1RVVXGWWIyC5Y1OeXWgbnzXR43w+4QPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605814; c=relaxed/simple;
	bh=Tr+qlF9CCfeobNfcvFCe0mBkgSd+LTHFlpz2ygDhrEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYnbIsuXo9JJZxr3LbrLkInDB/7YSG6vZhSNTQNM62Y6AS67qwdY9fwnNhVBG0QdPX22r1GIw6OQHq2bYkIH3c3SHuxLuGNtEtAGvoNnTHy0atfGcAiu3OyEl+bfZGtca8nBnrmtmBXORiz5/gXzNKM45Mo6rMh4w/+saofnJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3VTm8fk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78c77ebso843722666b.1;
        Tue, 19 Aug 2025 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605811; x=1756210611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flb6InEp+Rhz/Z2grT5FKfpHtbQ47S/+b9t1ySuxxnA=;
        b=X3VTm8fkLrVedC/Sip5uo7leC7A7evlkwcAFnPYSStH9PwirgAhhIn7MMoWR5NMjlV
         eaxjmqNAUWdscc0uU1YXg5OPI2xRPp4NpPVeBded1Lks84fAPQi5k8G1DDZTiuSp8bNK
         PmYMl4zPtIgynTH6VEWf9TNWhA+aA66lMb/aSOia1N0mzJeJF5DaDSERom922XGIvmss
         bDpwjlB8IdYO9GquyB6qmUWtuZ4ykm3j666HbF8OorWqEgAC9MLD/puFDm+A2wCLlmRj
         xYvwGSYiWGSxScZIV6YfTUuhc5ARtLiRjs4I7h9UkZmLH1Fv6ARYPNYk/hLJ8EGUcP+V
         QBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605811; x=1756210611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flb6InEp+Rhz/Z2grT5FKfpHtbQ47S/+b9t1ySuxxnA=;
        b=a7vETsJeeMaA/N1wGNRSLN9b2ENOjg5vD1mAncUveHrJNDu9wpF3YVmp5yF5CuXPuO
         j7VnaT2qO/JFYhvJWYB+yGAvGjzdXby+ZxyTBnllpalp9Et0INH0irY1zhlJ2OeeElpJ
         W1e2SA6AjRZCiuBL4o6TvBeoyVBZ6hheofkE2KE03s6dAobLxcDVyDMuY01jNnA4+aq+
         R6Sa2bjiU52K3OkqmP8mkgyGuMF0ToBg9NphOS8xNeJgOAYmSbjm3VyH4dFHArQOXJsS
         b1TI3jbnVXoQSkTSuEy/wHSgm5IK0SCzTQX5yzpghGam1rAC0XnRG6iGoq5lLkKSEAbW
         kEdg==
X-Forwarded-Encrypted: i=1; AJvYcCUN6W+0DxhLvfpkSHvEsV5ez0RQyBF5Azbxl/viQ0p+hC6qcsm7a7kww9XN+eIs3aDZe5BErnDuToLD@vger.kernel.org, AJvYcCVPwNl1RSj7q1R7jojgtc4AY2qK50yqHcSdKKj4TzQ/K0Aa5UyRG+RMo/H5ofGLlrg66DXMb4Ie7upl0iA=@vger.kernel.org, AJvYcCW/y0JE54YGaFyK6UfrxAlDmuK656HRTQZoHoF6ZGdl2vDbTif8zqEmshih4dYMPGqdK/bYSA4tqWX45QaL@vger.kernel.org, AJvYcCXA2Ggtmwfi9raiGf+s00yCynlAmz7DxVvSSEYigK6+j/FAXsTiYtNsaRPjPqLoIsNJsW9cQpuB5pW/@vger.kernel.org
X-Gm-Message-State: AOJu0YzoibpQvZJfHbDTY2T7xfk/HT1+WXHxsJRP0NJGyOsNU7uw+OdE
	Xu8tyMBBcnvrlJ97fvJU6XCLZmiHXufLl+6Tnmdxrq1RtN6sKFFUqzKr
X-Gm-Gg: ASbGncttTe6kHQyV9fUoakZNHqRuZoWjpK6PzYBuYIFywv3P3Ug1rk3yYFjMOYe7vPX
	Uvo3wcrrG+2CKUSbBELva0M3glRVgh4bjJ6Q4vmdyQTiVxif3WmN0O2jlbY1WE+2iZ+BWLdRI4d
	itDIIYNzOR3nnPHJOkDkofFit4sTGbMORdeT3HSTcdoAVDSDdZxjkwWfmn6g7UglKG9v+IOVwqt
	cY3eZe+4KkjN0hJTZaXWNq89MdcYTkDpt7UvrsCfYg/uMC2SkHiNJlVxqPZgiotC0DeS0r23sC1
	mayl6tVFW14k7hI0ouRB3qF9XX43orPIM3rx8BN0GeK7+KyfUCd+qHW3q/6LKko+cnm0oTXuh4y
	XVDbgha8QprpFWw==
X-Google-Smtp-Source: AGHT+IEXOXhJ0hiodB5SHvqbo00ALrsk+5peNPZ+NBwXvS3HlKGWuLTRmhWK5ct+hfcLkurIUQXNKg==
X-Received: by 2002:a17:907:3e9e:b0:afd:d9e4:51e6 with SMTP id a640c23a62f3a-afddd25a827mr222294066b.62.1755605810477;
        Tue, 19 Aug 2025 05:16:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:49 -0700 (PDT)
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
Subject: [PATCH v1 05/19] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Tue, 19 Aug 2025 15:16:17 +0300
Message-ID: <20250819121631.84280-6-clamor95@gmail.com>
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

Exisitng VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 3 +++
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 4 ++++
 drivers/staging/media/tegra-video/vip.c    | 5 ++++-
 5 files changed, 13 insertions(+), 2 deletions(-)

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
index c9276ff76157..71be205cacb5 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1959,6 +1959,9 @@ static const struct of_device_id tegra_vi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra20_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
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
index 074ad0dc56ca..a25885f93cd7 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -127,6 +127,10 @@ static const struct of_device_id host1x_video_subdevs[] = {
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vip", },
+	{ .compatible = "nvidia,tegra30-vi", },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
 	{ .compatible = "nvidia,tegra210-vi", },
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..00e08a9971d5 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
+#endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
 };
-- 
2.48.1


