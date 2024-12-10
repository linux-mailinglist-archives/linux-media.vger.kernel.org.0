Return-Path: <linux-media+bounces-23124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB69EBF71
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30AD9188B0E9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2116722912E;
	Tue, 10 Dec 2024 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ05nr0Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA14227581;
	Tue, 10 Dec 2024 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873762; cv=none; b=bZxK6p25H12wsrjUoeNmP7FLP27M0HqpjTyAVuGS1NwqJ3n71yPmM1A6WTdQT/f8SXmgPCg0tZYGH9oOlBJdwhQyrb2XnW2MmbLP3b5gmTHE1EI8ulokEDkbF69KIUgdjHEZqbQb8Ga/dv8kj69EIgHFqZk2Uy9rvol0AxLqRRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873762; c=relaxed/simple;
	bh=VVKqiqISW/ONQpIkdsvkkK7xVexqVHvQ/scrYExzw7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkWwCdjD88Z88XQ+YX+h/EoG1LgsIGYEKgOSpjS3ATfKSVv5I5M1wxn9DZB1crYS8+K+vsvqqhmejrNPdjJIZ96A8Q8g+xBM4ZZVSZjp8ZjDBziRn18mxRHB2jYh9xe2kbH3flB4aqcOXxJ6yUr5O3F9PdDzyX1aMACJDFYOKyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ05nr0Z; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8fa32d3d6so46455916d6.2;
        Tue, 10 Dec 2024 15:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733873759; x=1734478559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GA9lE8Sp5jyUWZ7a2rWqO2S0lPYRAcCaGaOYmXKfUlo=;
        b=fJ05nr0ZPcmBjhT6ggB1POLNchl8bKQolOC8sN4YVrLDmb+vXg/JsF5deJozUA+yDV
         84pRl1E+6XCVvKTzuGKFA1VaxRa5JfEvhMS+IkljYgjzI6e8f85FpCfRQNMaCS+Eow67
         rDyhOCs0kHvB31XdX6IKTviYsUUJDW4BRIp1h7Fvo1QasptQx3/44ad3y6btVSqKUiyp
         tBT5s/+bb2ssaXQr+SHiOmVIH34/fASW8iCkOsfOo4G1UD3W0dKnv+kreDe0zMMCKDYb
         U5teJQdUz2gB3UEERpHsmgVDdirLTgHr99RXeXJIasUEaYld/SIZ+VXCosi4n9uO4LUL
         l7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873759; x=1734478559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GA9lE8Sp5jyUWZ7a2rWqO2S0lPYRAcCaGaOYmXKfUlo=;
        b=caCqQxwZVt41dYoplZQRzXgKuX9qMdsZDC4DXIylAouoCKkema0OTdRIGCjh0Lt3XN
         dJ9UgNUV937N64dnmHAp+8te0CyteUG0I/R8vxi0V7kFeROiXrFBgDXrNP+6wLszasr8
         FowSqAmS28aLouaVmqK+2hzoZDLmpPxOLdk+azNQnyiSa8z75iQ4uny3LE/OWFYtXaah
         8XIL4Lp9ZEIj1fZMjGLWm8q98EdjnxWUIRu6nrNYQUvAiWPdWlruYDA8ahU+wsyEcar5
         sYjJuf105Dh+ULfhtFifF3hq2q0bHeAML5j4Aqzs03XlNU9myqXtkpra0ZpgNXvhhc9Y
         9W6A==
X-Forwarded-Encrypted: i=1; AJvYcCVIjcaEGUmOqWImtnPnNyDL4oKqlAKK2BZMWUdDGJE4VoeYSsVQilYoeihn3CUFnH82CYW6zE1MTedG@vger.kernel.org, AJvYcCVvh1c9kAdyo+ti6SJcpnV8rZTdzvtshBij5V/oVTbeALjE562QUrw+zpq4d2KNcdpkZqpekbISc77fiKBMlA==@vger.kernel.org, AJvYcCXIGvJxzpkFHo/lRj3J14t+rIo7QmfU0y4UoVyKsjYtkW9EqF08H0pgUch7/wQsReoASrexoGBpky/Pbzw=@vger.kernel.org, AJvYcCXwFqhQM4BUavJC86G9sZPwoPHA+fzzE1WlPrF4Q2lk7mVVS32jg6W0gxDNlGfhfLpVXEwH3Rt1r35p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9ZJOxfsiUM2pFWPaUnuMdiPoesAb9UPHHTECAFB9O2w8zNAj
	lbfzgDc07z1gzgNmqSZdc1izJ9O2a+xFa7NWoh8wMUuplabEiwex
X-Gm-Gg: ASbGncvNXTgxTLZIavmELQbMOoOmQqYrDvdbPskjvYNF2u1rsAaa6WpFIQ9LPmVlVx9
	KURRas7QT1m7gOZ7K/tbDNykATaom5Jp9KDzyYsrA9XInSlqKW2oh4LLrIjRTrcM5L6nlzfKdAc
	yflFpsIV83rUBRf3ZkC/1Vg9ViYxx6fyI00CAgf3OfQNOn4cqMnkOQnGkDzesK/5RbtiqVTpAQr
	NMzlT1HGK6xNl5WEiepGYxJukmitHb6wp/W3YKSvg==
X-Google-Smtp-Source: AGHT+IGgQ7yYCyHB0Deo33wsSdyGdAgh1ekuW86gzhiFvkQxDzaVAUb/knxXieaEX/BuRXk3T2+iPA==
X-Received: by 2002:a05:6214:2527:b0:6d8:a32e:8430 with SMTP id 6a1803df08f44-6d934ad175fmr16140436d6.8.1733873759683;
        Tue, 10 Dec 2024 15:35:59 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6d1aae961sm292125385a.93.2024.12.10.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:35:59 -0800 (PST)
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
Subject: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
Date: Tue, 10 Dec 2024 18:35:40 -0500
Message-ID: <20241210233534.614520-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210233534.614520-7-mailingradian@gmail.com>
References: <20241210233534.614520-7-mailingradian@gmail.com>
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
index 328096b91126..aa486602a2db 100644
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
+		camss: camera-controller@acb3000 {
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
2.47.1


