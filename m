Return-Path: <linux-media+bounces-19374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55588999AA0
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7543285546
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85AE1F4728;
	Fri, 11 Oct 2024 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzaBRCfX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926D21EF940;
	Fri, 11 Oct 2024 02:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614274; cv=none; b=gn4qC4cXwRnU49Qbp95C7O6igcp8vK+SsFAFbU6soRCCpNXrsKASfXH41M53tpNjhseNgRdHzBYuDSaqVRkBay+Q9j4mM/G60eiOH7dhP2SGzX91f6HtG3J5G6zlgIicbyZbR3h6dmOJrB6AkeR9HmCqNNevANqjnV8bgK5gHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614274; c=relaxed/simple;
	bh=FjTX3XDsZpHBupi3816W2od1/AGtgYSbkC2JLrZVGvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXnEG+szLNW1PtOQfnVlJq/w6WHHK2PJs3wmCFO9ylUk88LWJp6GbovvYbrY+/wxddI5wneZJHoQiCpgRNSOx02xkWRQWWg6+uA5SM2+Om55026L6lmeATt4S5N+u3ZedeGLlkl4JWM5qDxemUaSpnpTrnHQML++Q6iugfe514o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzaBRCfX; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46041d86566so8348861cf.3;
        Thu, 10 Oct 2024 19:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728614271; x=1729219071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRPUb8dk8eranWDUoNRWB5sVzMnuxcxe71W05Xb2xMM=;
        b=MzaBRCfXKtOTcM7dZHQJKuoPvOd2e6LFjNiMBkLdESjjl+9HWigc25iaa36LaibU8x
         7ITXJ37fXeHmRtfttopJEZ1M/rBt9pPXiZHFl6TwwNbheI7S+b8FcszUXS6VvACQZ/XV
         xU5Ju7Au5ID2k5JIKxhvZm24nt6NHxWM5d+o5uTjGl3vHqLgzZbCiZc0TMCaePFgwdSN
         Fi1U99w/+ZmBRRHZ81c0OCa8xTKjSwvxo37AoZKx2eEiC55wBZbcC36AmsJpZ4Xbmow3
         6uR7AtfLKdnL60I08p5Kkgf1YVXUlh+kTigts33jATbcQSyjWoOYaeWX+raPbSAeKdyJ
         5u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728614271; x=1729219071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRPUb8dk8eranWDUoNRWB5sVzMnuxcxe71W05Xb2xMM=;
        b=oX+uD0kCxJ/VUhO1IVS6H9SMuRad69338gSOJTUMDMtfuM0OgMkW8/djnFvYwWzpBI
         1IsxLjCVRvHVCdZxoG/+ZCrQPtY7nHaAzByVkyz+MWK+YXrwr93iT1Sh2jlcTat+Rn3j
         UIWwaZRACrchhygL3e0z4ODEdiI70RMcs+oCVxXphFgVTAvPcSFikrXMt3qq0J9zEnOQ
         XR9dzAvKAwPANJrUZXX72nG+roIpvnRR0ej6IYpnaj5JhfGfunHRbiPRspvnf3PWTXiN
         SHPYyA8+KdyzeZuyQLl0SIYoCCnLjkmPtPfEwK2cinl03Fxu1FN3QIfiepcnojApr/C9
         3KSw==
X-Forwarded-Encrypted: i=1; AJvYcCVAE3oF5Bu6+WCBk3ax6jCUbLGEQTecdIaODcpeOA1aq3UrLMVXVxs3Ke4h87F3aWR1JxRKIqwOu04V@vger.kernel.org, AJvYcCVw4qWMH8rz/2KMwwm44u4A8N88iGnfb/YgnZ1sTwJFj01bm+YtsttOSQLj6SgjR1f6O0cVRq2bMExPqqnUaA==@vger.kernel.org, AJvYcCWT4kbI0jqmu0VbmdSN07ud3laerBCSAbdM+NiTabKwnCgedjTsiJFqxjMUBeSAQGZq1Lolz4L7+C1Mm8c=@vger.kernel.org, AJvYcCWWM59hD2nemvqEDi6E3/HZ86xJ0DJywvDQjTBNk68WG0XUJXm7kfKFhIumrEgNgPNEef69eq8oIVHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzIFDxZSqHu3UQctImbvcVzBlQeQY6RpLXofzrxAhD3MmFEtR
	QpFMp7ANcBASAuc1cpAxsCvpNEwioQTogjgYO1QQSFVIXXzf8gty
X-Google-Smtp-Source: AGHT+IFy+didwRP6RtchQAcwd71MpnhBpwSrQI/VBkjSGGGu+1tFA4FD0vLaNQRaNUqfDR1xDDqFBQ==
X-Received: by 2002:ac8:7c48:0:b0:458:4224:c367 with SMTP id d75a77b69052e-4604bc53c68mr16821501cf.49.1728614271312;
        Thu, 10 Oct 2024 19:37:51 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d53bfsm11258731cf.29.2024.10.10.19.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 19:37:50 -0700 (PDT)
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
Subject: [PATCH v6 5/5] arm64: dts: qcom: sdm670: add camss and cci
Date: Thu, 10 Oct 2024 22:37:30 -0400
Message-ID: <20241011023724.614584-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011023724.614584-7-mailingradian@gmail.com>
References: <20241011023724.614584-7-mailingradian@gmail.com>
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
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 185 +++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 02f87200690a..229d1c4eb246 100644
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
@@ -1400,6 +1429,162 @@ spmi_bus: spmi@c440000 {
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
+		camss: camera-controller@ac65000 {
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
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
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
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+			clock-names = "gcc_camera_ahb",
+				      "gcc_camera_axi",
+				      "soc_ahb",
+				      "camnoc_axi",
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
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1_axi",
+				      "vfe1",
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
+				camss_port0: port@0 {
+					reg = <0>;
+				};
+
+				camss_port1: port@1 {
+					reg = <1>;
+				};
+
+				camss_port2: port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;
-- 
2.47.0


