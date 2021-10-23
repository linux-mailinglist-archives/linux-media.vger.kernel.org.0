Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB4E43854A
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 22:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhJWUiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 16:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhJWUiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 16:38:04 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8971DC061714;
        Sat, 23 Oct 2021 13:35:44 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id j10so4904046ilu.2;
        Sat, 23 Oct 2021 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KDOP1tCAcTvluW80vZVwTNvTPHQ675ZCbgD2GhXsipY=;
        b=EymZQsYg6HVkF4fzOeyrwlWNp+qt5S8Fz4YWTxg9nETZHkGoJMGFBQp4Ol/V+jFn6P
         cadYe1IRZVhbqt2259gj7ifcypiuOwf/Rl3+n5ZVpT+Enog7fLFjB6hGwPcW1/FL+How
         Oz2nT+qDsk52BiL02dGFx11GyFoU7vFvRW8ec7MR31AA4Wfj/fgOMBVS0q7DK0P6Qvhs
         2hW83AXHA6101TaCvjQ4GDSnmyr0b4a2N78ngNw1m4M4+pbw1klkLMsw1YxxKhCIMLmm
         f2db3lmg6ITh8rOUWMOBBwTDJDYR63M7DMLFzTDAmhyW6mpff533VLDeaEd8x7saV/XV
         70vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDOP1tCAcTvluW80vZVwTNvTPHQ675ZCbgD2GhXsipY=;
        b=dzcINtwxzMfPw/Zvkzbdl0NviwJxnPYVwdOSRIRUTpWqzrOKXwXpOqbXkv4KJymMQ9
         ksKOyHlXMc9G1EcbHdatcatcrN3rb2u/dq1eM9XIEzj/hk6F3Y67qWXHGbHSQ/k/HMhs
         y3WxZsgJBJB52PCgpTgBdjwfDa/fYqCIZ362NS9NeuXlqKFxnh2VBl9sAiSCdYAS2blv
         eEcs6JTvLTmKwWGktVdjqb54TIpWpfVNqqvAFndYkdhRhUHQFNGHJjU3SJW0FzzdBIOJ
         XlXH56BsUs9n8UN+2f9GI24ZNC89jp6XSI7L+M69eoSzlZp2kvMung2PcjQqEAzeYYpC
         a6EA==
X-Gm-Message-State: AOAM531dLrMkT26Zc0C/cwQTxyStMBRl0nMhA6qyc4g8e91ZGUkW1Pzq
        ye2TlY1XkqpJm00bdIhjbRc=
X-Google-Smtp-Source: ABdhPJw11YlXTJPFAcwSmNr5wGo1eBMiMJQGN3Z+9b0rBf4UGcEncUFSY9I7jgcnkGQ4e2dmJN/dEA==
X-Received: by 2002:a05:6e02:1bcb:: with SMTP id x11mr3566645ilv.147.1635021343882;
        Sat, 23 Oct 2021 13:35:43 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:1534:f270:7127:bc0a])
        by smtp.gmail.com with ESMTPSA id i5sm6128678ilj.49.2021.10.23.13.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:35:43 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        cstevens@beaconembedded.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC V2 3/5] arm64: dts: imx8mm-beacon: Enable OV5640 Camera
Date:   Sat, 23 Oct 2021 15:34:54 -0500
Message-Id: <20211023203457.1217821-4-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023203457.1217821-1-aford173@gmail.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The baseboard has support for a TDNext 5640 Camera which
uses an OV5640 connected to a 2-lane CSI2 interface.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../freescale/imx8mm-beacon-baseboard.dtsi    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index 6f5e63696ec0..cb19c80ac29c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
@@ -43,6 +43,16 @@ reg_audio: regulator-audio {
 		enable-active-high;
 	};
 
+	reg_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		regulator-name = "mipi_pwr";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&pca6416_1 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -67,6 +77,10 @@ sound {
 	};
 };
 
+&csi {
+	status = "okay";
+};
+
 &ecspi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_espi2>;
@@ -90,6 +104,30 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5640>;
+		reg = <0x3c>;
+		clocks = <&clk IMX8MM_CLK_CLKO1>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MM_CLK_CLKO1>;
+		assigned-clock-parents = <&clk IMX8MM_CLK_24M>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_camera>;  /* 2.8v */
+		powerdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			ov5640_to_mipi_csi2: endpoint {
+				remote-endpoint = <&imx8mm_mipi_csi_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &i2c4 {
@@ -141,6 +179,15 @@ pca6416_1: gpio@21 {
 	};
 };
 
+&imx8mm_mipi_csi_in {
+	remote-endpoint = <&ov5640_to_mipi_csi2>;
+	data-lanes = <1 2>;
+};
+
+&mipi_csi2 {
+	status = "okay";
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -209,6 +256,14 @@ MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x41
 		>;
 	};
 
+	pinctrl_ov5640: ov5640grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7		0x19
+			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
+			MX8MM_IOMUXC_GPIO1_IO14_CCMSRCGPCMIX_CLKO1	0x59
+		>;
+	};
+
 	pinctrl_pcal6414: pcal6414-gpiogrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19
-- 
2.25.1

