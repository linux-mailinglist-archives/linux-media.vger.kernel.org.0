Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D26F7F19D9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 16:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732084AbfKFPVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 10:21:16 -0500
Received: from inva020.nxp.com ([92.121.34.13]:33834 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732033AbfKFPVO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 10:21:14 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A5E31A0913;
        Wed,  6 Nov 2019 16:21:12 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8DA2C1A0650;
        Wed,  6 Nov 2019 16:21:12 +0100 (CET)
Received: from fsr-ub1664-134.ea.freescale.net (fsr-ub1664-134.ea.freescale.net [10.171.74.111])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C1645205EB;
        Wed,  6 Nov 2019 16:21:11 +0100 (CET)
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH 5/5] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Date:   Wed,  6 Nov 2019 17:20:33 +0200
Message-Id: <1573053633-21437-6-git-send-email-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add jpeg decoder/encoder nodes, for now on imx8qxp only.
The same should work on imx8qm, but it was not tested.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  8 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 37 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index d3d26cc..3c6fe76 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -242,3 +242,11 @@
 &scu_key {
 	status = "okay";
 };
+
+&jpegdec {
+	status = "okay";
+};
+
+&jpegenc {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 9646a41..e4eddc4 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -598,4 +598,41 @@
 			#clock-cells = <1>;
 		};
 	};
+
+	img_subsys: bus@58000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x58000000 0x0 0x58000000 0x1000000>;
+
+		jpegdec: jpegdec@58400000 {
+			compatible = "fsl,imx8-jpgdec";
+			reg = <0x58400000 0x00050000 >;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
+					<&pd IMX_SC_R_MJPEG_DEC_S0>,
+					<&pd IMX_SC_R_MJPEG_DEC_S1>,
+					<&pd IMX_SC_R_MJPEG_DEC_S2>,
+					<&pd IMX_SC_R_MJPEG_DEC_S3>;
+			status = "disabled";
+		};
+
+		jpegenc: jpegenc@58450000 {
+			compatible = "fsl,imx8-jpgenc";
+			reg = <0x58450000 0x00050000 >;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
+					<&pd IMX_SC_R_MJPEG_ENC_S0>,
+					<&pd IMX_SC_R_MJPEG_ENC_S1>,
+					<&pd IMX_SC_R_MJPEG_ENC_S2>,
+					<&pd IMX_SC_R_MJPEG_ENC_S3>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.7.4

