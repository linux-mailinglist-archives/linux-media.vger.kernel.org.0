Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347D5212A88
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 18:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgGBQzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 12:55:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60958 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGBQzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 12:55:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 220CF2A6047
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com,
        tfiga@chromium.org, eddie.cai.linux@gmail.com,
        zhengsq@rock-chips.com
Subject: [PATCH v3 8/9] arm64: dts: rockchip: add isp0 node for rk3399
Date:   Thu,  2 Jul 2020 13:54:09 -0300
Message-Id: <20200702165410.2583375-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200702165410.2583375-1-helen.koike@collabora.com>
References: <20200702165410.2583375-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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

V3:
- clean up clocks

V2:
- re-order power-domains property

V1:
This patch was originally part of this patchset:

    https://patchwork.kernel.org/patch/10267431/

The only difference is:
- add phy properties
- add ports
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 2581e9cc7a1de..a27c3ccf4bd08 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1710,6 +1710,33 @@ vopb_mmu: iommu@ff903f00 {
 		status = "disabled";
 	};
 
+	isp0: isp0@ff910000 {
+		compatible = "rockchip,rk3399-cif-isp";
+		reg = <0x0 0xff910000 0x0 0x4000>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_ISP0>,
+			 <&cru ACLK_ISP0_WRAPPER>,
+			 <&cru HCLK_ISP0_WRAPPER>;
+		clock-names = "clk_isp",
+			      "aclk_isp_wrap",
+			      "hclk_isp_wrap";
+		iommus = <&isp0_mmu>;
+		phys = <&mipi_dphy_rx0>;
+		phy-names = "dphy";
+		power-domains = <&power RK3399_PD_ISP0>;
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
2.26.0

