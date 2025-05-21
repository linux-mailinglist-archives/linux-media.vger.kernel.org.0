Return-Path: <linux-media+bounces-33021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E9ABF58C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014FA3AA549
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C7C270ED6;
	Wed, 21 May 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8uP9/0P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0826A0EA
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832847; cv=none; b=Js0K6b0EMV9FQRD7o6OX+01QVwMMkwZTMdQWA5ICQyZB/IdYEd4UJFl1zCuAeLZOfRBujZjJyfLro73KgJkmVAdDwQL07DkY0JCdGsmHuuBr6jhVHdNHUWOHrO01fKmM1AixXXaC1k3c2WZ4ST9fMLizkXPywteOE894dI22atk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832847; c=relaxed/simple;
	bh=/p8hi4Fb9JbhcU9eXGccjakCQbbweGLDyTOE826eGz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRR2Z7OcqnrjPuZLU01IjA+JBuoap8PnLfZDeMVKrk5DtyRH48HHuhoRYlOtCMn0mwmqW6bxGqQhESsq1WtMYnWVtjNtBbU/LuIH7BSBAPorZO/Wa+ppWEvgtucCM18GBRcFIY5gCG7Hwmhn57VEHNWQSq1SI+Bd35/RL2ylvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8uP9/0P; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a363ccac20so4273245f8f.2
        for <linux-media@vger.kernel.org>; Wed, 21 May 2025 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832843; x=1748437643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RpkuJlQUblTuXdXBYUHLsMDpcSWTTsmgm+ZR7X9N/YY=;
        b=n8uP9/0PXmH07oBxwjujbqu3lrb93tHq14FgXaRA5qH7C+Lm2XflNrUkq+MLLm2Mbi
         PrxJUPc7zbxgA89n8m6XgjDl+eXiHojeItuP9tcZGu3YhKT+wncTtOuXt0VkRRMIHfM7
         NHsYLbGhblbwZNicF5hLTcD6JAMlyncCpQ+u+GUd2VfYlaXvvBTp0yVZibkfHFFc1Xy4
         fKOvGLkrBydex7LbvAiJBe2f8gQzq9dOF/kTWjYCATzcLASHaDulxhDcLG1mLDehZoM7
         iyPuP3qwP/KNQvmg3GGHAn12If5lDYweZGvkkLAtyaWO1iBTWT2VO+kOcFBGxy4hwsLJ
         wQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832843; x=1748437643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpkuJlQUblTuXdXBYUHLsMDpcSWTTsmgm+ZR7X9N/YY=;
        b=M+n09lPtUexwxc2ZP8Jweqx4RReTgO5epzW5vpONZ3tEU7dYK5kH96ok4cCsm49n5O
         BoEgUaaUlBE31/ETWKDTBU+QIsb69rr9Q4RQZ4rCPMYF1F5FOYju2w2n99Z5NxbKXK8M
         DqnxaT+4XIkrhrmHFiLuBIpnXt14kPKqcEPfPD9pd4UQCT9hrhhyH5tU9HID4otjSYhC
         MxjPaKi7H2MnIklDJqY0U6NyP5OSX6snkEIHlF3HD5gYCz8SR7nNFoqE/VH0R8VriLTo
         2QeSJB2tg+8zTb2AjcaQ5fzzOGlCE6vouCd9oLq3HegNgmCapeW04e9SMAww7jQ8URyO
         KKGg==
X-Forwarded-Encrypted: i=1; AJvYcCXILE9nVvC+/9Wkcfg/oHqhpdcCS+tYGN59pGa6sKNpaN1Q64cdjWGP3DWRVGiCzzm3wxlvZaSUDVPiug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymp/cMmP9OXxV38K/iA+K4ZAS4y6UksaIDUCe46Ve05in1g8wm
	0DkyiiTV4cNl1ROFpyPoqQJsl70Jkj1rg9j85U3U7gu0Nz9gMa2LBnGdkNOAHsfHIjc=
X-Gm-Gg: ASbGnctAT+fH3Yy8SSZupexJpW+Fr+HMl+OXFOVMqrQFm9WFhZNeErOfVdF8Y3KFv2w
	7fitbemtnAWGnNh6ndedny4uakn5C2AawNkMkmLp0ICJHLtah9MxA+ki6LFm5JiLIYhIJ9mxmIJ
	vls9mBAqdaBGKzB/H6WE33mfkmHOdgJLoEzD8gtvtmgbJdEg4/sqiUW6UkMLZ2kbLGwEe4zwzcG
	0wFO7jpCxncGRUB3Fq2bwKNGKH0+Zd4Zd0py1RnGcHGjxfjFm1XOXZ04LEYu5P9YVMSe1xKNMUf
	L5nhbYt0tKKWXA8AvcOn3/XvwepZH9jlRaxey/rZH4iXyfSBUMTCV3AJ5tmh1ERN1spG/K9UPdi
	3ib+IsO7To/0PtmWc
X-Google-Smtp-Source: AGHT+IE+t/PYCXMw3FrDdML6YsWV5MqKEMrz7cLzul08Pv1j9GQdjSaGfDFVw2hwDw8YQywVgAFYbw==
X-Received: by 2002:a5d:5f56:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a365959288mr13967995f8f.36.1747832843294;
        Wed, 21 May 2025 06:07:23 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1basm20036403f8f.15.2025.05.21.06.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:07:22 -0700 (PDT)
Message-ID: <b2cf41af-756d-4e78-8df0-0350198d357d@linaro.org>
Date: Wed, 21 May 2025 14:07:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, todor.too@gmail.com, rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:56, Wenmeng Liu wrote:
> This change enables camera driver for QCS615 ADP AIR board.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "ok";
> +};
> +
>   &gcc {
>   	clocks = <&rpmhcc RPMH_CXO_CLK>,
>   		 <&rpmhcc RPMH_CXO_CLK_A>,
> 

I think there's some confusion.

I'm willing to accept CSID and VFE changes with the minimum proof of TPG 
driving it.

But - CSIPHY in CAMSS which is only proven by TPG is obviously not a 
proof and again I agree with the consensus here - there's little value 
to an end-user in just having the TPG for a camera.

No sensor:
CAMSS::CSID
CAMSS::VFE

Just about acceptable

No sensor:
CAMSS::CSIPHY
DTS::CAMSS enable

Is too much of an ask.

Just publish your sensor code ! We need more sensor enablement upstream 
anyway.

---
bod

