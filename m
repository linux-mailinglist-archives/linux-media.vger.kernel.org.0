Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C41FB19E235
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 03:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgDDBZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 21:25:16 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8295 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgDDBZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 21:25:15 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e87e1c80000>; Fri, 03 Apr 2020 18:24:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 03 Apr 2020 18:25:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 03 Apr 2020 18:25:14 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 4 Apr
 2020 01:25:14 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 4 Apr 2020 01:25:14 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.193]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e87e1f8000a>; Fri, 03 Apr 2020 18:25:13 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v6 3/9] dt-bindings: clock: tegra: Add clk id for CSI TPG clock
Date:   Fri, 3 Apr 2020 18:25:01 -0700
Message-ID: <1585963507-12610-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585963464; bh=FfGJH9b8JGj6Sguul3LNMexpCVjUbOXcObIX96zc9Fo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Sv3e/CA4jCeJq0ggWwSHMwhhjHI8Wwa/4tPLVRK4J/zJW+HuyKazF7oVXfeOz+aSM
         YALWBXNhkgJdA4jScM1Z/m4fAritfCnQHD9QGFFb5IB3i3C7iKN6D93WYSmqE6Hi3y
         5wtqxyV472fdmmaPDR2KGL6ELBzuiH/zBG+PPdoIw7uUTw6yP0ibul6iMewrGzInai
         xs8e+XamPS3cftmEqSfNJBtMrUTqxfFqHrreLl7HIo78dYBj/X8Fm3z+DTosXwtGoP
         c82oI38EpEZn0Scm25zX0w5NkWqx+eJafk4Fc8EtykowkPdWzNhot4APQuRuJSYU8w
         ZhAB3ru7FbdWg==
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

