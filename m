Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610A03600C9
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 06:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhDOEGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 00:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhDOEGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 00:06:20 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B1EC061574;
        Wed, 14 Apr 2021 21:05:58 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id p12so15989094pgj.10;
        Wed, 14 Apr 2021 21:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zlc3V25U9gckK6PqMa/W4dDg79hAl8KvtyFTHML3m7Q=;
        b=eq2faP9z2K0Fy2Zf2JZeJKDzfQ4p8reSNjLBf4ab8Mkini3n5S3fcYw5PAx5WB6JPt
         ijrv45uLvycm1z6xCAwO35PohD7sXQb09J72AW8nhukb/RcSrnlCEWhbXQtsPPo4Bm88
         yNuncfg3UsfNhSOfBv8PuPkCCvEnu2C+ou3erC+8XYqUB6ER6Z+AE4QnWkm8EUD1mzR5
         0EQeY7rmieLaz+a9APKM2H77XUvKajISIIvZz/w2dzLDOxSVKekOXJyOJfNj7cZd+cbg
         A1EI7AjhaA4GBVWixZ2knb6IOjLoV2CW9S77tdY4A5RbFK3sDPBHAWiskJ/Tb2GhZ6Hv
         BKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zlc3V25U9gckK6PqMa/W4dDg79hAl8KvtyFTHML3m7Q=;
        b=FgwwJhKoZAMXAiPj9cllPJ5DAeeHTPZC1f8SS6Dadqou0BGvdW3gWywqfnNnbGaB2M
         iZqlt9EAHTdlT2mFHc268e66HsXVw0V8VcLqfYgmhzZjt6fMRA7OumOQnZQZr/hL6hbw
         ZPngHLBxxt1qb+XV2OKnl2IbZuf7s72sT7mbZTjAB6x05o5hPnp3X/UE4+ZyRBcAsuMR
         BByBIfcNnSNeYY/cHN+ffFEfbDXL+pu2mGYlD0xh0BSpcOLA7OrZUHREDXf2tXRF/E+2
         Uwpn91LwhGkt04V4pDQ8MzF5Vv4SWu8q5iHkWuoS2OTgIBRISB7Dklo4OmZrU+TD7I1g
         sd4w==
X-Gm-Message-State: AOAM530y7cpQQwOBQQdsIvTVyHkgUen+Vl5ejn9gTjdMQCtFq40U3CA0
        YrIxdKt4Od0VTGLbNXuxiUI=
X-Google-Smtp-Source: ABdhPJzPhKfkWG2ustamkdEpXTSuX8BKl6dA6p2iJWmxfP+LteeA+n3bXaeQ+ZBC51B/M7TX+he5JA==
X-Received: by 2002:a65:558c:: with SMTP id j12mr1625718pgs.271.1618459558101;
        Wed, 14 Apr 2021 21:05:58 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id i17sm714406pfd.84.2021.04.14.21.05.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Apr 2021 21:05:57 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        shawnguo@kernel.org, krzk@kernel.org, linux@rempel-privat.de,
        s.riedmueller@phytec.de, matthias.schiffer@ew.tq-group.com,
        leoyang.li@nxp.com, arnd@arndb.de, olof@lixom.net,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        prabhakar.csengg@gmail.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-media@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3 3/4] arm: dts: imx: Add i.mx6q DaSheng COM-9XX SBC board support
Date:   Thu, 15 Apr 2021 12:05:34 +0800
Message-Id: <1618459535-8141-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

The DaSheng Com-9xx is and ARM based signle board computer (SBC)
featuring:
- i.MX6Q
- 2GiB LPDDR3 DRAM
- 8GiB eMMC 5.0 FLASH
- 4MiB SPI Flash
- USB 2.0 Host/Device
- Multiple multi-protocol RS232/RS485 Serial ports
- microSD socket
- 5V DC power input
- HDMI1.4a,1080p@60
- RGMIIx1 Gigabit Ethernet
- CSI0x1, connect with ov2659

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v3: move imx6q-ds.dtb after imx6q-dms-ba16.dtb to follow the alphabetical order

 arch/arm/boot/dts/Makefile        |   1 +
 arch/arm/boot/dts/imx6q-ds.dts    |  17 ++
 arch/arm/boot/dts/imx6qdl-ds.dtsi | 465 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 483 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-ds.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-ds.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a19c5ab9df84..425fe17ef7c1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -510,6 +510,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-dms-ba16.dtb \
+	imx6q-ds.dtb \
 	imx6q-emcon-avari.dtb \
 	imx6q-evi.dtb \
 	imx6q-gk802.dtb \
diff --git a/arch/arm/boot/dts/imx6q-ds.dts b/arch/arm/boot/dts/imx6q-ds.dts
new file mode 100644
index 000000000000..b0a63a133977
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-ds.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2021 Dillon Min <dillon.minfei@gmail.com>
+//
+// Based on imx6qdl-sabresd.dtsi which is:
+// Copyright 2012 Freescale Semiconductor, Inc.
+// Copyright 2011 Linaro Ltd.
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-ds.dtsi"
+
+/ {
+	model = "DaSheng i.MX6 Quad Com-9xx Board";
+	compatible = "ds,imx6q-sbc", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-ds.dtsi b/arch/arm/boot/dts/imx6qdl-ds.dtsi
new file mode 100644
index 000000000000..d28e065349cd
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-ds.dtsi
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2021 Dillon Min <dillon.minfei@gmail.com>
+//
+// Based on imx6qdl-sabresd.dtsi which is:
+// Copyright 2012 Freescale Semiconductor, Inc.
+// Copyright 2011 Linaro Ltd.
+
+#include <dt-bindings/clock/imx6qdl-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x80000000>;
+	};
+
+	reg_usb_otg_vbus: regulator-usb-otg-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_usb_h1_vbus: regulator-usb-h1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_h1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		green {
+			gpios = <&gpio4 8 0>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&ipu1_csi0_from_ipu1_csi0_mux {
+	bus-width = <8>;
+	data-shift = <12>; /* Lines 19:12 used */
+	hsync-active = <1>;
+	vsync-active = <1>;
+};
+
+&ipu1_csi0_mux_from_parallel_sensor {
+	remote-endpoint = <&ov2659_to_ipu1_csi0_mux>;
+};
+
+&ipu1_csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi0>;
+	status = "okay";
+};
+
+&clks {
+	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
+				 <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
+};
+
+&ecspi1 {
+	cs-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	status = "okay";
+
+	flash: m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "st,m25p80", "jedec,spi-nor";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy: ethernet-phy@1 {
+			reg = <1>;
+			qca,clk-out-frequency = <125000000>;
+			reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+		};
+	};
+};
+
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi_cec>;
+	ddc-i2c-bus = <&i2c3>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	pmic: pfuze100@8 {
+		compatible = "fsl,pfuze100";
+		reg = <0x08>;
+
+		regulators {
+			sw1a_reg: sw1ab {
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			sw1c_reg: sw1c {
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			sw2_reg: sw2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			sw3a_reg: sw3a {
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1975000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw3b_reg: sw3b {
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1975000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw4_reg: sw4 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			swbst_reg: swbst {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5150000>;
+			};
+
+			snvs_reg: vsnvs {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vref_reg: vrefddr {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen1_reg: vgen1 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+			};
+
+			vgen2_reg: vgen2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+			};
+
+			vgen3_reg: vgen3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			vgen4_reg: vgen4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen5_reg: vgen5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen6_reg: vgen6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	ov2659: camera@30 {
+		compatible = "ovti,ov2659";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov2659>;
+		clocks = <&clks IMX6QDL_CLK_CKO>;
+		clock-names = "xvclk";
+		reg = <0x30>;
+		powerdown-gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+		status = "okay";
+
+		port {
+			ov2659_to_ipu1_csi0_mux: endpoint {
+				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+				link-frequencies = /bits/ 64 <70000000>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	imx6qdl-ds {
+		pinctrl_hog: hoggrp {
+			fsl,pins = <
+				MX6QDL_PAD_NANDF_D0__GPIO2_IO00 0x1b0b0
+				MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x1b0b0
+				MX6QDL_PAD_GPIO_0__CCM_CLKO1    0x130b0
+				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x1b0b0
+				MX6QDL_PAD_KEY_COL2__GPIO4_IO10 0x1b0b0
+			>;
+		};
+
+		pinctrl_ecspi1: ecspi1grp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_ROW1__GPIO4_IO09	0x1b0b0
+				MX6QDL_PAD_ENET_RXD0__GPIO1_IO27 0x1b0b0
+				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK	0x100b1
+				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI	0x100b1
+				MX6QDL_PAD_EIM_D17__ECSPI1_MISO	0x100b1
+			>;
+		};
+
+		pinctrl_enet: enetgrp {
+			fsl,pins = <
+				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+				MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x1b030
+				MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b030
+				MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b030
+				MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b030
+				MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b030
+				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x1b030
+				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+				MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x1b030
+				MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+				MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+				MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+				MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x1b030
+			>;
+		};
+
+		pinctrl_hdmi_cec: hdmicecgrp {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_A25__HDMI_TX_CEC_LINE	0x1f8b0
+			>;
+		};
+
+		pinctrl_i2c2: i2c2grp {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_EB2__I2C2_SCL		0x4001b8b1
+				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+			>;
+		};
+
+		pinctrl_i2c3: i2c3grp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_5__I2C3_SCL		0x4001b8b1
+				MX6QDL_PAD_GPIO_6__I2C3_SDA		0x4001b8b1
+			>;
+		};
+
+		pinctrl_ipu1_csi0: ipu1csi0grp {
+			fsl,pins = <
+				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18    0x1b0b0
+				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19    0x1b0b0
+				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK   0x1b0b0
+				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC      0x1b0b0
+				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC     0x1b0b0
+			>;
+		};
+
+		pinctrl_ov2659: ov2659grp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_16__GPIO7_IO11 0x1b0b0
+				MX6QDL_PAD_GPIO_7__GPIO1_IO07 0x1b0b0
+			>;
+		};
+
+		pinctrl_uart4: uart4grp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL0__UART4_TX_DATA	0x1b0b1
+				MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA	0x1b0b1
+			>;
+		};
+
+		pinctrl_usbotg: usbotggrp {
+			fsl,pins = <
+				MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID	0x17059
+			>;
+		};
+
+		pinctrl_usdhc1: usdhc1grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD1_CMD__SD1_CMD		0x17059
+				MX6QDL_PAD_SD1_CLK__SD1_CLK		0x10059
+				MX6QDL_PAD_SD1_DAT0__SD1_DATA0		0x17059
+				MX6QDL_PAD_SD1_DAT1__SD1_DATA1		0x17059
+				MX6QDL_PAD_SD1_DAT2__SD1_DATA2		0x17059
+				MX6QDL_PAD_SD1_DAT3__SD1_DATA3		0x17059
+				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28	0x1b0b0
+			>;
+		};
+
+		pinctrl_usdhc2: usdhc2grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10059
+				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+			>;
+		};
+
+		pinctrl_usdhc3: usdhc3grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10059
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
+				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
+				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
+				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
+			>;
+		};
+
+		pinctrl_wdog: wdoggrp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_1__WDOG2_B		0x1b0b0
+			>;
+		};
+	};
+
+	gpio_leds {
+		pinctrl_gpio_leds: gpioledsgrp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL1__GPIO4_IO08 0x1b0b0
+			>;
+		};
+	};
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usbh1 {
+	vbus-supply = <&reg_usb_h1_vbus>;
+	status = "okay";
+};
+
+&usbotg {
+	vbus-supply = <&reg_usb_otg_vbus>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg>;
+	disable-over-current;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <4>;
+	cd-gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+	status = "disabled";
+};
+
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	bus-width = <8>;
+	non-removable;
+	no-1-8-v;
+	status = "okay";
+};
+
+&wdog1 {
+	status = "okay";
+};
+
+&wdog2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "disabled";
+};
-- 
2.7.4

