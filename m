Return-Path: <linux-media+bounces-28175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91BA60395
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 22:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D84F37A9C2D
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 21:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7541E1F8ADB;
	Thu, 13 Mar 2025 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tJamV0ca"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A61F709E
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902204; cv=none; b=azBO6AN52179DJK7FDiSEmxwtQPMZ1LZmoE3eYguROaIs+G71cdeaCnkNfcgfDz2a6W8RYh/4lIe4sNwi/GndHNq0oaZnbQ94YSeixbbNkZ/T3Klk5jbzKEd8PBcRF/CMbFAEnWr2NhF5fNoRfDCDTIUOrIEbUqzsY3ZsnYCVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902204; c=relaxed/simple;
	bh=a3wrzpVCaYNuMwQuNJHx7mKyoFe02+zkw63lLomddaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcMvi52yWOQCt+oPgmVmAAP9v3hzn1aIuYpLmOqaRkDqc4ptnwgRfz5j9vcMzFPCHXelyFxsG9BOiCjo/sdg9GvO4NBbitTsfk+Iznrys3mhZDlQ3oWg4jSbCoghkeXuTqwWx/9n4Jm6gQ5Ru6t5C1Z3rhkwxD7kvXgV2ZiGgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tJamV0ca; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abbb12bea54so275480466b.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902201; x=1742507001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZMmcHfeB4rBHuWqkNhUsUagbSg6bNeQKDj5E5I8kNM=;
        b=tJamV0caOKAODX9elPyfz2762PepQmOA4jbp8A54lFjSBTVt2Xou5vNiwkLCI6hfnH
         1SB7mG3JjSRP0A77cF05jv8EfIVuWsqK7ukUpny6Re8Fgv3ShReQQkXNObLWfAzxbex2
         JZLR4j0mWicYX7QZMIOEXouEgyVdhwNPlLbF/MkEVp7SAA4MnKAObExbymNkCFvOSstV
         u49hePDOSN3PSgXCbSC+V6RtTvH/hevhURgs8TjjjK5bVCg2KEgb552DJHCATB1XMGjf
         uURrvc3yMm3FCJQl3FzSXkRvTppAdkh+V+RfuxnIN8Gv8EjhvIi+EMpnjTEGg9Au1TGu
         1XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902201; x=1742507001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZMmcHfeB4rBHuWqkNhUsUagbSg6bNeQKDj5E5I8kNM=;
        b=tf/2ECzp/ZYOaJReU0PP/X4HRfyshY6JvZ9rEfXE8+CVJ6ZACqzWzl8QhxzP6V+0mJ
         M4xpDb2O2gqS51tr6t8DsOGDXN7nJogKl210OD5kS4q3w1VMqTqlDqYm/CkbkAN5GY+7
         OSfzNSPSZSGDVuqsxlX2gmMu2Vee704pB6Jue1hbPaSmy7LPBZdoNfi5FhSbY9k5ydZ8
         WelecodvuNo9DhD40wort7n2/n/AWQGlzTCfMj25l4u9KRTxIUrSzwpdvvbX6ki9e5aI
         UD/Au1BNEJYcurmi+wzCREgg+OAiYzrwUsNM8zqsT2MJU43L06AqpEbo/PqYlz8TYc/H
         08Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVufqH8BmJW2HYYz2vsdMLJGuo/XMfvsbMNANllRJMcfimVVtr8FMbqG1grjeTrYdrhPw5Xzm6D7fL9Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQ6FwCdVAkQkSH73HfcUcxlTtAQ/MW4DtHO361WFdtll6sBs9
	fpGxqWVcEGyVCuEKqG0ZIQad2YejIkfbSsnaws+Np9xtsHm6Im7GLDzibv3LK7w=
X-Gm-Gg: ASbGnctNeLiEiQix1wrGXLgbdFKyZum49/Mwmtxm6z7WaiH2A+n7wAzOKjnqAMuIdak
	6Q4L4PE2yWhNx3cqOrmun/nOJ5DyaLEkImvZNBmYG535G9AYyzAOmStq9adG0v+1FFycmndA95t
	HvpTQlg5pLx0HebFzE3DWHVqwQEcvcauAk13wSO5NCfN4HsJHC8haz8Jjv8gVfiq+2AbVHG1S51
	8HrCRlxPaTTI3ueL33NnD0kkCezkseL/3z683lLNxwWNdmURZkXuh4yzOzqUGa7dt9mRV8/uf2F
	ywUdo4pmwsZ5kX3iPDPcg8y7U+MK2d6DvGFkDj6au+K9Et3D2wqd2vItuuSXQKF/gAzskBqyXaO
	CiGirGZn6K6Cvcpt9aNU61DqHhnl4JG/vV82Y/5NiFVasgVs08IpNqq32YLXCtNR3RY/N
X-Google-Smtp-Source: AGHT+IEoowJuPUsYRRA5+TwZx73pPwDGjlSG75J2GAB4x1TkjB/AGGligwnBjapO7S/jscNp4DnL5w==
X-Received: by 2002:a17:907:2d0f:b0:ac2:8a59:92f4 with SMTP id a640c23a62f3a-ac330408d5cmr8908566b.51.1741902200774;
        Thu, 13 Mar 2025 14:43:20 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:20 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:16 +0000
Subject: [PATCH v5 4/5] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-4-846c9a6493a8@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Add in two CCI busses.

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
index 065a219e69c632eca288c9ade001949e37b92173..4ae0f67a634a982143df7aa933ec4de697f357a5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5117,6 +5117,84 @@ usb_1_ss1_dwc3_ss: endpoint {
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
@@ -5741,6 +5819,78 @@ tlmm: pinctrl@f100000 {
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
2.48.1


