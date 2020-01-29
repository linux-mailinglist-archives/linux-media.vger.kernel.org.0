Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA87314D194
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 20:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbgA2Tzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 14:55:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33520 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbgA2Tzp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 14:55:45 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5947C294ADF
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 6/6] arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
Date:   Wed, 29 Jan 2020 16:55:01 -0300
Message-Id: <20200129195501.8317-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129195501.8317-1-ezequiel@collabora.com>
References: <20200129195501.8317-1-ezequiel@collabora.com>
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
---
v4:
* Correct clock names.
v3:
* None.
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index e62ea0e2b657..ca2433ffcf55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1277,8 +1277,20 @@ vdec_mmu: iommu@ff660480 {
 		interrupt-names = "vdec_mmu";
 		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>;
 		clock-names = "aclk", "iface";
+		power-domains = <&power RK3399_PD_VDU>;
 		#iommu-cells = <0>;
-		status = "disabled";
+	};
+
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
 	};
 
 	iep_mmu: iommu@ff670800 {
-- 
2.25.0

