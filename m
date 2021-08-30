Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779063FBB71
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 20:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238449AbhH3SJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 14:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238442AbhH3SJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 14:09:11 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413C2C06175F;
        Mon, 30 Aug 2021 11:08:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id i28so27397677ljm.7;
        Mon, 30 Aug 2021 11:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ehFQwBA3BukYXlKRjKhYo7zYYZcV56jlrWBZsRudsVk=;
        b=Fifwl3XeLQJL4RlHoxrHI7pY51LOjaYOUgZNAL02Ng6vT2BzMjJGis80onUmGt7XGH
         WFP17IuJRfFI/ae3yl8IXnyYAgTY1ptRfs+oUNuI74JI57+XNHbikKMxCb+oo6zLk0RN
         1k1XpzLXR9N31p4hJPDtXdFZSOXvAyE3xIzob7SbArBct3V/BpPRTw8US1/oW09rKUlS
         GT1zjShZlQDSO6L/Q/wiSHgLP40m8SWx6cH/AfUpcnLKG6KbW1zRnQzRcbr+rPix5cDF
         0w6/hurDb6cZBNM8nknKOL6qwevmzvWgztnl4yT3f9eBK4ku/ogJRza8pGvtiwYtgH+3
         arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ehFQwBA3BukYXlKRjKhYo7zYYZcV56jlrWBZsRudsVk=;
        b=QvVT1UbxsShsW0awEI7n3tRqPoofZJQo8vg3jjENynpMvHOblX4V7r9HnLMb7bXgBz
         ninifr/+zlY4dumiItmtxIP9L4NPlxvfZ9lxWQmbeXNTWeyVHOtji2eRClL5AXx8D51s
         q/loQCHg1lnsYQQYtUCqeCUfKHZgTbOaNQr+ChWdfun4Z1BgzPAQsvQuRV+MmURGcQ0q
         VVSViyiHvdMlIS4XqTGv9d78pwQ82ko/90ElkCKhsFMzZwOqxYAaMpBHAOmsEgeV1nRd
         A3TbZx4taumgSzUUd1gJLWptJ4+OYCDT0yjzu3jHkEEI2g7ug0kjpy/uYzGz1IUOnK+n
         if9Q==
X-Gm-Message-State: AOAM532KKjNir6SB1iS8PllR9TgD33aorFCU0cthfVoyY849+POpDydW
        h7I9ARjdA8iXHK+8uGhEt9U=
X-Google-Smtp-Source: ABdhPJxxG8YG731ayRJQUndl/4IVw5XHoG6tIsVQhX87NC59tPsiXVaRZ5V/zbs4lREfOQ71p5+hyg==
X-Received: by 2002:a05:651c:10a8:: with SMTP id k8mr21257633ljn.356.1630346895552;
        Mon, 30 Aug 2021 11:08:15 -0700 (PDT)
Received: from localhost (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id l7sm1454952lfj.81.2021.08.30.11.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:08:15 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] phy: phy-rockchip-dphy-rx0: refactor for tx1rx1 addition
Date:   Mon, 30 Aug 2021 21:07:50 +0300
Message-Id: <20210830180758.251390-2-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830180758.251390-1-mike.rudenko@gmail.com>
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to accommodate for rk3399 tx1rx1 addition, make
enable/disable function calls indirect via function pointers in
rk_dphy_drv_data. Also rename rk_dphy_write and rk_dphy_enable to
avoid naming clashes.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-dphy-rx0.c | 38 +++++++++++++-------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
index 4df9476ef2a9..72145cdfb036 100644
--- a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
+++ b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
@@ -138,12 +138,17 @@ static const struct dphy_reg rk3399_grf_dphy_regs[] = {
 	[GRF_DPHY_RX0_TESTDOUT] = PHY_REG(RK3399_GRF_SOC_STATUS1, 8, 0),
 };
 
+struct rk_dphy;
+
 struct rk_dphy_drv_data {
 	const char * const *clks;
 	unsigned int num_clks;
 	const struct hsfreq_range *hsfreq_ranges;
 	unsigned int num_hsfreq_ranges;
 	const struct dphy_reg *regs;
+
+	void (*enable)(struct rk_dphy *priv);
+	void (*disable)(struct rk_dphy *priv);
 };
 
 struct rk_dphy {
@@ -170,7 +175,7 @@ static inline void rk_dphy_write_grf(struct rk_dphy *priv,
 	regmap_write(priv->grf, reg->offset, val);
 }
 
-static void rk_dphy_write(struct rk_dphy *priv, u8 test_code, u8 test_data)
+static void rk_dphy_write_mipi_rx(struct rk_dphy *priv, u8 test_code, u8 test_data)
 {
 	rk_dphy_write_grf(priv, GRF_DPHY_RX0_TESTDIN, test_code);
 	rk_dphy_write_grf(priv, GRF_DPHY_RX0_TESTEN, 1);
@@ -186,7 +191,7 @@ static void rk_dphy_write(struct rk_dphy *priv, u8 test_code, u8 test_data)
 	rk_dphy_write_grf(priv, GRF_DPHY_RX0_TESTCLK, 1);
 }
 
-static void rk_dphy_enable(struct rk_dphy *priv)
+static void rk_dphy_enable_rx(struct rk_dphy *priv)
 {
 	rk_dphy_write_grf(priv, GRF_DPHY_RX0_FORCERXMODE, 0);
 	rk_dphy_write_grf(priv, GRF_DPHY_RX0_FORCETXSTOPMODE, 0);
@@ -206,22 +211,27 @@ static void rk_dphy_enable(struct rk_dphy *priv)
 	usleep_range(100, 150);
 
 	/* set clock lane */
-	/* HS hsfreq_range & lane 0  settle bypass */
-	rk_dphy_write(priv, CLOCK_LANE_HS_RX_CONTROL, 0);
+	/* HS hsfreq_range & lane 0	 settle bypass */
+	rk_dphy_write_mipi_rx(priv, CLOCK_LANE_HS_RX_CONTROL, 0);
 	/* HS RX Control of lane0 */
-	rk_dphy_write(priv, LANE0_HS_RX_CONTROL, priv->hsfreq << 1);
+	rk_dphy_write_mipi_rx(priv, LANE0_HS_RX_CONTROL, priv->hsfreq << 1);
 	/* HS RX Control of lane1 */
-	rk_dphy_write(priv, LANE1_HS_RX_CONTROL, priv->hsfreq << 1);
+	rk_dphy_write_mipi_rx(priv, LANE1_HS_RX_CONTROL, priv->hsfreq << 1);
 	/* HS RX Control of lane2 */
-	rk_dphy_write(priv, LANE2_HS_RX_CONTROL, priv->hsfreq << 1);
+	rk_dphy_write_mipi_rx(priv, LANE2_HS_RX_CONTROL, priv->hsfreq << 1);
 	/* HS RX Control of lane3 */
-	rk_dphy_write(priv, LANE3_HS_RX_CONTROL, priv->hsfreq << 1);
+	rk_dphy_write_mipi_rx(priv, LANE3_HS_RX_CONTROL, priv->hsfreq << 1);
 	/* HS RX Data Lanes Settle State Time Control */
-	rk_dphy_write(priv, LANES_THS_SETTLE_CONTROL,
-		      THS_SETTLE_COUNTER_THRESHOLD);
+	rk_dphy_write_mipi_rx(priv, LANES_THS_SETTLE_CONTROL,
+			  THS_SETTLE_COUNTER_THRESHOLD);
 
 	/* Normal operation */
-	rk_dphy_write(priv, 0x0, 0);
+	rk_dphy_write_mipi_rx(priv, 0x0, 0);
+}
+
+static void rk_dphy_disable_rx(struct rk_dphy *priv)
+{
+	rk_dphy_write_grf(priv, GRF_DPHY_RX0_ENABLE, 0);
 }
 
 static int rk_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
@@ -266,7 +276,7 @@ static int rk_dphy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	rk_dphy_enable(priv);
+	priv->drv_data->enable(priv);
 
 	return 0;
 }
@@ -275,7 +285,7 @@ static int rk_dphy_power_off(struct phy *phy)
 {
 	struct rk_dphy *priv = phy_get_drvdata(phy);
 
-	rk_dphy_write_grf(priv, GRF_DPHY_RX0_ENABLE, 0);
+	priv->drv_data->disable(priv);
 	clk_bulk_disable(priv->drv_data->num_clks, priv->clks);
 	return 0;
 }
@@ -310,6 +320,8 @@ static const struct rk_dphy_drv_data rk3399_mipidphy_drv_data = {
 	.hsfreq_ranges = rk3399_mipidphy_hsfreq_ranges,
 	.num_hsfreq_ranges = ARRAY_SIZE(rk3399_mipidphy_hsfreq_ranges),
 	.regs = rk3399_grf_dphy_regs,
+	.enable = rk_dphy_enable_rx,
+	.disable = rk_dphy_disable_rx,
 };
 
 static const struct of_device_id rk_dphy_dt_ids[] = {
-- 
2.33.0

