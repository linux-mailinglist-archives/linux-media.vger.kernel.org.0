Return-Path: <linux-media+bounces-37715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C8B048FF
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805A01767C4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974DE23AB87;
	Mon, 14 Jul 2025 21:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O88qp61/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9C2727F1;
	Mon, 14 Jul 2025 21:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526982; cv=none; b=QvNN1IvjS+22psU/6Cj7p9zD2lv9Y3jpDwZ263UwNKcBdUskl1ZD7uROZ9p/rn65GCrTOkWpOA7AAgT1KG5N7sSM90beIBEMX3YvJqXRZpIqBdapWRIeB/IO7EIbTb0RYmexXyqkZEw4Jw2AMOjRv68F8vFzlmHQF/6PDQsk6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526982; c=relaxed/simple;
	bh=XisHIpvKB7Y+b9YUb/iKbKQHxfiSIqyISzAxAzUgZdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJCcTLZnhlTTRIUkT5DPIm0B1gBMzUxyg/Wwx5u4bg5FI0BpT1utsR11mDynBYTZOUH/eA9YKX7q3yBWBGtOprq9ZTpp2tXv5I7JqgYDAYhwKUnDHvWcHhvjf2536ITzSJVyfbD4tbAQYQJDI0oKtejdLKYmGdt72SYsjeeJ+pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O88qp61/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70478ba562aso60461786d6.1;
        Mon, 14 Jul 2025 14:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752526979; x=1753131779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdbltC6LO3xQeeaUgISfdPjf2WosEN5u0As937+kOy4=;
        b=O88qp61/A3cFhZmZDT3IzUgSkuSHt4fEvT0jPnMczZh0XS3RHXU8zswBK+EK71Hpq3
         N5S2xoX0AAGQeGtKgzP+brjw9+hbhNr7DtzayyhoH5sg4hu3ZJGqKZUMgdhALNO0SztH
         RAaRc72BfAFh4As44d+SyMAPl5Tp6Z7rMmpOFhfyHCr4ZE7y7A92lKLYcoyeUySkQwsl
         y+EEGH/OqHeA3GIVb8mkv6PZaADJd/RwHGK+F8YHDQziEfSmCa/aoVPjjG9zrV3tI764
         kLzW4jgnNdybaPfsTbEHuyyO2vtMJyxJfWroiIPx4CBHa4JCIr1ds72AQ2yXntBpFEqu
         wSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752526979; x=1753131779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdbltC6LO3xQeeaUgISfdPjf2WosEN5u0As937+kOy4=;
        b=UWKR7lkr5edGhvWL58zyYw2Gui1f/Tz7qQHQGA13uhSl9qFoBWMqorFQyxsZC5KwG/
         IjOlX5apv2E5SOTds92V7RuhACKy76hQBqa3GBl2VxoPw+Bgb1wD1LDuzqkWp2a7pXpe
         Tskx0vnzdBshw5nFWYhxEopBB4D7YKD6q/gROpn9Quh9D8LY3YmSCzE20+pSUSGPuXdS
         u647XAqrHId95MsDODPe/CJN+eHVU49+4aA5zeXCf7CyW3ZIwQlAR7AThcKaIQnqwpne
         t7QFrVtpPCLN9W3nxLZrPTnHWe6jZiUdID/slrhQB0bPzHKg1VNBU6MvnAsoSEPr5HRy
         VQiA==
X-Forwarded-Encrypted: i=1; AJvYcCVFdCiFewURyqHEl3JUKZJSEoFJ0zCwL8iLeislFp7bUQ5SHIE5ymvUXmaMSGohx/oScqfUk1TXC5VW07k9rg==@vger.kernel.org, AJvYcCWKZb4hLydVfVAu7xLrgD2Z3Xi9a2kKbVbDZEFTaCu0/5oE8jSZgPcUhNJU9GusFsNSojWDth50J01LGS4=@vger.kernel.org, AJvYcCXROwjwNa2flS9RAyrty2vhWlRL5lkdTgWw9aaHeCpyWfpUl6VUseZo6mF/KuS4ytdmxXHur9u35MeM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6EBbVBp/wfIQd3jD+9RKcOEpvIwdJhfSG2u8B61kFfqnVEn2m
	06EKKA4zvoEw/WtPk9axoAWVeZX2kSk0CUY3koPzhHOm1+npTOHg2awP
X-Gm-Gg: ASbGncslAMeCzaeYOlx/9iuesjzVD4vKjPTDlw5tX1v0jKMNecV0y4Jt2slWlYY4bhU
	9xlgg3eNmZzSsvNo+aPbWiac24K8Q/+FmDYyghfaDHR+2WlwbNUykdMmJL/iN5AHkAdnfFkiNRH
	pG7dwQg8rVqjc2xfYgBrlkq9Bps2/85bzjevu/gR4fyWCFLVdzPIP+jk3ebZP27yhUh4xKIcViD
	bJlCxaMdMrZUDSisb8kVs1vDUeDW++OZehKDd3YOz+vAw7O6ymHiroIG2G+ubA5Eu3mZzxq1KSj
	ubF+gwcgAhUURbuOOy1sphksfJgqFBqOIf/z/MSHgSLZ0XFSaYZXfD1xChjduPZNgatyLKTv/SH
	Q3wztGZqkww==
X-Google-Smtp-Source: AGHT+IHNeI1zPiI2bEHkmxT6hKXL6UVFpzEM6ZF+4VIhYg7YstIgepAEZqrySGkMJ46IsjKWIiTftw==
X-Received: by 2002:a05:622a:2615:b0:4a9:8bb9:55d0 with SMTP id d75a77b69052e-4ab7f9f9898mr19367911cf.25.1752526979061;
        Mon, 14 Jul 2025 14:02:59 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-7049799e407sm51774986d6.23.2025.07.14.14.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:02:58 -0700 (PDT)
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
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Mon, 14 Jul 2025 17:02:32 -0400
Message-ID: <20250714210227.714841-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
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
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index d01422844fbf..76751bf91c70 100644
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
+	pinctrl-0 = <&cci1_default &cam_mclk_default>;
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
+		pinctrl-0 = <&cam_front_default>;
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
@@ -491,6 +577,15 @@ &pm660_charger {
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
@@ -509,6 +604,13 @@ led-0 {
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
@@ -548,6 +650,20 @@ &sdhc_1 {
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
+		pins = "gpio15";
+		function = "cam_mclk";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	panel_default: panel-default-state {
 		te-pins {
 			pins = "gpio10";
-- 
2.50.1


