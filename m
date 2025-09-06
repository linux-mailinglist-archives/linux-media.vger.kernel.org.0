Return-Path: <linux-media+bounces-41887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA9B46F4F
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2F53A0860A
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A232F3C16;
	Sat,  6 Sep 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBGgsFLS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D92EDD6D;
	Sat,  6 Sep 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166847; cv=none; b=uGlO1fLPYeG5KWQ0Zbdi5RKBH/dkOqpZpHoyBd003/1ph86OS4J2sztp9Tky7ahWFYsyk9lesZoWMW/rugYKofzJqzPHA9OALHjPSZ7F/aSBIomQ9ueXBdQurlE478F9Pudz4855T3jizUg21CTLaofjRTg2N68YxLNTkLhwPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166847; c=relaxed/simple;
	bh=oRIHbapBkvIFjd8VdjV2tS2YmyYnsoUP9A054AJ6f48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsJ1/JtCzxE9XeVEARZDoou+OD+fdCLRL11cqPmscJlwq2qkrVwGy17SoVkBVkUPP38PRCIh82A1/iUAi9mI9nyKANWrzYPe+cz/+At64dQEfMbwoN9QJhkIzMpoChX4XxwjNSMVhjm87mBZ0RbXgfGSa0xTYW0/Ni0hgK0qvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBGgsFLS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3421543e87.0;
        Sat, 06 Sep 2025 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166844; x=1757771644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4lbvGVubD56OxVIYTjbgJT72UrL69nk9Yl7GjbDpm4=;
        b=DBGgsFLSww9WHIJstjIOdhwNfQoludU64CL9D4f11GKr7+SsHXHqzhuxozhHmbrMgn
         TRSbvgtj3c7FU9peth4eOivC4uMnteTPiKtd/NyIXCsiydwBhFWsPOHT3zT/MHS1bOK8
         LrpB2pf91GpvAc+bTsueitr43vvlXEXK0zFG+FV9y2eh+7lrXFVPRKDo7up4N+9n/cHG
         hwI2ybPnUQxI/H7dPmUc+InJg+4J43BX0ItxXls/+oyCfvV7FwBSZK7QE2eEzvxozHOZ
         VPOc+xC7/5heGH9ygSkZX0RuMJIwKUcOSKyrlwalojN1PBaKSFS0apExX3vORMLlTN8H
         COSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166844; x=1757771644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4lbvGVubD56OxVIYTjbgJT72UrL69nk9Yl7GjbDpm4=;
        b=UskC8DPKHlp44aeiiLT8C34wQ+M6e2eq47Lur7zFJ3x1rfgibFEXS/zYYUJJDwz3Lp
         33q4JbozwsF53O5CVPf1GD1jpCD+SZddn0q5+Et5JhZzKuoFwqAmBNV9t1WXMBQ3vzbg
         WNgaJctplG1lZD14z7/Dd0aliX3mYLTQ+Ir0ZMqp4W9wB5KFj5i+QkBwozQosJ/Kc+yz
         yajDKNBx0XXWhGJ3XgEVtZrV21H9IPKFiLngMgJJ1EYj1sEHvG9wovilpsP9a4UUkwWp
         19pCyxIapDrGyN5B/hc36/b1TT1lwsNuW8V5QQGvnnAs2A1L9QkN3kYRxIefeAwc1T90
         +WXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6hvhxkyQnz/Crbc9NMT/nTOdFgzxHYxsODVKiqXB1AyUUwSTh0bT3o5d+IC8JIadyRvlwYuCraBkg@vger.kernel.org, AJvYcCW5Dtj5z9g0jxwQ56cGidmMQziIdY+9CeD3n90SUA1XovNTomtuL3D15EJUmdXotSs7BCRrX+hKBWpk@vger.kernel.org, AJvYcCWFtmlSwGRuS7nqVMcsO3wWkQ+XXYYHCNuz1h7ib0Kl73MciLkeoHVPiqDbO/dfKJTCPKh36WQxO8a6tj8=@vger.kernel.org, AJvYcCWqO2qHtiSCftyER6u8QEEYCdotu4aFL4VCQOT/7o1lkbMx7oaSjDlw062mbPUoz7V7LDzm5/tjN+l8WJY=@vger.kernel.org, AJvYcCWwpEDlPKbx2eHhadqQHaG1cLeGR6Eyy8Z58tVgyGbje4G6K0ToHC/rNPjdKxyOW/EOE6wOyq9Ny7Z1igT5@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHsF9XIpOcBIabWhFDHaDO2eZgKww4h1cX4eAAevtApeUyyrz
	DUTL62t9Xhl8A8NMlOQt7lEfxLhQn5s3anC73tKdZixmAkEDaZwTbCFe
X-Gm-Gg: ASbGncutuyK7fsqi2MBgROkyZFdZz28iKEUQe8Sj1UYu9MDOuWponvVxPqH4nQkV+AZ
	T57Y3vYrPKFdizBL1rz8+PlhveTLDdw9ro9K6ucdYl4FpdJwNMT7MBF+gSR7ideBQQD8tFaTW/z
	5XVRxGMy55kdFLbUqf0YtsxUygTo3YxVz4/ySnPg+UKiSr1nP9cKU8VnqIpSwiyIQvEM2Qpu3KK
	0XclmyCOhLtQLwgqnhK2HXRv9HpiHYH/TzIyDhGtIVtEAUN3siw2XRVwUkClEVldG2rZuYCGFXB
	AIuA+/DN32GqUobkA3dy5Yb/LkCZD/6z3UuHXEIGjCGY+VZINN/BxrI6mrzZudN0p4+Kk5yQiT6
	5lpdtqiW6oIvjHg==
X-Google-Smtp-Source: AGHT+IFbSjW+2df8ovhvrvEYVHwTDb6GcdY+zCQF41mbNwIX4MyigO2GWVmHYoRhEYpkxCfyDxwxvw==
X-Received: by 2002:ac2:51ce:0:b0:55f:48db:813a with SMTP id 2adb3069b0e04-56263ba3098mr617510e87.54.1757166843736;
        Sat, 06 Sep 2025 06:54:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:03 -0700 (PDT)
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
Subject: [PATCH v2 01/23] clk: tegra: set CSUS as vi_sensors gate for Tegra20, Tegra30 and Tegra114
Date: Sat,  6 Sep 2025 16:53:22 +0300
Message-ID: <20250906135345.241229-2-clamor95@gmail.com>
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

CSUS clock which is camera MCLK, is also a clock gate for vi_sensor so
lets model it by creating CSUS grate with vi_sensor as a parent.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 7 ++++++-
 drivers/clk/tegra/clk-tegra20.c  | 7 ++++++-
 drivers/clk/tegra/clk-tegra30.c  | 7 ++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 186b0b81c1ec..00282b0d3763 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_tsec] = { .dt_id = TEGRA114_CLK_TSEC, .present = true },
 	[tegra_clk_xusb_host] = { .dt_id = TEGRA114_CLK_XUSB_HOST, .present = true },
 	[tegra_clk_msenc] = { .dt_id = TEGRA114_CLK_MSENC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA114_CLK_CSUS, .present = true },
 	[tegra_clk_mselect] = { .dt_id = TEGRA114_CLK_MSELECT, .present = true },
 	[tegra_clk_tsensor] = { .dt_id = TEGRA114_CLK_TSENSOR, .present = true },
 	[tegra_clk_i2s3] = { .dt_id = TEGRA114_CLK_I2S3, .present = true },
@@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA114_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA114_CLK_CSUS] = clk;
+
 	/* emc mux */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..bf9a9f8ddf62 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA20_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA20_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA20_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA20_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA20_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA20_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA20_CLK_BSEV, .present = true },
@@ -807,6 +806,12 @@ static void __init tegra20_periph_clk_init(void)
 	clk_register_clkdev(clk, NULL, "dsi");
 	clks[TEGRA20_CLK_DSI] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA20_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_CSUS] = clk;
+
 	/* pex */
 	clk = tegra_clk_register_periph_gate("pex", "clk_m", 0, clk_base, 0, 70,
 				    periph_clk_enb_refcnt);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..ca367184e185 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA30_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA30_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA30_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA30_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA30_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA30_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA30_CLK_BSEV, .present = true },
@@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA30_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_CSUS] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1


