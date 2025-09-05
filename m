Return-Path: <linux-media+bounces-41880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D238FB46641
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 23:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC74176945
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 21:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8712F3631;
	Fri,  5 Sep 2025 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6zrO47/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B432ECD30;
	Fri,  5 Sep 2025 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757109385; cv=none; b=JbMauPnhtcTdkopEJuG70SI8Zp6pke88T2oDlQmWMdnnBpi1hzBlKL4jehDfr3Rvnm3Wxqav6TEna4cb5X0jTxhmrRz0g7f+uJWmex0LdL+r9DAIyfhllLLqS7VX7M22YKecV5jRMkLGnlcRu0aNoAWlbcr9pgW2oPp6/dE+8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757109385; c=relaxed/simple;
	bh=4cexNgDE0ckdh8Iq0XYRWV8HEBClLYFInSPMm1MLgmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/JPyFF/R1qt4QyJmTu9vzi+tAFkkz8BC7PdorpWP1nwJS9TSEX4Ui7ZKRucXq7W9rWPKpTkHV9FHnrHf+jW+TWm/SVWBJeyXCEuMvduSU6dn9aYTESbgVzVmNGO8OAuKCKMF+NGVlc3T2AkEPnM8v8MLkTFlOi/bpcY6tyjko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6zrO47/; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7f7381bd1fcso169470585a.0;
        Fri, 05 Sep 2025 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757109383; x=1757714183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3sCuLQ6GP1WNmDG9sojH9/SBzIYTdjTY3j6/Sd+yLw=;
        b=U6zrO47/1NcZuX+m+g2c8V8Do/OA1iysKl1VQsDhMUeN87DwlUM9TsBq/yLNKRj2iz
         Gv8pWDCBMmyoRnIHjIt3nvEmXVuN1XuCkMArODMWx5W5FEl0zodoNpAIP+V6gTaPxHEF
         8BaDVkV0yPB5awSB7wgOhUF5V+LMtK23PRvompv/8A+HyTpXCoe53ThR3xP5FQeh2GsH
         t83G3kvbAZ2kk7WyNohuXe7PNS5iZR2T4CHIlrTSwcQq5VT3IvATrfXuWRdkZRjkdnUr
         4AB45XGUC8KoqBTOZJ/isbHmYwFPNQN1ZZQzD82mgLewo3Y3bmRH1xUZiCJK80iYal8e
         eP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757109383; x=1757714183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3sCuLQ6GP1WNmDG9sojH9/SBzIYTdjTY3j6/Sd+yLw=;
        b=EkKQlNoh1FXgYPIKlxCnA3/fNcwq7jrEXmOLiydQcwmdLqEusDbtW9tBA49/zkOT8g
         3+7RZdMmGuGNvZVDlmeXuSoXtX6DJU6UZjtLowaWIUMBbzmvEDQ69Ym0LdyetLuweVge
         au4KnRF5rKwbZPET+ooELCjsLWedwVitLWFjJkTRJR2puy8Cd811TpVsrsR/G/Irj3H+
         iXiH5rxR29V3+YZSSZpVygrKlF7UEjHoW6wKXk+ghwBeW1z/cilDRbm+h8PDaNFMP0Qx
         PfDNelzgA5/ArFbF6NKhjoY5eEXyQC5AczY1HXdI7ZSxNep4+OjFYtqw9MEeFelln6ZS
         45JA==
X-Forwarded-Encrypted: i=1; AJvYcCUOIhEGzHk/mSRMqYQBHzMJ3J5KswOK6pAjRJvpJI2r8XzWD7XzkLBZ0EGLUUZEmn+KPfIkEIiyCIT9bC8=@vger.kernel.org, AJvYcCWPy10LiuiMHjvELbi9r9YlMCPIvrn++aFNZaEwmXd+P3EkhEJXkoYo00zi4H9kWsu/lTgivk84Ns7T@vger.kernel.org, AJvYcCX0V4CBQKkjJrjywK/KjnRqzOADsj4X4jM2OVPqAKJDS4sL51nN0eqd+sH99GVLuj1pPdb/7uwjhmbnybp8Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtOpWj4NyR0SE+sfBTWzLSEC+krNr+R5EjyiZ4rMgkw9VLchP
	WeTIFnbPKUgaBKFcE01objEYT20HZsjl+J/rsSl6+ZimxRiCm60s7iyJ
X-Gm-Gg: ASbGncuNorZtGjU2HXAwdLYxUlBxWk1s3E5f8SUtMdNtHrddeZ4+apZS5b9QBFRjB4K
	my/fsEY7jgNH3Cni3SyWUja//e9WQaHrUI0nnuBzuxZyycDHnR+EXWrnu+eF3KT8qxFv5bVP7jM
	91BXU3n3cvniLEHv94YqoPzqNyVmXHLCE+jtIUlXu4m1wYJ7BuHsAVilIutyiFMwGkriRnPnM0H
	dzTZMUJ880acJgcImSLr1rRgTV1qg/WCKTMugtUGcV4GXVGviebBCK/0X/iT/oJ39j+On2sUCuy
	WKxiQZMh8hlxEv0/UYv4rwqSlrhYAZmHT2E61/cbq1VldrUOlC0YG2iDMLFySl5ceWQCZom/+CY
	9wFzwWEF5MFgQ6o/HrSl9L5bytP9ajqImjPmc
X-Google-Smtp-Source: AGHT+IGgJApR3lgg8INjLRRagRHjV8LSy6QsrRPuS6jz8B/x82YH6ncpHY7/uYH44d4cCftUNOGq9w==
X-Received: by 2002:a05:620a:29cd:b0:809:8ccc:ba7c with SMTP id af79cd13be357-813bff7838cmr22957085a.29.1757109382739;
        Fri, 05 Sep 2025 14:56:22 -0700 (PDT)
Received: from localhost ([174.89.105.238])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-80aab3b671dsm558246185a.46.2025.09.05.14.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:56:22 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Fri,  5 Sep 2025 17:55:21 -0400
Message-ID: <20250905215516.289998-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905215516.289998-6-mailingradian@gmail.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
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
index d01422844fbf..5980f733479d 100644
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
+		power-source = <0>;
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
+		power-source = <0>;
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
2.51.0


