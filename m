Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88A0212CF8
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 21:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgGBTOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 15:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGBTON (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 15:14:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE20C08C5C1;
        Thu,  2 Jul 2020 12:14:13 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 926022A60B6
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, tfiga@chromium.org,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com,
        robin.murphy@arm.com
Subject: [PATCH v4 8/9] arm64: dts: rockchip: add isp0 node for rk3399
Date:   Thu,  2 Jul 2020 16:13:21 -0300
Message-Id: <20200702191322.2639681-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200702191322.2639681-1-helen.koike@collabora.com>
References: <20200702191322.2639681-1-helen.koike@collabora.com>
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

V4:
- update clock names

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
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index dba9641947a3a..ed8ba75dbbce8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1721,6 +1721,31 @@ vopb_mmu: iommu@ff903f00 {
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

