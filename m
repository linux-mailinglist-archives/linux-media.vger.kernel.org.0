Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BA6446ECD
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 16:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbhKFP5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 11:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbhKFP5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 11:57:33 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963CBC061570;
        Sat,  6 Nov 2021 08:54:52 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id i11so3347776ilv.13;
        Sat, 06 Nov 2021 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bumy0VDul+gcmA0r67vymTvlrNYaUXXRfbPb8ywD07g=;
        b=l4ZyS5nX9X1I0dFs+nluMoED++JUqsHsoFPn3JRg28ABTcCC/V22KjGA+Ft69dzWTn
         m1eaIwyrzBd8rGMHFWxa6BlDRO7wXm+5BRklPKyCCZ11ztxdhNbmsqxvxuiwgXzoc+MG
         G6NxO8K24JgkHmOexI62bSpQj3FlWimWgo1sN6J591cn8oUb5VjE1EWVRFZCceaQt0Mn
         aqnu3t+IJhdOa8P0EqkQ6TZCvHocxeDzVHMY26wuRySz3vo1wLAtvFfvQIqgeahE3FLf
         J17e36rK9jeGDkBflD6K3A/54xiwnsGNL5quTU2rfRYtBxPUDdtcXgDEnNGtWJQQzrBv
         bV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bumy0VDul+gcmA0r67vymTvlrNYaUXXRfbPb8ywD07g=;
        b=CSCsA83rt9CU0qRhEdSJzz84QwnfmuOvdSFx1pI3N7n/NkLVgeI6FNiGD2Y8dyPTZS
         aPxrWho86I0tOeL6a8UB47ZCZIuoip0789Dex/WXx+H4FrHdki1IQcIQE/Von+UZ5vsx
         MNYLJkitoU9rhwp+nyJHvRG+wPdmU6DMk6+wk+qL6kGlriKpYWRkjCK5rEPzqomnuSTR
         gB8iaIMBwnPZQzx/veA0fR+wGnomWCMnpIeGKblzmw0Tm8pXI86HY6q96n7Bgx1z2jKb
         gTsTLh9n8RwwJeQn1V+GA3gD0GQqeXqyg6qds4zvwx8exgylPGFPBhp3TEvor5ToNcxs
         RBww==
X-Gm-Message-State: AOAM531oeXZjCUQOCfD9o0FFvu0taAHzO0Yoizcd4OYK23IAhBFBb2mX
        Eaf+pl2SWbADZU2jeRkHaoM=
X-Google-Smtp-Source: ABdhPJxV6c2Llyaj0786TGHnFT2bxq61GmeS0chcYvU5Ulm1FlWJgPIBVkw/1YG2tUvw2F5CcYySrA==
X-Received: by 2002:a05:6e02:1ba4:: with SMTP id n4mr27912049ili.269.1636214091942;
        Sat, 06 Nov 2021 08:54:51 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id d2sm5718313ilg.77.2021.11.06.08.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:54:51 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
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
Subject: [PATCH V2 4/5] arm64: dts: imx8mm-beacon: Enable OV5640 Camera
Date:   Sat,  6 Nov 2021 10:54:26 -0500
Message-Id: <20211106155427.753197-4-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
References: <20211106155427.753197-1-aford173@gmail.com>
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
V2:  No change

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

