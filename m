Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632B119DB3E
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 18:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404345AbgDCQQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 12:16:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58122 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404035AbgDCQQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 12:16:51 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 53653298674;
        Fri,  3 Apr 2020 17:16:45 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com
Subject: [PATCH v2 9/9] arm64: dts: rockchip: add isp0 node for rk3399
Date:   Fri,  3 Apr 2020 13:15:38 -0300
Message-Id: <20200403161538.1375908-10-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200403161538.1375908-1-helen.koike@collabora.com>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shunqian Zheng <zhengsq@rock-chips.com>

RK3399 has two ISPs, but only ISP0 was tested at present.
Add isp0 node in rk3399 dtsi

Verified with:
make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
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
index 6b3380b10e596..b1d62a87c5616 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1718,6 +1718,33 @@ vopb_mmu: iommu@ff903f00 {
 		status = "disabled";
 	};
 
+	isp0: isp0@ff910000 {
+		compatible = "rockchip,rk3399-cif-isp";
+		reg = <0x0 0xff910000 0x0 0x4000>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_ISP0>,
+			 <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
+			 <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
+		clock-names = "clk_isp",
+			      "aclk_isp", "aclk_isp_wrap",
+			      "hclk_isp", "hclk_isp_wrap";
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

