Return-Path: <linux-media+bounces-25901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D277A2EBA6
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 019A43A1D5E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BCD1F3D3F;
	Mon, 10 Feb 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncC5G3X+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295D1F3B95;
	Mon, 10 Feb 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187983; cv=none; b=cr+PZ5J13goO83maDuzw+IJ4va63YaPhrhmJzyxM3IaWKBirQMCivqf8K8eIxNor4v6NCHQDBfsI7HnLXCIj8BLSXq1yL0qJxHqSj8QYZT66TASaQ592zkmbuJtZ5mKw7WU3ZMHZEC+HVLk6tICIiE0zO9YeGUhMI18ZSsIPeS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187983; c=relaxed/simple;
	bh=Uo4TmisU7wn9Kpc2fbHxaydHm+iJ80nLy/agd1E+ApM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dJnJaf5idzdP7m8BGkLiu73fyf/NDo34qKT9Tjq+/YS5tRNmLt3EUXX1t1QaYxHkFQoB/oHw/w8++KAFxSHhUvmNY70YuwdrQFHeVJLWmiTb86cf/wcFtIbLM0XMFM3zI/p01Kawhm00rf9MAsg/2mVrlqaQsCQ3xx+bYngrmc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncC5G3X+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaecf50578eso845220666b.2;
        Mon, 10 Feb 2025 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187980; x=1739792780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tcko+2LGTEjB783TiWIDWhciLjGO64bpOmui7Jw9kx0=;
        b=ncC5G3X+l8Y2u7nnqBi8C5zewdTstlg8XvTnSU7xFRk2CMucmwRm+2G0s0tVQ0WhUe
         Gn7HmbCEVQWqo91ODCOVKfKy+Fzod1a8NsSrUMPM/j9V0Gus9G0Y9OLHDl/aKMyqHIff
         vcyskuMBthqjFslvRjoln9W3EYL2pH31CudkpTMmJ/y1ADtWNi3GiuQxMAOvJvb8RcRI
         F1wqH8e0bsteZNkgmc9L4IO5+PLKGPzj6T0UeR7YVaazbJ5PcDdInnKEOChV6GkElWNm
         SZ/Ei3F5SoOZrWV/BLiocUYpmWLL+qKztfi43GCYHgkQiApgq1D5oFTes6GrCVTwc+RY
         yLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187980; x=1739792780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tcko+2LGTEjB783TiWIDWhciLjGO64bpOmui7Jw9kx0=;
        b=fkCo/hYAVEz0szVu0hA3yURJBBCzVrAzNOb9nwAgwgcCBZhljlY9n7DMpTqpJZTRVs
         7nRdVkvvMbGwE/sGj3HsVzqsRQ+yGEse5gjWi5RRmBc6kz75q+IX2GvVme+gK40b+Fm1
         bie6qvYG1FJL+cassyfY7iWX0z4haX9n4jOxdOkVNCYi6c/UQX7AHpcJWtT/QgjigQPx
         VaoZ0ersKEfKXMfRoyUKxtnIz7LFYj8PeQn17+Xrl+3IF9fBC78V0T+PEUa0SYzcHxnE
         TK/BMaDoruU2irUM1lG9c5+CYArsMqq2fLbzGrAZkg0h9iacFYb4J63ebxwmpHBP9hCW
         AcZg==
X-Forwarded-Encrypted: i=1; AJvYcCUOMfK67oy4lvFtQldM2VWrtH6vmDaL1BxP5W7v/9NneiN3qHNfmbcvZg5/xk05lkPziimKldW5SSkd@vger.kernel.org, AJvYcCVZXs1ob/hrqFX6mSZCR6jbx1uYhVb7uqC0AFkpyWIRQ0Q7J3vwT19NoCYowWNzynzKSCVsE8QE2++fpYE=@vger.kernel.org, AJvYcCW3VxN4vk9I7eO7cTS7JKVyddba5Fm4IbKcmdnrzQEMt56pTALa4/n/Qp7P8YgH+FnxGL45hOclcAuaJYjo@vger.kernel.org, AJvYcCXsnIHw5tdm97n9Tp4BUbRsBCNeTWuixqNdJVi43Q9UtiypStDsjZ6UQPpE3ZVvDT6HW309379WrnDc@vger.kernel.org
X-Gm-Message-State: AOJu0YydQbkEsRKAVnpRazZo0LGnFDoeI2FdwCv7VPB48BndFaZJwOEP
	vlluMsFiV6VSFyUfvoawIKdQCWpYAGUTczzXQcPIqmBegSDpQEk3
X-Gm-Gg: ASbGncsgyEb7nXtcq5P4FDa4dPhLX8ZMFHmoadJRwdfboLMgx3LCslyVQCE4zepOp+W
	MrBOfVakLfJ4kFxb0jhk7X/hA+xnJoKIfCg2t16QIFeVwYDSEDP5KPSofNP3XxhLIMv5u2wtt3o
	uarAgWKaqz1a3trDsQm8mfNEUOIIMW3b408KrR8iuuDiIPKBQYxYr3T0T4f5DHP4roWH/q/dkAh
	2gLBRSE2X2DWwoqcftsnOEMnuqY7Il4bx1quYhFDVSTEPlw4rH9LsGch4P3LFSkfUreyMJ0S3fy
	EFCz+WV6S594whUjqmc25Uej2f8984pbof8gk1RpN0Je2HVTxJQ/sXWXJZp30GfCJt03gX8l8E7
	grwYE8jQR6t+XQlmqJoMFAu6FH84=
X-Google-Smtp-Source: AGHT+IHLu0Y36JRC+51o0vyk4KbOZ8N6uUlsAc0UT5MymiVYg29nPUAml9edHiLfIvZ3aUgSS41LBA==
X-Received: by 2002:a17:907:1ca0:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ab79df1e783mr831432766b.48.1739187980240;
        Mon, 10 Feb 2025 03:46:20 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:19 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
X-Google-Original-From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks, and resets
Date: Mon, 10 Feb 2025 12:45:33 +0100
Message-Id: <20250210114540.524790-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for CRU0 clocks and resets along with the corresponding
divider.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 51fd24c20ed5..5d02031219d8 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -28,6 +28,7 @@ enum clk_ids {
 	CLK_PLLCLN,
 	CLK_PLLDTY,
 	CLK_PLLCA55,
+	CLK_PLLVDO,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV16,
@@ -35,7 +36,10 @@ enum clk_ids {
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
 	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
+	CLK_PLLDTY_DIV16,
+	CLK_PLLVDO_CRU0,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -49,6 +53,12 @@ static const struct clk_div_table dtable_1_8[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_4[] = {
+	{0, 2},
+	{1, 4},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -69,6 +79,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
@@ -78,7 +89,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
 
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
+
+	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
@@ -154,6 +169,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
+						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
+						BUS_MSTOP(9, BIT(4))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -177,6 +198,9 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
+	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
+	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
-- 
2.34.1


