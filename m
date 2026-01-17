Return-Path: <linux-media+bounces-50939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A6D38C1E
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 05:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E86B304DE03
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 04:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751873093B2;
	Sat, 17 Jan 2026 04:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGSdUHGh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FBF322B63
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622813; cv=none; b=EXdhH1w1UI7mLQMPuuFO3pwjMR/AIr+LtpHBWVBm6jOOsWTxFUjwoizozXCePCjyvLX7noi3fD//FKXfyUhoIZ5F2rl6zy0CGI99x5jpmBxZnp+JuCK5FvklZddH7ZrQGD2rOOff2I6rX2Ehol06Vr4YeJS/53d5TN7FX8cutDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622813; c=relaxed/simple;
	bh=Lhwv6D/imJe/RU+nFcTCBbC6E5wPYje6u7F4ebVJzTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9Rh0DghbJQfXk0L6f1Zq6XZ4JLZ7/AJlNEbwwn9cH95J5r9WW5qtZCUrXrKEis4nzDqHbv00JOXvKW0bDsZ/acoN26tybBjrSoDn4J4xu2p2c1l6JJj7ZYnr40sy+t9Rq2m8HR52bKMVnBeZuyFrbG8PCP7Km0zKziUhjXkju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGSdUHGh; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c532d8be8cso274697285a.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622810; x=1769227610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnjtImrdEjhPayN2qIroF2+jnyYbVa8YSS8vBZ23BfA=;
        b=nGSdUHGh7+PMc1mO2BVUTFNv3uMXr31BbEQkdx5pLvbCU9Wgakc939sYKlM26WOCVU
         FqjVKwkGSr2bEu6Ap/EHKzz+fLSeJULZdEMFtgR4g8cAC2Cu7vzrDMkFP6U0deTYHZRb
         6D+kB/OS49xUE0Ry1JhRvBNsqEFKxYDcv45PLbsoLyGLzyH54VnNAehI4nIEo5TB3Gkl
         t4KvlI4ERNiqKZFdOmC2O/YTB876ZCJNe+nmdnNlWM5+x+AXBCjwbGKqR0KhF4s6N0Jz
         ij2ViR1Z5b+gQ2ZTUJl2g3heeMq+gz1xTwuuU/yGhAwERhCHwVIxrYCZcoCApcLZK0O7
         GylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622810; x=1769227610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnjtImrdEjhPayN2qIroF2+jnyYbVa8YSS8vBZ23BfA=;
        b=AxNwL3/DLt5v6P3OkKPZUUF/ketHYqvFK6CmaxNtUhacw3BIqNM15n1Kxi/YQVm+GZ
         KfDLLvYDoFmvC1NvGg70Oas23Hhcuc5ohuP/ogecNQ8KeaKeIiCdB7IfhHIb8MhMIvzA
         ZaIJJKtp2Q/4iaV8NrH32F+s//deYTfDq3kisU0/0ek1NTJ/49Q9YtQBGv3RgGgqLhCu
         tsKYa4ITHDMszVuBtXOwRC+4aQy08mC5zzf0BAafYZLjzLe/59bmnBw6s6B9B8yrNadH
         7MY1JtrTBNEQPVVQoWGvDimfB5uuIUEx+GIL2aTxEpxijxtnn+3suYfSdN2xTCmWCFq8
         GbvA==
X-Forwarded-Encrypted: i=1; AJvYcCXVa+CiiWTg7qbY+hHgmlJJ4nY1vk98CoAFnHS/5Sjkm9GFRlxW5obUlmWiAn2D/p8gz41fZPMKMR9kRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTeDVlwNbOab+lcU8jc5gpmys41Zy5gqX/8lmGBP+vr517MIr
	EgDcAy5XrnQdX5/VvK8pW04m9qhvX3UqMDbpo5UPZIXpT5NYG0zrcWyv
X-Gm-Gg: AY/fxX7bShYGNfJOYAtxFHOnjH8+fZmTpVKuX2V1AkRB7YrRK4ojYyNuSPB+vks3hvD
	qSgFyrbSLckRBap/Kx3HgC4+KSB5cQqx8RqQU3sI/5uvmQsQp2CuTtQjM4tna2LpcxjRJlMlVW5
	D37MLDOF3qkI8vD2rln4CvDw2BIhFHokp6xtg39wfu2M34gItR+2lnysWSdY6IafLkOXEFG+e7r
	jkqJa9xXxiwxONtHe/xEOmDum8oOK+xJ0DfXmBmfqaQuQ/0oB5SVj+DqSRsVTscH/Wl5KLryPux
	qu3QF2lrLvfJu04eR82ExSwxJNjOI3xR5jbdVK755bap5+3As38EVIcwu3wyqVP1IVNGR7NBBAX
	WqjWyoQqSctP6QgVbK4ZZKdXwf8Gh9ZO6+vYUe2vG8wKdF9YH9BBNUZi0dYDFVA7t6uRAXzw2Ck
	GwlZgbY+YkY06IrgVYDbq+Uv2aS1MRBaX9CqI6uifUVj7KsQty3fQfnyxCa02X/US2gis1XVkgl
	R0=
X-Received: by 2002:a05:620a:1a8b:b0:8c5:2f89:6904 with SMTP id af79cd13be357-8c6a676dd6amr698697885a.45.1768622809943;
        Fri, 16 Jan 2026 20:06:49 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab272sm383499585a.2.2026.01.16.20.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:49 -0800 (PST)
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
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Date: Fri, 16 Jan 2026 23:06:57 -0500
Message-ID: <20260117040657.27043-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index ed55646ca419..e925cba0381f 100644
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
@@ -392,6 +420,59 @@ vreg_bob: bob {
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
+		pinctrl-0 = <&cam_mclk2_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
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
@@ -490,6 +571,14 @@ &pm660_charger {
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
@@ -508,6 +597,12 @@ led-0 {
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
-- 
2.52.0


