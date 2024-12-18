Return-Path: <linux-media+bounces-23741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D19F70B6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F7F716C447
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A2F1FCF53;
	Wed, 18 Dec 2024 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmXb3QGP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3181FCD15;
	Wed, 18 Dec 2024 23:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563964; cv=none; b=Fzg8Cb1QJziQnJGj4QgFTjLQBGZ++8Iygc2sUuYlBUUq9aCny+YEQ7hXrio+0RlaXktgokdritPhKLEQvAvcfp74l5MSd6XjAiixiWedbTOxe90CTRnCsT4Mjb5CaMO6TRDhxzSvxqZ56QBcGmzAoA8S2TborR3jn8H1dcBIWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563964; c=relaxed/simple;
	bh=f9cJ05WCR2wdPEl2OKl0KC8I4zZ0XSzhEbqHOiSZ4Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axSCjZ0RTkG12u/IUjHCZ8IUps0fogivg609lbETa0z6rkGl+vMLjjhVFniLcOUBItO84vnhpqpq97qWADxIVThQJJnudHlEkBF5AmX2R6tcbFctqXhGTapmQ8mM0r9Kc75Vy3ZYdUVEX/CeNneAFGghWFfypjo57Aohq8ADrNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmXb3QGP; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a7e108b491so1218855ab.3;
        Wed, 18 Dec 2024 15:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563962; x=1735168762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24h5o9WmiPWWVl46Dr7LPcbWN6q2XU2AlMJNr+RBJSM=;
        b=lmXb3QGPtmMA+uO9quDWfJe4os5egOVQXG2mH8uaCVeFy3WAiSga7Wy48G3I1ve4g8
         44gAa4YAuf6XqvIcS5xa/7Qy8JADkhB6M1EpdNrZ0DAZo7AJDK07l5MLrk5VFhMebq2m
         +9hA4fOs8fT/+B9VAff7fJBsELDgdX3cZTZat7qWEONlwSyFS6ElPKM2YVVti1W+4lH6
         qZonJpg/PUs0UJc8leK/VlVbIUtSCCkEaEzOu1ny/zMCtK1GIMiihULdPCROO9cwkIzu
         52erGYzy/2vpSqd2sDuj1tIn/38QzzOJWRPque8xAEiiVDiV0QG3Q0FLKGleCM69Sj2b
         1jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563962; x=1735168762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24h5o9WmiPWWVl46Dr7LPcbWN6q2XU2AlMJNr+RBJSM=;
        b=L2oFdBIOTK9kC6EQgbPvL5YiUkHmvf/6/Azv/NTfzf1grLuN41pwfJ8HI7O3tqKxrC
         6bXCsooEBG79qDr8DV3OXTQlwnZ6fFGWIojWyB7w3iDa9fzezaNDpMoW49UkLdVT7+qr
         0ddWIWtJzL7ihJYjpeyXn1vHePRaHM4e3WunAOFeiPZMxWQmE4QlJ+A9forf1tIPZiTO
         g7x3K1cfa+9vgoxffxv2/nWbh4Y2MN349iAZ2OcGBN+SaRArDjrfZ+vmL0tJajm6OhPG
         Pebgrvwvu6AifqmKx3nHbWT3CwYVqpfegOAHKIfiKj9fuuhXMcujozcMsdsrIe3myRVj
         yeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVOc8YKr3yFVLi5mxnChlfwFdX01tgQsJ6D4BbKA3hji0XbQJH0heMZ/EbSvqoeY5cZgc5Dyt6Uoj7S0Y=@vger.kernel.org, AJvYcCWJjm157uyP9mDEiN9MrD6zy3/QCYSdXJlQ3slqa0hfjF94TA51gB3eor+nqrN/pXhERO6ZK+nBg7iTzrUQcA==@vger.kernel.org, AJvYcCXP0RgwNyMjJgyjRLPo5FIJdW71j0V8ijlDjY7iaU0WwAcG2v3pSiYYYTx7Uf5M1TOPZUsEBuT5NIfw@vger.kernel.org, AJvYcCXqXMr7ZmeAq/BS7r4ZnvBHZmd2bzYJkUh8rgW0KPcabgogsKrPortI0GBzJgV+16xUij8QvFBMgksx@vger.kernel.org
X-Gm-Message-State: AOJu0YzY94GhYwC3Tz4wpXS82+uDxVdVHooiS++MXrssRvM0zpXuAk6L
	z87wxNOId9j/fEtexTfK6XncBGrGSxCp54UpGJKveyLmzcSC2LNY
X-Gm-Gg: ASbGncswk7o10YR6BPIptO4H9xgu0b0SPvxJbwTxZgaym9fkM+1YhSWvRZFNlivgysq
	73Ncdm+BfoyAOAWn5uxGUN8BVqIwJxEdJ9eWzzVQMWOXYLH6mccvN+Lr0EzsjpOiJ5onjpi7dgY
	jn6poz226ddxvJzdEHf/tJuZs94EXKZYoRGR7gLkJun4/n7l1qvX47DdlQQz74Z2uzoEAnQI2kr
	KKojs0oMRdLf6Txzzbl4ltVUQnH+8YVWQN++eEYvj8=
X-Google-Smtp-Source: AGHT+IGKkxlLb7J3Vm3DERq+L/8vB3lE3fDDHMAgqPxonqOOV7QCBFJdENzhhf1Oe3mszKJUiRNxZw==
X-Received: by 2002:a05:6e02:1985:b0:3a7:9347:544c with SMTP id e9e14a558f8ab-3c01062a2d0mr15696445ab.5.1734563961816;
        Wed, 18 Dec 2024 15:19:21 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::eca])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a2dfdsm2428402173.105.2024.12.18.15.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:19:21 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 5/5] arm64: dts: qcom: sdm670: add camss and cci
Date: Wed, 18 Dec 2024 18:17:35 -0500
Message-ID: <20241218231729.270137-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218231729.270137-7-mailingradian@gmail.com>
References: <20241218231729.270137-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera subsystem and CCI used to interface with cameras on the
Snapdragon 670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 197 +++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 328096b91126..068b6be14be7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Richard Acayan. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				pins = "gpio17", "gpio18";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_default: cci1-default-state {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				pins = "gpio19", "gpio20";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_i2c0_default: qup-i2c0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0";
@@ -1400,6 +1429,174 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac4a000 0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		camss: isp@acb3000 {
+			compatible = "qcom,sdm670-camss";
+			reg = <0 0x0acb3000 0 0x1000>,
+			      <0 0x0acba000 0 0x1000>,
+			      <0 0x0acc8000 0 0x1000>,
+			      <0 0x0ac65000 0 0x1000>,
+			      <0 0x0ac66000 0 0x1000>,
+			      <0 0x0ac67000 0 0x1000>,
+			      <0 0x0acaf000 0 0x4000>,
+			      <0 0x0acb6000 0 0x4000>,
+			      <0 0x0acc4000 0 0x4000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "csi0",
+				      "csi1",
+				      "csi2",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "gcc_camera_ahb",
+				      "gcc_camera_axi",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx";
+
+			iommus = <&apps_smmu 0x808 0x0>,
+				 <&apps_smmu 0x810 0x8>,
+				 <&apps_smmu 0xc08 0x0>,
+				 <&apps_smmu 0xc10 0x8>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					camss_endpoint0: endpoint {
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					camss_endpoint1: endpoint {
+						status = "disabled";
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					camss_endpoint2: endpoint {
+						status = "disabled";
+					};
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
-- 
2.47.1


