Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002BC29435A
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409243AbgJTTkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:40:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44998 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404703AbgJTTjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:39:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 64CF51F44DB5
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, kernel@collabora.com,
        hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com,
        eddie.cai.linux@gmail.com, jbx6244@gmail.com,
        zhengsq@rock-chips.com, robin.murphy@arm.com
Subject: [PATCH v6 8/9] arm64: dts: rockchip: add isp0 node for rk3399
Date:   Tue, 20 Oct 2020 16:38:49 -0300
Message-Id: <20201020193850.1460644-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020193850.1460644-1-helen.koike@collabora.com>
References: <20201020193850.1460644-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shunqian Zheng <zhengsq@rock-chips.com>

RK3399 has two ISPs, but only isp0 was tested.
Add isp0 node in rk3399 dtsi

Verified with:
make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v6:
- Add status = "disabled" in the isp0 node
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index ada724b12f014..af5f8e2c5e64d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1723,6 +1723,32 @@ vopb_mmu: iommu@ff903f00 {
 		status = "disabled";
 	};
 
+	isp0: isp0@ff910000 {
+		compatible = "rockchip,rk3399-cif-isp";
+		reg = <0x0 0xff910000 0x0 0x4000>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_ISP0>,
+			 <&cru ACLK_ISP0_WRAPPER>,
+			 <&cru HCLK_ISP0_WRAPPER>;
+		clock-names = "isp", "aclk", "hclk";
+		iommus = <&isp0_mmu>;
+		phys = <&mipi_dphy_rx0>;
+		phy-names = "dphy";
+		power-domains = <&power RK3399_PD_ISP0>;
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
 	isp0_mmu: iommu@ff914000 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff914000 0x0 0x100>, <0x0 0xff915000 0x0 0x100>;
-- 
2.28.0

