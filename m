Return-Path: <linux-media+bounces-40473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AB8B2E369
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED1EA236AF
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB82E342C9D;
	Wed, 20 Aug 2025 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Svvug312"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2146318BBB9;
	Wed, 20 Aug 2025 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710206; cv=pass; b=ZkO1WDqEZin90B3GsL32ce8ikZOPMAEmKjrTDZPhJppgKvBhJJV0eP/Em6KyRPZqVDbqpJ8SF12ckD78fwnXcjtMbVPoP2kZqAkVv4d/e0dBz+JPuL4+j77SjwjO7RZ2ZjNGbN71dJJoMFmmm2WE9xejQE7gXfGpj7RPwbsFMpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710206; c=relaxed/simple;
	bh=NJnQOUX1x8H1+8NG7rlFyPF14t8y2D78FF6yU59YEZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgeFj80Es6AqFAihjBuoKUcIgMWoKUqM042FaN282P32xe9Cw3YI+kxPnUe+vhl/lYDgqbVwPLJ6QoOkTfPZ/zULdWIi7P6i8aKwpRWX5tm+s6VebqxqXNs5K0KApqH1JdnC3mQSDWxTVeUisDIX7Ys9Ecy0Wk2OH2dIiVmVq4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=Svvug312; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710157; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OTg23enOVgJBINUO837xN77ZyALL07DslQtfHbOSqPUIWR62Y7c2laD55wYvPn95KRWnOomDv9FDmi1tH7+Ng924hr942T49Mnk3E4x7J6sbsrO2UwjZP4YTrnPWKhsEyHwktk7Y+82MTLXHhY/1SL8RuOpkUgzKp9J9FUowjYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710157; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NjnA7EfdJpWfPrM0W0WOANXaMNtnO1H7p3xLGJKGWG8=; 
	b=UY11dP+U0yZPi6EOkDfijX/0CTxMA2Ouoa+GZoN+hKvRrovIgva7JChCEtPsBAo+mExEl3uZEgLbBctDWwVw7TSBPq4MqAMfD/VIMuFBA9fmDQzdxN2/eft/YKWmgOp0i3AkkXAGxpb/6Y7X29VZ3yG+S/psqZIajkGMAuO9uX8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710157;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NjnA7EfdJpWfPrM0W0WOANXaMNtnO1H7p3xLGJKGWG8=;
	b=Svvug312eLpkwbqFTiYb5nmHD9JLaKJxJWTW9ThuC4jiHvtJeFzFrRsTdPmxt9vQ
	72MhlgFd3GMROuJXc11wCJsznMGF0pAVW6mE/a0HeQD8VBQlpfRnH8LTDq8az0wuMwI
	8MBCVcaGH5yqWZQGo9cu9HXJdfq9ij1IhLlxQg/c=
Received: by mx.zohomail.com with SMTPS id 1755710155739521.2105992096317;
	Wed, 20 Aug 2025 10:15:55 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 08/14] arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
Date: Wed, 20 Aug 2025 14:12:56 -0300
Message-ID: <20250820171302.324142-9-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

According to the mediatek,mt8173-pinctrl device tree binding schema, the
pinctrl node names should match pattern 'pins$'. Fix this.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 26 +++++++++----------
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   | 14 +++++-----
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 14 +++++-----
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index dfc5c2f0ddefd..7d665cedf8a44 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -80,7 +80,7 @@ pins2 {
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
+	mmc1_pins_default: mmc1_default_pins {
 		pins_wp {
 			pinmux = <MT8173_PIN_42_DSI_TE__FUNC_GPIO42>;
 			input-enable;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 0d995b342d463..0766026864c9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -601,7 +601,7 @@ &pio {
 			  "SOC_I2C4_1V8_SDA_400K",
 			  "SOC_I2C4_1V8_SCL_400K";
 
-	aud_i2s2: aud_i2s2 {
+	aud_i2s2: aud_i2s2_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_128_I2S0_LRCK__FUNC_I2S1_WS>,
 				 <MT8173_PIN_129_I2S0_BCK__FUNC_I2S1_BCK>,
@@ -654,14 +654,14 @@ pins1 {
 		};
 	};
 
-	i2c1_pins_a: i2c1 {
+	i2c1_pins_a: i2c1_pins {
 		da9211_pins {
 			pinmux = <MT8173_PIN_15_EINT15__FUNC_GPIO15>;
 			bias-pull-up;
 		};
 	};
 
-	mmc0_pins_default: mmc0default {
+	mmc0_pins_default: mmc0_default_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
@@ -686,7 +686,7 @@ pins_rst {
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
+	mmc1_pins_default: mmc1_default_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
@@ -710,7 +710,7 @@ pins_insert {
 		};
 	};
 
-	mmc3_pins_default: mmc3default {
+	mmc3_pins_default: mmc3_default_pins {
 		pins_dat {
 			pinmux = <MT8173_PIN_22_MSDC3_DAT0__FUNC_MSDC3_DAT0>,
 				 <MT8173_PIN_23_MSDC3_DAT1__FUNC_MSDC3_DAT1>,
@@ -735,7 +735,7 @@ pins_clk {
 		};
 	};
 
-	mmc0_pins_uhs: mmc0 {
+	mmc0_pins_uhs: mmc0_uhs_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
@@ -769,7 +769,7 @@ pins_rst {
 		};
 	};
 
-	mmc1_pins_uhs: mmc1 {
+	mmc1_pins_uhs: mmc1_uhs_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
@@ -788,7 +788,7 @@ pins_clk {
 		};
 	};
 
-	mmc3_pins_uhs: mmc3 {
+	mmc3_pins_uhs: mmc3_uhs_pins {
 		pins_dat {
 			pinmux = <MT8173_PIN_22_MSDC3_DAT0__FUNC_MSDC3_DAT0>,
 				 <MT8173_PIN_23_MSDC3_DAT1__FUNC_MSDC3_DAT1>,
@@ -813,7 +813,7 @@ pins_clk {
 		};
 	};
 
-	nor_gpio1_pins: nor {
+	nor_gpio1_pins: nor_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_6_EINT6__FUNC_SFCS0>,
 				 <MT8173_PIN_7_EINT7__FUNC_SFHOLD>,
@@ -863,7 +863,7 @@ pins1 {
 		};
 	};
 
-	rt5650_irq: rt5650_irq {
+	rt5650_irq: rt5650_irq_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_3_EINT3__FUNC_GPIO3>;
 			bias-pull-down;
@@ -877,7 +877,7 @@ pins1 {
 		};
 	};
 
-	spi_pins_a: spi1 {
+	spi_pins_a: spi1_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_0_EINT0__FUNC_GPIO0>;
 			bias-pull-up;
@@ -892,7 +892,7 @@ pins_spi {
 		};
 	};
 
-	trackpad_irq: trackpad_irq {
+	trackpad_irq: trackpad_irq_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_117_URXD3__FUNC_GPIO117>;
 			input-enable;
@@ -900,7 +900,7 @@ pins1 {
 		};
 	};
 
-	usb_pins: usb {
+	usb_pins: usb_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_101_MSDC2_DAT1__FUNC_GPIO101>;
 			output-high;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 9fffed0ef4bff..f28110c331c71 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -179,7 +179,7 @@ pins1 {
 		};
 	};
 
-	mmc0_pins_default: mmc0default {
+	mmc0_pins_default: mmc0_default_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
@@ -205,7 +205,7 @@ pins_rst {
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
+	mmc1_pins_default: mmc1_default_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
@@ -229,7 +229,7 @@ pins_insert {
 		};
 	};
 
-	mmc0_pins_uhs: mmc0 {
+	mmc0_pins_uhs: mmc0_uhs_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
 				 <MT8173_PIN_58_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
@@ -257,7 +257,7 @@ pins_rst {
 		};
 	};
 
-	mmc1_pins_uhs: mmc1 {
+	mmc1_pins_uhs: mmc1_uhs_pins {
 		pins_cmd_dat {
 			pinmux = <MT8173_PIN_73_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
 				 <MT8173_PIN_74_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
@@ -276,14 +276,14 @@ pins_clk {
 		};
 	};
 
-	usb_id_pins_float: usb_iddig_pull_up {
+	usb_id_pins_float: usb_iddig_pull_up_pins {
 		pins_iddig {
 			pinmux = <MT8173_PIN_16_IDDIG__FUNC_IDDIG>;
 			bias-pull-up;
 		};
 	};
 
-	usb_id_pins_ground: usb_iddig_pull_down {
+	usb_id_pins_ground: usb_iddig_pull_down_pins {
 		pins_iddig {
 			pinmux = <MT8173_PIN_16_IDDIG__FUNC_IDDIG>;
 			bias-pull-down;
@@ -474,7 +474,7 @@ mt6397_vibr_reg: ldo_vibr {
 };
 
 &pio {
-	spi_pins_a: spi0 {
+	spi_pins_a: spi0_pins {
 		pins_spi {
 			pinmux = <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>,
 				<MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 122a57c3780b6..7e522bb8963a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -391,7 +391,7 @@ pio: pinctrl@1000b000 {
 				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 
-			hdmi_pin: xxx {
+			hdmi_pin: hdmi_pins {
 
 				/*hdmi htplg pin*/
 				pins1 {
@@ -401,7 +401,7 @@ pins1 {
 				};
 			};
 
-			i2c0_pins_a: i2c0 {
+			i2c0_pins_a: i2c0_pins {
 				pins1 {
 					pinmux = <MT8173_PIN_45_SDA0__FUNC_SDA0>,
 						 <MT8173_PIN_46_SCL0__FUNC_SCL0>;
@@ -409,7 +409,7 @@ pins1 {
 				};
 			};
 
-			i2c1_pins_a: i2c1 {
+			i2c1_pins_a: i2c1_pins {
 				pins1 {
 					pinmux = <MT8173_PIN_125_SDA1__FUNC_SDA1>,
 						 <MT8173_PIN_126_SCL1__FUNC_SCL1>;
@@ -417,7 +417,7 @@ pins1 {
 				};
 			};
 
-			i2c2_pins_a: i2c2 {
+			i2c2_pins_a: i2c2_pins  {
 				pins1 {
 					pinmux = <MT8173_PIN_43_SDA2__FUNC_SDA2>,
 						 <MT8173_PIN_44_SCL2__FUNC_SCL2>;
@@ -425,7 +425,7 @@ pins1 {
 				};
 			};
 
-			i2c3_pins_a: i2c3 {
+			i2c3_pins_a: i2c3_pins  {
 				pins1 {
 					pinmux = <MT8173_PIN_106_SDA3__FUNC_SDA3>,
 						 <MT8173_PIN_107_SCL3__FUNC_SCL3>;
@@ -433,7 +433,7 @@ pins1 {
 				};
 			};
 
-			i2c4_pins_a: i2c4 {
+			i2c4_pins_a: i2c4_pins  {
 				pins1 {
 					pinmux = <MT8173_PIN_133_SDA4__FUNC_SDA4>,
 						 <MT8173_PIN_134_SCL4__FUNC_SCL4>;
@@ -441,7 +441,7 @@ pins1 {
 				};
 			};
 
-			i2c6_pins_a: i2c6 {
+			i2c6_pins_a: i2c6_pins  {
 				pins1 {
 					pinmux = <MT8173_PIN_100_MSDC2_DAT0__FUNC_SDA5>,
 						 <MT8173_PIN_101_MSDC2_DAT1__FUNC_SCL5>;
-- 
2.50.1


