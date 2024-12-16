Return-Path: <linux-media+bounces-23517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A989F3D99
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B92357A5FDC
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8A31DA631;
	Mon, 16 Dec 2024 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loWqqdWd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98081D9595;
	Mon, 16 Dec 2024 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388252; cv=none; b=DKf4BGdKluCmFxDDVnWZerIFjCag0uL/hkKfKOzhbqAu8ru0agf9mSpFCQNqFQ3eRn2i/jDQtZk6ElCcX3+ep4V2ZPPh0w41Cx4N0jKf9Pa3aRU1JQt87uGyKL+2a/9zu7CQvFb2ORJbGSxx5hCMHeGwQjEIxubwSs++Y95lZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388252; c=relaxed/simple;
	bh=D6HafcycUX/EFtUqIaMfl7jdirUZ3qGVXb+NW3pysr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmHM3dJDgrpFub07ngHg0X/4QVde8EbpdKmmTsMktfG0xyVQ8PIukyxlxI7A5eNQ1kNMqn9lGeBNIzchZGFCaWqDu1SiieaeWgXr84Prw7XX5rrdTy0Z7oSUmtzzEz437VRnMv1sDOuaRv1lQti3f0ezA3V1vAb39V3FFqoDsSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loWqqdWd; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so39842965ab.3;
        Mon, 16 Dec 2024 14:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734388250; x=1734993050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taKwwUF4bAATYZj9kNFDvG2mHEOjX+/eBWr1rC1nBhQ=;
        b=loWqqdWdn61nTgE8Lojmvwzp2QVrK6hEPW8uRaiWPrt+/ca4BbsqTdIcuu/kSzayfF
         6S2AO/l9e0VwkuTcW+8sW1wJBaeXAohLODSFSR2MK8plt4dyqNXM9yawcmfxVPTRvEzf
         NNwfnEbxtK5taYf7UgvNOJhspAWlm5qoQoVtKy+7lRHLp09T06weJVWzgENt2YCUdjJ8
         bP4HE/nzP0TqO6BQ0DlVqR+L/sNmbvccxyPN+i7QZpv9irIu7f6FSeRoUEMDnBRWvuP3
         BwjhZsSNJyBDyJRuh2q1nTuUm+UeuDC4YptDpFaks4bSlTNXqM18lytXmlxltgXVrZVP
         piGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388250; x=1734993050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taKwwUF4bAATYZj9kNFDvG2mHEOjX+/eBWr1rC1nBhQ=;
        b=HZpTWaajfMh04j9/sJCGgUAwOPukqBN0yZ9moPwzoKrhH+il8LTX9DF4OUQOFuQQi0
         96Ar209T5oMDXw+j/mSJ1hHdplxrYvLkpNRWvyVYMi2nol1zi4E3QmDSoQXr2bsRyNJ/
         qlLgIo1Yw2T+MgWKE6LCnNU9URABmp9PLkyRUmNNWmHqS9SLACw19tuOTgMuYPms+FlB
         uDY2hXTJJ9Fo6aHItg9EzE2Vvf3FcnfOYKCAI4wsK4N+NVl2G0Ar2EPnnCmXxLCGKCWv
         dpdbPpPKlrSKkn2V2vgbbkrJr4ffp0dUo4pl4P9guom+kgJDi67iuwXLaNVIzuKEkxIC
         sZmg==
X-Forwarded-Encrypted: i=1; AJvYcCUTHgM1Yznlk6oVprfo3Rr/5JieRQNrBsopYJPUPxisVTyBBxKQRO+lTcadM4+1dkEfOIlsQ6SugLk6@vger.kernel.org, AJvYcCVRSAKtXheTK+xe/jXeM9+NYcsyU1WFnAjbM/IgS0heUg5tXT3+ExZJ2S6fO9av9ig36sk+wdfdpuqO@vger.kernel.org, AJvYcCW5ullapkicX3ig1xVZhVW7xGjU5yF7EqoDLFSt2p61Fb2d8Bpnru2bNRbN89qT/ZUbTqHPsnSIFHEG7J6fSQ==@vger.kernel.org, AJvYcCXjO+ESgiV9faOlaTjyvrf/7IC0ndvgNnqa7nYcm2bLyNaDXJDhEB/pvxxfilCN8Exvim52pv3AbWkgm3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwqOEqv2z/bh68jyLK15CZJEOC5XLFxXr6x/fIQvUl2Ecio8RP
	vD2qrCccLtLO5kwuwGhJtEf/c/0Y3EMJuWXxff9a80h31C2mYGQl
X-Gm-Gg: ASbGncv/0Vk+cefK/5VkTzz+TFynp8n+cqJ3iWqsTKtVJmozpUQWNkBJOYt0vVFK1zb
	UJngYm3ez2vvT9MBF138p7eaSe6Zc5tbFWvGdL7p3T/mQt/buPzKdyIK/OvUeYM1XWJq5oJ3ejd
	YHdOdSa5HYyS09HZsx7ihKBKapE4CmwR+6QF3cEIF9WyY8Xf4jrlfbrQCeQ0QFxTfuuuG8ZHyLM
	6o4KIHKD6rd7iCddh9SSwCA3t8FSPSEtuVQsU6de7A/
X-Google-Smtp-Source: AGHT+IGE2PuithjN1n9QJC4e/W2MNQa3/EM2bNkUGgfItRp8e//YlVpzo5wnDQBYAmrJFVPpszEgrQ==
X-Received: by 2002:a05:6e02:3308:b0:3a7:70a4:6877 with SMTP id e9e14a558f8ab-3bad2ea6ee0mr16670445ab.7.1734388250088;
        Mon, 16 Dec 2024 14:30:50 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::d916])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b2475afae7sm17987335ab.13.2024.12.16.14.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:30:49 -0800 (PST)
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
Subject: [PATCH v8 5/5] arm64: dts: qcom: sdm670: add camss and cci
Date: Mon, 16 Dec 2024 17:30:26 -0500
Message-ID: <20241216223019.70155-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216223019.70155-8-mailingradian@gmail.com>
References: <20241216223019.70155-8-mailingradian@gmail.com>
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
index 328096b91126..d4e1251ada04 100644
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


