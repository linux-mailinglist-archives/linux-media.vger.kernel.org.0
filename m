Return-Path: <linux-media+bounces-59591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KSEfF62g7GkhawAAu9opvQ
	(envelope-from <linux-media+bounces-59591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 13:08:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA4466132
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 13:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 844A1301FD4D
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 10:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8F239657A;
	Sat, 25 Apr 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cy/T4de0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB01392811
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114612; cv=none; b=ud7EI2uKMhqEhoDW0tfhqzNCSldDomQ/vxid5t0mTTreiEmWDubSPxeRZRKiXSLThZnCwqQe67kHmbx/58Yr4Ni1pUGJq0vRsxyewq7dhtm1E8GkjdQP4+e0uuJniSCCaGhquaFpZ+qbDE7jiILhbefGlqi0B9OTy15CPSVZ28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114612; c=relaxed/simple;
	bh=j92iOYgKQ7RjjOLofBQE3Vd++tZ0z/woMt8SEp8QCZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aP1VmXxGy/Uxz+PQzYHzFMsoZS27c4X6MKGs8NQCW/7sorG9M5LbQAdu12/m2Gp28QmgfsUnQ7p8pTHrTaAimvjij2e4zHvFGy9N+fihDkMXREZZWKSgbby+UP6YouNE6S1YiUAG9TQ9FNi8jqDGmrcEy6jualwnHj7m2zfmMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cy/T4de0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b23fcf90b2so82725015ad.3
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114611; x=1777719411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXgloxp5cdGXbJc9mmRLA5BQUt4nlOpF3BcjxCU2IHU=;
        b=Cy/T4de0glMoZvobRKvlj9PMd914hdEQHtP/N/WaVTSjrZLyFeN6v/o8Km+MEAOQBg
         Ml2qsU8mFNBt0c1eUIukhrEhk2n/5cvK/A/NR6lXcvdouM2hl/8SzXkO/D+AhtCFS8x0
         4H4GU8HRjZ+bKEzVe0Q/O7B4TDXDIdUCL6xWuCQqeRPSDus/AOTWnSo+6ArEyqJr4LAN
         OoTkIFA0xpCMH3OxLdAu7E2Mk8y+dNl5DyPaOm5aFUJGBzLOqSI9GUX7pUM4TotC7x61
         5w2IQ1WuH3iczDo8Pmj12x2QlyO3g7T/aUYQgMHQUZmafMxWrtPxPlNASs7H9aQ7aTip
         IvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114611; x=1777719411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXgloxp5cdGXbJc9mmRLA5BQUt4nlOpF3BcjxCU2IHU=;
        b=WUV9WbDPLEaadbzWSEBkNRuvFYnLstC3bmgOMddXok24f+pKn0KQMH+vUKeMF7FWoz
         V0NfqF3OXivuyGI9fBKdLALEhCFmUzcXkMBD4MnFpOqSS7JdMNDY02YRpMGEMe1PE8tN
         RMK+A2uu0Ho37q26aiwiANB0D2kMuswltt3TQOEBZAL/ECZDuw4pxcf3vItyxoSB5JUZ
         kjoCqC4tEIgIZvE14Yf8wlA2MRWTJY9wYcAgSuGztldK+Z9IB8VYgf3thS2jBJTxSAuA
         JM1e0e58GH5OVqvIq6E+zbVBbxsCTIX58Xk0620ZFzS73SBpXqPiLetacNq75O0Sgd/4
         v5sw==
X-Forwarded-Encrypted: i=1; AFNElJ8UBufiY9sIgGZgyvt3HSn38pLqBl5IkEBHI+z2AWyq9OjfsY2MIj11ijGQ5nZSsmHDi1alCR/JIUbBgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsyh+De853Z9ekzK+lirANXVfFDSgC5FxgyigmP0CAIUfpXC+
	LW6USmuRl/IA7E1sfL6lvLX3qJSb5cNPBP1v2NzApEi2hFOqwr2mU9jo
X-Gm-Gg: AeBDieuitN6VSJ5w/2SFw2uB9PIie79huitXfr/DVleVabwx8U9Gl5a7qLB4R3ATmW8
	izx4qtpEfuKH5myVHpawR8mEvfqtskqtTMVaZ4NGiaXC3pBh3F/7u+vtLuSt+ZmLQH2rRGXxiNl
	52k01oNT9dmpsoJEgdc3Sj7bfCLH0ShN52mjFCHOEFntkaycOooOBe9Iez1ktSZ2z3p5DFD0JGF
	LVHzbGpKayUZMh0nzLzL0ZJwTOzDJEor/ZbxnuDzG/58r8uUMfke2WROaPuSapBwPfZ/GoiGXe9
	2VAFYn62l6b7MFXL7Fr2LJJ7v2V9wEFm72tl6Mj8BO1UWvBK5r2CZaL8CMdVXUp6xl4guXjvhMA
	NFyb/yn4XGp21q1Z89da0IvyPvEo+VxI8w0CUNCoV+izU+MIT9EEx3dlltcw4RrbOQqO2s6L/WJ
	yiMe+DbWxSveRx9MZ98IDaQA44nOH+
X-Received: by 2002:a17:902:a516:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2b5f9ea55d1mr247155295ad.14.1777114611051;
        Sat, 25 Apr 2026 03:56:51 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:50 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear camera module information as musch as possible
Date: Sat, 25 Apr 2026 18:53:00 +0800
Message-ID: <20260425105300.745044-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425105300.745044-1-mitltlatltl@gmail.com>
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7EAA4466132
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59591-lists,linux-media=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.598];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[puri.sm:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Spam: Yes

The rear sensor is S5K3L6, describing it but dropping compatible
string, since there is no upstream driver. A funcitonal downstream
driver is in comment.

The VCM is dw9714, describe it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Please take this patch as a RFC, I am not sure, how much I am allowed
to add without a sensor driver.
---
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
 1 file changed, 123 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 39e559e91289..76b1ecb3819d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -22,12 +22,18 @@
 #include "sc8280xp.dtsi"
 #include "sc8280xp-pmics.dtsi"
 
+/* remove due to gpio pins collision, skip 2nd instance won't break things */
+/delete-node/ &cci1_i2c1;
+/delete-node/ &cci1_i2c1_default;
+/delete-node/ &cci1_i2c1_sleep;
+
 / {
 	chassis-type = "tablet";
 	model = "Matebook E Go";
 	compatible = "huawei,gaokun3", "qcom,sc8280xp";
 
 	aliases {
+		i2c1 = &cci1_i2c0;
 		i2c2 = &cci2_i2c1;
 		i2c4 = &i2c4;
 		i2c15 = &i2c15;
@@ -52,9 +58,17 @@ framebuffer0: framebuffer@c6200000 {
 	leds {
 		compatible = "gpio-leds";
 
-		pinctrl-0 = <&cam_indicator_en>;
+		pinctrl-0 = <&cam_indicator_en>, <&camera_flash_en>;
 		pinctrl-names = "default";
 
+		camera_flash: led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+		};
+
 		privacy_led: privacy-led {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
@@ -129,6 +143,18 @@ vreg_camf_1p2: regulator-camf-1p2 {
 		pinctrl-names = "default";
 	};
 
+	vreg_camr: regulator-camr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camr";
+
+		gpio = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&camr_reg_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -387,8 +413,8 @@ vreg_l1b: ldo1 {
 
 		vreg_l2b: ldo2 {
 			regulator-name = "vreg_l2b";
-			regulator-min-microvolt = <1904000>;
-			regulator-max-microvolt = <1904000>;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -433,10 +459,9 @@ vreg_l6b: ldo6 {
 
 		vreg_l7b: ldo7 {
 			regulator-name = "vreg_l7b";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-boot-on;
 		};
 
 		vreg_l9b: ldo9 {
@@ -622,6 +647,16 @@ &camss {
 	status = "okay";
 
 	ports {
+		port@0 {
+			csiphy0_ep: endpoint@0 {
+				reg = <0>;
+
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&s5k3l6_ep>;
+			};
+		};
+
 		port@3 {
 			csiphy3_ep: endpoint@0 {
 				reg = <0>;
@@ -634,6 +669,58 @@ csiphy3_ep: endpoint@0 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	voice_coil_motor: vcm@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&vreg_l7b>; /* FIXME: require l2c on first */
+	};
+
+	/*
+	 * https://source.puri.sm/Librem5/linux/-/blob/pureos/latest/drivers/media/i2c/s5k3l6xx.c
+	 *
+	 * This sensor has never been detected on Goakun3(2.69GHz)
+	 */
+	camera_rear: camera@10 {
+		reg = <0x10>;
+
+		pinctrl-0 = <&camr_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAMCC_MCLK4_CLK>;
+		clock-names = "mclk";
+		clock-frequency = <24000000>;
+
+		rstn-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_camr>;
+		vdda-supply = <&vreg_l2b>;
+		vddd-supply = <&vreg_l2c>;
+
+		/* &camera_flash can't be enabled directly for now */
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
+		lens-focus = <&voice_coil_motor>;
+
+		orientation = <1>;
+		rotation = <180>;
+
+		port {
+			s5k3l6_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+
+	/* eeprom@50/51 */
+};
+
 &cci2 {
 	status = "okay";
 };
@@ -1423,6 +1510,13 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	camera_flash_en: camera-flash-en-state {
+		pins = "gpio93";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	camf_1p2_reg_en: camf-1p2-reg-en-state {
 		pins = "gpio44";
 		function = "gpio";
@@ -1446,6 +1540,29 @@ sc-rgb-xshut-n-pins {
 		};
 	};
 
+	camr_reg_en: camr-reg-en-state {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	camr_rgb_default: camr-rgb-default-state {
+		mclk-pins {
+			pins = "gpio6";
+			function = "cam_mclk";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		sc-rgb-xshut-n-pins {
+			pins = "gpio7";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	i2c4_default: i2c4-default-state {
 		pins = "gpio171", "gpio172";
 		function = "qup4";
-- 
2.54.0


