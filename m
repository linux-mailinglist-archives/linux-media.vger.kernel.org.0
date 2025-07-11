Return-Path: <linux-media+bounces-37497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B1B01CB3
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE8D1CA7100
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA642E7658;
	Fri, 11 Jul 2025 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="apYSwzo8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC792E0418
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238697; cv=none; b=Cqza82VmPReV05LxGisqVMMHyWAU9msF5yIFiei6SMbaNGa60EMlMEt8mHxPBnJDUMTcF6GI928mUx2NU6/LzaEUpekxlsR6utmol9BrDvUV7x0nyzScK6kuq2upI7E3HPyPGwu2kRi9hmlRtFHVOogIyf/YVXmWK1yOV7hM3IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238697; c=relaxed/simple;
	bh=LgmLX2RZ4X74crWj3cWM7ysfcUms+MkA5YpXJ0oww+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ty4b8M8I0PjC2EGE2q/l7V0lRgb/jS69YlIYuGxbfSA6UBHkA2cQEwzlaNL3hJS1pTkZ3BDfQcwNehcC56RrrztNFZ1vrNFksM22Rn2pt0fDce9afLMs9F2GUUYJ3SQvKn0DR349cUHEjMNwqJn2/F5m4lSFmYsUT/LXGjC/Bxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=apYSwzo8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so15937965e9.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238693; x=1752843493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v3EVCAyFusaLk3mZgTj27fJdcuFLP8tgaOmyEGMO98=;
        b=apYSwzo8GOYswXWU+tEJXi9Xi/1RDNQeQWuvf6wasldrmadL+oagH/+V2x7qCawtUt
         yQrPHuMrKuwaIiEkL7J9FEKkiK1RwwVCztF3Rcf6XvhM5heqQTGPUp1AZvJpUs2yOj4u
         AYi8Uq2FDkFB3wJ4VzT4ai0hkdgobeyEKnV7zOPM68QpK5bB5qlC8EmsCnY8N9guK9/e
         mYqaYbXKAwga1gQ9ffO4huYYSKmPQ9hYDNZBs7JHUyjLDyNFyipqd6C/QAtDfqdASGpO
         MrFL2n3dSR6S7OwR6+cjobMGRTok188wM8zte/McYjQjdUQ3SGXVxsdmvp5XdCXDgHVc
         rB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238693; x=1752843493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v3EVCAyFusaLk3mZgTj27fJdcuFLP8tgaOmyEGMO98=;
        b=DlWHAfMRxaBJvqpXmd0DCnVYfdnANAwA7vSs/7j0+Rilb3nYsztYBA+cDC09l3f8N4
         ZNULZBKmgd0jiuDLOO1CeBHYOZrM9p9StDKGfPt+CUHfNdzUstscxq1h73jD4Z8Ec3+G
         C2NSp0ybkI77K1Neeqn9/REKiipnyJ1hHHMruKwuGucKILjNnTrhI1XYVKfx7V8X1lMQ
         Kf1lztEUCLRPkDrRzV+Hhpka+uICqoMnrhikMd+afYGx+IJ0fOLK8EBG1KC/vEvXlhal
         FR7H2rja+3QI/+fD8RImUCJvd0BdVVWv1LARMziKJ9LatQLBOoRPGxmpRPdltRlZ3Xfr
         c3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUwaJwfCWJ3d+g6QLdM96QlBD40YYLU9JqSjE0hBBfUwBCTmegjsPe8uDIqtQxOFJGiy8o35155/ph5LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBOC2Tq5ewbAZWCgxt2SwLiDQHEozb0uC/5Qz450/rQVYP1wI
	Ks2zzdQD5rNX7C/xKZwgiFzmLNbjJw6mi7fkMM1rMrAqqm7LVktjaTROvOkrHSRKVUg=
X-Gm-Gg: ASbGncsfF5SM51mMeMzIRxvm6JDsht6YWxGGqzkOvN+TGtXjN5EICO0sptktqgIJ3Wr
	xCgWyUFP3PWr42W9x+mshD2byNJ5UENKDzhyffbIYjfEHEsrLoHF8WPydIzAysRwu7LSjUwOzjx
	U5BTT4kV7eEuZWyMlO+UCPus4nzGxb6Yeq9WO8/xREQlRegub1ddQYSfbwVy15JW/O61JK8zJGe
	FQwOeJScTQwdTWhUyl87AQlQa2RKnzYvgst7KpgxsTlfWZFiCqBtDnt6FiyEoykiFMj9swnWxhi
	0mT6ChFyeheoPT//7I3OfymyywY4AgeCvpq7V3YB0MWSI2OckfHofJS0g03H/uqqgpu5oabrhFu
	RUEoWlnYbwrgM82UsKlhYHVjpuXQ4zj7f0wjb0i0lYKkkSwqoxEKEUkAJprQEF0AD
X-Google-Smtp-Source: AGHT+IFcUrL4U8BMr0ery0/fbdYJur+qbwccfjgkJyTk+hxObOyLPZL+GDqLrqXXn2LckQoe02uDyQ==
X-Received: by 2002:a05:600c:a111:b0:455:f6cd:8703 with SMTP id 5b1f17b1804b1-455f6cd8a4emr4821665e9.31.1752238692986;
        Fri, 11 Jul 2025 05:58:12 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:03 +0100
Subject: [PATCH v7 11/15] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=LgmLX2RZ4X74crWj3cWM7ysfcUms+MkA5YpXJ0oww+k=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpUJ/oNArjEu8vlINVYmk0Bt78iBMUWoXJmM
 MeayObaeNKJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVAAKCRAicTuzoY3I
 Os8CD/40Lx4A93Vu1OHr1cQG0dkBFN5D1Z7OqePE2tHQVtU7wXvnFt5RZBGU2toYGraJ3Qa7SNS
 bHLSi9QunZgANBZlqP4fwm+RzfHdDCwdyCgcEdaK0k6OO/3el7c2PZRqs997/7DuJor4i9hiskA
 mb9nBWRhaZ11ZVw/rR88oaRV73M8iq3pgXf9u/Z2uIhbFbjZ9lkD2y3susuDsf20VNz2uIUsdYI
 tvo7mVpA1pihuFOA2P7/0jHd7EtSYoHZzDOFG844+Zglnk7bcfLo5S0F8qDo111Ibl0smSSDX0Z
 E+ZshY2nQqUIjTsSdhMDNyX67eJBvrYtYIooIJhaFn5KMkZQcmAyyxzgHVvNfZUetSSwl1yOFIF
 TXXyyRWDsO7+kRAa1PGoG63gmIUUA1MMGBBSMcFTtuyRZGWtevRgJr7TE65XR/wEqWUHSnJ3Upz
 VJNDlqC5R7ZAgO4bva8cC63+3qSoMMXDYYmwn0CreAsfMg+C5++rWaLxO4xlnWrkOZrC6vDesk/
 6h7uTx71DWc8/sE5b3xSjfeLFPYQNR90cj/PtaZEC/l4VaKTbBLrpHb8SFX8JbSzPqpXGKq0n3D
 KQWvHji75yycEpjUkvTuK/JkcBG0gA0KZrNFWuEZWunjdoLL5iSB6IzGcXPzMexlv6k8lyHK2CK
 T1REWftHPQ+V9rQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 08268f60c305cd69baf937fced6d37f2ea788b62..ace4ab2b9fc0faac8233a40220aafba200ff05d9 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -996,6 +997,67 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			csiphy4_ep: endpoint@4 {
+				reg = <4>;
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+	phy-type = <PHY_TYPE_DPHY>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1608,6 +1670,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.49.0


