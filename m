Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DF21AC055
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634267AbgDPLyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:54:17 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45295 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634245AbgDPLyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:54:13 -0400
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5C51860015;
        Thu, 16 Apr 2020 11:53:02 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
Date:   Thu, 16 Apr 2020 13:50:45 +0200
Message-Id: <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PX30 features a RGA block: add the necessary node to support it.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 75908c587511..4bfbee9d4123 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
 		status = "disabled";
 	};
 
+	rga: rga@ff480000 {
+		compatible = "rockchip,px30-rga";
+		reg = <0x0 0xff480000 0x0 0x10000>;
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
+		reset-names = "core", "axi", "ahb";
+		power-domains = <&power PX30_PD_VO>;
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;
-- 
2.26.0

