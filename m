Return-Path: <linux-media+bounces-28074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51FFA5D3A5
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 01:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F063B2471
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 00:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8739443;
	Wed, 12 Mar 2025 00:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lI7EftAb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F53FD4
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 00:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741738313; cv=none; b=iyuStnJAj45eBuu5FHYRIhQXu6wrwId/7IwdpOQ439KlnPBEMvv0vz88wjjmkf5yVqn+NcreEqY9iEsK9MLG4HB86xOXNyVEN6G+7w31vTF6kr/LUCn469j41+MNUTmZKa5tbiKenzrDR4eEW6m2iQLecn7X1dnpEVR4p99VVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741738313; c=relaxed/simple;
	bh=xPgE35IV8KNTHHoHioD+yoC6BP3oPuoI0of2EXXk+bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwaNNaX5qDPyuVDIYBxnmkcrz0DYGxzuJjgU/uXNFVBrS5zah9DMTEPS5vsvhN0LwLi/fjnT+LSx+kD0Q9SEPTAhEjdxHXPS0sb1aVV9oXkodT76inuExlZRDKTx9SCUPh7jH1PkZ2Ks2N1DANNeV2ezJJgychM+LaMzyTGzku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lI7EftAb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf1fa94d6so6588571fa.1
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 17:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741738308; x=1742343108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsK4UP5jBx8R+zjGmQjNibc9+ye98rN+iBLLFU5DXOY=;
        b=lI7EftAbbgcvHATA0QiUY/HVXowlpP1lCGEFur/kQu1GgAy7Zg2jiEw/qywt1clkRO
         oid9+v3xtkFfDPJyFpJX/Gan6A2qDtzM+XVZrPUx04t1xwkW52lU1rHxNsRvrsbdK/qh
         3oLYPl9n5cUI0xYJ4dJs6vY127+DXKNMd0sDB3Ss0xYABk6pIjv62sLUcXDQeP26J8/M
         Ui6K/RlE3FZLdx4WpJLMyOB3E5RrYysDbbBl/vXoBXPmcQ5E9KGv0ZZzF8ldpD2ScGw/
         U0MUW55Uf3zwruGzcTiDviSLWjjlprpwjNScKe88/eOJjgVtFBtz3/7kMwoqAxww0Ykd
         YOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738308; x=1742343108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsK4UP5jBx8R+zjGmQjNibc9+ye98rN+iBLLFU5DXOY=;
        b=N3021Ai7Az+5kNU81GtoDhTTUjQa5wE/cMHQxSxtWK1V+fqxIZPK9zBY9xSbx2TsLF
         mKE5CKhjEOFyvqqA/6wthVHQhgYYtvv0SsvnxafOt0WDDTyFzOljUKyYBvHivxAvb9cF
         eOrzJALUMXowM9agGcKTWgGK7zM1ayDBw6qQNH+ZvjyBmCYX1CXX0OV5VSN1kjx36rjb
         suagAMLz6ZOQ/GTJR3vVFbrAkxG1jYxOtZjCqNQcKjb4ySGXZbhtmqBEDBYqhwYgbU63
         pVFagm+irCzsR0mso0FYJZ8Q62frUEqBFdLCdin6wpPXJQSYJ97liKfEn1TyCWR7QAzW
         jfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZNBtwpz4d5TiDukBNe5YiLuGsg0jnQZ0rTCNVWwpZWiXgZYKURlTqwBPlggj93K6Ay+yvmgzzsR05Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxCOYJH9aCYZ8kG8cq7bYuh4sgwfjXBUBwNMQV9uxs/DddxCu8
	kjswJE9mvCfvsMKBpSpjQwz2eIc5xpKhUqNXWNyqdb3iLXY3ngLkSOl9wAiKkrY=
X-Gm-Gg: ASbGnctv2NsuA/6YDAy5he+c9yfu3jc6OOLmCbhR58lsqQKtU4cw8a+D98BUxuPnUJD
	5agYjUDkh0SNoMmWeG+oyEoilHbJMzR76ox/xOC3SRxzHB9EXSNZmTwaz+p4Se/2Fcyju0lSG1B
	HRdBHdW0EDflWhHRFUQMEa8SuOccUGSouGHR6xY8adzCovAIbbzojvl2t9xv7b1iW/dt0bg49hQ
	igNgqB2SGZ4qch7UmhLlRdUVdf2yXGAj3i7HS5zq2PEXUE2WXIOXGDEe3+cXhfAsvFFQE6cM8qN
	T9AFhuvXkx/Mf6irX9cewqYcu3tPS8XFNCCylAEqRAY+YjvSaaGGjEpUhuZtgEKs+iPe/9J2Ord
	wVZw6wcLJPTP1G4IrpCf/WFNdUj/j0ZtU/Q==
X-Google-Smtp-Source: AGHT+IEH9KvpyDPZCrvWJAcNp+X7CY5UDrC573xmFDlylPHoWOCaFdaDLIrdUvJynCWp3wPLm4LH1w==
X-Received: by 2002:a05:651c:1a0b:b0:30a:5416:bc7b with SMTP id 38308e7fff4ca-30bff3f9588mr16820891fa.3.1741738308179;
        Tue, 11 Mar 2025 17:11:48 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfe741fadsm15984251fa.10.2025.03.11.17.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 17:11:46 -0700 (PDT)
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
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8650: Add CAMSS block definition
Date: Wed, 12 Mar 2025 02:11:31 +0200
Message-ID: <20250312001132.1832655-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 184 +++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 719ad437756a..bf5e238a93c3 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4903,6 +4903,190 @@ cci2_i2c1: i2c-bus@1 {
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
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
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
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_0_mnoc";
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
2.45.2


