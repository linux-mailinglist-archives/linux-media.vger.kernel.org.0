Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C371D1B1A85
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 02:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgDUALV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 20:11:21 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9959 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDUALV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 20:11:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9e3a1a0004>; Mon, 20 Apr 2020 17:11:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 17:11:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 Apr 2020 17:11:19 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 00:11:19 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 21 Apr 2020 00:11:18 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e9e3a250000>; Mon, 20 Apr 2020 17:11:18 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v8 1/9] arm64: tegra: Fix sor powergate clocks and reset
Date:   Mon, 20 Apr 2020 17:11:06 -0700
Message-ID: <1587427874-3291-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587427866; bh=PTc2SyRS9NP+68XdMh+c6cj6nLmKTNHZwxALx6dnzdM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=LYZRJQDL0d1toLf0E1kgR+5GUjEWtPjdRTqp7tOPVkX68GJlGOoGp7D/gC5tIKSIF
         K+Zmt4jx9iGbcDbxhkjKIZtaJKaPZk8rwcBNOJHtcht8hwncMV8QDELvStN2BS6SJK
         6Ib7c0jCQrehhDdFkZa+s9JINk9ZGaWV9W0KSSLmwhlGRcIfYZ+ZlI6TiHziJFNnnL
         /Z4mEeGSccwf+ExHA7NP8t2g7WnZt0Fdf/zga25Sci0ZYVttNERhaE1XQ5tQDs7+AI
         99uS6aUNVQ5N5pJOjue1IOnRg5yrnBPbkUxVDUec0BUocwYy8VsaORYBA1HWkx4zYq
         0irogxi/S1Xqg==
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

