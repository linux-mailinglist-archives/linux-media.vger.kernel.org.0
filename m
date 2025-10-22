Return-Path: <linux-media+bounces-45257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1055BFC80B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0BE19C1132
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFD234C828;
	Wed, 22 Oct 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWXN0sZs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A4E34EEE9
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142912; cv=none; b=nZhMRfyz/2niE0cUDnYBmiYIS9IMh+/G5nKyYRJIeNROeLv7KpgmvYZaiG+sx9+S/zdZbJTOfAbTZhvvRF+/4Mbx/XHqITTGb3HT0V8aRTlykbcVaDw8PSuoezfJVhymk4+A0AF+F+oeyDor4/mAdEq99TuAk88uDbAFgaZUS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142912; c=relaxed/simple;
	bh=oogKzOkmRUHqbeJIXHjFVmuliJy7HLFoYw49y22EcBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxI6FYeyuQS1/OfGPr6ym1n787PaULN+Vw3PeeULsjJSWq72hYgvcFhxFWpF2dA0WcHqZZJNC3tiJtTD1FlLpzwXc5ponRxvKKLaQ+XXsqmYNGay5XLLwBmcowxKoCYV+f1+Hf5tbTUfDZwasCkrfsz4qLgrdY3qn33dxMuYni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWXN0sZs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710022571cso58947085e9.3
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142905; x=1761747705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FSRFPudzEKyK76m04qsFR3ktGMJkJD3i+v6OWuiw2c=;
        b=QWXN0sZsU3lD3l2v9Q8PuhnoxfwaSAPAE5mEMmyupvzcB4RpR3uThFBfgXoK3xJeEW
         Zp3stkVbuU+z+G3JwP9v1usbZDjQgfQWVRZ/zAFO/Qsva7cKwCLAn334WVxGeTWDvMAN
         kMMsjbKQnPgEFWP4WTgEsEsKhFShLa5cm9OoDDVOR8zZXwQ9kwisAmdFeFe4Bc4h3PCX
         k4srZFnT8QcEZlg/G+UcpS2GLOYh0BD8kFdkNUegJZLKlOVqNsYFbrQb/k8GH2kAN3q/
         xE7tvZFA+AYEcMXKxqIA44/2gdobONwalgwJ2zJtLtEwQEm29oL6nn8ovunu/two1sQy
         2rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142905; x=1761747705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FSRFPudzEKyK76m04qsFR3ktGMJkJD3i+v6OWuiw2c=;
        b=ZmqikrD23fEQz9XNOoOh7ulGRUTd2vOXLlOH4in2XCzCRGnRPcDRD2OTvUcUVuIXmA
         hUiB/Hy+lu5ABbaTw3Iq4M3ogICiNWRyQefDu50F16CFzhTESufg7FfNt88nqOR34N62
         9/rKNpyZTDMtpLxGzW15QRThGWbQYfBx2RtixN3+IYkAGjh+FRvr1yNw+LcESHRDXpa/
         dFzT9evNOm61JSluqv0bZbmJKsfX4UwpdSyHw9YiE4lyL8et16aHDvkzFAwgNpAjxVsH
         azJQtFazxddHRhO5lyU7raaWEBiRd7yv2eMIla4Jwa8SpxBV2yqBD65Z/XLxGRyGrFBN
         8O5w==
X-Forwarded-Encrypted: i=1; AJvYcCUoqxg9vUCJ4L/UuW3c+RBK5qA/pidbh/2XsE+RZWawZ29brv8F07m4sIve5/MfaYM5jsnTGOqnjlmvxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkgLP4KDCEz9fw9Qz84+d5Yn4INp6E230Q2XkoWm/s4e0EwM/K
	c4XANfSkBu9j5qdvW3F7wEz+MWDsBe/PRToq2dr/9Tu33hKoLe/f778j
X-Gm-Gg: ASbGnct0Ifc98N18G9BwVmfGRK8Y3r6aq73rS3K4AmTnb7Te3V6Uh5NgZ41oJgAuNpp
	CQM9Cs681bODvpyXO1yJy622odiOnPQIgFDTv37ghkm1hzln9gGbUrpTcdNRquIOoFre2t1LUcP
	elydHms6OhTnZFglHsO5KEXAk5nf3iKqSF/E1g2Y06f1wpiM01EzgJVfxm/avtuu72NreSwxod6
	AeWItl8bqZY71FRbA5XteCHswMGiy8vhfpF0SByE41DpgRVVHrw/ylcKMlGZ7nct2zEUaNyyV78
	gMf0l2U7UpyPPjvH90OH2xiZSSTKCRbe6I+DN7JCH5j/84Z9vk2hqpChj0x/kVpZHtOYYifx5gV
	AAvYj8CoJRPf/HkNcoBq3pxoHN5ekF8AcjsDpz7ZY3NKZ8zYgcOqVWFfA+AprqHczig1X6x4KgP
	WjeA==
X-Google-Smtp-Source: AGHT+IE+R+MFV4kZfuKKlqZW+VRqACGxd+UeQjJKPUWrsEGvn2bnxhzqWlUevwPhO9Lp6LuefqTXKg==
X-Received: by 2002:a05:600c:3f08:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-4711791f738mr170626375e9.37.1761142904892;
        Wed, 22 Oct 2025 07:21:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 12/23] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Wed, 22 Oct 2025 17:20:40 +0300
Message-ID: <20251022142051.70400-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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


