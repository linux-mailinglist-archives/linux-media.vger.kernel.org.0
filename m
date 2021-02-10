Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A4D3164C6
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 12:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhBJLNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 06:13:39 -0500
Received: from gloria.sntech.de ([185.11.138.130]:43748 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhBJLLO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 06:11:14 -0500
Received: from [95.90.166.74] (helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l9nO2-0003eN-Su; Wed, 10 Feb 2021 12:10:22 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, cmuellner@linux.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v2 1/6] drm/rockchip: dsi: add own additional pclk handling
Date:   Wed, 10 Feb 2021 12:10:15 +0100
Message-Id: <20210210111020.2476369-2-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210111020.2476369-1-heiko@sntech.de>
References: <20210210111020.2476369-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

In a followup patch, we'll need to access the pclk ourself to enable some
functionality, so get and store it in the rockchip dw-dsi variant as well.

Clocks are refcounted, so possible cascading enablements are
no problem.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 24a71091759c..18e112e30f6e 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -223,6 +223,7 @@ struct dw_mipi_dsi_rockchip {
 	void __iomem *base;
 
 	struct regmap *grf_regmap;
+	struct clk *pclk;
 	struct clk *pllref_clk;
 	struct clk *grf_clk;
 	struct clk *phy_cfg_clk;
@@ -1051,6 +1052,13 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dsi->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(dsi->pclk)) {
+		ret = PTR_ERR(dsi->pclk);
+		DRM_DEV_ERROR(dev, "Unable to get pclk: %d\n", ret);
+		return ret;
+	}
+
 	dsi->pllref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(dsi->pllref_clk)) {
 		if (dsi->phy) {
-- 
2.29.2

