Return-Path: <linux-media+bounces-41899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C3B46F9A
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00BAF1786BD
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BC93009C1;
	Sat,  6 Sep 2025 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFrnyH1/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABE2FF153;
	Sat,  6 Sep 2025 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166866; cv=none; b=HkrkhcCanBLm4KkWA2gVmQhNYJ4+5Mw8T6JCP5WNnrLw0Zllh4pZmjIck0dNG20BF4xSDpg0G1UqDJVAtae7bVqIjrN+NCDd3loGdUJQQB4M4B4ovUzvO289Vpe6UgpbjMVml6yxVnGblnT1onU56Y4pyTaut3Xmm8rRv37le7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166866; c=relaxed/simple;
	bh=65j6LwR4mJiY2H/RFsjkUk04+hjmd9f5nUARp7ytK+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UISO5eGH4XyPxcsm3rhT/wMvHRNWcmq7yI9SOtvbOJBGj/7nH2FwS5PyU9J8bI+RTJzdmHwRyHStBvoH9uIQ9xj1m9W5yzD/Xnsam90dppdw6fhu2lqWcaM2o3GkyCiQ/IYTDnoz2xh3exWui2x/RMDmpzTeIHil3aM+ju/fUuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFrnyH1/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so408395e87.1;
        Sat, 06 Sep 2025 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166863; x=1757771663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vTlXJ0ADIeGEtY5cxRTfOE3Fzno1hN3qUAjTXoRk9Q=;
        b=EFrnyH1/JRixB8ZkLYcdQKnwna5rU6JOVeREFdw1fqMSEiLWE8t3mwHgbp/ecfAyFZ
         1B7DVUEqspqGCF45oY1yvWP+a9Xmx3GtZbKGUHyPAvas39JEJvFkFRuyV6PyKqvwIR1q
         2KhJmndQ48wRjRJrwTco9oo5NcLV5oZLtAuEzj6jnxJsBaZKXczrgEmws6QmYQD7Zv95
         R2iRUrx5V5jPOXo21D2aClXJVSgLPPkipS96+W+zzBJ91RT5DuFtPixDHKy2FJ6A+A2N
         4Y0ei1KX4AnCYkS+Prt/Ecbte3X0sKRhUwMQhPvv1N7iwJPggnk2NrIvl5OS30fFxvrv
         /k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166863; x=1757771663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vTlXJ0ADIeGEtY5cxRTfOE3Fzno1hN3qUAjTXoRk9Q=;
        b=gWMLw+m8+jMtUUMjypq/5A1CqT/dYYeXMX67e7vMsVOKlz1aGThBVNEG+zUcHadvUu
         UGUNBDQi9NmqLzgDr8ofigtjzmbPeQDnvk3T4+6xochVRVNTZapcaHSG1NXDEJeGW707
         betQIPMjdjVHKwPFy5bk7z0QUcsbvoSwKT6ZjzEIYMecIcBy3MbR1dIQdF+tPxUUrgZj
         zP7M+7nyZUqidi/DTR3ZOhKYzPf+SDJEzJdsR9OsvXsPCGye5UJzBFbwov6Gck+hiwDn
         Ljt3VnaXEyPxSJfn0kAeEu0K5s+y812C+/sXSOhbkhbrJdCXyf/cJjwuD1vy6EJPYlDK
         I4rg==
X-Forwarded-Encrypted: i=1; AJvYcCU1jDWMhhqAhScJMuMiIsudAv4Txs3r5BiEAYbuiMG9V3ZSkTDxYBzBP6jfiQYX++mq3DszY2rTI4E7lnzD@vger.kernel.org, AJvYcCViLHOEKoXSx5o08NRSulphu0SVZyUXcouYhkGxxAS4tEVP3nP6BRAMxNfiwWyOBEwYHY1Dgq5isAlV@vger.kernel.org, AJvYcCWM3QCkFLscxXQc+fbTjrunOQ6tm6Y0w9loRTL3/rW+pZIrf76CYFBicQnrqhx6sji673zFI8aurRVPaeM=@vger.kernel.org, AJvYcCWh35I2+00+fZfaflimWlWMHimqBM+DTP+hcBgLMFrIHGSzAqct1q9of4D1DbCIdki6XK7mB6q6VGPR@vger.kernel.org, AJvYcCX4HApgh+2ufNYmWNx0ikiYuenDCA/E0oNH6VYXXzeoKaJGbV/KuyF8x8eRgbeF9gnf+B5uaBWXDF0ajlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYX8Hx8G0S9ODipyMvWE46ITQSFyJpSRPztlJMTTJx6T1kjt9N
	XJSFgku1dN7ouSBnEu/mtoaN+TNuM6ghRu3EhiCzxZOB0cZttPP+sTqs
X-Gm-Gg: ASbGncsIOs4VFobHHrxbO0y/eEAuOP8qc4qERrupDwfiqWeQZkYugds9Y6HE0gt0kid
	uO0g6ZH0b6Vjqa9NE9x7PMPNkyjpOpkYmJ1EXn8W41U/ns4Dz2xeTnaw7ljRIzEiWIRjwskOxj9
	0DeaOYrt8oxV8wIKox35+0pQXQYqF8dFKASfHWpfkroAxPDc31ZW0+v98UQ8CxL9nZg7Z59qo9h
	ViOpInlttoJj0gXJ6+okUlkQEtNRkzDAeTFpoMLuFlgxLdQoUk3EGVhUKYvNhZ9LuyOyY6vju+r
	180Prl1RI8y3VSBLSpLIcWVWblAr598RqvkUjX798aOSUZx4kAcHM+3C7TejoOze++8KfIoARyo
	kOvaqyRXRDGXx/A==
X-Google-Smtp-Source: AGHT+IHwDEExXcShBRr7iwUZKOVrNMOfF2rMEiTh8K8LE2hhdC+VYvqxYCvbDotc3PEX8XolwsvD6w==
X-Received: by 2002:a05:6512:138a:b0:55e:990:fff3 with SMTP id 2adb3069b0e04-562648219famr575340e87.53.1757166862562;
        Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
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
Subject: [PATCH v2 13/23] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Sat,  6 Sep 2025 16:53:34 +0300
Message-ID: <20250906135345.241229-14-clamor95@gmail.com>
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

The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
proper place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 19 ++++++++++++++++++-
 drivers/staging/media/tegra-video/vi.c  | 23 ++---------------------
 drivers/staging/media/tegra-video/vi.h  |  2 --
 include/linux/tegra-csi.h               |  2 ++
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index c848e4ab51ac..1677eb51ec21 100644
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
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 2deb615547be..05af718b3cdf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1405,29 +1405,19 @@ static int __maybe_unused vi_runtime_resume(struct device *dev)
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
@@ -1436,8 +1426,6 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vi->clk);
 
-	regulator_disable(vi->vdd);
-
 	return 0;
 }
 
@@ -1882,13 +1870,6 @@ static int tegra_vi_probe(struct platform_device *pdev)
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
index 64655ac1b41f..367667adf745 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -93,7 +93,6 @@ struct tegra_vi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clk: main clock for VI block
- * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: vi operations
  * @vi_chans: list head for VI channels
@@ -103,7 +102,6 @@ struct tegra_vi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk *clk;
-	struct regulator *vdd;
 	const struct tegra_vi_soc *soc;
 	const struct tegra_vi_ops *ops;
 	struct list_head vi_chans;
diff --git a/include/linux/tegra-csi.h b/include/linux/tegra-csi.h
index b47f48ef7115..85c74e22a0cb 100644
--- a/include/linux/tegra-csi.h
+++ b/include/linux/tegra-csi.h
@@ -139,6 +139,7 @@ struct tegra_csi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clks: clock for CSI and CIL
+ * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @mipi_ops: MIPI calibration operations
@@ -150,6 +151,7 @@ struct tegra_csi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk_bulk_data *clks;
+	struct regulator *vdd;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	const struct tegra_mipi_ops *mipi_ops;
-- 
2.48.1


