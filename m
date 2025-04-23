Return-Path: <linux-media+bounces-30884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59411A99B71
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 00:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1604F5A6E11
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 22:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AE621FF5C;
	Wed, 23 Apr 2025 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0I7AJGs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67320101F
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 22:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446814; cv=none; b=Vu3M2xmvcRFbQgkUlD7gRkm8pmld2SI9wELDH1l62yjTyUCFk7/4rt9umjAjNHZNs5SSG6iqEf/xpXcHsf4QjW7y5B8CHbYOULHindDd9EVNTlqbbHtUMhVYz5hXSrOr6VJJy7ZE+/R7xNZiQkwGt4pNu9p1GNJcU1b96NhI4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446814; c=relaxed/simple;
	bh=aD6zxWAQd7k1gt1B2+XOnoLdTXTCBk8kAijFJU/KWb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJ/MHCufC10yGVZO/luMjXVE+7+i7TgcIWyB+Cfy/xBBqmN4prGIIRE7Rut0+q/lKA6KL1yawq3GwA4cAXQZ4LH3B0uP0fLohGdUzyKQaRaqCgKbZUwAWa9jT6ancZ0IUZxFvVFskynFKlnPK89PQ88QZk8JyA0n7dd7ERfWf0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0I7AJGs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e66deb66fso20157e87.3
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745446809; x=1746051609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FstcsjlH3leeZFG/jkPOr9l/52Li9ba936xTRfNP4s=;
        b=a0I7AJGsqCy7D3tkXv6w/U5F7fBACezsjQbXd6JL4b7Gzi80y+1t8AtVu3Eqn4/HEE
         nImZHxGB4B81L0j24rDO9++gCt/Y9YGbM+7ZZOxrqp6L81Zpu71Gs2q/eyYfIkXeihdu
         vDBP7IJxcfQXl52D1Ot7gqQEy+J1laAdv/P4amFWh2hn9aghp2dlrnNbI0OpN9+4hVGQ
         PmskYffRKMzFepzc7mK79IUmLb1tip/yE9N5DUzW7Fc9Zwkt1P2Tgwq9CqS3eMU00ehY
         OAit2Ipa+KTf1L8x5WUc4WNV2dsAK7GlWZOz1YNqRNhV03PmlziSpF68jh9Pnwz3tEvp
         7+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446809; x=1746051609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FstcsjlH3leeZFG/jkPOr9l/52Li9ba936xTRfNP4s=;
        b=UKNzQ4kJOwV3XWVUhizPRvwrYKuqMeYbnxmmJHLao1GSabOD6ViQ7VXyzVDx3fukX5
         X9dJs+hAcF3qpY4et/nePghabxvdHaRZ4IJglgYvpeqSes58gjJW59Szc3TsVNkdn/EE
         yhh1g6J+7FflLpmifbm8Wnpfs0JWvCRL+LC+qg9Fj3h/r+yQ5cppFMIjEJDtwO9bPn24
         fDBZhRX/2GSvm5KvKyAmfjOiOy1/SZQ48TSpn+GCbqJqyJXQsCouSRLZvQw0i1xU6cVS
         VIhH/IuXYORUIxsk/+QY2k8u3Zgp/OIeYgyd5nzdP0t+7l+KdHIQryst+5JrzhzbOAC1
         7TBg==
X-Forwarded-Encrypted: i=1; AJvYcCXqgmPmamuaBhzToyCk3pj5JB2vHlQrRyJt2TzXAUOi35PynCBrwkAF6pYV7HRGEdIcTdoam2rp6Yo6Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy89I/D5zvSzDbwhxIoY/bbi4MPLOw3eZW/p606vPm0EF0DG0Yr
	uIPK9GtrljnF2+deZ5XD2YRPQ/Low3GdYLr4u05ROC0jNQQHg5LDO6TxVSVKUjg=
X-Gm-Gg: ASbGncvE3VutewikX6gc50RbMbia/An4wfQXce426iKfQyv4ZA8b4CZd1AwtqaoCTGz
	kzSnGz2lEXhRoYdfbXlwupozR7gP9BvkBLJNIS5X85BjF001uVjWtQukohVu1sNa7NY9e0KDEtN
	lBpTgEM2M81Uc6lERUFbKohR5G2tiOI7EWcvzTCKrzUznsC/3NvywKC7iix8mS66tHBdcb7jEED
	O5yeFz3OJ6JlquwW7C704PsKKZyirytpmVXn/wmD+955heCsrynJju6uk/bRAw9j4L2wl9rZePH
	fcw+HNnJStLKyWzvvGXFMSNKljyTewN18M5FeWA/oupjd2zwZgLSTPoS7kOnMVjWmGNj1NP49ti
	+rr6vr7ZPAVQfgXeTCQDR9XVxFL6l9tc1k0//Mouz
X-Google-Smtp-Source: AGHT+IGC1EENy8KaNIqVut3zxW5tDBcp8Yyd4vOtvjk1I6IgML/ll3wA7wlFC1isFvmxbZvuBcYu6w==
X-Received: by 2002:a05:6512:220a:b0:545:1d9f:a01b with SMTP id 2adb3069b0e04-54e7c5472a9mr54582e87.10.1745446809369;
        Wed, 23 Apr 2025 15:20:09 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb371a2sm19547e87.57.2025.04.23.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:20:07 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8650: Add CAMSS block definition
Date: Thu, 24 Apr 2025 01:19:53 +0300
Message-ID: <20250423221954.1926453-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
References: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SM8650 CAMSS device tree node to the platform dtsi file,
it contains of
* 6 x CSIPHY
* 3 x CSID
* 2 x CSID Lite
* 3 x IFE
* 2 x IFE Lite

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 189 +++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f721794..b24ab52413f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5065,6 +5065,195 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb8000 {
+			compatible = "qcom,sm8650-camss";
+			reg = <0 0x0acb8000 0 0x1000>,
+			      <0 0x0acba000 0 0x1000>,
+			      <0 0x0acbc000 0 0x1000>,
+			      <0 0x0accb000 0 0x1000>,
+			      <0 0x0acd0000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acea000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acee000 0 0x2000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0ac80000 0 0xf000>,
+			      <0 0x0accc000 0 0x2000>,
+			      <0 0x0acd1000 0 0x2000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_axi_nrt",
+				      "camnoc_axi_rt",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "csiphy_rx",
+				      "gcc_ahb_clk",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "qdss_debug_xo",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_0_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x20>,
+				 <&apps_smmu 0x18a0 0x40>,
+				 <&apps_smmu 0x1860 0x00>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_IFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0", "ife1", "ife2", "top";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8650-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.45.2


