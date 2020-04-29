Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754E41BEB37
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 00:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgD2WB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 18:01:28 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14825 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgD2WB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 18:01:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea9f8f30000>; Wed, 29 Apr 2020 15:00:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Apr 2020 15:01:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Apr 2020 15:01:25 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 22:01:25 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 Apr 2020 22:01:25 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea9f9340001>; Wed, 29 Apr 2020 15:01:25 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v11 2/9] arm64: tegra: Add reset-cells to mc
Date:   Wed, 29 Apr 2020 14:59:59 -0700
Message-ID: <1588197606-32124-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588197619; bh=fypsljnYXUQBk09pkBuzFp0S2nxT0B9eauugx/SlCBI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=fJNGHUKQXapa4+aEMingAMCmJVv+2sxq09n4mP0VhUE7g/lsITZt/LlrSXfYdbdVv
         oar50E8cvooWHfy4d97gwkqYy/2d39ZTidpuWnYI527Yi3Qa+46XnzMT15GZTP6nIu
         0MRJAHZVhlx3YCC2kC8qoJipTkx6IB1ecQXHazPXPFCLfcAZbqxHzs7tyNwOCkpczH
         i0Ohfa/HFN2R82HDvTWGswOHpJzO9hnQGWu2p3VXpeJCjNWad5PJ96IB661Z2Idqzy
         r/apCZabvQHUpNS6VMSLX0AxG1AesMmPrzPkQ5Rspa60vciH2xCJDy7a1S5tp1fQUf
         jsY2PMXnFVXDA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 device tree is missing reset-cells property for mc node.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index d0eff92..5b1dfd8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -894,6 +894,7 @@
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 
 		#iommu-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	sata@70020000 {
-- 
2.7.4

