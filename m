Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C25CA153
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbfJCPsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:48:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727024AbfJCPsw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 11:48:52 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 491F920700;
        Thu,  3 Oct 2019 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570117731;
        bh=F5+Id2+i4uSkOnDF22aTVmR46OVB1/MDlfPr46K2ROk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eJmp3yq38oxw9CiZZkmwvg/ssf1SpaEMEirw53bQ8mbE3FmHpz6b9JFgOIWtXquUG
         H1HbPagLs3aV5GbnWnj9Xxpl5vBdgUSoqCCQXZjjU4glX1xVWWhw3XE5+6Me8JmLv8
         PmUbPR63eYgFpR+vQyjYAEuu1Rq21fVB5l2wlbjM=
From:   Maxime Ripard <mripard@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] ARM: dts: sun7i: Drop the module clock from the device tree
Date:   Thu,  3 Oct 2019 17:48:42 +0200
Message-Id: <20191003154842.248763-2-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003154842.248763-1-mripard@kernel.org>
References: <20191003154842.248763-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

What we thought would be the module clock is actually the clock meant to be
used by the sensors, and play no role in the CSI controller. Now that the
binding has been updated to reflect that, let's update the device tree too.

Fixes: d2b9c6444301 ("ARM: dts: sun7i: Add CSI0 controller")
Reported-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 874231be04e4..8aebefd6accf 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -380,9 +380,8 @@
 			compatible = "allwinner,sun7i-a20-csi0";
 			reg = <0x01c09000 0x1000>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
-				 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
-			clock-names = "bus", "mod", "isp", "ram";
+			clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
+			clock-names = "bus", "isp", "ram";
 			resets = <&ccu RST_CSI0>;
 			status = "disabled";
 		};
-- 
2.23.0

