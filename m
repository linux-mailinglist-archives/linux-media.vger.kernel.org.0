Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823D719E213
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 03:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgDDBZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 21:25:18 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9125 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgDDBZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 21:25:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e87e1980000>; Fri, 03 Apr 2020 18:23:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 03 Apr 2020 18:25:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 03 Apr 2020 18:25:15 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 4 Apr
 2020 01:25:15 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 4 Apr 2020 01:25:15 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.193]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e87e1fa0000>; Fri, 03 Apr 2020 18:25:14 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v6 4/9] clk: tegra: Add Tegra210 CSI TPG clock gate
Date:   Fri, 3 Apr 2020 18:25:02 -0700
Message-ID: <1585963507-12610-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585963416; bh=/06MYnopqzjyrf2N0nRAUhGBnkcd6r/kBjlHyehzo9I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=nynG8ud/22Fkty41DAxBdfnGLZBOJybm/lSHq+7gvgpWlKqOTpKU5N4ktEhDNrNER
         /5bPXKBFYIt0dQ/+fuTuJ9MpfIEsroGeLvOnje1YF0DPLNe0a4NOEWDPhuXqjjBh/K
         GTrcYDTtMnPeMg+OJK9FaCmgEUU62h+VNyQ5qOJCVrAoWQZxIVSV9+i4roxMKpN2hy
         Y3TXu/R++le3VUSLdANXfz8CrjSu6iZ8yetgV3f92X2jOD8+Wp1wbGRafg0IEIlZl3
         u4x3vBDzMYGY0TcDT9U3MZwJYCQLCyTrIGc/v7gTF7DUNXHB3KkOokirdC1Qhz57T/
         017hplxreqNtQ==
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
index defe3b7..81a879b 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3035,6 +3035,13 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA210_CLK_DSIB] = clk;
 
+	/* csi_tpg */
+	clk = clk_register_gate(NULL, "csi_tpg", "pll_d",
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

