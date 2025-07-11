Return-Path: <linux-media+bounces-37496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3DB01CAC
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0D71CA6FDC
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032082E62C2;
	Fri, 11 Jul 2025 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BzNKnsQh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5292DC33F
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238695; cv=none; b=I5FeeMvpo9Ji2YCEjfG4ehfYgTx81QMT9duU5JASuta4NNnCmmBGIZARlQPYJGxhbZvHjan0AnqCrliiiZ44DWeYOviOrI5QdeyTzNq6qth9Jb6rTtelW8EbjrftnbQ+xY7fW4ItbbVSHA62e9K+gxOaQNZk1ZJQGwc/P+PknPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238695; c=relaxed/simple;
	bh=afR/VpOG1z/05Kmbd1Lwd5KUUa2slFlpn5oWxYzHcV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwRwY6J16/pN0IY8XtoWkH0X4AueQThA9ZGOeZ3PTY6CmhSrJK2U0Kne7lRufgEb/AwwTN45vD4G2b4YloYACoj7tkar/gXt8zxmZ7gQ03TWT/p9VVlsUGaSznqy972WpLqHEIsSICBGrEvfaaK9ChNmdo6Q4f8fIGgZunK68Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BzNKnsQh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1246671f8f.0
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238691; x=1752843491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgqmdh8Hqa4doV4MBCFCiNXZ92zEgFq+2zXdl7tC+X0=;
        b=BzNKnsQhRJcCPYacQuoEF2MG0v8RxTEnwL8cJP01C9YR3fJTXo+9ou1fjq704ucDyQ
         gO2CYbORWquTDjAeSpq17Wi4X477RtlJg1FLh3s+HHG0cEgBVto1i1Pso19HuQl0h3ZT
         Zqr7NPldKj2rnKEuYXQ9bDVt287m9rye+uiacIvwTJHnIORMzpob5a0QPMt2gbkcyS4d
         dyvH2aKH1hkDzdD1aDdRDHpN7i7qNUx3blGZ3IVWPqXbZ2da0FAdIcMfC/NvYD10uLGD
         gFQiznMbo91NiKfHOlVNeUujpppNqVWesZj9EY5n6NFXOwHHmEMsf+k9Hqy0f42BYMfE
         RL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238691; x=1752843491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgqmdh8Hqa4doV4MBCFCiNXZ92zEgFq+2zXdl7tC+X0=;
        b=qKwnPJ9HLI3vIOnKEJtyMmRdVzC3mnOrXWKi3C9WQq/qoACnIPfRIZso5GT0Rs8Yg6
         tAAjdt2/M/TwtAR9Ee7pzFgOH5sda1gr9qR0Df3j8aSBY+Yd9sFySHN6YWcrBd7wesFo
         7ZuzBsN9AxuynRmT5NJttKUeK9RzBuNasnlhoB3pVfJhokO4cIA2fC6GVLjhw85DvPvL
         N0rBTOHoqBdN1eBakukXAjjKHoGgw/npnHLUJu2Xhn9Jjk28TVtkPJmawKZx5CrCd8h2
         F6qRX8sFksS57U+UBrvI9FKucWujdytK+PEON/mjZ6zCEGzusQ3ClYkF/jUNXqUiqMEt
         cImw==
X-Forwarded-Encrypted: i=1; AJvYcCVyV5EcCzaNgf5+f+5egkRIkg2D3GEJT7S35EdE2BfsUM3KljQFt4GIYLixxucC+QCApsgOMm3o3/54ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyotgIi4UFRzCfm128CYKkSxj3L362CPOSwFfwINJZkjwaX5BIC
	HScQjX851jCq84WSzB4GEnKpE4Xp3ob/+8GPxV6kGn8rvigmc4M350RPtXSjVQA84uI=
X-Gm-Gg: ASbGnctts0rc+LnnW6uecgH7o131cFvlK1pQ/SWQSy4g3tSW5wi4z6aCZacttjDoHaP
	798++SGsoQexxXx1cHpt7TrJIQf61i9Nac7fBX4iC896FxacLPthYIhnYBrBY7bE2pu2kgx0fr3
	Ny1mBOJthuF/YOMEaYJbUQU/YLUH19msQEEDmKe/OXwwUe2Olv8SIudLiE3T7bwspRCZQWRI1JD
	3O/D1nfUoXKGDdaveumX2lvt2MZPVMeYWECfzaWlr766FzqGHb6oRz0/LUfeLiTomp4eBEBdZS8
	JbuM+aU83GCWtQ12aqbIRgR/FDU+NKwbIvDTey+4rvFZT2/vl5zn0+vNbWB/CN/I594dcHhyCLJ
	rKpF5IBUIBTBYRZ+UWXWN2tFmHcQ3sbacLB34KJtA1mdyaJuTuslsa/G/98taoMIx
X-Google-Smtp-Source: AGHT+IFH5xU7eCi3Qw029iOutAbx3qiinPlumEFqhOvJWzstyzzOkWTh2NvwX9QI/3octWtZKgbqnQ==
X-Received: by 2002:a05:6000:240a:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b5f2e26c14mr2587744f8f.45.1752238690658;
        Fri, 11 Jul 2025 05:58:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:01 +0100
Subject: [PATCH v7 09/15] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-9-0bc5da82f526@linaro.org>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5338;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=afR/VpOG1z/05Kmbd1Lwd5KUUa2slFlpn5oWxYzHcV0=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpU9v2K5drXP7fl9A5a2ajvc5gVh8SRZi/ds
 jwR2NABVlyJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVAAKCRAicTuzoY3I
 Ok9oEACp8jJ8AxFh6FZDZRCtFCaLOqa+JwWC1Sf0ztEFidYpRrWqFvYXCy8Kv/fKyqP1P8g9+dT
 6a/Bab0G0m77gHb9YmtNgGhOcZFcdHML+xmFP3oJH0bpHqt2obF4vigLCBfSRHh/HdxzRANMoS2
 GqFik4NCIOOAhRPL5lGIeMMVTABxrFp8ALwdELSQFZshzK1wKMrHW0qVPvmNq+7Ie/FjxoWHjRm
 Me9iSL/V1ACpR+P0X088K6jFk/BmZFHbbCuxhXzk17T/qRoA/FWskUqpbMDsew43hdmXmQPnGxp
 K51lYYpi1wC9swliJxgwmL4+hLeSdnIqlnDxMUzc83P709Cb68sfSSfg2Ke9a8IM3Piy4JCl1fy
 9MTsJNMI4aLOb94g9fJn0Hg8E7bqX2krU1c9lcmnyTgxks7XOKu6P9BUI8BYCzPwxHEhCl4aDwG
 BR3wZAOJaklq9KcT4ILktIDXcvLJicDRZhORh9JVOff2ngeRxaZi8aiVdjH4JvqIUffwl5f6srn
 HbvNse6+XKcEJaHBH5Xb1xbR0LB4gxNpRc+PYPicrmAL+yPrDt+1NqBS7Lj9wIC4vtZvQhkVoKG
 I2iSQkImlric+9zN9VfSJQUsioTqcUBXAPOSu59H4csWmxF1Mci1SzURrbqFVQb54CgjrCXUSKr
 ITOosbQieDyp1NA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
3 x TPG
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 158 +++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index e385d6f329616360e089ba352be450c9eca6aab6..838bb1b50973332dea6d0bd95fdb979dc319e98f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5244,6 +5244,164 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb6000 0 0x1000>,
+			      <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0x4000>,
+			      <0 0x0ac71000 0 0x4000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x1800 0x60>,
+				 <&apps_smmu 0x1860 0x60>,
+				 <&apps_smmu 0x18e0 0x00>,
+				 <&apps_smmu 0x1900 0x00>,
+				 <&apps_smmu 0x1980 0x20>,
+				 <&apps_smmu 0x19a0 0x20>;
+
+			phys = <&csiphy0>, <&csiphy1>,
+			       <&csiphy2>, <&csiphy4>;
+			phy-names = "csiphy0", "csiphy1",
+				    "csiphy2", "csiphy4";
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
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
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		csiphy0: csiphy@ace4000 {
 			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
 			reg = <0 0x0ace4000 0 0x2000>;

-- 
2.49.0


