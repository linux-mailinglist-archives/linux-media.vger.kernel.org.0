Return-Path: <linux-media+bounces-43186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F166BA0454
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACD541B21624
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D4830DEAD;
	Thu, 25 Sep 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8XpQF2d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0430AD1C
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813457; cv=none; b=e5HDOvGiCUsMWtuvIHJ3bptqOjwtR3BQ1npVHUo7rq2mjGRAXRAOAktOeXEcAGf8Oq/txuL67JQGzpTySzlY5/sToFE2SBES1TcWBlpeb1FjWQ3o2P/cMnzCWShavpE30ylqbKLwMfIBoliywvl32jZYjJZu/2oLB+s/qLqpOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813457; c=relaxed/simple;
	bh=oogKzOkmRUHqbeJIXHjFVmuliJy7HLFoYw49y22EcBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnxyNKsuS1zhsh+JyNwe+nH4Yw2PQO3QPa2lrZQ0rJFhX0NMomVhU1tF5I5P+FquKvBRtMiYniCnfwPBgcLsi0PnK5RLJ7eUVlFL63b/xXYj+pzgNZEpIFXDXFy+X6P5QAtLgkRbh3+vQyvVB7es99CBvNkqtK2GqYoxIFHewRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8XpQF2d; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57933d3e498so1186464e87.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813451; x=1759418251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FSRFPudzEKyK76m04qsFR3ktGMJkJD3i+v6OWuiw2c=;
        b=L8XpQF2dMlCDMK4XGshfNH4mVaoLq0ZKekz1kUJ6DUPbLFgIVTGPCrMLayPW3ntelp
         1JiO3C6n6FPInPd85DKegLhHty3GYARSd3MIRtkC3AxhxpOStC4oTRXcrc8Nkx7SHtaU
         DFZjb9/esMQul9LyEfem2Wasz5nw9PubvW98nO9/6oJSXmXKBk0PGCsjm6LToZ7mEsUM
         k8NHbRrT0l5TNPsnuVc5zvaXNat0LZztHXpth5FFWkK3YtOHPzHClnP8hTFg1iBDdUse
         +Ax23emDarzdCRWdKbkCKSqSJq1QJGUdLkb7gL7Vpn3B9WvVwr6uuHZjrXVn2oorZ5YE
         RdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813451; x=1759418251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FSRFPudzEKyK76m04qsFR3ktGMJkJD3i+v6OWuiw2c=;
        b=FSYpUYGtQwRfxvUQqmkI/+VBSGAjzo72qU5eL/s3FQF8TfXUKMFR2qkOsv1mTL2fiV
         8tO0ufONDcyLbChgaG3axOuFbU2J2QsA2tsp+GoxNHKY/8bTDMjJJO2uDIW/7yrcNQRq
         L+P8qOKAhX24OuQ/84w3kif2QuwCybBEuG6z1kznVmu6tJmKGmuDkd2ZABr2ToWygVxD
         30rdiee2GIkfa2jqaKsZyi5QaLwsDKpsMztj1Y34pwIhGq4gwBulHo6IPf1SEEkVtVOr
         IYCjrZJldOFgBf6HwrzJBGhqa8dYX8mw0JifbVJsXbooH/h8uxCamQsGtCWYIAWziCAs
         oe5w==
X-Forwarded-Encrypted: i=1; AJvYcCWRjh47ccf4dE9w+CjDBYRYXBY1opreX6JKHbaGRraukMjJkDg58jLnTksJdsIz52tRcGS3oSiC6m8IDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gaCLvJUvp1VNefLgHs0820FjhNibGGQCc/MJ9tfxA+g5fguY
	mJJbwXSkB7cK6eoIxNZHHt2wJ7RcWMhZfazbzNoSPlE3yyX4+p3OpOPK
X-Gm-Gg: ASbGncuRRqMd4TQedwaM6keFrXbpzMrYfcWz68ZwSNjvcMeDKPIn8R9bBx6swRF4YGn
	S1p+n8/j3W5qEGtvHNwxyRHAYkyOUeSBiYWArPYGaZiY0zz0MND0QwpDWokPMw1p1Q0fxun3785
	mbsrM81TxW5LKM4+/i+Xi/yf0KZROJLFylcdPjkzQG9V+N0T9L7WNuxNw0hz+lBO/OfMgp5mYbP
	3Am1Q7i5RSyZ92C3M4JrAoRasm/8rdBAr9eNuT2b6GjF8TPLun6RuCpxyFfDOrbB3NfTyRt149M
	KRdjLLZ8btnG+dRYAH6q3NFPtJPuEMV155nUFh2VBdjWwM0n9t6CP0P+mRb9qP4FX7wT11/nM5e
	yDY5QR0zGP5X9ag==
X-Google-Smtp-Source: AGHT+IHRCCPwpFzIrnL2p/TDgPO95O9ITZ5a1oX8XTvwMH7qnlAL6Ra8udUIkuKkerDbTH21ejsiDg==
X-Received: by 2002:a05:6512:12c8:b0:57b:f151:f321 with SMTP id 2adb3069b0e04-582d0740b32mr1075096e87.2.1758813450809;
        Thu, 25 Sep 2025 08:17:30 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 11/22] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Thu, 25 Sep 2025 18:16:37 +0300
Message-ID: <20250925151648.79510-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
proper place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 19 ++++++++++++++++++-
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 23 ++---------------------
 drivers/staging/media/tegra-video/vi.h  |  2 --
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index ef5f054b6d49..7d70478a07aa 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -710,6 +710,8 @@ static int __maybe_unused csi_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(csi->soc->num_clks, csi->clks);
 
+	regulator_disable(csi->vdd);
+
 	return 0;
 }
 
@@ -718,13 +720,23 @@ static int __maybe_unused csi_runtime_resume(struct device *dev)
 	struct tegra_csi *csi = dev_get_drvdata(dev);
 	int ret;
 
+	ret = regulator_enable(csi->vdd);
+	if (ret) {
+		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(csi->soc->num_clks, csi->clks);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
+		goto disable_vdd;
 	}
 
 	return 0;
+
+disable_vdd:
+	regulator_disable(csi->vdd);
+	return ret;
 }
 
 static int tegra_csi_init(struct host1x_client *client)
@@ -802,6 +814,11 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	csi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
+	if (IS_ERR(csi->vdd))
+		return dev_err_probe(&pdev->dev, PTR_ERR(csi->vdd),
+				     "failed to get VDD supply");
+
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
 		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3ed2dbc73ce9..1550defb115a 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -137,6 +137,7 @@ struct tegra_csi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clks: clock for CSI and CIL
+ * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @csi_chans: list head for CSI channels
@@ -146,6 +147,7 @@ struct tegra_csi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk_bulk_data *clks;
+	struct regulator *vdd;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	struct list_head csi_chans;
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 04b538e8b514..70607a3eeee1 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1417,29 +1417,19 @@ static int __maybe_unused vi_runtime_resume(struct device *dev)
 	struct tegra_vi *vi = dev_get_drvdata(dev);
 	int ret;
 
-	ret = regulator_enable(vi->vdd);
-	if (ret) {
-		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
-		return ret;
-	}
-
 	ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
 	if (ret) {
 		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
-		goto disable_vdd;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(vi->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable vi clock: %d\n", ret);
-		goto disable_vdd;
+		return ret;
 	}
 
 	return 0;
-
-disable_vdd:
-	regulator_disable(vi->vdd);
-	return ret;
 }
 
 static int __maybe_unused vi_runtime_suspend(struct device *dev)
@@ -1448,8 +1438,6 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vi->clk);
 
-	regulator_disable(vi->vdd);
-
 	return 0;
 }
 
@@ -1894,13 +1882,6 @@ static int tegra_vi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
-	if (IS_ERR(vi->vdd)) {
-		ret = PTR_ERR(vi->vdd);
-		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
-		return ret;
-	}
-
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
 		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index cac0c0d0e225..bfadde8858d4 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -94,7 +94,6 @@ struct tegra_vi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clk: main clock for VI block
- * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: vi operations
  * @vi_chans: list head for VI channels
@@ -104,7 +103,6 @@ struct tegra_vi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk *clk;
-	struct regulator *vdd;
 	const struct tegra_vi_soc *soc;
 	const struct tegra_vi_ops *ops;
 	struct list_head vi_chans;
-- 
2.48.1


