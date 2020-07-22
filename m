Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBA2229C5F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 17:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733271AbgGVP4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 11:56:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35862 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732910AbgGVP4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 11:56:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id F2AD12976FD
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
Subject: [PATCH v5 9/9] arm64: dts: rockchip: add isp and sensors for Scarlet
Date:   Wed, 22 Jul 2020 12:55:33 -0300
Message-Id: <20200722155533.252844-10-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200722155533.252844-1-helen.koike@collabora.com>
References: <20200722155533.252844-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Eddie Cai <eddie.cai.linux@gmail.com>

Enable ISP and camera sensor ov2685 and ov5695 for Scarlet Chromebook

Verified with:
    make ARCH=arm64 dtbs_check

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

This patch is based on:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/527854

Changes in V3:
- This patch was first submitted stand alone at
https://lore.kernel.org/patchwork/patch/1223736/
I'm including in this patch series without changes
---
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
index 4373ed732af76..ae08205aa8e24 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
@@ -296,6 +296,52 @@ camera: &i2c7 {
 
 	/* 24M mclk is shared between world and user cameras */
 	pinctrl-0 = <&i2c7_xfer &test_clkout1>;
+
+	/* Rear-facing camera */
+	wcam: camera@36 {
+		compatible = "ovti,ov5695";
+		reg = <0x36>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcam_rst>;
+
+		clocks = <&cru SCLK_TESTCLKOUT1>;
+		clock-names = "xvclk";
+
+		avdd-supply = <&pp2800_cam>;
+		dvdd-supply = <&pp1250_cam>;
+		dovdd-supply = <&pp1800_s0>;
+		reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+		port {
+			wcam_out: endpoint {
+				remote-endpoint = <&mipi_in_wcam>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+
+	/* Front-facing camera */
+	ucam: camera@3c {
+		compatible = "ovti,ov2685";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ucam_rst>;
+
+		clocks = <&cru SCLK_TESTCLKOUT1>;
+		clock-names = "xvclk";
+
+		avdd-supply = <&pp2800_cam>;
+		dovdd-supply = <&pp1800_s0>;
+		dvdd-supply = <&pp1800_s0>;
+		reset-gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ucam_out: endpoint {
+				remote-endpoint = <&mipi_in_ucam>;
+				data-lanes = <1>;
+			};
+		};
+	};
 };
 
 &cdn_dp {
@@ -353,10 +399,38 @@ &io_domains {
 	gpio1830-supply = <&pp1800_s0>;		/* APIO4_VDD;  4c 4d */
 };
 
+&isp0 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_wcam: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&wcam_out>;
+				data-lanes = <1 2>;
+			};
+
+			mipi_in_ucam: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&ucam_out>;
+				data-lanes = <1>;
+			};
+		};
+	};
+};
+
+&isp0_mmu {
+	status = "okay";
+};
+
 &max98357a {
 	sdmode-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
 };
 
+&mipi_dphy_rx0 {
+	status = "okay";
+};
+
 &mipi_dsi {
 	status = "okay";
 	clock-master;
-- 
2.28.0.rc1

