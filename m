Return-Path: <linux-media+bounces-50093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB6CFBF73
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5606F300647E
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9003A25A2CF;
	Wed,  7 Jan 2026 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4fjOTG4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689F25A2B5
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760237; cv=none; b=UT3v52d8jJfOiTWEa+CVuXcWXK1z2Di/AOen0wnNRsojPbwXCXpgLrwkqbgt1IpTf2qa7jxtPgRPe/KIJrr+SvXOskDUUALI3AW4iVohyqOL+RHra7OQIhfI2dx2ZzW/Zr9utUQGF45vvO/GnYkTpCERxhAwTIv1XLNljiP4on4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760237; c=relaxed/simple;
	bh=tpKwT8BRmh+4TfFD5KNeHQ94D71yYWXSxwOTFbPdyGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyW5munR2OIw4tO/u3UaVFSelswbwVlisFrAM9Npr6i1w1RV4QVlTD4OYVWMIsqUW3JCF61ClR5d1GL+KL7dkf9ax4vRmg1W85gj1/d2fcvEbZI90126Yl6DS0zzS9zPIIzhkFOcThdQjOzSqBe7VT1aAauarnzqdZbstASSXRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4fjOTG4; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a2d21427dso17162696d6.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760234; x=1768365034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t6ijxVnxYYl+Qkqm4DID3uci/fVGDoUjERuFcxrn4c=;
        b=B4fjOTG4mOvAhBOfr0wWH4se+wTU+6IcVJHIAo95btzjvkgt5/USUPVJe8LywjASu+
         ZeWF9bkkUZvFB+RKNNuGjUoUd0IUEsPEmUAcdcDKxqG6Rpodn7V3EoIp6lLXKI0THB45
         wfC20cNZVZS5GUz+3vV8D2ZX5VzjBYodLHDZWfFivsZDCeX/YnDhOnR9ulnTGr0FxqTF
         BwVtg9W6zxkoEa0wRwUcOQdYUfEW9Ac15uC4cInLD4Y8BkbopobRKseHXYZ95yhvE0qW
         v+MgWwrZVqJ+1ovxdM22dVaXoydKwUHLZ0VBCDCf6EhkB0IXneedaQhqbfyx7vRwCRoI
         kpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760234; x=1768365034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7t6ijxVnxYYl+Qkqm4DID3uci/fVGDoUjERuFcxrn4c=;
        b=bcNjmXAFN7Rb/MakI5X2ybZkVe+wWra9m0NjRtLxykzQKLDiB+9xCRhIPGPF6Uat9H
         87YzZ7pei21rtefCIJOOq+RcXSjA0dizsR5/lEgwf4349+hjFLsytDmAQZQhzdHUuJJi
         6+y4bpB4W47oWqT4QKjYL5DPAifnGOMDfMOpseI7fhPp+uBTTJlJoRC3c2QXQ/+jv6vq
         nh81lwkn38wETB/fICawUAFIiXBbmRD0M3W6uu8WQmchRQb5yN2/AZWARH8K9aM64PEz
         9mOoKU04zo9cuNynhKBizrkZ2Tx3DUXX2dfeUj0OXa/VunCHhxCm6r7Zd7rm9lT405wC
         t5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Rp60qgfonc4Ey0LxjPqh+mfe+hkzG25XSdY7gg882BJPJd5hz4dLJx8W7tzPo2VBQ+7eaW0bdN1Y7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLY6wnSIpR4GSVspDO+M7hr0NDRFxrQzBueNwjnFbSC2WljMr6
	oelfBFXfIS/ZH2EP2YBpeAn2ghREQWrcSIr20w0/7revQ8LnC81gArft
X-Gm-Gg: AY/fxX7hz7yAp2UwrU57IVdrPGMKhIcCNkbM+IZIJ/O2ZwgGPaXMNbzYGdwH2HaLj0k
	f2gojDv4263FErGwg4MeqYeoqeKDvtBzLXFAjcW/JSSIX0nJUBKjVWNcny0oq1QDUzkNfpIwWTc
	UZkJk93gW0ne6tIZdNx9bgiVC73mgHuTqUgEk1KOyAb+PvWE63on/nT0u5YhRzZeepqUktKqq/8
	WTX0HlQkHGD3RgMXFkSI19eGx+IY2vIyy7q9UYL3UcyvWGy9IOhyYPoVtEyj17g17WeiQTk0r7O
	HJZLFrs3ZZpMU1rbQw861+x6Q9qsU0iTanN4b1PFU+IYkAqExlxnmIlLFzMb32dyAxJJOchnueg
	E+AxknlrC5f6MiuEUv8Ieqa3LdyPBm4ELxAVSdNYN1R9eur4DvjIBmqZo/HFx9oivKOSgedNCA3
	E4xIeaxO/7Ue2fk0K/CLhkOU/731Hnt/HnoZz3c2IGzAdkxyd3AKeT9NxB4DtEM/KpKGEu57iVu
	WQ=
X-Google-Smtp-Source: AGHT+IFl+7lp7gXI2x/Wcl/yop0i6XbQOu37mNnFxGVaw+VUl/pbW+ltRx+mYf0geBGnFrjp0xheOw==
X-Received: by 2002:a05:6214:598e:b0:888:8557:69e6 with SMTP id 6a1803df08f44-8908427568fmr16304366d6.47.1767760234146;
        Tue, 06 Jan 2026 20:30:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm26755086d6.35.2026.01.06.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:33 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Tue,  6 Jan 2026 23:30:44 -0500
Message-ID: <20260107043044.92485-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
support for it.

Co-developed-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Robert Mader <robert.mader@collabora.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..ec447fe3959a 100644
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
+		pinctrl-0 = <&cam_front_ldo_pin>;
+		pinctrl-names = "default";
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
+		pinctrl-0 = <&cam_vio_pin>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -392,6 +420,61 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	vdda-pll-supply = <&vreg_s6a_0p87>;
+
+	status = "okay";
+};
+
+&camss_port1 {
+	camss_endpoint1: endpoint {
+		clock-lanes = <7>;
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&cam_front_endpoint>;
+	};
+};
+
+&cci {
+	pinctrl-0 = <&cci1_default>;
+	pinctrl-1 = <&cci1_sleep>;
+	pinctrl-names = "default", "sleep";
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
+
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&cam_front_ldo>;
+		dvdd-supply = <&cam_front_ldo>;
+		dovdd-supply = <&cam_vio_ldo>;
+
+		pinctrl-0 = <&cam_front_default &cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
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
@@ -490,6 +573,14 @@ &pm660_charger {
 	status = "okay";
 };
 
+&pm660_gpios {
+	cam_vio_pin: cam-vio-state {
+		pins = "gpio13";
+		function = "normal";
+		power-source = <0>;
+	};
+};
+
 &pm660_rradc {
 	status = "okay";
 };
@@ -508,6 +599,12 @@ led-0 {
 };
 
 &pm660l_gpios {
+	cam_front_ldo_pin: cam-front-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <0>;
+	};
+
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
 		function = "normal";
@@ -547,6 +644,13 @@ &sdhc_1 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	cam_front_default: cam-front-default-state {
+		pins = "gpio9";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	panel_default: panel-default-state {
 		te-pins {
 			pins = "gpio10";
-- 
2.52.0


