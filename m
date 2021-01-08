Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F87B2EF837
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 20:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbhAHTe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:34:27 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59462 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728928AbhAHTe1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 14:34:27 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kxxVv-0004Zr-Gj; Fri, 08 Jan 2021 20:33:35 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH RFC 02/11] arm64: dts: rockchip: add isp node for px30
Date:   Fri,  8 Jan 2021 20:33:02 +0100
Message-Id: <20210108193311.3423236-3-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108193311.3423236-1-heiko@sntech.de>
References: <20210108193311.3423236-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Add the rkisp1 node and iommu for the px30 soc.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 52bc54416657..4f762968f75f 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1131,6 +1131,49 @@ vip: vip@ff490000 {
 		status = "disabled";
 	};
 
+	isp: isp@ff4a0000 {
+		compatible = "rockchip,px30-cif-isp"; /*rk3326-rkisp1*/
+		reg = <0x0 0xff4a0000 0x0 0x8000>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "isp", "mi", "mipi";
+		clocks = <&cru SCLK_ISP>,
+			 <&cru ACLK_ISP>,
+			 <&cru HCLK_ISP>,
+			 <&cru PCLK_ISP>;
+		clock-names = "isp", "aclk", "hclk", "pclk";
+		iommus = <&isp_mmu>;
+		phys = <&csi_dphy>;
+		phy-names = "dphy";
+		power-domains = <&power PX30_PD_VI>;
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
+	isp_mmu: iommu@ff4a8000 {
+		compatible = "rockchip,iommu";
+		reg = <0x0 0xff4a8000 0x0 0x100>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "isp_mmu";
+		clocks = <&cru ACLK_ISP>, <&cru HCLK_ISP>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power PX30_PD_VI>;
+		rk_iommu,disable_reset_quirk;
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;
-- 
2.29.2

