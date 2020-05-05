Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7BF1C4C2D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 04:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgEECbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 22:31:48 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10301 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgEECbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 22:31:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb0cfa40002>; Mon, 04 May 2020 19:29:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 19:31:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 04 May 2020 19:31:06 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 02:31:05 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 5 May 2020 02:31:05 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.119]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb0cfe80004>; Mon, 04 May 2020 19:31:05 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v12 3/9] dt-bindings: clock: tegra: Add clk id for CSI TPG clock
Date:   Mon, 4 May 2020 19:31:54 -0700
Message-ID: <1588645920-20557-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588645796; bh=yIkJupQ4QVx2Ih8swAh9bp2GpufF3KkGGfUp0KO8Aws=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=SmVUIk/q/7SSvAX0GknAD4QELK7n2Tgz2xwbyYhnfOqMb+/XNLFDEMbfZICTkNuPD
         w3aTbYmx+JWFGOtdnHrnPgUcLTaSwm/OKOMOUEytYxCivN9o00PCxvhQZcHWTF5D9q
         rX36JD1n/O4w2cuzffyRdq8eizZESXJM1WByvxxUuLZ/jgdw+NxRF6Yc3IuhozlU0q
         HOT//QQYJxIcwabkAN6+kiD+mUTFKcpnRxWMqHpJ+ZZ27p45Xa8pS1yiovURf6zq3G
         BK270kr5ICd7K4yMZX4KTLMGYyqDwkDB+D6QtsV+MNwPCIS+dWcSM31SlIJT4Znvcv
         7/lw6ElzrGQ3Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 uses PLLD out internally for CSI TPG.

This patch adds clk id for this CSI TPG clock from PLLD.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/clock/tegra210-car.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 7684a9f..ab8b8a7 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -358,7 +358,7 @@
 #define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
 /* 325 */
 #define TEGRA210_CLK_OSC 326
-/* 327 */
+#define TEGRA210_CLK_CSI_TPG 327
 /* 328 */
 /* 329 */
 /* 330 */
-- 
2.7.4

