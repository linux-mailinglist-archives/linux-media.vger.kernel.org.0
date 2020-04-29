Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D77A1BEB2F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 00:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgD2WB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 18:01:26 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14821 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgD2WBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 18:01:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea9f8f20000>; Wed, 29 Apr 2020 15:00:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Apr 2020 15:01:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Apr 2020 15:01:24 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 22:01:24 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 Apr 2020 22:01:24 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea9f9330000>; Wed, 29 Apr 2020 15:01:23 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v11 1/9] arm64: tegra: Fix sor powergate clocks and reset
Date:   Wed, 29 Apr 2020 14:59:58 -0700
Message-ID: <1588197606-32124-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588197618; bh=PTc2SyRS9NP+68XdMh+c6cj6nLmKTNHZwxALx6dnzdM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=il2yvtidICj4a5bjnABPyAna8tUFqg6pQdx0U6lnEm6+f6ivNFYU0iowbo4AIiVeu
         mnguu6zmllUaEFO6L5f9CmktgavMQ9dX05USsqddZWOoRdh4nL+3K6zJX9+euWNpVT
         fi7772XvA2p9XePJwFNCY1Knv3qpYf/OZUYudBrIOTTnxwi7Uf9q4JTp2cyBrTGXFz
         FKQoYrKuZTptr0pJ5JI3JchEOm7i5fOxOvSFUY+nnSpkbi4LMK6kBnd3XBw143ylBe
         LQQIRaZruaOpkMbPN6XyimQNbRf2HpwkWd3rSijVUDDgoGoFJN4OzsG8iuM7BCyctd
         jXNAWISMppWtQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 device tree lists csi clock and reset under SOR powergate
node.

But Tegra210 has csicil in SOR partition and csi in VENC partition.

So, this patch includes fix for sor powergate node.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 64c46ce..d0eff92 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -796,7 +796,9 @@
 			pd_sor: sor {
 				clocks = <&tegra_car TEGRA210_CLK_SOR0>,
 					 <&tegra_car TEGRA210_CLK_SOR1>,
-					 <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>,
 					 <&tegra_car TEGRA210_CLK_DSIA>,
 					 <&tegra_car TEGRA210_CLK_DSIB>,
 					 <&tegra_car TEGRA210_CLK_DPAUX>,
@@ -804,7 +806,6 @@
 					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
 				resets = <&tegra_car TEGRA210_CLK_SOR0>,
 					 <&tegra_car TEGRA210_CLK_SOR1>,
-					 <&tegra_car TEGRA210_CLK_CSI>,
 					 <&tegra_car TEGRA210_CLK_DSIA>,
 					 <&tegra_car TEGRA210_CLK_DSIB>,
 					 <&tegra_car TEGRA210_CLK_DPAUX>,
-- 
2.7.4

