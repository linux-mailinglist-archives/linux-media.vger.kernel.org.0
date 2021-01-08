Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF34E2EF834
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 20:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbhAHTe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 14:34:26 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59442 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728883AbhAHTe0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 14:34:26 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kxxVv-0004Zr-RM; Fri, 08 Jan 2021 20:33:35 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH RFC 03/11] arm64: dts: rockchip: hook up camera on px30-evb
Date:   Fri,  8 Jan 2021 20:33:03 +0100
Message-Id: <20210108193311.3423236-4-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108193311.3423236-1-heiko@sntech.de>
References: <20210108193311.3423236-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 5fe905fae9a8..52e788e983af 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -422,6 +422,58 @@ sensor@4c {
 	};
 };
 
+&i2c2 {
+	status = "okay";
+
+	clock-frequency = <100000>;
+
+	/* These are relatively safe rise/fall times; TODO: measure */
+	i2c-scl-falling-time-ns = <50>;
+	i2c-scl-rising-time-ns = <300>;
+
+	ov5695: ov5695@36 {
+		compatible = "ovti,ov5695";
+		reg = <0x36>;
+		avdd-supply = <&vcc2v8_dvp>;
+		dvdd-supply = <&vcc1v5_dvp>;
+		dovdd-supply = <&vcc1v8_dvp>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		clock-names = "xvclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkout_m0>;
+		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
+
+		port {
+			ucam_out: endpoint {
+				remote-endpoint = <&mipi_in_ucam>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&csi_dphy {
+	status = "okay";
+};
+
+&isp {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_ucam: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&ucam_out>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&isp_mmu {
+	status = "okay";
+};
+
 &i2s1_2ch {
 	status = "okay";
 };
-- 
2.29.2

