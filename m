Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D061BEB44
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 00:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgD2WBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 18:01:35 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6513 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgD2WBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 18:01:34 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea9f8c20000>; Wed, 29 Apr 2020 14:59:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Apr 2020 15:01:33 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Apr 2020 15:01:33 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 22:01:33 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 Apr 2020 22:01:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea9f93b0001>; Wed, 29 Apr 2020 15:01:32 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v11 8/9] dt-bindings: reset: Add ID for Tegra210 VI reset
Date:   Wed, 29 Apr 2020 15:00:05 -0700
Message-ID: <1588197606-32124-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588197570; bh=KEZ1lHNwQNYea9tamUq6xhOd3Wa4inGS2Z794lURij8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=SRxN1tAF8pPlJNtIV1thqZC51jZOSTXRr6Db2VCXSTLSsMPoCzLjlKzdvnf7qIDdY
         sOB5wJ6mXSMrOk96Y/Ox+caXZdyHasYtqzsgRkbTwzSPV4UzVk1HDG2MILuCsN56xO
         cg0e3Nslkveh7dHWLniRWRkNhsolh2h8fWcKJfOMqGfRqUNDyaXBNj3JbapK8K09z2
         wq0onR2mwemUvSSEE4gtzz3OPJ+gGBq02R/l3ZV79QnPjU3nai8X9B0WrIvZElaE8U
         fWCHGgfEPNLV1RkgL1JQrLRgPThnJ4w8fZt8Fmj1hOiZ4nQIfmPfm8oWzBBaSEbwpb
         cF2hWi4AjXvtQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds ID for Tegra210 VI controller reset to use with
device tree.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/reset/tegra210-car.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/tegra210-car.h b/include/dt-bindings/reset/tegra210-car.h
index 9dc84ec..8755946 100644
--- a/include/dt-bindings/reset/tegra210-car.h
+++ b/include/dt-bindings/reset/tegra210-car.h
@@ -10,5 +10,6 @@
 #define TEGRA210_RESET(x)		(7 * 32 + (x))
 #define TEGRA210_RST_DFLL_DVCO		TEGRA210_RESET(0)
 #define TEGRA210_RST_ADSP		TEGRA210_RESET(1)
+#define TEGRA210_RST_VI			20
 
 #endif	/* _DT_BINDINGS_RESET_TEGRA210_CAR_H */
-- 
2.7.4

