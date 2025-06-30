Return-Path: <linux-media+bounces-36367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C1AEEABA
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 278997A9BB0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5189285067;
	Mon, 30 Jun 2025 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2LUZi+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC6323BD02;
	Mon, 30 Jun 2025 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324413; cv=none; b=ULwZkvI1zQHlLkkqdbO7A7h94wigO6EkpUDLdp+TX3kV72NhNG6G/roJqRLrPx+3AJvwJk5jnUBFFgLaNGuGsq8R/Lf2D3ZbzbTvsgoTqBWv51ROfoQMqpll8DGl1KtXA9BLooscJutRvHWaq4LyZMHbE/qXEnKDA0D/JYrmjDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324413; c=relaxed/simple;
	bh=Uo9bVY0HlCvBEyDZ1TIoJjAghHGhdCVDj6GMVcAEZr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMqhDh8aP2WLbFXMZhGauGjazbLzNLFF90ArTK1hr0n11QWq1UMP9V3D/iiaYShXYoWAbV+4/qVkoii1lpKxMfgCoAxqJFmrxTMgAQgautvAozSBKxlvedVuARfu5v6zAdEvEH1bNJyak8FGv0FM9cvZWYYFqJMd2H1/f1XB0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2LUZi+g; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fabe9446a0so47410296d6.2;
        Mon, 30 Jun 2025 16:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324409; x=1751929209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6ZZi9+Wt7EcwZivGYxXgDkNe6LyrAD7+7iOuFkCB3k=;
        b=H2LUZi+g/No35tTI+jQFiNZEdykvQt1GM1YoNZVMyYuNyysQioGuTQ4yzh73nUPuRq
         cVSQHf5S2C7xXJw+HF/8RkeGNBXD9Qte3xAxAe9RjcUUmzSziuAj2FIOhjVV0Jig7pea
         BYU882JEG44obcljusglBg7m6c8BYUhS5rtbUEP8gNnI5VQJhtr0wLMOeUsQbepwe2fX
         oiIbohf6Jndc/+XrONaImQ/1wkr+P6BdJNUWJFkZrCxg7Ga+fbrDRgHL5OPYlpPpDaMm
         qKWw2pjK+1udl4uEPwzAm9H7GTjDCWeHx63blWsuKL7abKExxYv0G0TsiAjsUGmszlyV
         TTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324409; x=1751929209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6ZZi9+Wt7EcwZivGYxXgDkNe6LyrAD7+7iOuFkCB3k=;
        b=AL/jUz+Mi+9he58PzoKHRFLnxEj9syS6BjAx9ylHDAURieHbxuwArCVM9LuDZx6wld
         0/u7tzaFGbGfP8kN2lBLZqv1ADXMCB2hBivuxQCuWh0ZIu2L3MXKPWIYhCqC5LVuTB67
         ini2YohGLngzPInJkqQoHHbdmay3vDuizSNYwTLJr5izrJDG+Of4UsNqcgmY2yY8JRsd
         6WdXurpe9uYLMXdKdtuLH4lddLnSwiNhOMHdBdq4m3fDw6NjCrZdm0VRqDouSPCNR+aH
         EWRH1tPzPMPD7+X+ODyxnh7XTH7nB1e+0t0xF2gXOzyM5yY2jBFNxlYXWo8fWQViT2Tw
         SLHg==
X-Forwarded-Encrypted: i=1; AJvYcCVgGs+0zmifONjdD+04K5liP1PXiVwsIN4eZLfDeNC/ibnKCXRysT5G0eDr6qr8EbafbmpNSEAbCxUUjQc=@vger.kernel.org, AJvYcCW7W17Z2Ty49Mpny+cnyB3HE97x1bwTMQ+B94gxM4enxtA1hzoVRPigUlwNxGWy/r6KGOTiMP6qXUnTQB2gIA==@vger.kernel.org, AJvYcCXUIpoWzHXDzSOKgbgzN2HIxVj54lqCT5AqidrKNQFxiDZwU4Sc7k5D6IhuI7/2nd1uFc0vAt97PfRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19WRA51Hd0QofjVRJTPGBJ7QlR2PGuH/WUKhFhs+DtOpJEPiM
	eoTu0XCGXXIBL4pN482C+GJmn7mBbH+bDu1fZhjYA5WC1mLAnORHQDGT
X-Gm-Gg: ASbGncvPkrRjSoPCTsfZQ9O5EhnmnZj9Zl16/sM6/ntXFsQW1s/XqX1BB0UH52dCgpk
	k1SmtjLrCQd5ZR2KBaA1/KUe+X1FGjh5gCX2YDbDNdZaj1Scp79i05lKMcL+vBkOpOkjN4Fzw1z
	wNZRccN3AuA4/jrartjSaChVBAuTYDJlnEFcY4GyEl0Vh/IpaY1HBD3FfjI2aW3sTgDIt9lyHAb
	j6o9umWdkzh82tiXQCsHD3Ily4rTGmVWFV2Kcen1I88Un5Q6MXFvxrTbh/9mBDhbErwbiAtI5k0
	HeyGqAJXHUUcklBBVX75eVFeO8SKfJHD64+KSJv1nOzPqe1i8A==
X-Google-Smtp-Source: AGHT+IEkkqcXTm3/QhOVHowdokD8pxJDGRUaxzBpMv7bhaqxGM/R9hRC0QYkySM5adKfBHLCfkSwwQ==
X-Received: by 2002:a05:6214:4518:b0:6fb:25f:ac8c with SMTP id 6a1803df08f44-700036ae354mr316383846d6.31.1751324409004;
        Mon, 30 Jun 2025 16:00:09 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd772fcb24sm75738256d6.91.2025.06.30.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:00:08 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 4/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 30 Jun 2025 18:59:49 -0400
Message-ID: <20250630225944.320755-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630225944.320755-7-mailingradian@gmail.com>
References: <20250630225944.320755-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sony IMX355 is the front camera on the Pixel 3a. It is connected to
CSIPHY1 and CCI I2C1, and uses MCLK2. Add support for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index d01422844fbf..0af6a440ecbc 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
 	};
+
+	cam_front_ldo: cam-front-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_ldo";
+		regulator-min-microvolt = <1352000>;
+		regulator-max-microvolt = <1352000>;
+		regulator-enable-ramp-delay = <135>;
+
+		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_front_ldo_pin>;
+	};
+
+	cam_vio_ldo: cam-vio-ldo-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vio_ldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <233>;
+
+		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_vio_pin>;
+	};
 };
 
 &apps_rsc {
@@ -392,6 +420,58 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	status = "okay";
+};
+
+&camss_endpoint1 {
+	clock-lanes = <7>;
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&cam_front_endpoint>;
+	status = "okay";
+};
+
+&cci {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cci1_default &cam_mclk_default>;
+	pinctrl-1 = <&cci1_sleep>;
+
+	status = "okay";
+};
+
+&cci_i2c1 {
+	camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		clock-names = "mclk";
+
+		clock-frequency = <19200000>;
+
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+
+		vana-supply = <&cam_front_ldo>;
+		vdig-supply = <&cam_front_ldo>;
+		vio-supply = <&cam_vio_ldo>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_front_default>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -491,6 +571,15 @@ &pm660_charger {
 	status = "okay";
 };
 
+&pm660_gpios {
+	cam_vio_pin: cam-vio-state {
+		pins = "gpio13";
+		function = "normal";
+		power-source = <PM8941_GPIO_VPH>;
+		output-low;
+	};
+};
+
 &pm660_rradc {
 	status = "okay";
 };
@@ -509,6 +598,13 @@ led-0 {
 };
 
 &pm660l_gpios {
+	cam_front_ldo_pin: cam-front-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <PM8941_GPIO_VPH>;
+		output-low;
+	};
+
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
 		function = "normal";
@@ -548,6 +644,22 @@ &sdhc_1 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	cam_front_default: cam-front-default-state {
+		pins = "gpio9";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_mclk_default: cam-default-state {
+		mclk2-pins {
+			pins = "gpio15";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	panel_default: panel-default-state {
 		te-pins {
 			pins = "gpio10";
-- 
2.50.0


