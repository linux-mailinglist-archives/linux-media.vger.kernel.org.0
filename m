Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01DB44645B
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 14:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhKENpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 09:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhKENpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 09:45:39 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088E2C061205;
        Fri,  5 Nov 2021 06:43:00 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id j28so9504245ila.1;
        Fri, 05 Nov 2021 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SarUraL3MNewUYrIR1gjIrvQNh1IHGXftn6tysi+onY=;
        b=BFKnkms3Yvsl99PMfqniXuAWo8Xc41e1L6vsekeHPdcmBmCaUVlMxbBifpx0sNaGvg
         KLjLFbUtZP72D7rzTVYrNsiFe+Nx3F3PQnSEHK55gxRml/KtXZXCZBYvz9s3zr5I0gU9
         7ZcoXbD5fkBackuPOw/OfqWEpvLqu1JKsI9TaFQgRrbOMSszZf6o/UB4lJ2Zk6APPzXa
         gNJZaUQCvZ7IAn3DOJfI9Qz62YybjVnX9EAEFgOxM75QzTxJ4wh9Nf8rdx47JpBwmchm
         c4i7cTRsl2w9Jjp/VokU5gD6gUkKAHYPMywmAiCyovt82zzS4boNeLFHLUNPdrPyBbAa
         pLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SarUraL3MNewUYrIR1gjIrvQNh1IHGXftn6tysi+onY=;
        b=AnBUCuPb1ZYibCDr+wHL81/LK5j7gAWubTFShlPfxPrN5OwPT0gA3svBMPaR15fNMu
         tkF7Luu3BBuYrpHOVnH/TzoC/ne0z5wzvfsOIT5xYG5C5Wim+KTjEaHk/TMp/J76PBt5
         cQnQCxSzoqRF0TNDOzVSINtttCLLWPfKjueloPsz0vVpSkqSl4hRNWxCX+LJxhC2T63j
         ZjAY85umx0gjIxgjkPsjauae0p8y2XXR5MqFeo7WHFU4itR9zOrp0y+WB1LHgBkrLTXT
         E3yBlu8pbAp51WalEg4a1aJXBt/ey+ffTMqHcepjmRoxxw7vFZZL+Pn7PsMWLQ5yHc+r
         eM5A==
X-Gm-Message-State: AOAM531zqpbDgIELFVHLCfPY7REcXYV/nlVwYxItU1PPgnPF5pDlZNcy
        I2eEI4N6QcqLvi25YBxeVr8=
X-Google-Smtp-Source: ABdhPJzLq3UvMLphxCEWMLq1ouYIv2fU+fB1+Jm4nDVL7aswxiaNpxLnY7RTPGDVU7ftlalBbIDD1w==
X-Received: by 2002:a05:6e02:148c:: with SMTP id n12mr14926231ilk.131.1636119779379;
        Fri, 05 Nov 2021 06:42:59 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j15sm4537909ile.65.2021.11.05.06.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:42:57 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: imx8mm-beacon: Enable OV5640 Camera
Date:   Fri,  5 Nov 2021 08:42:27 -0500
Message-Id: <20211105134228.731331-4-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105134228.731331-1-aford173@gmail.com>
References: <20211105134228.731331-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The baseboard has support for a TDNext 5640 Camera which
uses an OV5640 connected to a 2-lane CSI2 interface.

With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
pipeline can be configured with the following:

    media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"

The camera and various nodes in the pipeline can be configured for UYVY:
    media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
    media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../freescale/imx8mm-beacon-baseboard.dtsi    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index 6f5e63696ec0..0fb95f4a5e78 100644
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
@@ -141,6 +179,18 @@ pca6416_1: gpio@21 {
 	};
 };
 
+&mipi_csi {
+	status = "okay";
+	ports {
+		port@0 {
+			imx8mm_mipi_csi_in: endpoint {
+				remote-endpoint = <&ov5640_to_mipi_csi2>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -209,6 +259,14 @@ MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x41
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
2.32.0

