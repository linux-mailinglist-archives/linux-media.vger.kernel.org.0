Return-Path: <linux-media+bounces-39050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BEBB1D811
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66E717AC762
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD5C2472B0;
	Thu,  7 Aug 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+KcYBcm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AEE24469E
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754570244; cv=none; b=qRPQP0ax5YSx4qrmKh0krf2Qsh8NYNMJdfNaK+iCyxuCJRo42W60e0Y1Gj7I7wtLCNDUdlWDfqHWpW5sTfgVW8bKXgOQEu/RKrS/bAfyFqDWdKQ02U7GPBiUhXuQurJdmob7xPw7uqV9TNYGaAKI7haPzv5ccU5W1o2F0SD+FHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754570244; c=relaxed/simple;
	bh=0HJeJ81F/fe85KKd6Kapj27WSnTdBWo7pAlxPgJ+W+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkHLWlwZvc47UYbqpUjLMmKdnOPyXDTLkN4O4LWT+M1i3Q01I1uoN1bKpX7wFo4PEIF11htZuMMx6UFbZHXkqEEFsgD19YPguJCkiFZ0d2C34lLriDzACmbAmBvCdv8vCu3jx+g6PUNmKCPTdO78ypUaDFwll2wAOZOppotGPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+KcYBcm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso7019755e9.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754570241; x=1755175041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SssdXwaRmyli//zxIcsg2m9oDnPDhQ01niz7e6EkH/Y=;
        b=V+KcYBcm6vor/TLEdzELJDMbBpcx4fn4qeRyde73qXR311YugSs+lgKZudvQlCSDyr
         ONP8fn0i6y7u2MJvdxoK4zn6ks+y74Yj4EfC2f9P1RHd5AuJZb8hbF9usmaH5lianoFg
         b5J5Qobjc9FtpHjS814twCjD3O9y/C/oFxRXpyGGTcoRJdmx5HgGlyLA88dLWzqkMohn
         A5Jod/JCd5jLuHvYelCbIJpNX7m53nlFv6ycjw+d0mo8ctxR4N+maP5Rg6K/htP0pYJk
         YGQof2W1e8Q+80zZH1irv7r7TxEiWWZv5djNIZq9Xje8m1/5dAKTwLnJa3ZW76bsgS1B
         YR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754570241; x=1755175041;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SssdXwaRmyli//zxIcsg2m9oDnPDhQ01niz7e6EkH/Y=;
        b=uWOHzXJwmi9nLddJcnv6axKqJH9JSXnFgRi7NEH+Rl/N3vXwdUPsfUfie8TInRdqT4
         WJU3qG9ru3tKKXILsV5M50R2thzvdQCQERvorkw4ngv2iGU/9skEbPSRE4KMSyET7yyS
         WJSmBXatF1ag5ndbSAtod00cMgxEYi+I0XNJbaDZSc8/9FGNX3mc5NOm9YCtKMPJZXaC
         xCtdL2Qn9ehWPtJsf+psDO39SPsOgSEO/P9eGD+Ll1IenAy1mJHxo2wqVtYzA0ji2oq7
         DqoyGWDdRVmjWIwGJYamEkTTT7vfn71MUKxBC5GZaQT+rLTvmRxc7BuzTEwKslytU2ND
         4ErA==
X-Forwarded-Encrypted: i=1; AJvYcCWS++Z5kAyj3RbLA2vkRyA9TXUqVSrigXJxiF5bk4RTv5Er5qcXzgQsSkJGF4kC700XKOZRjQKbzUFw8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDetcqN8cqxtzKSZ/V1K5YrSC+ej7m/1gfvcfLl10G9e1Q7U6
	Ez5xFuFdkEDo9TDom+AqxXfJBsil/lD+8cUa6SUX8qE+DEstyZr2LQt7+X7cl6ued+Q=
X-Gm-Gg: ASbGnctCSjLRmfarooRz270z/9RnDIgJf5ou2OzjOW5qQHnena9niMzsD+kRPR9/LL8
	FKo54QCftziT5vj3GF7J61qI3YlMIgoENf0PtsHlvhRPbxDGi1xADlra+No+lXHXRKY3K8gLOud
	nvkuYmsfWB6/HBXPWG+WxawqTJZAvHzSQkfKpmpKGuFN/YyQjGXVSk8fIuTZHJ2Nf06O6XDmt2I
	84nIqSNNtrRMLz3Vp2X3YuYSMWuYY0o/6cCH1vNOgKYcLRjrtr6JmZF2JGZwHQBqpo/V2UxaDH1
	jJU61V+TGtd+kqq8seCai9yOp6q5PXJP/LA+q8+Au6B2/MKvhI++KWn9LocsAd/nsosu/9LpRVh
	/L0/l1zglLYRE7Y9QJ0qbu6mzO5PYCGBxb00GiH+8AH4OJZSUs3FY44g8+aXLAH4=
X-Google-Smtp-Source: AGHT+IFOEsRG8ebIvvAsL7B/AJ9oBvQYifwwUwKVZY3a9oI94ficILiwiXeFUjcUVB8C/IvgBehkEw==
X-Received: by 2002:a05:6000:310b:b0:3b8:de54:6e64 with SMTP id ffacd0b85a97d-3b8f97e6e52mr3149326f8f.26.1754570240565;
        Thu, 07 Aug 2025 05:37:20 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4532c4sm26483493f8f.36.2025.08.07.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:37:20 -0700 (PDT)
Message-ID: <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
Date: Thu, 7 Aug 2025 13:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
> Following the new device tree bindings for CAMSS IPs introduce csiphy2
> device tree node under SM8250 CAMSS, which allows to perform camera
> tests of the model on an RB5 board with an attached vision mezzanine.
> 
> Note that the optional 'phys' property is deliberately not added.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> For testing only, do not merge.
> 
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f0d18fd37aaf..401a32679580 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
>   					     "cam_sf_0_mnoc",
>   					     "cam_sf_icp_mnoc";
>   
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
>   			ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -4641,6 +4645,16 @@ port@5 {
>   					reg = <5>;
>   				};
>   			};
> +
> +			csiphy2: phy@ac6e000 {
> +				compatible = "qcom,csiphy";
> +				reg = <0 0x0ac6e000 0 0x1000>;
> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
> +				clock-names = "csiphy", "csiphy_timer";
> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +				#phy-cells = <0>;
> +			};
>   		};
>   
I don't think we should make this change, for CAMSS in general and 
specifically for sm8250.

Instead I think we should go this way:

https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/

With separate standalone nodes, and reuse of the upstream PHY API.

I believe you have a series for the 8650, please rebase on

https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/

and

https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org

V2 of the CSIPHY above will incorporate feedback from Neil and yourself 
on adding endpoint@ to the PHY however I think we need to have a 
conversation about standards compliance at attaching two sensors to one 
CSIPHY without VCs or TDM.

---
bod

