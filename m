Return-Path: <linux-media+bounces-39841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1521B255A9
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708DE5617F4
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E59A3009DC;
	Wed, 13 Aug 2025 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOLbygg8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAB63009C5
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121059; cv=none; b=IZZyHMWSyVr63TJ569ZD4MLz5g9wC4BYdldznlkmiOXkjdiqrtr7VcOVJw5EwWOI0UBiP4mSXXXEskWu6gHl6i+YhVKEfFGecCxFfPQdOgHOL0/rjmy/NRkp2hWNCAP/KB8yacK6kd7ovATmFdWTjyeKd+hC0qJsFvjbS4zMbZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121059; c=relaxed/simple;
	bh=OIHFNFGpI3Nnr1laP8Tk/ZYcGpLTmB4+VLlc5+ifYaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dt87BD06h4+PAlfeiWex+7OzdyKMAT2kPJ6W0eRBGbUEcsI20Y+sJYWcf+633MW6Pm9h/LRGN/B3b2M2gaVStPZPM86Ro9UjQsuA01wQiSyYxHjcxTU/8+ImkuAs+76QLWT4I9ETPlOp1t7zk1XR02fwjQkdEsx2q+0gpTYd8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOLbygg8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so264689f8f.1
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755121056; x=1755725856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/R0PLr1UJ15LH0yUiipvHzrelupSAOLxlwfOAUkKpZE=;
        b=NOLbygg8wCZ7xDS8sY6/8XVxhJIdZ/UyZHh5Rk+mxXuE2sGvyvcgxK4gSBj+gUJrNg
         Mfy6CDfSnfDisC7Ay48wHY55NwBLsyN+LuEfZNJqyZtlNwBzyQhgN88KY6nzAHmjq/8Q
         4TMmf3pmFu7Y7AzqpLhTS+PtvENEPjWnb2UN1Q9p7H3kLxQQmFW7dq3wwu+f9ShjwKxf
         9l8xeFWW6SLzvOnHZgOhSzt7jAsCkEU60DfVtMpzNzzEBkD229b6LBUAwGTeIBkH2naJ
         ah/Ejnf+gyZlBqTuK5fsJ9WX6rU/N094XaevnXaucRsuWP5NJsQMLLsmJxOrqKrCeMgW
         vM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121056; x=1755725856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R0PLr1UJ15LH0yUiipvHzrelupSAOLxlwfOAUkKpZE=;
        b=Qmbicsilvrs1o86ljuiqnUODJBiSofdk2HgomkZ4hwxy1qVTT/usP6YK4fd+FKPUZa
         Xno7D76gXXkKEFGu55yNRM+WjP2iiDvNO2/ST4CmyrbxahMUI4TsvXmrGGfkp+ezt+P0
         2QkwOxFFy0OcdWh+XgMeVt3HpXFxSYnQMMBd+iLqLf1tg8jr8XeX61TT0f9/89f+T4vQ
         kDxFSVC/O7qCHh/6NtJF7jOmgCVWMm+QhqYnwA96WvSxdS0H4MAvHIBBioY5IUsLSnjO
         mPQPxqxsyssyiJjWlthsRlYviGbSoMNf7ehuqB1DKBTADlonfR+XtV3qPCMs9IPj+kHW
         Se9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4F58WC9CMNHMrB97G9eb+ODQftY64n8GIYcMsdkO6LKcTCkmg8UpK4T8l4XwCbFgl1IbAtu2JuxBFyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySTVygWwWfzu+WECFvQJ5ilXq0hlOeBltqMm4CjmOgnZEKHO0r
	K+DGIYrjXy+P6lNI7in6pn2oZhO6PVIuK9sOqb8usL+OdwsbJZ18fqplsd3xzCdAGb8=
X-Gm-Gg: ASbGncse1GZJ5kb480Dt6sQ3kmUdqmC5868P272wT+mlLRQPBDctdLVwCYYkUmvHN3T
	F6blMYtlDsGb7l/X16P98ncph90QhFQjMGUgxCZa67nsm8rFmOnXhms+br4Ts+1u20G/hy4TK2z
	8B35Z0tePvL6mz69LWWMz+QqCJFB+6jm/1cuRLizjMhIaewNJa8RzR+lr1VrvojIq0BOTzyvq8s
	xCxfOg9HKCYs+k+IZvfluaPVqByyMqBjtFlrdf9Dsho2fqs95SgJnXyQ+kMWv0dFNnOwwi5jb3L
	m/HLQXGc4xB5f5Zt8Ucxuftu9wUScVGwhG923iGpdRdEOdho3vlHya2rg4wIzBjMNO6I25OqSW2
	chLnicrJbkiqt5GNojhCLpfe92yVcqtZw/lhnVk3OzS94dW6rIDU4O0O0Y1HZ3Txx
X-Google-Smtp-Source: AGHT+IHDgkAiDoUCfIGsD1JHcyl15RLIs40KyXWWTRPJ8npwc6pR4KZc9S2TTnaRFinIsu9wVY/smQ==
X-Received: by 2002:a05:6000:400b:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3ba506624edmr206323f8f.4.1755121056198;
        Wed, 13 Aug 2025 14:37:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a540945sm15247815e9.26.2025.08.13.14.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:37:35 -0700 (PDT)
Message-ID: <03947c1c-1d60-472b-883f-c9875df20245@linaro.org>
Date: Wed, 13 Aug 2025 22:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: qcs8300: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-8-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 06:37, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>   1 file changed, 171 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 3cf1d4bc7e4a..538b55a89f28 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4641,6 +4641,177 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@ac78000 {
> +			compatible = "qcom,qcs8300-camss";
> +
> +			reg = <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac7a000 0x0 0x0f00>,
> +			      <0x0 0xac7c000 0x0 0x0f00>,
> +			      <0x0 0xac84000 0x0 0x0f00>,
> +			      <0x0 0xac88000 0x0 0x0f00>,
> +			      <0x0 0xac8c000 0x0 0x0f00>,
> +			      <0x0 0xac90000 0x0 0x0f00>,
> +			      <0x0 0xac94000 0x0 0x0f00>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x0400>,
> +			      <0x0 0xacad000 0x0 0x0400>,
> +			      <0x0 0xacae000 0x0 0x0400>,
> +			      <0x0 0xac4d000 0x0 0xf000>,
> +			      <0x0 0xac60000 0x0 0xf000>,
> +			      <0x0 0xac85000 0x0 0x0d00>,
> +			      <0x0 0xac89000 0x0 0x0d00>,
> +			      <0x0 0xac8d000 0x0 0x0d00>,
> +			      <0x0 0xac91000 0x0 0x0d00>,
> +			      <0x0 0xac95000 0x0 0x0d00>;
> +			reg-names = "csid_wrapper",
> +				    "csid0",
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
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
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


"Eat recycled food, it's good for the environment and okay for you"

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

