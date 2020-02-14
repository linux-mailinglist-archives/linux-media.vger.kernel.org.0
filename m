Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF5415F4C1
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 19:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405324AbgBNSXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 13:23:35 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16971 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394820AbgBNSXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 13:23:32 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e46e5940000>; Fri, 14 Feb 2020 10:23:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Feb 2020 10:23:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Feb 2020 10:23:30 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 18:23:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Feb 2020 18:23:30 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.245]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e46e5a10003>; Fri, 14 Feb 2020 10:23:29 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 2/6] clk: tegra: Add Tegra210 CSI TPG clock gate
Date:   Fri, 14 Feb 2020 10:23:24 -0800
Message-ID: <1581704608-31219-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581704597; bh=U33XItr+moxxea1Mr2O71xPE31NqHV1XULA57TM/x3s=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=C/NT/6JdO+4OA2DPHnephddRFGki3UQ3g1LbVHHYzRDhl1jSzr7QZ3xFn7+S7fUj0
         0LYGKcy5cNbhLZn1lXRyGBxIVk+C62+jUglJFkY6Taw01hWBknJlL0lWqWRjLWru7+
         t6dMrbRtTI9VaSgaG+ZwfvIKGz7aGF5LOuqivICnGpacD1h1AVztFRbW6qQBv/AFlM
         7kt5XH4ql4+TAj0r/nWFm3EmGK30H6Ocr5wFgZNQ2Zw6lYRK61UhTWPWuAVn7Bo4Ry
         0YJlGyC4y6SHUrm7cRvIk/dt1Ed7iKZgeDjo/81Z6Gpf1aVGwIdWRFXtO+Bbf2cP7j
         S/lOV0+nR8Rrw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 CSI hardware internally uses PLLD for internal test pattern
generator logic.

PLLD_BASE register in CAR has a bit CSI_CLK_SOURCE to enable PLLD
out to CSI during TPG mode.

This patch adds this CSI TPG clock gate to Tegra210 clock driver
to allow Tegra video driver to ungate CSI TPG clock during TPG mode
and gate during non TPG mode.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 762cd186f714..e66498b5fd6f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3041,6 +3041,13 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA210_CLK_DSIB] = clk;
 
+	/* csi_tpg */
+	clk = clk_register_gate(NULL, "csi_tpg", "pll_d_out0",
+				CLK_SET_RATE_PARENT, clk_base + PLLD_BASE,
+				23, 0, &pll_d_lock);
+	clk_register_clkdev(clk, "csi_tpg", NULL);
+	clks[TEGRA210_CLK_CSI_TPG] = clk;
+
 	/* la */
 	clk = tegra_clk_register_periph("la", la_parents,
 			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
-- 
2.7.4

