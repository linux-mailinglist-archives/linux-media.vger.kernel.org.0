Return-Path: <linux-media+bounces-44783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B1BE631F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F165E7A6E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 03:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6D725D209;
	Fri, 17 Oct 2025 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+ZgB4Hn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF725A322
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760670713; cv=none; b=k8/RPRrdqFum/nsgyt0sJ0ANzhlFvXHdAke0BIgEPBNL6YWz2Ggi4YQTEntl8XCT76Xe+Ga//rpdgt3a7kGjKqN/g3m42xSyphtfaVlzMutx5zfJ7koxoRkDPlxCvKc2+lchXhqr2QHu/sVmViNpIn2YYKIU/7654Hu+A4xUaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760670713; c=relaxed/simple;
	bh=wXZFPgYH70cmZX6EYNF3mM2sZEWe8tVseMuqUQBxWu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuwmyL3bgFy4XSbMql3YZJWZR/03GkBFWOTgCT0xDZQciHx54tTzNycDSUfWbLFnQHZZBS9z1MTmgTo8+WHrazQRgLOFOO1II1OaVzvgMRIhg7dzzBN41gsZwRmRf9PS06+U7DRwPo8d3eTvqsQjpRGa+nE/kCLpMwy0hdIGUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+ZgB4Hn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57a8b00108fso292054e87.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 20:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760670710; x=1761275510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA9hqAjwG1E9jDqSO/KlB8EGiH+7nWQhHT2HL2H+WO0=;
        b=Y+ZgB4Hn0czYixtJ+8sgnCkCxDj6SyH0RCmyivGraTNTyKL3/yYfGnQE6XActCNUWG
         d8Lt76EAVQXvyktbDmgFFFU5+yv0yBgLpqCsOQfqdZdvaBh+oE13CEtjkFj+6P5iIr7U
         Y6k9DgL9qxOCE8tTi2O4u5CYAsU0HLvwIFbkN0QDnpvR5bEYaFa+0huKog8+5IDnEGr3
         3xc2ffzBaqnVXjItOT0IapT4Jgyk3pDqANwkSZ6k18POn6HCwdEPGVOVjWnJxtqn6BUr
         FTwIXcG+2cyTwhJoVPTMvNifl94BoqlIxMOeNYp4b9TUmYF1iqAklq3UhjFx7JglECzJ
         FTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760670710; x=1761275510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA9hqAjwG1E9jDqSO/KlB8EGiH+7nWQhHT2HL2H+WO0=;
        b=gWO3JSlfqxaAmjAQFivTnDk+/oqKot2hGV5tE5D4iJHv1IMrB89eewdUIl7N97xndd
         ZNVsFDeUUbps5JbvpYI9DuLiVF8LdoUrpT+dM1CsdSjA6tpMRixyjBEB0NpVo+zo8XjU
         vxW90SgzWEKYtt9volxi/adI3Af/oi3NiG4SHqY1HnGiCA2zEgl9k1oNeWl/aStyxNDY
         1c8QEHekb5MvfL63Yoq8FMrfKvNguifejMfvB+JGVwQiHDkDaPUQSG3cJ6fCMDNSD8X8
         MqzulKwXJzMstdoY0K1zV1iS+1LWw1Z9CcpFH+tJhfVkJ6ABq84WHuOO0oakSYHOdhXM
         VGVA==
X-Forwarded-Encrypted: i=1; AJvYcCVaou20/xvdKg3G6j3fsNbaWnvVE1KjEVzkJMLix5jv2XWEstwzP/WKXqNmY1F6XKRwyarju17/FSypPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPB7OODA9B3Etvg4Dw+ALqU7+5TNBqblX2s2ZXWg1yESV0cME
	vq8GHtX3qyYMzND92bIjrJqHPgKykSzeQkRorVGk0onudBNiHZD2sm3b1ImJkO+Ssdg=
X-Gm-Gg: ASbGncuNJWqrbovtPvzs6vIUhz+WAzee1m4kpiPWoZMNCGzHOEC9X+sAof74XsEkHcs
	cGJA3s90jtazzv/ocTiVVCMDhVS3pSWvnnUq+2IqT99etzE1NZPtWDljQd+99Su6lk+lO8tXlLy
	gbH1d705+X57MGR7DT+YXajtW2VfIv0iH2d3qnHnZYTXKlFu7nfv4LYCnZTK1u6Bp8/Gq0uW6G7
	X+77DOYoGm3mLb5IosqX7OKVE7opJgfiFQJbzRR4NHanac1mgAwM4kBou51DkphErQkNnW6aU4e
	u0Ld3Iwj4rfegQ9GjlqJztZxQ4jm8CX2t0okno7OqFzJWDvGBmESCkk2gbjjC711fpA+50XCv+V
	LByl9BTcNDY2NZ449TneB25MQvj+ds8z3G0lrXnq9XsqtaMvnn/pW+CAFnia+Y9KlICMMN+pIIm
	V/FF+Y8rSJWU7RXExsS/aTOqWS5GD9Pxih4Rgy8F3SseE=
X-Google-Smtp-Source: AGHT+IECks8I3mYWx2PUIbg7ewNMlGfHX1YiKCcgj3by7xQkWiPnfR6l1obsEgPSWsZwQ8dRAVIVMQ==
X-Received: by 2002:a05:6512:2209:b0:57a:2be1:d766 with SMTP id 2adb3069b0e04-591d854a5a5mr435142e87.4.1760670710259;
        Thu, 16 Oct 2025 20:11:50 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563844sm7496077e87.69.2025.10.16.20.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 20:11:48 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8650: Add CAMSS device tree node
Date: Fri, 17 Oct 2025 06:11:31 +0300
Message-ID: <20251017031131.2232687-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Qualcomm SM8650 CAMSS device tree node to the platform dtsi file,
the SM8650 CAMSS IP contains
* 6 x CSIPHY,
* 3 x CSID, 2 x CSID Lite,
* 3 x IFE, 2 x IFE Lite.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 180 +++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ebf1971b1bfb..555305c1c70d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5343,6 +5343,186 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,sm8650-camss";
+			reg = <0 0x0acb6000 0 0x1000>,
+			      <0 0x0acb8000 0 0x1000>,
+			      <0 0x0acba000 0 0x1000>,
+			      <0 0x0acbc000 0 0x1000>,
+			      <0 0x0accb000 0 0x1000>,
+			      <0 0x0acd0000 0 0x1000>,
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
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
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
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
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
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
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
+			clock-names = "camnoc_axi",
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
+				      "gcc_axi_hf",
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
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0
+					 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+			iommus = <&apps_smmu 0x800 0x20>,
+				 <&apps_smmu 0x18a0 0x40>,
+				 <&apps_smmu 0x1860 0x00>;
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
2.49.0


