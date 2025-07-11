Return-Path: <linux-media+bounces-37493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 754ECB01C9B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D30D1CA68D4
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407E02DE6E0;
	Fri, 11 Jul 2025 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/06DyYN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0146E2D77FC
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238692; cv=none; b=lMwLCJ0/tJkxtjpREY7y/RmFE9lHyQAobH50sKc9PQRIWUSlIKb+TXez7VsU6Un8u8jTSAwe+XwzKtIWso4R0wMcidWl87rM3AcwjWt0gULmMdSDVmaK+fufrIm4E5S8BHk1fe1sgAEWQfeArIC3evhQG39+Um58MMC3suzDmGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238692; c=relaxed/simple;
	bh=ETI/AHSUJsz5JS2Ws7Cricsh5CI+Ea01tbS9XwH/NpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXq9WURV5irCsTSPm/ohHDxT1NQFUEN/TDcS067IaFuxttkw+3RHRuzXfhE/R+T+k2KKMG4p13LUXBW4NGwtEZcgTqD3pB/kn57Udgb4FnHi+BSTAfmxkFQ+19kFlpjVQuAuiS1gjGYSb34ief9pnorpOIC4cWbTFkQb4Xc+AxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/06DyYN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso22453005e9.0
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238688; x=1752843488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i097IaLYfYDmLJQUaR4DhbEpB4vYLQ/9VvicO+IExI=;
        b=e/06DyYN1sxCE9yzW4cwQvu+aBK3XzNSdBXgz3yySs3LQKrsW9NCvrNJpHo5ARYfmR
         W2/th/gGmodaG1kLZGWCYOJrQ2R107D8NJa5TEZ916ZdXd2RCCgIVKUR9apsdeZOWtwL
         L3530XxFoG3tduWZYn5YaTh5sdieLqWQWnKHGiJVsod4W+I0T5pZZUqRgK503nnuG+Vm
         1lIIeqNVqrs4RFw1zetyA7GRAgadv8nua0GnfKtCM++F6z1r+Bs6q2Few7Pm09hH2c9Y
         xTVIqdClb5hw4TZXTuqJZ9CdfDkx4gZJ9BmCeLl/ZTfxIS+a53Pi/4c8ft0fHGfh4uyJ
         oKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238688; x=1752843488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i097IaLYfYDmLJQUaR4DhbEpB4vYLQ/9VvicO+IExI=;
        b=wZ5o7Xc3aLEbFF5+SXmn2BTlcaLcu9FGwBk2HliGmRyZaQQIhAzAUsZJjWqM2Ymuic
         4az9ER8fo5iCm6TgPzTawWQFbIpVokGfmqlD851EiyrWQYWshG2tEsIreyJz8zqXfc4/
         p4uAWHm+aCseWw126id/BZWIvNwQ1vT0oshD6hePTcfdwmeIYk9LpJpFa0y+jjpp9cQf
         tX98vpuoAZLHAe/sZAU7lJbK5IvwbDnSQqj+roo3k9TQ8piN6JDAv5Q8Bx48Sleniq9S
         +G9IhaxDa1BtGmHfSMlqjxf9MgD+tOeHns87PyxA/+AXpjkUn0lDzOjAZJY/eso0fpBC
         EuZw==
X-Forwarded-Encrypted: i=1; AJvYcCXNaNSvBV/PQbC8OG0etHM5LXIkbM3VtUiehEAx/MZ0Um5zZXTNhcl0rHBWK1o1ccl81paU4yj+Q7MUmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjOQbjddGfUtS/oypHt7CmtqY48tU4YmKkqXUhuB/o/OxpIwpA
	EG0XblLlWj60tQG1HNF/abQz25y7U3hhkDp/PIsi/sCg6zKFIkCK48SCexcqVQVCWWEQX2D6fao
	kbKgvjNYVDw==
X-Gm-Gg: ASbGncvy9hTCugSUXTmm0cFT4XDO9N43nhLYWxhNLpaFglxFJyYmxpSEtP9P8HGChHU
	fM/n6exS9Ph/BnPgCdtDr+O5dXN0+iCF7XQ9gWfdngWNeDTNUv7f6eH083cVItCortcbQpdkB0n
	JXUaydZnXCNxfiO8aqF/2276VyfiB2ilgVp+jVHTG5kq9o+I3/VrqSjWti9RvAa8o57zY3CtQV2
	Ouwa4sxgj0YFLcEkhlVbjO/PvqtdYKPekLW41A+jOTKJVt0K0UPvGuAMEoh0W6jAUbEUvVBG2i8
	eX8Pec7hvYnu8UvauP4wp/jyXYnvHg4I1Ri6dDGd6/kpRi250bLsw+6Mcj4YQ/ONJd1wMbtGlUn
	9FL/jPOnjr4Rz69982uPL9bw6sEpgyTg4A9Kyf7uWY1XvsQt9+7as9A9oEaLCUl5o
X-Google-Smtp-Source: AGHT+IGZtXWyw/8SR1DLstRR08snUclu5qzLJBHDYMN9S9fdvA300uTGgLyM9TfRjfWqlBAhXwUl9g==
X-Received: by 2002:a05:600d:7:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-454db8d8cd6mr65769055e9.15.1752238688302;
        Fri, 11 Jul 2025 05:58:08 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:59 +0100
Subject: [PATCH v7 07/15] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-7-0bc5da82f526@linaro.org>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5106;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ETI/AHSUJsz5JS2Ws7Cricsh5CI+Ea01tbS9XwH/NpI=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTCnUj7uaQ+qyTQJJKB7O6eUF99RuHZZ/Lk
 Dp7CAixej6JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OonYD/0d76E9g5Sy10ttlZYEuf6AtNQPIwrEpcKjC2bCkpXUTwc+cYm2FCmGafcua8N1qNjlVTD
 KL/flfBXRgMtZOfNEJYz0FLNtErkr9z4dKhoEDtdu0KqcgxTEzdEfJMGIkqxbjOO3lc5TTAVzjb
 B5dK2oiehJ7oAgg8BCxOZ1qUGFd3wE5/vqjvknt7altskmuuX98zRtF+a7CBPVFYRjdw549qZno
 PsUnwFZKUaQV1/lZD1kI5z6c7iiVLmMnwS8RAglNLBXGNJtUwfp0a4r1U2BczDVcScoIw4ma3s9
 fafz/HA6AYQ1IFJaNfew/sz33AbsOFNDYpHj7tAhzmr+tqmMsCCAdqjxP5qbtJGyoK6oAzar83k
 NqGQaj0G00a2gFVAXGSF+x84ZCEhxxgrKnqmIjqMwKm18ZrBHAPjbiKld/69+SAsiTzaCCe4PzR
 MLJcTh+DRWMXXu2D/7XbS03Ef5lCi1fEG5mT/+j/U1AO7TaFaI1jQKQiUtwzYl1x1WE+dxnM+B7
 0oCh6zO6EerWD9Elk4EDQOEuimS32+awoyq3iwOwe/Q7z4wo87pb4vRVrp5J1XrjvDqMz9GdL8f
 ehoA6H5E3xGDBXxRCAyCGdkMul8le5pTn1On5eZv7qeZK6E+SC2hq1wfhwIGKhsP5kGzBaSQ/Xh
 EwBfxOhXwykJogA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 1dff82692ff6702c5577ae9e693ce3f7ea215eee..41245e8592f78edf141141f2f5b7c5b841318f46 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5166,6 +5166,84 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -5790,6 +5868,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.49.0


