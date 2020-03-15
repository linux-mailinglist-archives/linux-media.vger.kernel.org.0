Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96281857DA
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 02:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbgCOBqr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Mar 2020 21:46:47 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10470 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgCOBqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Mar 2020 21:46:07 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e6d88800000>; Sat, 14 Mar 2020 18:44:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 14 Mar 2020 18:46:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 14 Mar 2020 18:46:06 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 15 Mar
 2020 01:46:05 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 15 Mar 2020 01:46:06 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.141]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e6d88dd0001>; Sat, 14 Mar 2020 18:46:05 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 3/8] dt-bindings: clock: tegra: Add clk id for CSI TPG clock
Date:   Sat, 14 Mar 2020 18:46:01 -0700
Message-ID: <1584236766-24819-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
References: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584236672; bh=FfGJH9b8JGj6Sguul3LNMexpCVjUbOXcObIX96zc9Fo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=QhBfJoD29y2ubthzU6pgw7ezpZSax02PNvQZqnLPvxQdhfYcB74VdrgUY+cs3BCk6
         Z6SL43ffHUBfqbOhERTUE1Q/G9vR6WWBfTUXFgnYykiiM57xgoZmq2VUyEupf7O+Pj
         qm3LK+6DddHUq8tMbRvVQkxINa2ax8ME/QYNLKe8w1MROkWkPLsdRsPGS/8NlynsYP
         U8bsrqtOJgpok0mJFe6VufAGpdJXg5LXWimN3GMTqXbCYDYWvgMbAvmrNCZjsQvK5B
         OjXuc7uoqRPYHacgkCSl01ZiSsBTIb3fh/ujFORzkd9qao19UHQT522CUFljwCSCYS
         N1SXrwFk+LfGQ==
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
index 7a8f10b..d8909e0 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -351,7 +351,7 @@
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

