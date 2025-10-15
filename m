Return-Path: <linux-media+bounces-44620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C036BBE0408
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 20:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A294A4EB681
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 18:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739AD30216B;
	Wed, 15 Oct 2025 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHm4hJa6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AF83002D3
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760554168; cv=none; b=fUQ6Z4qCMpQoIS7BSIy/ero3aVO+ojGkK9bzeLx5zKTa3XW7IybdXpNoLo420ky0l4QaiwA67RRP8cCFxsBf6gjhB30kYdkYxlD8FE4JHQWhO3sI+b8c9BYIgCFRnIytoimq6+0/4NG8g+3+bgDVzmLTCnBcVpwGy3eDPdqDbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760554168; c=relaxed/simple;
	bh=iaV/nUZLN+zOxAuYBUs0m1sLWC+VUj+7M/cgAxpGApI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfkAiME6GImg3yo2STm5Uc5Cu198pF5Gff1t6+SclCBBLaP8oR4DtLS7JrxJ83I9IvIgWnAi4zjKGx1oC98QO6B6PUtxMuW74fetULZn9aEPVldUOE7PoWUF+8Pog/XK/1O9Xm+9pFJFa3K+EeiMM4hvgx29LP2ylZuS23XBIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHm4hJa6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-582067563fcso1145990e87.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760554165; x=1761158965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzWJncyHzn0swQi7I4nmNemTnnfZkUzy+RF1ph+lVak=;
        b=rHm4hJa6fKotntzmHvP0RwpAEhEhflUbWlcFfcQAQTPRc4p8aw4qoiW1A2hZciYpvQ
         Yy7Zypkdk5RsmmcTjdaCJoAWR87CDNe95v10p+7SiWLloSIuuXpS7P6FmMB7IsHvey2/
         r8Kze+3a35UFc6EjvJLLrr6ALcbhtneZYOqz87W9Df3UTL70yq3lJ1X4682CJuAvtQCO
         9+s2Ws2zgN2SxaRY7P5WGh2UY5J5mNedi8e0FsL3M6BmD011fTk5EptbdvG5xg0i1atq
         QWfw/pgybFUoAq5jxF5o4523O5ZDTG4Jilh5reEcOak+265+xQj0HxTzZv42PzetVfsM
         rsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554165; x=1761158965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzWJncyHzn0swQi7I4nmNemTnnfZkUzy+RF1ph+lVak=;
        b=tFjfI3tS2ccx4O8MrsBcYIbBEQQe9dDtmzmcj55l6kSRp+WNf526FcW53uqGmqHTW8
         1QSLyrUsIVs/aRmdtdLN63chhIKM3X+t99/KchJsuNdNqnT/ZoUOFz6dv4f/z0uoa8Vq
         0HNuMt+91Oc4tKf8bGPS51kcRCPfsnCLi/dp0imNGpAa3xM3dlNcMvWNJJzsP+O4/cmU
         HVz8rJRId6gAK9EIysbEJQPxWZeCTmjyMgckhs1WpFHL6xP9qP95V0r9JX5VKWKwxyDY
         3dXJwL5iIQ7bkU4UfLHJzn5xZ3UHHsGHQqc9hk7uk57bxQFzfPoNHDJngFDEUYUBoV7u
         0nOw==
X-Forwarded-Encrypted: i=1; AJvYcCUONpIBeeNZ6qlsl+KQgpdAFf9bUawWLA0oRFPWjnh/XPt1GF+jWdSWood6wRSyv+eOcpsBp0QM5pozhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnKSibyvMlcO+G9R1iD0+Pj7qLVwsY2uQ5mvGFVaRUhiWU4lWF
	+H6CTlvXOA3NzvM4BxSrcp5lahIq9cHpcQbykBztFR8Y0z1LaQIOyCEXpruOkhXJtfs=
X-Gm-Gg: ASbGncvtX7PZOyA/XWONbcK6Ho4cTtMMApTyl40QKLcTuK1Tx8cQhAEuCvtDjXMQklO
	C5MQl0SIjWQ4pU9D3s5UmHGt0QAj7Jc057za6EBsDy6IPI6CTTNNO57jRqip8+r4vKVBLXdLLpi
	0pju6FSHWLFBa07Jgf2VRJuZuNE0UPIsb7pt9pw3xHnkr39VcJS/chveHTcI5rb7LdbljIyY46j
	VlJHugiCDJ3tGjY/VxEkLPHSEsRwL6/AewLK5FrAKyFFsXFiR+vpb03+nIxpgyx6PHi5wDCaEUW
	+SGIFJ8pWh3MjYU20N/dcjJuksrh1te+egDKEv2C4QUNzGCoXG9tgtPVAr+ZHv93AbSGoyiIyGU
	eF0qHlJ2ZHRbBgR9OjalGxD0fyWsvl6jQCH+H1Zd+d0xYy+I9Ph7Hwyv0kqxWmdAAxLmAZ7FnAR
	h+F++dugJrxAUzQPXq7Qdw1f/UUUQ5ZxDyz+WvwJox5QtrgRu36hPIPjTeVETz+LcWC2gQmL4sg
	Ke41nrX
X-Google-Smtp-Source: AGHT+IEZp9j24Q6VxXUOyr7mVBGBzy2hOIza1xmN7Uf+Xn9oo37+2SzKCXeek/w8Yj5QVPavcLsMqA==
X-Received: by 2002:a05:6512:1054:b0:57f:5f3e:84bd with SMTP id 2adb3069b0e04-5906db0ccfdmr4378907e87.8.1760554164814;
        Wed, 15 Oct 2025 11:49:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591c2bcc26asm1728266e87.46.2025.10.15.11.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:49:23 -0700 (PDT)
Message-ID: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Date: Wed, 15 Oct 2025 21:49:21 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 16:01, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>   1 file changed, 171 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 8d78ccac411e..acd475555115 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@ac78000 {
> +			compatible = "qcom,qcs8300-camss";
> +
> +			reg = <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac7a000 0x0 0xf00>,
> +			      <0x0 0xac7c000 0x0 0xf00>,
> +			      <0x0 0xac84000 0x0 0xf00>,
> +			      <0x0 0xac88000 0x0 0xf00>,
> +			      <0x0 0xac8c000 0x0 0xf00>,
> +			      <0x0 0xac90000 0x0 0xf00>,
> +			      <0x0 0xac94000 0x0 0xf00>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x400>,
> +			      <0x0 0xacad000 0x0 0x400>,
> +			      <0x0 0xacae000 0x0 0x400>,
> +			      <0x0 0xac4d000 0x0 0xf000>,
> +			      <0x0 0xac60000 0x0 0xf000>,
> +			      <0x0 0xac85000 0x0 0xd00>,
> +			      <0x0 0xac89000 0x0 0xd00>,
> +			      <0x0 0xac8d000 0x0 0xd00>,
> +			      <0x0 0xac91000 0x0 0xd00>,
> +			      <0x0 0xac95000 0x0 0xd00>;
> +			reg-names = "csid_wrapper",
> +				    "csid0",

The list of 'reg-names' is not alphanumerically sorted, this is a newly
introduced sorting order pattern of CAMSS 'reg' property values.

> +				    "csid1",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_lite2",
> +				    "csid_lite3",
> +				    "csid_lite4",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "tpg0",
> +				    "tpg1",
> +				    "tpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "vfe_lite2",
> +				    "vfe_lite3",
> +				    "vfe_lite4";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_ICP_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb_clk",
> +				      "cpas_vfe_lite",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "csid",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy_rx",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "icp_ahb",

Please remove the ICP clock, it has no users in the driver, and if needed,
it will be added later on.

> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csid_lite2",
> +					  "csid_lite3",
> +					  "csid_lite4",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "tpg0",
> +					  "tpg1",
> +					  "tpg2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1",
> +					  "vfe_lite2",
> +					  "vfe_lite3",
> +					  "vfe_lite4";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_0";
> +
> +			iommus = <&apps_smmu 0x2400 0x20>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "top";

'power-domain-names' property is redundant, since there is just one power domain.

> +
> +			status = "disabled";

There should be no empty lines between proprties.

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

There shall be an empty line before a subnode declaration.

> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,qcs8300-camcc";
>   			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
Best wishes,
Vladimir

