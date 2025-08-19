Return-Path: <linux-media+bounces-40260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC6B2C31D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0625680F0
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFE1340DA0;
	Tue, 19 Aug 2025 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2c4Lqz5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49C33EB05;
	Tue, 19 Aug 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605810; cv=none; b=Mh/TEBWWyO6IY+H2Ru1reYbWSFw3kUv7SmnW24MqUT9De8IZjJABA/vKMc04C8/VRwmti1TGIgZwdPeujBSYuvN4E+PCvX5C4l7Kgam7gBiag9TIpZyoDHWuNWMInEQnL+q71kQnPnP4miIgO97ltH4DmG8z10ZuqxwwARrHxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605810; c=relaxed/simple;
	bh=A6JDE2qj6/Tmrwz2kzL3eYIsuA6v/5h7ZSerj7GfmtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBZAijF2PYrrwnv193hg45INWCbI1EpPZT3Saqb5MdYlmt3AJTRJWMaHNMxm22qQJ9McXhCu6h78bZb9BAbVTtNfquh/vG57Q5aHjt1W59QoStkUXJm2IwsHs3gtfBvOFXPlhQP+kIIZKIlHoiJoiFgIM+guGkXvx7IOSKtM9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2c4Lqz5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ae31caso931374066b.3;
        Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605807; x=1756210607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iBp08QNR8Td2vyYWnu87FXoNEPHv9ZHxpFhDONz5Gs=;
        b=U2c4Lqz5+Ru7zRbwjVjV2rNLzoMg6rBFeTH5lCIaEnzFrht5o+atgLof2YC7FWOf/j
         MtiirRArUiLXCOcFGRSA1xIcsZFaH+XJlC5a6mqt3T6e/8hytgPEWWzIzuUB7PVTmgOO
         rTJVZMTGg8NDpsDfXMtbevTZcfsSBmlSsmhNuz2cg/+8Dal5kfreIs/22cz+fw/hgmxI
         UybOnnJN+mOX0k5ysFVgVFqiT/46pYs8nNQQo83xKDh/UNugmrF7ER0aHXcyVLEm5OuI
         soLZcqHuI327Ansbnu4UHqWdj9LTCqBIhKSw5nMnmmhDLcEyS9Yn3/zBPgEp9inJp51A
         LtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605807; x=1756210607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iBp08QNR8Td2vyYWnu87FXoNEPHv9ZHxpFhDONz5Gs=;
        b=M42Jx41oy/eh3ddXZM0jgDUISYdlUv2pckmdIFlJlwCAKTXOzVDUqbbi/TFYaKnCuM
         a1t0/GidmkTGwJseMb02Cuka7+2UYZpXFbdxyZlfCqXb6mS9LyzL6JredJcZzqLjubwT
         QvDB1qCBmPTchaFTAqWpz8XEQ+fnZYtWV8HDNNaXY+ZDG1KsdV9FF8tSLHH2gQJoDVGf
         BGTV0OPtgeT2ZSrIHYZuPYLeusOLYLktaZNYdTwM5B9KpQaQ+h46lVYPDiLLcvOafF8X
         2egvVS7Ve56tdWNsMip8QMzynsrabWAFSOfd9RdNye0ewGCPdPfuExI/ya58RQCkadVR
         mNIw==
X-Forwarded-Encrypted: i=1; AJvYcCULpGZ0Sc+L62EC4pW8VsU6twC7oGNQlFolYAzHM3z4ErhNqAcNbiq616vsm5lp5KXIi8AUvXAZoNz3@vger.kernel.org, AJvYcCV3bSFLWHFALbDFg+TBgbWSXSRUZFk8cFz0kAexdjtfk/RhjAr5oYlOGOyYdgdb9WdXaycldEbhPiGmY2E=@vger.kernel.org, AJvYcCVAKJeGdqykleTVBEQry1jfngBMZjbFTrcWLFCEpyoufiZuTB5EBmQhr2v55rM6zU2yFPS2KRvwb2U4UdcD@vger.kernel.org, AJvYcCWnFs+VW3lysecuGUL/gTkUA9KXdM/omxYT38GjGoZLuDOYtRF8pli8cOWa4JTwJbV6F4uUu3eKCq+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0G02Nn7KPcWOIBXMkPsm7I4CDbIc1Qc3Bm62n1t0QpOe9QEdQ
	sEp64riDxYbA8xG1icj8oM6QQurKujVHd8ofRwoA0COl8v1+JfalAWvj
X-Gm-Gg: ASbGncu9a6TvgiaKdEqPjMqe7/4MAC0zt04+169TDwQnqq1QBmIoE1tNZprZLYBX+Hn
	4ELu5DwuZx/kTvCFvnQfPo5G54Uy9zPspVLpBoMrpFDdMC3sb1eDLhJH4jdvt9cRm26FMp3Rgxi
	mzAcHRkCLgoMAsE/306kheycWWckJRZ5WwBf54YWaXbDqIKD1fl52UrSekjW2gWUmELUlLS7zul
	j3oCUM1+lzvBtfxslqWS26edZHXX//ztb74AxgxZQlS2WQ/VPy0NkXp4TTVrY6nGSBbuEStB13V
	We8yPxY+qkQTa9YH7mmZ9PDPhpypk2sRkAWAJQUtwdleaUO+cUuAeH7OB+pIwNYnbX7FM2jOCYZ
	K8O4ln3Db8pYoGQ==
X-Google-Smtp-Source: AGHT+IEYZ39tq8yeh7XOkopLmn5iOqMcjzDRT5nnlaEu9RQqze9ng8oVmePY8pq8xmtyZEUdZCdUDQ==
X-Received: by 2002:a17:907:3e0b:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-afddd0c699cmr229709166b.31.1755605806678;
        Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
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
Subject: [PATCH v1 03/19] clk: tegra30: add CSI PAD clock gates
Date: Tue, 19 Aug 2025 15:16:15 +0300
Message-ID: <20250819121631.84280-4-clamor95@gmail.com>
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

Tegra30 has CSI PAD bits in both PLLD and PLLD2 clocks, that are required
for correct work of CSI block.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 70e85e2949e0..f033eb1ac26a 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -153,6 +153,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,18 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clk_register_clkdev(clk, "csia_pad", NULL);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clk_register_clkdev(clk, "csib_pad", NULL);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1


