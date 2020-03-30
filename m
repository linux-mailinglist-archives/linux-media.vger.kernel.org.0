Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1F7C19723B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 03:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgC3BrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 21:47:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53536 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbgC3BrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 21:47:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3469629483D
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v7 5/5] arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
Date:   Sun, 29 Mar 2020 22:46:16 -0300
Message-Id: <20200330014616.10621-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200330014616.10621-1-ezequiel@collabora.com>
References: <20200330014616.10621-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

RK3399 has a Video decoder, define the node in the dtsi. We also add
the missing power-domain in mmu node and enable the block.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
--
v7:
* As noted by Johan Jonker, fix node order.
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 33cc21fcf4c1..dfb737e8ff31 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1278,6 +1278,18 @@ vpu_mmu: iommu@ff650800 {
 		power-domains = <&power RK3399_PD_VCODEC>;
 	};
 
+	vdec: video-codec@ff660000 {
+		compatible = "rockchip,rk3399-vdec";
+		reg = <0x0 0xff660000 0x0 0x400>;
+		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "vdpu";
+		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
+			 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
+		clock-names = "axi", "ahb", "cabac", "core";
+		power-domains = <&power RK3399_PD_VDU>;
+		iommus = <&vdec_mmu>;
+	};
+
 	vdec_mmu: iommu@ff660480 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff660480 0x0 0x40>, <0x0 0xff6604c0 0x0 0x40>;
@@ -1285,8 +1297,8 @@ vdec_mmu: iommu@ff660480 {
 		interrupt-names = "vdec_mmu";
 		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3399_PD_VDU>;
 		#iommu-cells = <0>;
-		status = "disabled";
 	};
 
 	iep_mmu: iommu@ff670800 {
-- 
2.26.0.rc2

