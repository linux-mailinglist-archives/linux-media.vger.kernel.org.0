Return-Path: <linux-media+bounces-28106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B44FA5E664
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 22:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41BE91751B6
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 21:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0601EF091;
	Wed, 12 Mar 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZSdpyhc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C441EF096
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741814314; cv=none; b=IaFoqZ5LtbCloSZsqzd2rxfKUEB80qumLTOrKo06Ou7CHhiESDeNK9qMKRKjDLzHnKpiQ8pnTtYgxZfjVB27w5EDdMNwqhMQII3sjqb0Ij4iBq9sMuwZ7X7lDIPg+28d/gsfNbkx3VCL7PbT/HMbljRX86dxv/oKpgDmzl+6l9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741814314; c=relaxed/simple;
	bh=ZRK1QnXjKXmwtDsvZ8yDGFinnbLW9DNcB1m9v5f4NfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZyEkEqHD0e4btXev11G8witBZEVBGPAUnVX9rEs4zJiHnkruZn4eEwJOkz12BIb7wXBthXdPk8bwJ20jU8fJNULoi3QUIexzg1nzuP8ioc8MlowMb1MdUPxQ/uOaTJjDBX/T0u65JIZvUFcdsIvoIUYAk8RZmffPJDX8aYAN9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZSdpyhc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so46735066b.0
        for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741814311; x=1742419111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAAaCcWnu1E/LRXYBdsReUtTWQq4VO+o7nDriwfTZMA=;
        b=PZSdpyhcx9baOD6p13Y8JPBzfj7ODwsrjfhtnNPCz2kEveMmpXe2m/0I8gENluL+hM
         TEz3P+uVjY8NLIM+P75nO9HkVyf7qX2ikx4yFVF5Z9GddSurC7rqLxboCwJuSOHEMelf
         nX0W/TuTR8iNDPAu0LibXAvq+1mHjtK+dL27kK6n7XT4LRghU2PYQqs7plZ0DSeljZ40
         jq6CwIFJJ9aheKfvtl/KS7JUifI5A1O7QVbMN9WotBGKy2fG+uDKpYs/J1eJYk46Ibm9
         hAwmnKK9RUG9WU8ZcmAoOxXTbLMCZl0jaV1V728MFtgyAMWmEsKPLAGWNbhtCz/JiApQ
         Y4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741814311; x=1742419111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAAaCcWnu1E/LRXYBdsReUtTWQq4VO+o7nDriwfTZMA=;
        b=XsfXBYFU8OlM9hB70YjHpY/zl+Stamq6l9lsJouOcUb0WYdVEAKbvgYJ10t1rr6EN1
         PsQps5ofs8btn17ipTQcZM2HTcSVfjqa6/wa220lzYsGKLcfBliZQZnytzyjesljnXa8
         WWDL2vvQGSmaca6A88HnYiVH96M4NmjXqaYgLeHZNcyX9bcvv05VILWUAOghSQ0GV2Mk
         wdAfpoP9gl4zlgLQA8GBQNKGDziugoLFwg0YulJWVs+mG0jHOQRnuA/YE80rYKd6lSHl
         Z/TGk3a8PBBtH4x9szh/8oLIZ4t8AdjCkbjbNED0fr+sBl58Uj211PR5onQB0xP1hfZE
         Z65g==
X-Forwarded-Encrypted: i=1; AJvYcCX/r6NUhCPnMCOqv5aEPwzlAqyqQVMMkscUlwG38ZYjlmS0nJSbNr0u0uEBsUPbszcuqvplbIRwOQMLBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAU2glqy7Gq2ncVS+rATuPsnmov7+NUKJqBxALd/PcS0zJViw
	KjfPo9OhIp/1eyqBxhMWwcADAyrbq2P6UwMfwFhB+x7w/XdcwqfsxejoLAE+1Wc=
X-Gm-Gg: ASbGnct3NvV4ZpFibKtgbIWPAKWM60VO94R35pnjfZmd0yMy48Mlg3PB4HsoDcEPZR8
	zrIcl9czVNvXN3xdG4Kh9fecGq9svjtHr3r6Xvao6k1YEw12wYj1SIQEsL174GRzvMj/w4syvkk
	hzn6+6R/QbblufjJqhOiVx1YY3Alxx4/rA1Rq++EKpRIG40aFo8tZCFfzTtg+Ixfpv5diQnVih4
	wQD1G5R/MtSFKwAE0++Ppd2r+ovBvASwYEHBx/Cl3xx27Xtl4C7dGzcTOGQrtLJ8d5decTBPgyi
	SQ1trbYvJupkK1Qpe5CcLTHGy8LhzV/puhThl2GRkrl05bYoqGtS3p7jQ3bOa2OfGS3PkOshaTO
	reaUptxa1QkybsGiAbUWY4gwkCm5yyoTS468YvVC0VMyFgdNhSSNytam3OrCEki/pdpHJbfFQxa
	RUN80Z6c28shadLUzW21Z1tQdG2kcfOjw=
X-Google-Smtp-Source: AGHT+IGhFP/qkL3DgglwZ5MvHJdcpcSeJ8ki8DIky3RR3GH88+4MNn/psSZ2uCJxfybLvhHcJQ+E+A==
X-Received: by 2002:a17:907:cf46:b0:ac2:a42a:999b with SMTP id a640c23a62f3a-ac2a42a9e35mr1789666366b.52.1741814310999;
        Wed, 12 Mar 2025 14:18:30 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25ab328b6sm939324866b.124.2025.03.12.14.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 14:18:30 -0700 (PDT)
Message-ID: <0b1a0db4-35b7-4098-8539-cd73cb396635@linaro.org>
Date: Wed, 12 Mar 2025 21:18:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add description of MCLK
 pins
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250312001132.1832655-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2025 00:11, Vladimir Zapolskiy wrote:
> Add fixed MCLK pin descriptions for all pins with such supported
> function.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
>   1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index bf5e238a93c3..526ef2ae8ac8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5792,6 +5792,150 @@ tlmm: pinctrl@f100000 {
>   
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				mclk-pins {
> +					pins = "gpio100";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam0_sleep: cam0-sleep-state {
> +				mclk-pins {
> +					pins = "gpio100";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				mclk-pins {
> +					pins = "gpio101";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam1_sleep: cam1-sleep-state {
> +				mclk-pins {
> +					pins = "gpio101";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				mclk-pins {
> +					pins = "gpio102";
> +					function = "cam_aon_mclk2";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam2_sleep: cam2-sleep-state {
> +				mclk-pins {
> +					pins = "gpio102";
> +					function = "cam_aon_mclk2";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam3_default: cam3-default-state {
> +				mclk-pins {
> +					pins = "gpio103";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam3_sleep: cam3-sleep-state {
> +				mclk-pins {
> +					pins = "gpio103";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam4_default: cam4-default-state {
> +				mclk-pins {
> +					pins = "gpio104";
> +					function = "cam_aon_mclk4";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam4_sleep: cam4-sleep-state {
> +				mclk-pins {
> +					pins = "gpio104";
> +					function = "cam_aon_mclk4";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam5_default: cam5-default-state {
> +				mclk-pins {
> +					pins = "gpio105";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam5_sleep: cam5-sleep-state {
> +				mclk-pins {
> +					pins = "gpio105";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam6_default: cam6-default-state {
> +				mclk-pins {
> +					pins = "gpio108";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam6_sleep: cam6-sleep-state {
> +				mclk-pins {
> +					pins = "gpio108";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cam7_default: cam7-default-state {
> +				mclk-pins {
> +					pins = "gpio106";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam7_sleep: cam7-sleep-state {
> +				mclk-pins {
> +					pins = "gpio106";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			cci0_0_default: cci0-0-default-state {
>   				sda-pins {
>   					pins = "gpio113";

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

