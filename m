Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1C5438553
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 22:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhJWUiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 16:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhJWUiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 16:38:07 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F48C061766;
        Sat, 23 Oct 2021 13:35:48 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id b188so10078380iof.8;
        Sat, 23 Oct 2021 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kYZLgxf29rXPGIy0NqoVL1o+rM2gGr1j1H+X1hQjOR4=;
        b=eHfL3shFu7T6yK76H9jVeR+EDD/EFDXGPsO0O//3EIn3jxkpvd3q9KB0AJP5gYBADO
         O8pGw5yuernxSi5Oy603fzNkIyCsx6URdZHpeBDQT7u8+woDaQhAzlvztu3IkgSWx67/
         D9YHf0dFqZJ0mj+bXl3EqANfV4MqkF2LfzIRNxoTG05+uLYizbLR+ju11JZLJ5+n226x
         WxNfJiHA4q6YOB9AOv3OSOCUQ53sW9/0ZBSceEzAj83vFfRbFTpobTK45NwPjB/FUKj4
         fiZ/JdEeUQ+ZTLv+V9rCL1oisWNBZnQVz/hxJKa4bnY/5fuD6QRNzvd7m1Xc+IWe7sX3
         Cxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kYZLgxf29rXPGIy0NqoVL1o+rM2gGr1j1H+X1hQjOR4=;
        b=Ex584PeUNNIrSUAyuNeqR92Sf54AZff9jBJlHj1Nn2JunwWQup7FZzyOVN3XQLleyR
         uc1MddN67WoNd7ZaqVngaGKwtoG9fSPVsOA3vHOauJTkPwpt/uffpgMJg0FkmQ5Gz+Ws
         gbdh/CD2LZtcw/gebibOI2CmUMBG4OQ60wfRJf116E7ApwgSI9F4lsA+meA4o+Yu+hdT
         ZvN3Rta4UpLyDjiIz9m335DFw3cc3P3TgRq5I+4j2BFseS9zhSenzfvF5GL+xWMW3lix
         GYcViYjtpWWwoyqog6l7PI3Q25IcFpTIhdgS0HiRR35kxKcIr/VPKSeFXhFLR91+oXT4
         lV6g==
X-Gm-Message-State: AOAM532/FXjNfMS7kVHHUgqUIsy4Af5FtC5wkLVGULWJ7u3pFn8uJxBQ
        s80pEivyKDTy/L+pA46pL+c=
X-Google-Smtp-Source: ABdhPJw42x8qNZR2LGFeVm7q250qSCKu/c8Qv6anPb0nZI00cB/D7/iluEnPVCAffgpDmfJURxqlHg==
X-Received: by 2002:a05:6602:140d:: with SMTP id t13mr4814913iov.120.1635021347553;
        Sat, 23 Oct 2021 13:35:47 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:1534:f270:7127:bc0a])
        by smtp.gmail.com with ESMTPSA id i5sm6128678ilj.49.2021.10.23.13.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:35:47 -0700 (PDT)
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
Subject: [RFC V2 5/5] arm64: dts: imx8mm-evk: Enable OV5640 Camera
Date:   Sat, 23 Oct 2021 15:34:56 -0500
Message-Id: <20211023203457.1217821-6-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023203457.1217821-1-aford173@gmail.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The schematic shows support for a camera interface, and the NXP
kernel shows it is an OV5640.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index e033d0257b5a..27217d30b8d8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -239,6 +239,10 @@ ldo6_reg: LDO6 {
 	};
 };
 
+&csi {
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -287,6 +291,38 @@ pca6416: gpio@20 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
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
+};
+
+&imx8mm_mipi_csi_in {
+	remote-endpoint = <&ov5640_to_mipi_csi2>;
+	data-lanes = <1 2>;
+};
+
+&mipi_csi2 {
+	status = "okay";
 };
 
 &sai3 {
@@ -406,6 +442,14 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
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
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
-- 
2.25.1

