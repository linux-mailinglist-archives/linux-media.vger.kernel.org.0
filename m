Return-Path: <linux-media+bounces-25665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5050A28312
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 04:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F963A3FB7
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 03:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05821214A91;
	Wed,  5 Feb 2025 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT0VB7ug"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6B214A7B;
	Wed,  5 Feb 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738727436; cv=none; b=YnoKLbQtsQzsBf+PKkjOv8DjRgcacmvwsJmp54P76A8/4o7NwDYFfRa2qy8fZkRv2fzn88/GTo4DRlAcPrMkchLepJt4KXRZEuqDodT9cLIbobAB5sO0TZmN+Nka9jLlFU+Bu95LVIsT4zxCkF7otIKKDIU5qaCrSt8t5bDf2S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738727436; c=relaxed/simple;
	bh=3d/XSiH31qjL/Ihtu6kqAwoq5OHbRDINsw7eUK/DfNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdskvhXcgUYoycNbxmM1b2f7qlK3b9Kmj3kjDdXHd7ODz5jU93PdQdwNfRM38q1QsBMHQuj+zjGeygLMHi+hXbfXtE99yNBcU/lmf5bwpqyr/kAdt9P94cDMn+jeLqBdshacOA0QAvFR5lsMqvAcqstH1kr7ESPlpsITXXkc56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT0VB7ug; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e41e17645dso18478266d6.2;
        Tue, 04 Feb 2025 19:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738727433; x=1739332233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltVESsqwLovrNlzlWrFxftnJMM/f40s5RlQq/y9Ie/8=;
        b=jT0VB7ugL1Lha8ckHiUAy0DgqUXyzCqMtY6CD5ut6SW3ksE7ugSegQtKDXG9AdNK3j
         tVh4oSMem4F4AW5xn4lZ1DhhAduSzMpvI9iWltuHO8GIXMykAu99bOQOIb+0PnIPzase
         EOv/k8WAycYGu9tVOgBexQ6N9LjdXhn38Eoedgj3ZSJAOmVHYJsEEQbvwVG/oKvJxKpj
         zHiiu7gLyvFLVZ3Wej8Go6eAkOgjjkitfIGVqfuD0qsde32Q5I9G5SpAuxmPCBA6l4mi
         uc4wLV1WGwqU4+Yqosq/FsJ9st8sEq4i5Vt5lZZEPk9Uk8qso5sHB1yWYnBtac5djhlt
         nv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738727433; x=1739332233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltVESsqwLovrNlzlWrFxftnJMM/f40s5RlQq/y9Ie/8=;
        b=Hm2s0lysNNwp6OQsJ3XPvAUCXVNpTn7MdIXY82gPY+nCLRAsFxw4BfZuq9Hfbx6pRj
         unSKBRA9nWox09PQh5FGcJXYcMyihx0d6WkuyWO8EstX0+33Xhjc1oHOwN9XPyeZLIL8
         C4S7Bt+4rvaO8EszGfdz8tPmAaZPsdAXsdavWuqeTPXHckEwLZrkwHKPgFmgMhkHZLDI
         CMQRNE7qOTyAgJ3aMLWWQIarHW3IehqYPL7nQ0hqTQuOOyQzMtmCkR42Urg8ZT9FDvqK
         Z7Nls17s3e/FuQoq4Y8X+qcGuRNMqNdaokiFd2PaCWTNBHrq45NXjcWe4MHqmKZwkA2g
         YHAA==
X-Forwarded-Encrypted: i=1; AJvYcCVz1IxP+7CCdFlIFEppImWSCRiie1kEr8ID/7OhJJuz9AVejg938mnYVifHiEf91CetpFVrt9dMYaZv4mQ=@vger.kernel.org, AJvYcCX1nfyhKuIkGRZEPIR4hKcmGj9cVAjEd26lTUs1URC/Z6/JYaJXyBkmIosKrGmSuCv/0mCENQErfZF3VxYm1g==@vger.kernel.org, AJvYcCX20r4HFhzB1H8tg4D2+PcTdg11Hk6ciKGXpVRya5uewyfnWi1NFcPeXt4uWG8yeMKFUheQ1iHiyEcZ@vger.kernel.org, AJvYcCXRyv3W65pglzKoADSIy0gvYGVquMCAMA11zQIR+VUJvfy2z2eki9pAMSFRkJGQidjoM4xTVpVee/CY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10ab8Lj5c1/0yuq9mJAKJb6XLieYPo7zqE7Z7YvLtvf95pn7R
	UoPWR3GR+WoKcXGSirhsXUd/L9/TrjdpDIDAvke1FQ1r0UrU/uvk
X-Gm-Gg: ASbGnctxbk01Y9+2sLmnnLHL3NWTcqDhLr70PppQZ1lcRC92abAYmUG9JE2KkiaqpQX
	hGauttaRQYjXObeq0/TVIvn2yeKzb88pp+mQB1c+qsGSyxVZyRuxBdRdTM5a6Db2kOBisJN0POH
	/KVdnlIq8NBbeuFb0LvLrlbw2ry20bgj3YuLOMC4bm7uZSt93dV/nioHy61Yo2DoihK2cQk1lZ5
	BaRAy477q90YjT5BRWZEDdVXvdbINdh+thBOb0mYffR+T2UAnBzptvJcvCzWkOeId6qwvVpgIXN
	gcc=
X-Google-Smtp-Source: AGHT+IHZ6lS+7pdK3/dMBm693BIxHLrGZo920oevzHRgcu5oG9LCNVHQZOPDHNG08EjwXL2Iv/4WLg==
X-Received: by 2002:a05:6214:212c:b0:6d8:88fc:c0fb with SMTP id 6a1803df08f44-6e42fc72a69mr20627676d6.35.1738727433625;
        Tue, 04 Feb 2025 19:50:33 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::2692])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e2547f0e44sm69277506d6.4.2025.02.04.19.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 19:50:32 -0800 (PST)
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
Subject: [PATCH v10 3/3] arm64: dts: qcom: sdm670: add camss and cci
Date: Tue,  4 Feb 2025 22:50:17 -0500
Message-ID: <20250205035013.206890-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205035013.206890-5-mailingradian@gmail.com>
References: <20250205035013.206890-5-mailingradian@gmail.com>
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
index 279e62ec5433..d79aa3461b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Richard Acayan. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
@@ -1188,6 +1189,34 @@ tlmm: pinctrl@3400000 {
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
@@ -1594,6 +1623,174 @@ spmi_bus: spmi@c440000 {
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
2.48.1


