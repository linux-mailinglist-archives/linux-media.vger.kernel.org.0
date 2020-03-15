Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E331857D9
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 02:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgCOBqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Mar 2020 21:46:07 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18896 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbgCOBqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Mar 2020 21:46:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e6d88d00000>; Sat, 14 Mar 2020 18:45:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 14 Mar 2020 18:46:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 14 Mar 2020 18:46:05 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 15 Mar
 2020 01:46:05 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 15 Mar 2020 01:46:05 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.141]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e6d88dc0008>; Sat, 14 Mar 2020 18:46:05 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 2/8] arm64: tegra: Add reset-cells to mc
Date:   Sat, 14 Mar 2020 18:46:00 -0700
Message-ID: <1584236766-24819-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
References: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584236752; bh=fypsljnYXUQBk09pkBuzFp0S2nxT0B9eauugx/SlCBI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=PIiJbrc2bXHRaiihRuDuiRbzSVrNzlYWDi2shikzTHchOJJndeDn8ZoZvitf8QK99
         JHQ2Zcy3ZysCxafk3HKuPsSi2rqdEGecxLCA+ubD0P7c9dtBOWV2C3Dm96mI+tRU89
         hmsJ34rMIodSJ3fXvT30PHQdvqK9k5xYBuF6bm8116/Vf+h2t1NwpKRbu1X+qj5Yqg
         /iIJ2yW/Xd0L3wiK9qpTfQtS/fTPQfKtGTnr84TJRtR6DikoJNY6/GRWl+IYI0wmM9
         5yAO6KygImOlHLr2DrEhHynJ5mwcE6WV7VNI0ZcSGdtXs7iqbhbQ8Nggl/diNqUKnT
         /N97jL9mu16Ng==
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

