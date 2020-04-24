Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE101B6C2C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 05:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgDXDzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 23:55:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10180 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgDXDz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 23:55:28 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea263230000>; Thu, 23 Apr 2020 20:55:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 20:55:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 Apr 2020 20:55:27 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 03:55:27 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 24 Apr 2020 03:55:27 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea2632e0000>; Thu, 23 Apr 2020 20:55:26 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v10 8/9] dt-bindings: reset: Add ID for Tegra210 VI reset
Date:   Thu, 23 Apr 2020 20:55:12 -0700
Message-ID: <1587700513-28449-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587700515; bh=KEZ1lHNwQNYea9tamUq6xhOd3Wa4inGS2Z794lURij8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ncMOXkoQgz34dfn7yyo9E6OnmCDtW2lGwJxCjCL4ly93JM9W/N3dFFs7Yv/etZkDh
         NqcViAQRVpUot7xZ9gUjrEPOlnRC8x2bRUvjN/tD9gWgzJlzRcN9pBNLp9nnCJ8zv9
         2O980BWI29IBqAxzRBvEoNZ65dJg7HgmvYKyl5l2p31O4ag8bjEdiOeRhSCfA8gzsn
         ob+ME80BekKLTjYDSfI+HyWcW21hsDqZUJ8dnL0cOdp4CSiUoL61wMu2CFo6dkf/Ns
         geWCZXIC7IIj1rhn2AxVvBDq5V2rKIozmbeCL5mLL1CttHVPDMucRDicXb0ijL2Anh
         5zqho6E/SPVxA==
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

