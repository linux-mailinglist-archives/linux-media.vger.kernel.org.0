Return-Path: <linux-media+bounces-48610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D6CB4781
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 02:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8E0430012E9
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 01:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD54222599;
	Thu, 11 Dec 2025 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAXjloDS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014A226D4CA
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417774; cv=none; b=FlRLHDWhspq2rYlNF9qg67CwhFWVTZOW1L4zzPf8PoBivuIT0XwJUBitxZCQtYMzR5dAbegKmD0R5KiySAfrN8X0feJqt06vXuldy++E+g3EkKQPZkUthJnYbx6zXTtoAl0JNOX7hMj8s4DdvMqUHSwCAJd9YAzybs0VIpu1i0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417774; c=relaxed/simple;
	bh=cVUyZiafLwk+Z0g6SclDnKYZVev3QETSgjMnziXMeJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOcdiH4nidsuDst8s+B3hhYehJV6/ymod4skiQapQLKN/UVk5ZU+c5GVaSUYYVbgBYDe69rnF8Lws3oSkwpeW0JRdm7PZywaI9boxzTyYcLLdLjO0j53DQdUgPi4ThZG2vuEdljvAmQdCm7FpfUaFgt/r2/WscSEF73k4JO2Agk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAXjloDS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b9d2e33e2dso69949285a.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417772; x=1766022572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIqq3d5zqq0Uv7f6K1j3TXXE7VDWxmXOVt+3dsivAoE=;
        b=hAXjloDSIlmmPwKzKA/0GTLRko0cXBXRsNMN6bWsOe5VIPxlZZwwYbbElGNHB1i4gq
         INmuoelWg9a8QssoxL7ceDF/Oe0meh/4k2l14oMdP02gagCzxRuP9A+46XBhh/CMxQoH
         itVx0HqtZJqUOsn4sIFeLVZBK0iESIW3R3W3N1J4ielbRLffnTf8TY5PdIkivtS6+tuW
         5I78LikgUZrZ689IrfnS1kUeaznkA4SqCy2ZZ6R6TF+heRMF5x014gOzlP39SayP9PHg
         cFMAafcJuqszpQl8Uj/wBFJzAr2Zpf4vs9qmSDXVLOkkXHRVbbDtW5QJHlwuSl1oJym8
         EFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417772; x=1766022572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FIqq3d5zqq0Uv7f6K1j3TXXE7VDWxmXOVt+3dsivAoE=;
        b=bfTDVquPFmb3P7EvbKcLEiFYp9eOpX0nhYQYGccxB3OyB3Drbojf1Ac/yUZ0Ef5JPS
         njEXgkhhYTdwO2MBU4ve+aQNIOTQ4QBgsyiyLidG5rG6evJ/IbWNUaHIFodpCrwzzwQ7
         TCAMI4BM69xT3s/xEk6vI/5PgWF2Zgb/ROQG1n6eSW5sGp0MjufVAa7xv6us/7GQ0zyL
         lK9vvdkl3G7ljFXkIFO4wocEsuWKNOk/WHzZ13WwnfrT+VESFgzuWxDtdJ750Xtu6PsQ
         qtqcJkoP+dkoEB47qy9Il+OVpJ1yZTwdsp10K0+y8wrFjN4kD70HVeh8FiLyHLZYPY3N
         Xdpg==
X-Forwarded-Encrypted: i=1; AJvYcCXJjLjClz4Qv5P9ZxbcCdRAbfRNrpHNhpI6agpogLMWqs5OVXTiamzbAsPM3jIry2zzgyXziJLJcdcUIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvIcDftKo+YyMX5gzX5FTPte4kCb4/TWzWPvG7F5EjqbyetJKF
	sJaXgdS/jxhKho7STJLNkqGSWsbTAqP3+ObMeEiw2EANYin56lS8mA4e
X-Gm-Gg: ASbGncsx7wR1HdGhqlyycbb+PJ+bEzkUILO3YIJ8P1sVpr/1YUMQMxlTvoYFCPMYnZ+
	8hTejQqUosCsO++ldHQGxjr/NPX83aPfPMG7jBVPET569VYgUzUKVXYKFSAUrmfPLUdO+kO5l9S
	F/66yeJUvTKemlp21tOduoYxxbPHdXRQ4JfH8EkrMvAVAFOK3WK6YGhbxKAwJqFUhBRZt6a2hkn
	+i0qbB3T6M6r1Ay7PE3NvA2fUD2a+VLQDo1Yc6Amlewm6Euh1re6jpGcGR2xkYPmMlQrX7srNwj
	R8Lq58ZNM1ICsxaUjJXCbNJLVdf7ZuWjmyBH7HuVDJ7x9ZibkvE88gAwunE8Ol2I+0G2GlQgM19
	39y8XVWTTHnvV+7Pq2w12fA3utZRiLbR0F0rI4pTj6XVqG2ZXlkxmxMoZPH0sdUejZj/gNZMRMm
	VIuJffUYCgkU346w==
X-Google-Smtp-Source: AGHT+IE2dbqDwbbxTMIpO69e6VAs5kHMQo6+m4byhyQCv5RSUCQNC3Rmzged4NQp7/e15cxBpp2enQ==
X-Received: by 2002:a05:620a:d8e:b0:89c:fd5a:cee9 with SMTP id af79cd13be357-8ba39e3bb14mr703457185a.38.1765417771850;
        Wed, 10 Dec 2025 17:49:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d3e157sm95163885a.37.2025.12.10.17.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:49:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Wed, 10 Dec 2025 20:48:46 -0500
Message-ID: <20251211014846.16602-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211014846.16602-1-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index d01422844fbf..ede0ad7ded23 100644
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
@@ -392,6 +420,64 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_1p225>;
+	vdda-pll-supply = <&vreg_s6a_0p87>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			camss_endpoint1: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_front_endpoint>;
+			};
+		};
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
+		clock-names = "mclk";
+
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
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
@@ -491,6 +577,14 @@ &pm660_charger {
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
@@ -509,6 +603,12 @@ led-0 {
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
@@ -548,6 +648,13 @@ &sdhc_1 {
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


