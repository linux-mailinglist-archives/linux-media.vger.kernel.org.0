Return-Path: <linux-media+bounces-28996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E8A75C5A
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 919C73A9461
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F3F1DF972;
	Sun, 30 Mar 2025 21:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URQ1Ihd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4D01DED47;
	Sun, 30 Mar 2025 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368885; cv=none; b=LP2m147DnJKVyNmsEUrqxZ4+P4NKvvw8jRjQ78vocvlhJj5yRq+mIRbfQtuvbEzfOHgWXLITYcc1cugBWSvfW4aPOKeDGa6gA8/hVS2+xo7l2IyocWzhA6mq8Gr6/uNVIs4QZZ/OifCxCXdT0PhrCjUWQ1vzmJgf+zyfBi1ro2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368885; c=relaxed/simple;
	bh=4qIV4OMJRQtj6+PhEQn+RPmbOwnjOLUtIYmtdPoEJKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTReF4++cygV6Rb9N9SH0eCooG4cCAYyNyvqxHGEPToj5cfDIMLhNrfxphJW40DzVLpTsUrn1bbP4qTbZL+D9+vDCFEjSHseXUYU1WJHN0BsuClQGm0G0c6pTw7kgo3Crq7aUUbJpboqYTYCdvCQsrDkPMlJyHR8ajykQs8q9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URQ1Ihd6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so20156915e9.1;
        Sun, 30 Mar 2025 14:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368881; x=1743973681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYYfYJzS9UTTINef7l3N2YuUileFPTdDLT/ieLiyLmw=;
        b=URQ1Ihd6DtbTLXaQ7NSTDmBNkscq+IIdnA+d6ZjS3M9bF/GvtKsSiTa1Iq9PGGB5aV
         5NTU6CAQ+vJlChQ1CbHKquR+/AHk778Lr5DzFWs22ZhWcsiLYah+Mc2rHEolQWchAO2y
         5TtCxWgVfagE30HWedb+wweNn/SfXmbxUlWxI8OTCJZHqSTNWCp+r4Xh8iGO+ivYJKXC
         rWE5BVUXlskmAMaCFr9rHMSpYQyFToAFJxIEuYsrkuQhhaIKqx+6rm5s1SCsNYnESS0o
         xZLv/NSTJ1mUm1SEaMFh2jePCU+9xJNk4ZKXU92RZzA+0+zZ4gXPKKbh4JJd+rJxfFeZ
         l8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368881; x=1743973681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYYfYJzS9UTTINef7l3N2YuUileFPTdDLT/ieLiyLmw=;
        b=jpgN5btwea1nLZrfl4R0XQae6PJ0qXXZCnqzCUXyYot+1+7JV9QZQT9EHprzz4cRTY
         2PGchNi2ZCSRF3gw59lym7Q2CnIChVZkSQD4h10k3tatsRlLn2U3mUSY6qsOH4YYoFso
         mmwNKfwPRANDh478IM7i3XQ+SJuOVji0iqlwKq/1dtu+fl6DDt/pmyGJ8OqjX97IQHY9
         fu4XbSQUWJjVG6+zfTpWvmDGoGWXIcPoS5LELIge67nmNxK+2IOV+TuGlhWLLqOB5vIT
         iuWNtRSd3kqGtg+P23BztZEipGpD2QpBrfI9bRixpxQR0/xas9XUSLIEA7QNt6fmD0ki
         7zHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1nhZL98pa77LZJMdDnd+NxxHVqE3+iY3cZ3UJmIquDksrvc/Wjavog/za8XhxcBfjneL0Yn2N75RY/FA=@vger.kernel.org, AJvYcCVJ/aq6EjmCxk0CAsNf2/LNg3N4TzVwSroYaEODPDc5zL8w1qRxyUiZYhdM4B0TC2wZR1G2o2ZamkA=@vger.kernel.org, AJvYcCWSeHzd17Etift+o++4AmpYM1XhjyW46kfq212E5mWrJQsXH5G+mQAw1HwfxJ/iXhT/RdNS80yjIWMA26YZ2hdKOPk=@vger.kernel.org, AJvYcCXL2Ts3f1zj6k1KZEi5nJTzX9cdz8MrnIRwr55RcOVNQl4JVgo7bqYLNfi26MCjz3DGe1HXnGx3rG+Wmicc@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYH/73LwpdwDJVAMK5RVD686mW9obTSo9VekvmwlUrr1xTd+D
	RuocmYWHdSn2B/EXVPnTp3bXdR9u1u3++lpHerAvXdR1iJI1MkMo
X-Gm-Gg: ASbGnctdwxveKfTDpKC3rVeazpcoLjAYSNZGFfk47Cbe8TMUSk0D9QUk+1BQhxO/KLo
	hiqin4oi8A/ggbZI6NHRwbbCxxJ2K1+BA/dUBmRDqplLdLBDAvAsdLFTsnMUbj7owfq/VCjmUT8
	m/8R6wF2khUxl6KWJnpgQNg13GasLmP7S9qD70Ohz2RGeR+Or6Vgle3ogX6n7wSry783hZSkGcA
	p5AqLhgmhvyeSxtRQ5VgYBRiTg9RbrfIbxqkTkq9BK732PIbrpn3cGzAXFpGf5iYbzqL07/KPrc
	wPI3Lv3hE2o5Sv95GrYHD/ASmXrwY+S5xmvErbOkbr7zNvRGVu2Ox7w89kogUQEGL4I2bQ==
X-Google-Smtp-Source: AGHT+IGA5SShe2wrh5HjhamkRaD85AlQ7QpNd6UvrHKlJhkllSwtSLD1fUK5QyBrjaPFdss47hjF0A==
X-Received: by 2002:a05:600c:c08:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-43db62bd2b2mr49544755e9.21.1743368881459;
        Sun, 30 Mar 2025 14:08:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:00 -0700 (PDT)
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
Subject: [PATCH 02/17] clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
Date: Sun, 30 Mar 2025 22:06:58 +0100
Message-ID: <20250330210717.46080-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add clock and reset entries for the DSI and LCDC peripherals.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 63 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  3 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 057bfa0e2a57..94c959577f03 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,7 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI,
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
@@ -58,6 +60,9 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_DIV_PLLETH_LPCLK,
+	CLK_CSDIV_PLLETH_LPCLK,
+	CLK_PLLDSI_SDIV2,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -78,6 +83,26 @@ static const struct clk_div_table dtable_2_4[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_32[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{8, 18},
+	{9, 20},
+	{10, 22},
+	{11, 24},
+	{12, 26},
+	{13, 28},
+	{14, 30},
+	{15, 32},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -94,6 +119,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0-rxc-rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0-txc-txclk" };
@@ -113,6 +146,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+	DEF_FIXED(".plleth_lpclk_div4", CLK_DIV_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV_PLLETH_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
+	DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
+		       CSDIV1_DIVCTL2, dtable_2_32),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
@@ -327,6 +367,22 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(7))),
 	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
 						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_vclk1",			CLK_PLLDSI_SDIV2, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_lpclk",			CLK_CSDIV_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_PLLDSI_SDIV2, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
 	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -388,11 +444,16 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
 };
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
 const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	/* Core Clocks */
 	.core_clks = r9a09g057_core_clks,
@@ -410,4 +471,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	.num_resets = ARRAY_SIZE(r9a09g057_resets),
 
 	.num_mstop_bits = 192,
+
+	.plldsi_limits = &rzv2h_cpg_pll_dsi_limits,
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index c60f9ff49439..32304abd16b5 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -28,6 +28,7 @@ struct pll {
 	})
 
 #define PLLCA55		PLL_PACK(0x60, 1)
+#define PLLDSI		PLL_PACK(0xc0, 1)
 #define PLLGPU		PLL_PACK(0x120, 1)
 
 /**
@@ -105,6 +106,8 @@ struct smuxed {
 
 #define CSDIV0_DIVCTL0	DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
+#define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.49.0


