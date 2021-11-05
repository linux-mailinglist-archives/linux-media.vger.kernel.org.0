Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBCF446452
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 14:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhKENpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 09:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhKENpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 09:45:32 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D0AC061205;
        Fri,  5 Nov 2021 06:42:53 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id k1so9478182ilo.7;
        Fri, 05 Nov 2021 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJVMN8J4fSdVamG2Tu6JD0TQF0L5ocpUKb2/MzMiTRQ=;
        b=A4kIRCh+R1s7T5qNJGo2RHDB8a/X5QXZCV/tWNkM0gd9AGXz4tQlX0xgBxbUb9A3tj
         8EgfMqW5nMkScjVDnolJbFiybGyo8TOAThRt4Cji5z1WnQippwdW/z8K4JQvM+HVmTu9
         XVYausyOqi332Zw2Td4Wp8+LLysqOXTe5GGZdt1apKtCo6VOifWeFxX8WI83GdGUFsP5
         ISIlFqfNoMa1rbZ4qa8Ky8n5YTRgXlTwDecEPuIFzqvxkfv/rzmKoWwtcUSROIYY76ZR
         PI9ZFr1ITa4DWso0mCSzRbT3xWbsTKJZ3LRADyI6oaGLt53jQ5QqhmAb1rupqoBX0tlR
         JGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJVMN8J4fSdVamG2Tu6JD0TQF0L5ocpUKb2/MzMiTRQ=;
        b=G6xueb+gQJ+ON7ohCSidzs/LoBkhzoTshbpL0Om7WyJP3KX17W6OQJw/5kQHIuiusY
         O1NR0jrK0huNUmlG/pmzRJh+OaSJ5N9WDlDGswYojhejHlSADUi6nJqpDEedxp8CZZ1H
         kmhfIVwMZqAMknjLpjJ07GjoVErLG6URSIbJFhZ7ETq2ePL/ShEtsRPI3U/DmR0fFrzj
         tcRF6Q1F5q9m5RIaHg3WFRic4MdI1UPIS5hVXPrvdNFic9HycieVAP9nfQMwuEaUouoo
         NY6JR0MPjK8AgKSsxxNTu48vpynBlyObKx7unVRCnT0aXGayBzOTv/OQApvR8JRd0AAZ
         wtvA==
X-Gm-Message-State: AOAM5319fMg1YObnThykqz1ZTutSWpEC6Tq0pqK10CMVrEnY6Fp+u8pF
        6TuTfk/79bUC5uDlNNupNjs=
X-Google-Smtp-Source: ABdhPJy/sYAZAytj/M9FqrjFeO4wsLbFO+aQIVqWJUJvqJxMT2sgXWKziGVZgXj+E9E5VU56HsLTmw==
X-Received: by 2002:a05:6e02:180d:: with SMTP id a13mr38231436ilv.117.1636119772392;
        Fri, 05 Nov 2021 06:42:52 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j15sm4537909ile.65.2021.11.05.06.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:42:50 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset
Date:   Fri,  5 Nov 2021 08:42:24 -0500
Message-Id: <20211105134228.731331-1-aford173@gmail.com>
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
 drivers/soc/imx/imx8m-blk-ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/imx/imx8m-blk-ctrl.c b/drivers/soc/imx/imx8m-blk-ctrl.c
index 519b3651d1d9..5506bd075c35 100644
--- a/drivers/soc/imx/imx8m-blk-ctrl.c
+++ b/drivers/soc/imx/imx8m-blk-ctrl.c
@@ -17,6 +17,7 @@
 
 #define BLK_SFT_RSTN	0x0
 #define BLK_CLK_EN	0x4
+#define BLK_MIPI_RESET_DIV	0x8
 
 struct imx8m_blk_ctrl_domain;
 
@@ -36,6 +37,7 @@ struct imx8m_blk_ctrl_domain_data {
 	const char *gpc_name;
 	u32 rst_mask;
 	u32 clk_mask;
+	u32 mipi_rst_mask;
 };
 
 #define DOMAIN_MAX_CLKS 3
@@ -78,6 +80,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 
 	/* put devices into reset */
 	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
+	regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
 
 	/* enable upstream and blk-ctrl clocks to allow reset to propagate */
 	ret = clk_bulk_prepare_enable(data->num_clks, domain->clks);
@@ -99,6 +102,7 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 
 	/* release reset */
 	regmap_set_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
+	regmap_set_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
 
 	/* disable upstream clocks */
 	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
@@ -122,6 +126,7 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 	/* put devices into reset and disable clocks */
 	regmap_clear_bits(bc->regmap, BLK_SFT_RSTN, data->rst_mask);
 	regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
+	regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->mipi_rst_mask);
 
 	/* power down upstream GPC domain */
 	pm_runtime_put(domain->power_dev);
@@ -488,6 +493,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mm_disp_blk_ctl_domain_data[]
 		.gpc_name = "mipi-csi",
 		.rst_mask = BIT(3) | BIT(4),
 		.clk_mask = BIT(10) | BIT(11),
+		.mipi_rst_mask = BIT(16) | BIT(17),
 	},
 };
 
-- 
2.32.0

