Return-Path: <linux-media+bounces-21594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F257D9D2876
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 15:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7A05B28D7C
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 14:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799031CF2B6;
	Tue, 19 Nov 2024 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZaAM3Nq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370DC1CC172
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 14:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027461; cv=none; b=CyePOxO3PTOEYga59RQhSjKn4cW4oaN/2fZ+G1WO49Hs5MH5sfyHNj9wRlJWEyca3l+PTb7PX+516cVXWpHX+kdfqW4Opmx14RR30wNMTpXHX1rmnvVVQjwEiOEINS63WTSEesR3Q9h+hVZxJPu/BZvIyG2GWQuW8o0Zda25DhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027461; c=relaxed/simple;
	bh=Z4LGSf629Wag4Es5bBLjMPV4iOjbQzkT1BnLPQ/FZUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAFJA7CKB9kZ8uGC569BOAd+qhumK/LdXB8uqnQhksGf+RRyXgmZ/Sq6VLOueHBsVPIuPOuODFfTUKxyVgLoxsr6URlHKRmSqNrhi3QrXB1lcSnLe/wRUSt/YOpeQzVFLUAi9+k6nofwYvCP4ODRBp30INAb8vPHpns33Og2eZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZaAM3Nq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e151d73fso645149e87.1
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732027458; x=1732632258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gdKTcxf8+PBBnCZ+z/VAG2rAofPVpU5jnjnHijQXe1o=;
        b=SZaAM3NqIL5LjmSB+CYviVPLTLrzCzwmlmdZra3KRYPnPq7163CGdHYzFSzJ8t8yOx
         Zlp2HmKkEjFqyllxvX0hOmJMCcihvynUicvFoq8qnJO+xzl4c0nqaspPvEkFOcFwApq3
         ndC/RDUmNsNa2rIigiG/SLT2sBjM4mDugD05Jy0K9+yPTn3z0qfyHm8m88PUg9QK9YD+
         BTMaHplDcp80PVDdnsZteK0Ps0NjMpcyW9CNb3dAqJysiB0xshPxqhAzKO7msyPwVNOi
         pMuS0J8PR4gxS867w8CpKt7JBprArfuHBbkozaZTQVo9JsjXeosW8rnHmrhK6Xu/E+e+
         bOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027458; x=1732632258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdKTcxf8+PBBnCZ+z/VAG2rAofPVpU5jnjnHijQXe1o=;
        b=MvVvvP9SLsukA2oljoK7ppUqk2bkjLtBbEI8kJ0kypWxtJBFoRYXIejV2eU79syAYW
         pBwP09XuQ55NaFdmf67XmIEuK6rhhxnwzgcLdVJ7x7+e/WcWZv6qLuO5+iMgWzCSYEJ9
         yzuruyexIB2JrSso48RCvx2dA6kd4ojNJIcPETP85g+PJ/HWMngpGelX5TOdhe1v8vcg
         T01Y0BydRenQas8BkaW9dbRCD/XGC86m2bBK7mfqeikETUE4VTFoZjJK379NORetddQr
         665movFwAd5jE2L6a460d+Iojg2h2/SGjaUcFixCEH6/gYG7YnAoxW2CoXk0y2Vm/ssP
         6jzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRJfTJ1GSeTB6RfExx0UZLOGvG7VRF+KvGqaCiUapog5FJUdUHMqxCugP4sRduwFnqG5YnlcVcbLwAbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9dSrNrSqFn+R/sXW0+lOLp5lux8mJWocnZ0lO/kUKk+mweIJ
	HiGE9ChqAHHiKjpB0VkxIMgexwWYd1fpuWVQD2cbuHVfOqw4G722rcwGxJ1Ghfg=
X-Google-Smtp-Source: AGHT+IEyxAWEb74MLDdYjB8Nmzr8VfQbZUazteRGzuIpJqXb5yi1TUpviHqV5uveKCDz7zCMTMouEg==
X-Received: by 2002:a05:651c:158f:b0:2fb:51e0:953 with SMTP id 38308e7fff4ca-2ff6075c377mr18085541fa.12.1732027458328;
        Tue, 19 Nov 2024 06:44:18 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff699671c7sm12182001fa.52.2024.11.19.06.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 06:44:18 -0800 (PST)
Message-ID: <b91972e9-5cae-4a8c-b672-5b8d96d442d5@linaro.org>
Date: Tue, 19 Nov 2024 16:44:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 11/19/24 15:10, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 180 +++++++++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c19754fdc7e0fa4f674ce19f813db77fe2615cf3..f23352493cb270c0fdc3c42add032286601db1e9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4730,6 +4730,186 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: camss@ac62000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>,
> +			      <0 0x0ac62000 0 0x2a00>,
> +			      <0 0x0ac71000 0 0x2a00>;
> +
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,

I've forgot to mention that you need to correct the interrupt type
to rising edge, that's been disucssed.

> +				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +

--
Best wishes,
Vladimir

