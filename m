Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 854DF19D8EF
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391052AbgDCOV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 10:21:57 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44843 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390965AbgDCOV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 10:21:56 -0400
X-Originating-IP: 77.205.41.241
Received: from localhost.localdomain (241.41.205.77.rev.sfr.net [77.205.41.241])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0A3931BF220;
        Fri,  3 Apr 2020 14:21:52 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add the camera interface description of the PX30
Date:   Fri,  3 Apr 2020 16:21:22 +0200
Message-Id: <20200403142122.297283-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403142122.297283-1-maxime.chevallier@bootlin.com>
References: <20200403142122.297283-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PX30 has a camera interface, supporting CSI2, BT656 and Parallel
modes. Add a DT description for this interface.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 3e1f51a66daf..38ed35bc9b7a 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1058,6 +1058,18 @@ dsi_in_vopl: endpoint@1 {
 		};
 	};
 
+	cif: cif@ff490000 {
+		compatible = "rockchip,px30-cif";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>, <&cru SCLK_CIF_OUT>;
+		clock-names = "aclk_cif", "hclk_cif", "pclk_cif", "cif_out";
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "rst_cif_a", "rst_cif_h", "rst_cif_pclkin";
+		power-domains = <&power PX30_PD_VI>;
+		status = "disabled";
+	};
+
 	vopb: vop@ff460000 {
 		compatible = "rockchip,px30-vop-big";
 		reg = <0x0 0xff460000 0x0 0xefc>;
-- 
2.24.1

