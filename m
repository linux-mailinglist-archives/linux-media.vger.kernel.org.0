Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192B11B6C3A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 05:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgDXDzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 23:55:24 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10164 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgDXDzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 23:55:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea2631b0000>; Thu, 23 Apr 2020 20:55:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 20:55:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 20:55:20 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 03:55:20 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 24 Apr 2020 03:55:19 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea263260001>; Thu, 23 Apr 2020 20:55:19 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v10 2/9] arm64: tegra: Add reset-cells to mc
Date:   Thu, 23 Apr 2020 20:55:06 -0700
Message-ID: <1587700513-28449-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587700507; bh=fypsljnYXUQBk09pkBuzFp0S2nxT0B9eauugx/SlCBI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=hNxzLDJGY06lU9A/rWf9NcVW1VoMDbWaAThTFgUF96VXN/gNQMPXgM+b+1UG98sJt
         p+KT0OvFAtoVpCVw81mfcPpN+7QPecaOQDmtO0ICtYuewZeI/aTxhE2P+d41bJcJZs
         nO51+TVvRiHBjLr9ed9pdeyTKPIFm7xSpjtqnqGoHBbTyrvMdpla3at9ZpCSaZqNsD
         hz0Er3DH0tuY2fWg2MSI9rmBkeOo9gEahI/SKOWiZz0n6xaIcizlC34jc8UEtrDTWQ
         f7EjX4Kyn6rmkoVswpxjAiq+5T+dcASFY/qsLhPYOTF43sAAlIuLyMST/zrALGA627
         28VkWwCipD3GA==
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

