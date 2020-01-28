Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A72614BF87
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 19:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgA1SXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 13:23:34 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17752 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgA1SXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 13:23:34 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e307bf30000>; Tue, 28 Jan 2020 10:22:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 10:23:33 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 10:23:33 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 18:23:33 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Jan 2020 18:23:32 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.115]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e307c220002>; Tue, 28 Jan 2020 10:23:32 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 1/5] dt-bindings: clock: tegra: Add clk id for CSI TPG clock
Date:   Tue, 28 Jan 2020 10:23:17 -0800
Message-ID: <1580235801-4129-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580235763; bh=SPzwobycNDg9N502/mnGfQIq3LKpSXOMWG+HIM072Xs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Hkp2gvS8P/QYTqJwKI0nBqKiVxK7ixxh7vuSD0rLBrVreOENuSXA2tIiS6ndR8QOX
         LaSz/AjAGl1WOTCSbms8qv7f7VgKRv8H7AaT34LbdCZToNe0V++dSorX2ORAnbxb3D
         UlLcl3eCZBYddctC2GzelHM6BuOBnIEdZIYnDScrty6AL5Dr9+CY84o+aogE3taupP
         sQLd5MsBDo+lzz4vU+/tF+BefHPUQ49WnONYktxomxL+RsdOtZYnKS2tdGpwQ8g+8s
         yeUKYQUVKHqnb/KrCsXpmts3+wSLvMqHub6wZEaL09DxADAz2H/uOoFn5c9zxjKTcz
         leWJqHJwSWQkQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 uses PLLD out internally for CSI TPG.

This patch adds clk id for this CSI TPG clock from PLLD.

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

