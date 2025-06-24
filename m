Return-Path: <linux-media+bounces-35788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58625AE6683
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 391A17B316A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068A82C1590;
	Tue, 24 Jun 2025 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uA/M4pTs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55BD291C35
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771892; cv=none; b=bm9Wl4cmpomqeuda+NECrwpT1kXDKOTDYZSWIYYBB7fLX+hWm4l07iJQeexQqZheVz7xBB0oYqLpBe8uw2Ts8r/1fN39AN8xoqS1ybZMzRhWeZwu2GoaOgdMJn1xgsHCUKA8WtRWLJoL3V2oAwAFMle2aUwxHI3zyO6xLDkKxFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771892; c=relaxed/simple;
	bh=SNPpj7vjjty2f4GcEPbvBgmWRu/gVwdJZznlDEc11KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CG7wdgDaTlAYo9TQdvg4zpqIfHrJdfabbHEIdgv8KpGaPNFYbAebnHGJHL4oy3dNzH8zwcxVx6aKFpDQS1BLFx2V9w2bkVFjK5lUyVelVOOPpTyWi2b563BnXeYjSS7TsU1lYfPz42DZGIboLOaXWZZPKoJ430zhCC2BBgIdpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uA/M4pTs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553e5df4511so305944e87.1
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771889; x=1751376689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ixsChjPXVo6tgSzutDLAX1rFKh+YpL/is6uOUSR1ZI=;
        b=uA/M4pTsWXNxuf26ML3cTsvaYGniT0CiXnLKgZxOAcimj1IMmRoCKQ+t7mdCN7+G7s
         R1pxZKRaCQImOqnK5QZatW35asTsAVsxGrmyvoNx2nOD+XdESCpDVEYoN8eIB8yUVvwW
         ItXi3nkXiBiWprcC+5qzZ3qQeuOYk0+e4MI84xFHEcygVIo2XT+b44WBB/pXJjFLadQ6
         SM+JRHNrWmE1wzowI4NNRRrIYppGag2JiaYQ4bGKQF0YvclWMd7WSR15yKOpvupevg9C
         UeGvcXqTKcu9Uln5ywIafagCFY9wql3hoIGj978PwXsc3GoNe5mXhbJMPsFpbxDp60wO
         s5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771889; x=1751376689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ixsChjPXVo6tgSzutDLAX1rFKh+YpL/is6uOUSR1ZI=;
        b=ux1QVxAtk3MNQ59SIck/BgHXMvJpSgcjWEHtBPBY0oavqZQt6MD2df3qKT/mGGCJ4f
         g3KFdqz83BvrEXUYL+stgZB5Uv5U9ROeMn954kuEWlUnO6wSVYcj1ZuWa1poBMQz0x1/
         caJIZT+yUEOaJK3zoI+K6PST1DklrA2f4/AsOPsRBThuqktd4HXXwjh6n3D+UyW73qQ5
         FioG+8AbVYlnW/j+heDV7CFPWVX5d7J6ykk93ycaGc2tflFkad9PEOCqNAnfUGFgwSRG
         rc9jHG5bPLwifNe+2zzNMqgVvb7/5RBUYtf/dkVrONQTB9GDi5oElATY82AQpY2pJzVC
         9xlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWonP/RkZniD3CYcZ9D+0cdLdxjZ852yV7ZwZqigpbHRaQ58KeRkqHTpg+FDI3yaLevDrBBaDBbI89JmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUxGzU8ND4Bjjns8o3b46EmdBqr72Wm0dfJ268DH3x/N+NyRPt
	EP4zzHRMjckssIpwLdl9Ii8ufcQortaDoFgnmAz22mS7OueRYj4qPhGHgpx8oyPMxYA=
X-Gm-Gg: ASbGncuNDVgSMzbExac8NYgMi9O+LpUX9u8natovRLUwbBcakHym34VLhcDuTNo/CUu
	/Tri2V6a/6gIBNkNxFN8J/hLadBYzQrPVENeZsSB3fJgjPLVX8cJTAU3pUIg3puoDuc6u6uUKJb
	s+vXC490NlIHZduPFmzoPlKQ9Rz6kNPSromYpwsX5et6yQnT3s59q9CmYD8N+o9X1ijOR1tRSvS
	FcZ63W20swCTICd0LWYM2uWbzf/TViBx/xlJmApHcUDLdnLqHOH8mJv/8lDktqYrihs+y6flffT
	koyQYUOFnXzsN47UHtrSG8msXg+/afP43GIcSjYb2xVGLAZ7VyRptc8j/nVztV6HtJxVxLdxV9c
	zulHOT4RY1ciMQG9YWZWEJrObCZ4nmfHRJKHfw3yx
X-Google-Smtp-Source: AGHT+IGwGCymU8RONA+nhcXdhqLM3PrHi9ooRcM+SCxJHnCXXQhmrBOwn+PHm3whE+vhvRviZRDUzA==
X-Received: by 2002:a05:6512:3086:b0:553:2874:8efb with SMTP id 2adb3069b0e04-553e3c079b7mr1854622e87.11.1750771888708;
        Tue, 24 Jun 2025 06:31:28 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbba4sm1837510e87.109.2025.06.24.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:31:28 -0700 (PDT)
Message-ID: <9fc448d5-5c16-446f-ba89-ce4681b5c76d@linaro.org>
Date: Tue, 24 Jun 2025 16:31:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 15:14, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 185 +++++++++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 4ae0f67a634a982143df7aa933ec4de697f357a5..ee78c630e2a1c38643c9222a6d6fff4cc1216a47 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5195,6 +5195,191 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb6000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,

There is an inconsistency between the unit address and the first
value of the 'reg' property, it shall be fixed.

-- 
Best wishes,
Vladimir

