Return-Path: <linux-media+bounces-29005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FFA75C8C
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E783D188B0BB
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721DF1E8345;
	Sun, 30 Mar 2025 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmhRb7u/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FC1DEFE9;
	Sun, 30 Mar 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368900; cv=none; b=Y6tB4RrXXHWbyxqhVLrmuOgLzHY43POyV3fAcTl5W2F+w544+VvsfbuSxVHLsEGxqsjZaEWEBUXy+f2rgXdhsxlILd0P5M5RdxflAxPlGwfUC80AGXr5rPB4wkm5T9/H7kXL33l/gou2UHSTX9eG0mE6LlMuSlaBQw1zQ0sfUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368900; c=relaxed/simple;
	bh=JROumQIMuL2tEIbg+q4tZh6YElwxYECYEYCtgx6QE8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9IfvhtMK8PMX6XzVHJ4EL51/7Rny+WmBs/eNMFzjxf2iR4OyOPv5dZ/M0IjfLo7FJOfaTo3MxGOpdOo/bP7/RvFPIsw4TYxwb2/p52RwlITMgOtnmJbGqVxITSNzd6Zx3x1Op69b7+Latf9u+kXAPRJ4vJIDbqzqTCj476fYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmhRb7u/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948021a45so38627915e9.1;
        Sun, 30 Mar 2025 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368896; x=1743973696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQHFR59dkqsOPoXxQiwxuI2Fxob9eQ6awblsa+mJ+JE=;
        b=EmhRb7u/r78dvn+TfKPcOiOuJ+HOsNUPZevRl10U9PTUc6fBXr3HFl4aMCH6Ne/yJM
         ub4on2ZVpCBKghiWTzD5WdIuAKcnjeoaXHXIwv7KLV+dMTEZxbSMJqBAGDbAZci8Ofhi
         K1LCwez86JNVSbJaqpki0FWK1Hk5550AaNU3uUXGE5bJUnz+fiviza6foDdJRGs/10Ds
         xt+2B/k+b0IM9sZB58aqu2EATU5AcJDKJs8nAH+YQkX3Y46p/39VODk3UYjMp+v1Rg2K
         dnucfDOP1or2poZ9A85UVMdCbBq6EAOz0wljOFa73iF0jCjgrBg+5AYO+gM1efBHxmEF
         Op9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368896; x=1743973696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQHFR59dkqsOPoXxQiwxuI2Fxob9eQ6awblsa+mJ+JE=;
        b=lBHt+hrjn7nHULWtfw3hPJ5wecLuDy/kmXK6nIaA4SGJXkK1fvw0gJ2Hpz8op17th6
         0bH92x1ilt3Qt5iE60otgrrTG6jocz2H3/a0ep7p7XfCnWN5JLV1jH71ok0cULsxSKp8
         eyJSimWst8X+MeGJx40ZwZZ8ThCoZZsAxFiu58jQ07ny+EiLqQKEj15cSXO4Z6LtRyeq
         NVS1KGX+BeGSlBtsmVz40gqU6yLDXWAwEPCDwFH+D31SMK4GK0XqHm/1HRCXaNPR4DOL
         MfUngilZUzkCNJW0Fr6BS9/nmUQzeo3ou/71BiC1XqhEUPY9czFOA4ppwtH94UdkyYX6
         ZkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP9BPivKuPXxM2MEAsFBhnC/zXO25eloI1HT6zXZmfUvZsJzbAE2ZUBMmpakA9LmsUPM53jNh3t7o=@vger.kernel.org, AJvYcCUhOqeq5LpxxLxvG2faNY2bURgr2VU8UilKXPRet3iGWr12OfeyNG/oO9KkUZuVZhG4XPY5STtj+XlYNDAy4O1q1l4=@vger.kernel.org, AJvYcCUrMvAerGCvDfOfqanKkfO7RUv7HbRUfo09GzbaGc0HX5ESIHPF5gz3ZHRa2iM+lV5x0lpVS/q7VcYLP3s=@vger.kernel.org, AJvYcCWYE/gw7y48mcUY5u2OxdqjekTDhJUDYYqwLSD4kD4FDpbXPS15AUWMsyayIwSpN6XfuX+/4qZtfAZFeoQq@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZ24mqr35v3WlYUCOFl8npXziWjDlzqIoRLPMsoXY5a0AuKZS
	6aLOylefxli/XpeKz39TroCeZOVRMiW1Gd++EC+TPmAbX11TKru2
X-Gm-Gg: ASbGncsZQJtel2ywe9lC/ir2DEKeP927R5yWsPyT/yhmBKK8fSYpaw/RaSxwFFvbMIk
	Dds8FidhJJ9KoxOmbCWEocaq45Tej8idmELuu1Akm09phpVQ5EaFVvzZS7aTZul8nVXBaZZUDq4
	G/WycMHDAMzV1cwWQpqxNxtWWSsK3GJODWhAeXto0lh+9u1jkw2/bgks+0hhkvuJ4eu9su4xw3r
	xYhAYfNhZxiUWzD6TBerN3AYWLeR7GK1UOu/ZSz513TJvaNmJ8hkxsAoiKF5XaWQzSpwyosyHTW
	f/Zv0YTxC40Mow3E+uJSYb7dwRTi43B7rpwHn+zqDAsgkWt6unJNi+NlfAbNN5ykFrRJZA==
X-Google-Smtp-Source: AGHT+IEks5Zd0aeJxmur0QRpEFpCL0qYNvoBm4U/H0V1UQjB+T7C1DuggC5cOUnZrF3aLLkGv6doHQ==
X-Received: by 2002:a05:600c:3d8e:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43db6223fb0mr61444535e9.8.1743368895509;
        Sun, 30 Mar 2025 14:08:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:14 -0700 (PDT)
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
Subject: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Date: Sun, 30 Mar 2025 22:07:07 +0100
Message-ID: <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

In preparation for adding support for the Renesas RZ/V2H(P) SoC, this patch
introduces a mechanism to pass SoC-specific information via OF data in the
DSI driver. This enables the driver to adapt dynamically to various
SoC-specific requirements without hardcoding configurations.

The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the one
on the RZ/G2L SoC. While the LINK registers are shared between the two
SoCs, the D-PHY registers differ. Also the VCLK range differs on both these
SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` is
introduced and as now passed as OF data.

These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support by
allowing SoC-specific data to be passed through OF.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 66 ++++++++++++++-----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
 2 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index e0379f099659..44b95082b29c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,10 +28,24 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+struct rzg2l_mipi_dsi;
+
+struct rzg2l_mipi_dsi_hw_info {
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	u32 phy_reg_offset;
+	u32 link_reg_offset;
+	unsigned long max_dclk;
+	unsigned long min_dclk;
+	bool has_dphy_rstc;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
 
+	const struct rzg2l_mipi_dsi_hw_info *info;
+
 	struct reset_control *rstc;
 	struct reset_control *arstc;
 	struct reset_control *prstc;
@@ -164,22 +178,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, dsi->mmio + reg);
+	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
 }
 
 static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
+	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
 }
 
 static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(dsi->mmio + reg);
+	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
 }
 
 static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
+	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
 }
 
 /* -----------------------------------------------------------------------------
@@ -291,7 +305,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	vclk_rate = clk_get_rate(dsi->vclk);
 	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq);
 	if (ret < 0)
 		goto err_phy;
 
@@ -334,7 +348,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	return ret;
@@ -342,7 +356,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -585,10 +599,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 				 const struct drm_display_info *info,
 				 const struct drm_display_mode *mode)
 {
-	if (mode->clock > 148500)
+	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+
+	if (mode->clock > dsi->info->max_dclk)
 		return MODE_CLOCK_HIGH;
 
-	if (mode->clock < 5803)
+	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
 	return MODE_OK;
@@ -714,6 +730,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
+	dsi->info = of_device_get_match_data(&pdev->dev);
+	if (!dsi->info)
+		return dev_err_probe(dsi->dev, -ENODEV,
+				     "missing data info\n");
+
 	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
@@ -729,10 +750,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
-	if (IS_ERR(dsi->rstc))
-		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-				     "failed to get rst\n");
+	if (dsi->info->has_dphy_rstc) {
+		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+		if (IS_ERR(dsi->rstc))
+			return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
+					     "failed to get rst\n");
+	}
 
 	dsi->arstc = devm_reset_control_get_exclusive(dsi->dev, "arst");
 	if (IS_ERR(dsi->arstc))
@@ -757,13 +780,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
 	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
 	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	/* Initialize the DRM bridge. */
@@ -780,7 +803,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
@@ -795,8 +818,17 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.has_dphy_rstc = true,
+	.link_reg_offset = 0x10000,
+	.max_dclk = 148500,
+	.min_dclk = 5803,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-	{ .compatible = "renesas,rzg2l-mipi-dsi" },
+	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 1dbc16ec64a4..16efe4dc59f4 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -41,8 +41,6 @@
 #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
 
 /* --------------------------------------------------------*/
-/* Link Registers */
-#define LINK_REG_OFFSET			0x10000
 
 /* Link Status Register */
 #define LINKSR				0x10
-- 
2.49.0


