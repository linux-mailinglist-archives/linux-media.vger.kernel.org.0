Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B615F4CB
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 19:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394917AbgBNSXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 13:23:34 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13397 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394801AbgBNSXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 13:23:31 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e46e5840001>; Fri, 14 Feb 2020 10:23:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Feb 2020 10:23:29 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Feb 2020 10:23:29 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 18:23:29 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Feb 2020 18:23:29 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.245]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e46e5a00003>; Fri, 14 Feb 2020 10:23:29 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 1/6] dt-bindings: clock: tegra: Add clk id for CSI TPG clock
Date:   Fri, 14 Feb 2020 10:23:23 -0800
Message-ID: <1581704608-31219-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581704580; bh=S6xZgZFIi3mqYtcaBlNqBcPaadNMOP/GEU2NRAJynoY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=UcR0N38mir7QQlQ3cP2/fSBIBjUEBPuEVIiQvyYratzdSv28/zSkXfbIL3cNignE7
         XFp8bsuT0HetSqJ/Iha7nZqwwueijpJNvvnlw77IyJvH+ZhZs0nt/iO7BTHDg5Mr1m
         DxIEKkzUrJSw4CMHLLxDczfnNROEjBsN/NBs4tF/9xdCbWdWf0ubcNwwbMNaCyt6KY
         gQHkMi94prNaKLxwE7k0r2Bd4ZZ1Sos4TaxsN1dHSphqlAkC0HG3H7jWVWqJPMIm76
         k279KKRSzMA/sZRx2Vxzup2Y/j5FvugTQXtolELCIeyNc2tQTA23X5xdS+VyIXEm1q
         LURv+IpCsUYKg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 uses PLLD out internally for CSI TPG.

This patch adds clk id for this CSI TPG clock from PLLD.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/clock/tegra210-car.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 44f60623f99b..dc22aaec8805 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -349,7 +349,7 @@
 #define TEGRA210_CLK_PLL_P_OUT_XUSB 317
 #define TEGRA210_CLK_XUSB_SSP_SRC 318
 #define TEGRA210_CLK_PLL_RE_OUT1 319
-/* 320 */
+#define TEGRA210_CLK_CSI_TPG 320
 /* 321 */
 #define TEGRA210_CLK_ISP 322
 #define TEGRA210_CLK_PLL_A_OUT_ADSP 323
-- 
2.7.4

