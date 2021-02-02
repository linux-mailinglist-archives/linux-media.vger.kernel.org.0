Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA0030C2FA
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 16:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbhBBPFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 10:05:48 -0500
Received: from gloria.sntech.de ([185.11.138.130]:48868 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234891AbhBBO5o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:57:44 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l6x6o-00020V-MV; Tue, 02 Feb 2021 15:56:50 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, heiko@sntech.de, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, cmuellner@linux.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 6/6] arm64: dts: rockchip: add isp1 node on rk3399
Date:   Tue,  2 Feb 2021 15:56:32 +0100
Message-Id: <20210202145632.1263136-7-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202145632.1263136-1-heiko@sntech.de>
References: <20210202145632.1263136-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

ISP1 is supplied by the tx1rx1 dphy, that is controlled from
inside the dsi1 controller, so include the necessary phy-link
for it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 7c661d84df25..98cec9387300 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1756,6 +1756,32 @@ isp0_mmu: iommu@ff914000 {
 		rockchip,disable-mmu-reset;
 	};
 
+	isp1: isp1@ff920000 {
+		compatible = "rockchip,rk3399-cif-isp";
+		reg = <0x0 0xff920000 0x0 0x4000>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_ISP1>,
+			 <&cru ACLK_ISP1_WRAPPER>,
+			 <&cru HCLK_ISP1_WRAPPER>;
+		clock-names = "isp", "aclk", "hclk";
+		iommus = <&isp1_mmu>;
+		phys = <&mipi_dsi1>;
+		phy-names = "dphy";
+		power-domains = <&power RK3399_PD_ISP1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
 	isp1_mmu: iommu@ff924000 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff924000 0x0 0x100>, <0x0 0xff925000 0x0 0x100>;
-- 
2.29.2

