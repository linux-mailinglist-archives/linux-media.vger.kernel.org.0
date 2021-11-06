Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAEB446EC3
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 16:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbhKFP52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 11:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbhKFP51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 11:57:27 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D2DC061570;
        Sat,  6 Nov 2021 08:54:46 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id k22so824919iol.13;
        Sat, 06 Nov 2021 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iiKkWXx7LH2mtsbKdfcA3IaZmnBXPN3UgFdD8y0kBYA=;
        b=MJxwBVe9vLmvxQwX+/3/BR4kcgDSfMwKNajXuRCbZSQXxFYDunWJ8Q0+HSe7Hq/IKn
         qw4sCGPdv/TEkP6fm9DH6+01JgDt0ANlSOwFgn5jU0EtOch35OOrDTdFmPJ7nknZgoJr
         Ty+qxgkBgSNiN+dzo0hJtwBnmhEl2+Qck8f5LXeAk/08dweFu1/MIIrfPgIl5ZKm6dpl
         ACwhe8NDeG/ypLFfBB2Upq92BbqcCpOvtnX2ZMcqCA/i5Cqy31eTMVGPMboLbaG1Y9/b
         77pP2jOmvtkpT2WPsd4fX/DoancCOYhqejRuNZAh95OITWsRCmlIsUb9p3pHVqHjWXFi
         0Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iiKkWXx7LH2mtsbKdfcA3IaZmnBXPN3UgFdD8y0kBYA=;
        b=BA3JNacb5nt7EMqB/dCpGZB+7dAoFIXnpsFdYN86SLaRALPOn3NO/83/5spS9gDtiZ
         O8/SW5vAqVsTpEPUp3kRgVZVOW7DIKYxx2jaizUJETW/ft7sQUEYPc1EkYFUkL4E9U73
         LSG44ECf0OZDFKyOfOk0/si79bQfYt21iCgYRRdkexsFffN/wCnALfkFBO8CSxN/7HXr
         M9rJqLDQey+6TrfHffYVO+A0DqsIHM92DxQSCx//wX7PhwVwmkLAuOf+06WNYEf4X/PA
         Uus3MWks3gx6HBqOAYs8fDSnj9xL4aRcSu18YQUuXRzZ7On3OhppWYZd/Jna6kWqwQ3V
         rBlg==
X-Gm-Message-State: AOAM532RuQb0WDhf4sByZnKrJLIhx9KozDGz/q9OqHBk4cCrLvOw7sBE
        Fz7IsvizukiKojDMMKw2UHA=
X-Google-Smtp-Source: ABdhPJxtrSSYCX6qkHYipUtxezBT7pSTriqytk8UjlFhB6d5r7EJeLQHagN9vMzwwHmiq3/E09KJgg==
X-Received: by 2002:a05:6602:1607:: with SMTP id x7mr4941365iow.134.1636214085658;
        Sat, 06 Nov 2021 08:54:45 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id d2sm5718313ilg.77.2021.11.06.08.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:54:44 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
Date:   Sat,  6 Nov 2021 10:54:23 -0500
Message-Id: <20211106155427.753197-1-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of the blk-ctrl reset bits are found in one register, however
there are two bits in offset 8 for pulling the MIPI DPHY out of reset
and these need to be set when IMX8MM_DISPBLK_PD_MIPI_CSI is brought
out of reset or the MIPI_CSI hangs.

Fixes: 926e57c065df ("soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl")
Signed-off-by: Adam Ford <aford173@gmail.com>
---

V2:  Make a note that the extra register is only for Mini/Nano DISPLAY_BLK_CTRL
     Rename the new register to mipi_phy_rst_mask
     Encapsulate the edits to this register with an if-statement

 drivers/soc/imx/imx8m-blk-ctrl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
index 519b3651d1d9..581eb4bc7f7d 100644
--- a/drivers/soc/imx/imx8m-blk-ctrl.c
+++ b/drivers/soc/imx/imx8m-blk-ctrl.c
@@ -17,6 +17,7 @@
 
 #define BLK_SFT_RSTN	0x0
 #define BLK_CLK_EN	0x4
+#define BLK_MIPI_RESET_DIV	0x8 /* Mini/Nano DISPLAY_BLK_CTRL only */
 
 struct imx8m_blk_ctrl_domain;
 
@@ -36,6 +37,15 @@ struct imx8m_blk_ctrl_domain_data {
 	const char *gpc_name;
 	u32 rst_mask;
 	u32 clk_mask;
+
+	/*
+	 * i.MX8M Mini and Nano have a third DISPLAY_BLK_CTRL register
+	 * which is used to control the reset for the MIPI Phy.
+	 * Since it's only present in certain circumstances,
+	 * an if-statement should be used before setting and clearing this
+	 * register.
+	 */
+	u32 mipi_phy_rst_mask;
 };
 
 #define DOMAIN_MAX_CLKS 3
@@ -78,6 +88,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 
 	/* put devices into reset */
 	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
+	if (data->mipi_phy_rst_mask)
+		regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
 
 	/* enable upstream and blk-ctrl clocks to allow reset to propagate */
 	ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
@@ -99,6 +111,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 
 	/* release reset */
 	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
+	if (data->mipi_phy_rst_mask)
+		regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
 
 	/* disable upstream clocks */
 	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
@@ -120,6 +134,9 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 	struct imx8m_blk_ctrl *bc = domain->bc;
 
 	/* put devices into reset and disable clocks */
+	if (data->mipi_phy_rst_mask)
+		regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_phy_rst_mask);
+
 	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
 	regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
 
@@ -488,6 +505,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
 		.gpc_name = "mipi-csi",
 		.rst_mask = BIT(3) | BIT(4),
 		.clk_mask = BIT(10) | BIT(11),
+		.mipi_phy_rst_mask = BIT(16) | BIT(17),
 	},
 };
 
-- 
2.32.0

