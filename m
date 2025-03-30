Return-Path: <linux-media+bounces-29006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D98A75C87
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3930168BF4
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A701E8855;
	Sun, 30 Mar 2025 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpvbY0xe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24BD1E7C16;
	Sun, 30 Mar 2025 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368901; cv=none; b=XaFRCurGdHBZ+RevQHHIlJCRfGSg1rQKTg0gqdIZageOof/pod1CplN0thQu7er02lOqqeuyJsnsvo97LEKCtBBhvWnB3DTxN7if6RilpLiIs2yNIEFXik97Sarqsv6yw+rHIcffFfsDkWfRZdXF5Ft+ir4khNsW+xoN9JqP55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368901; c=relaxed/simple;
	bh=MsrZr3jL026KNCW7PyRhg6lj5ZoZkgVtJKY/yobQsoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfqTl7NEIKLYz5tffZBYOgPQX9rjB2pSgX8IJ4ynC2oSVwUCz/sCEOrBbAW4dshfnuQyB5zqzpTLVW8Kh4kqwLdcAJPG1R5I9o20Hw+Nz7ZedqM+XpAaplk5JmCfe8nM5sJRbMHLFM8a/RaxdTsVy05hCqGuFBrw+VRHyN/Gt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpvbY0xe; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1281677f8f.3;
        Sun, 30 Mar 2025 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368897; x=1743973697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WL47na/f7Cm5ezjeiYyvgmEI6emKIRhwkU1H7guX+E=;
        b=UpvbY0xeHGrNVOvimjmXfRpBJr0KW3uUddghrZY02XMu55YmrzhYLELkOBLjGk+Q0n
         H2NUR8U1WiJ9JGdnoDCXpm90Bhcui8ahZDhTBMWTOCX5Fx4zEN5bzKasvjjdq84XGiAx
         NKkjqLxgltVs3CngI0chV4s7oPxOzpm3VaQa//5KdkiflOrAB+aFVZtaFvrIavGFBqKc
         9bNs8q92cyMUrwPrt3zK6xcKWg2xMMBibDgYLvlNrOjihWM1PvnknyyqGN/C7J0uM1kR
         Hpgg2wYDEa8RdPSjk6B6ckMKIVif9hNowWsHpTnJfpVs6Bvunpko0igqRny4WJFfAzpS
         i5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368897; x=1743973697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WL47na/f7Cm5ezjeiYyvgmEI6emKIRhwkU1H7guX+E=;
        b=sXa7XNhAu/CjfT+/rX4dDwUbWPV7HigecNx5mZEOUEvyqjCzHR1oaEUMx3aI9zn6+I
         1UnUbjgOz4rf+E8+yY1Imii0pdf+h/dGdVJzaquXe0omDn73p7COWqRSjuUB24GfXyQO
         37lyqY0sgsMkP+OWoWAIz8NqnPfjs+KZqKH28q7Jm1VW4MO8nXArBopTw/NqKcXinjom
         ulucUSuzigGGw6kBRd09KhKrXDazpcafMfWDAuUld659jbP3g/pcwvANlSFgonrogK6I
         2iM/3QUEaAO+J2eo3bqnyvQJgh1TKi01A4q43SafkWEK6lzlgBLK5Jem0mSA5GKqponn
         wN0A==
X-Forwarded-Encrypted: i=1; AJvYcCV76UpTQPDK2Uik6GweWb58Nql0LF1pwSE5d/0GIh58clNiC9jYxKh52SZzmuUWV6A6LTcIg0ceVdAhLwMT@vger.kernel.org, AJvYcCVDxY1bksAWKrPNckOl+hdsNO1LnqwssDZVsa5xOJKQObXJHDuWO7coNSFe8d6tGEP1qpj3UbLg+6C9IyM=@vger.kernel.org, AJvYcCVupXwYl6jjLF6lua0acbTlTf6OFwOD3repy2tpX7O0YeYskBuLOeCnQIA6NmgMGx43ZMXrCFjBbAT/rLxq8hSy4Yg=@vger.kernel.org, AJvYcCXFE8vCuVVAycgN/LAOCVrbVguhXkYWg7wA4hdFu4PiHkk9vdBYfA7zvb6TguqszYoT5PbsirjcvTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvy4qgZzjS324a7LhGBgh/u8y9PaAiFqU5uKxcRfbavNP4QYae
	YpcPXvz65vPQUlQ41EYNWuwTFVMyLSIyS4F8RNIvCDcNMbTTEuD0
X-Gm-Gg: ASbGncvFzGjbYeqkUh4kOwb69qUoBf45tmvZFP3nJqT7/C+P+eHtSGKioRW2/kJpwEZ
	no/Try73W4k9CwiaHFYsU/hWadKJrBW5DUNcK0IQA3PmBYkkJVEudQoBGK3UX7G5v0h1sXY2jRs
	jOf6qSHRqfQFplhUmO1SjdSQ0wyo37MdeBGVRgPXQwhA/kTHvEkUiO1BhBcbzjLiEgxUa8ml1D8
	4KbUaxURGp7hAsCy7Ay8Eett8wz6JqhUcusHr0TaDZv1AcleqOXfNGpOyKmZG2YUu0pEEoKCCih
	viYj9D4YyW6veWxaU1w43lZP1ZpSLjzy3kFMN/sw88upEHGvjjBhoIFZF7cL4Gvz4rkPGw==
X-Google-Smtp-Source: AGHT+IGh0oqGPfkf43mLqos238ALBWtWgRCoU8+NfGm32FoQHuOb01nXaAIF90vjNfOVilmYf+rBZw==
X-Received: by 2002:a05:6000:1862:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-39c120ded7bmr5144373f8f.22.1743368897156;
        Sun, 30 Mar 2025 14:08:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/17] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Sun, 30 Mar 2025 22:07:08 +0100
Message-ID: <20250330210717.46080-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 44b95082b29c..84c3384aa911 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -31,7 +31,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -201,8 +201,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    unsigned long long hsfreq_mhz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -275,6 +276,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	unsigned long long hsfreq_mhz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -303,9 +305,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_mhz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -313,6 +315,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -780,7 +783,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * KILO);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


