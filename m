Return-Path: <linux-media+bounces-34762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB09AD8F23
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB929171042
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35250293C61;
	Fri, 13 Jun 2025 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpmlYs1G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3C291C07
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823588; cv=none; b=GJ8XSfNbH/RLPEtbGE0W9u/gPf3d7o8I23FyvF+rp0Tioo439XCRip4jqwT9R0u2i2g0CWgpv8AU+qhp14qlcOqmYhIqRbe7/hjuODlGXocjoc39YAF5OgQQd7WnMNRuUHmHoTdbypHAm+Ma+iGQs2fKiz4vf6S2jkYpoH4cJeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823588; c=relaxed/simple;
	bh=KbUlGtpfhdEZom8VAmFrDXTGJwRDxsPYiWV9ksPDsMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAD6+2Vu4p5RLQygJbFAOGxr2lYAKryitaxkmOG/FdQLLUlfnY0DtrjlFXXuUakkMIoQp5XOaA7wTBOeufN/WR0/GmZBYmrgMsNXkjlJqmXvUL+NEFjnkOexYhjBsGEDAyuxp2zcoXfXqSSlh+lZgAc02Og75PFEVTVq+gKoXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hpmlYs1G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a361b8a664so2037520f8f.3
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823585; x=1750428385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUn/T2v9DcG34w0Q+hYirGCU74t68lTP6XWgRwe314k=;
        b=hpmlYs1GiAoWTOQCu6ldv6fqocvJYrBFraiTudtOB2hwSV3+QAp93Z+yA7GJZ5KS0n
         DS+SAXzGhYfiXggSDIG1cfzLawqoidMXt46FJcvIkxYIhXNk3W8S9TeA+1sZ9aOSvCKq
         SiH6547GXK3nhQmt+VPJnMFu3Q/+vtitGfibWhO80KtKSS27iu5FFqb49gzZsw5YEm2j
         YFxB15qepUYgJCR8/SW51jfcTRauUaPuRF2cF6muhvFnu9mmLndj1FN3FS9hpP1QN+g0
         7DoIVyUnxTiQA8G7Px/jY2F3UYELv0ICg4sd1AMUN0H/O5JUpgQyclz+EzIDShTopOAI
         WzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823585; x=1750428385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUn/T2v9DcG34w0Q+hYirGCU74t68lTP6XWgRwe314k=;
        b=SiAYx/V02X8/97+qyZdkByrpyCbVROu+Pjrt7YAYJEokiM2Pc018WfXUHJvH5otDU7
         HXtZKltu/5I/ke7vjmA1UqCpiNQDqF9Bn18XH61buoVHpkFTCceKqMoQtqbJVDazwTPh
         9iOaNGddotYWp8hMimAofmDyGVykgaiYOPIFjm3vp7pCOr0YAIg7k2OqO3bRbJUWlLkv
         riYHzdPMYl8rdnXa7o1fU3UgO/0Ygq6DdgPHUaSeLV3aSMsuNjTPvCDuicgm8ItW7YIJ
         xJJ+DImTqyrEh1MnXl9qCWFTBj11Y4k+P9r91BKnv5aN3nhhRVMVqZ44kI7HcL9nn0Oi
         3/hA==
X-Forwarded-Encrypted: i=1; AJvYcCUSzgxujMM6/GtlHMC+ob9ewyBMJ/QXagpZsdxSa/AceG4GyWZ3Yk60k3CMFsUr65mHYwuWE1SDXN4KYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwytJujJ17Hr4WDTA1ZW2ib4ARjFm1lWdKvLzb0cltRg5oHc71s
	VEwqve6KxpvPDNJaSBMpsr2LkNMHN3SGrl9epT4vRglYBBs4XdlQeka7OA3VSp6h51A=
X-Gm-Gg: ASbGncvZQi0BZpkyTAhYBebQvarVe0eXSLzBp9TLKG1cjaobWIoVYjj7ypUxz0c3IY6
	Yz1w4q6H0sf4zO1+dR/BjCEuvdRqoV0ymG3ueuYhwwqG5jv7bCh7dCSYmTCnccQL+6apIq/ENaa
	xxBkFZdHFYMsrBxZg5gDUUgxo43ZuoyIMWdnhKPbA3QirBDWuTrdFVtH+Eh6NLf5v02zL1Gm0kz
	vxlpMRMt+/SVFV4PK0XOVBGGCEGWFJCRmly8kVn057KuEVrpdKd6yVdiEeB2CShFDh3OIF3l7IC
	wZrVXkr/7fI5AYja/YPdAOLP5ginZC7HXA4inET4/362odJMLVyleLieyRtXtqEI4i+PxLsrlCx
	8CVFpUf8dvNCcbHjdYCD4zImcKLo=
X-Google-Smtp-Source: AGHT+IH1fMP2KnFNWRoIIFgpfDxW7MxNb1uMSxg0eL6l8twtoQZjitcGVI8/ENMR8PDgAtAlfuMQQg==
X-Received: by 2002:a05:6000:2505:b0:3a4:ef00:a7b9 with SMTP id ffacd0b85a97d-3a56868319emr2894882f8f.12.1749823584788;
        Fri, 13 Jun 2025 07:06:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73a7bsm2525723f8f.36.2025.06.13.07.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:06:24 -0700 (PDT)
Message-ID: <81a65ea6-2f46-4d11-9a3f-50664da78eea@linaro.org>
Date: Fri, 13 Jun 2025 15:06:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> Add DT entries for the qcm2290 venus encoder/decoder.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f49ac1c1f8a3..af2c1f66fe07 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
>   			#iommu-cells = <2>;
>   		};
>   
> +		venus: video-codec@5a00000 {
> +			compatible = "qcom,qcm2290-venus";
> +			reg = <0 0x5a00000 0 0xff000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus", "vcodec0", "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus", "throttle",
> +				      "vcodec0_core", "vcodec0_bus";
> +
> +			memory-region = <&pil_video_mem>;
> +			iommus = <&apps_smmu 0x860 0x0>,
> +				 <&apps_smmu 0x880 0x0>,
> +				 <&apps_smmu 0x861 0x04>,
> +				 <&apps_smmu 0x863 0x0>,
> +				 <&apps_smmu 0x804 0xE0>;
> +
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +				opp-133000000 {
> +					opp-hz = /bits/ 64 <133000000>;
> +					required-opps = <&rpmpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +			};
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};

These should be dropped in favour of static config in the driver.

> +		};
> +
>   		mdss: display-subsystem@5e00000 {
>   			compatible = "qcom,qcm2290-mdss";
>   			reg = <0x0 0x05e00000 0x0 0x1000>;

---
bod

