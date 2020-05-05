Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2E61C4BFF
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 04:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgEECbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 22:31:04 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10286 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgEECbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 22:31:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb0cfa20001>; Mon, 04 May 2020 19:29:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 19:31:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 04 May 2020 19:31:03 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 02:31:03 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 5 May 2020 02:31:03 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.119]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb0cfe60003>; Mon, 04 May 2020 19:31:03 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v12 1/9] arm64: tegra: Fix sor powergate clocks and reset
Date:   Mon, 4 May 2020 19:31:52 -0700
Message-ID: <1588645920-20557-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588645794; bh=3xf9czYfmSODImXook5Yf5mDw/b6JJdIG+Ndajeq4E4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=nBOx1h18nZGHQ2TuGbWIOwyq9PGrpwq8lcbXq+diJtgdXUIxVypw464IjM/1JaVte
         8I4awGOZpKXR4D9jWvHaT/IMGXY/X7j4evki9IFR73hZUFResIKFNgkGW5/oUlnn/9
         64a661Py9jm8PSDEGEQTaAN8+xZ96hIVIlyr8Oynk4skXnw63BBTOtyL5vaPmpz4vR
         UGZlrrwuPbsSUTx/ax0/RFV8xhWUHupenIF+vc6FZWYYC0B2+x3Iy7SdE765+6a6zn
         WFBNEUyWzXeXeajDnj6rbIh1O4h7rScOMQiIzpfpyxAX1T/gFO+e/Kk5wPsi6veZ26
         fnOh5whYhnlaQ==
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
index a550e7b..909960a 100644
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

