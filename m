Return-Path: <linux-media+bounces-36620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A27AF6005
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 19:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD031BC730C
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28615303DF0;
	Wed,  2 Jul 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzkXNiBX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADA1EE7C6
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 17:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477403; cv=none; b=BfvkimeJDFEUkWDMNxV9AWuywvBn4seE8zXfVGCfVFcrsE89hi+nDjIsagSOPdf/Atj7EGOtYP0eXv0weYxKRFz1TOdoZjKTL6mXzA8LA6rXYm5o6j2qQlNCMpDEZxK7dRSISCkTTvixpgzkdsPYhmoP11gK1AbJ8CZpuUHL7sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477403; c=relaxed/simple;
	bh=sEsGRafy2RVvhnjteg+9GdBVEH0c2srqTIXr72XuoKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=atoQBtxFK93Px3Es3dSzzKPWpmwtHoDNK+vB5FOkUnUiATKPMj+s/GuE3LZ0xxVThF9zIriBW8MV8v0TDMuxIWrS7WJbm8JWtzfidRvYO9sMC223NMbSZUW2/tr/iuPg3XVxhHp8Fhq8RGSyz3JR+KI3Mwnfm5hMapNTeQL2MjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzkXNiBX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso1092104f8f.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751477400; x=1752082200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZADzhB0tGPkPINVTAEgu5v6r+MhKSj9WHZf4In+Lqg8=;
        b=LzkXNiBXwb+YkF4thOdLU8APgpG7T/yH1NKmf5TQf6OuxiJrQ9Q+LJ7zeAS+mfBxQJ
         HrTPH1nhZW/b+rAi0qwcBLTSzok0ZH43BNogTHAlajlb/t1GHYZWYmGcf51Dg49KgeAJ
         4evjnlF7pOnyRp4e80oPtTgFIPWfxpN8jD7F3gyy2e9O+MV/lyZKAHO5qoka7ILOsGwb
         qxpjqfxuOnKuYTJ72ehNBPe5FhLSJMI82lNXaycFSE8y5exmcKj/+QC+4YUbbKbKodXb
         r3RzNFYPryITWAqjfDG0vVHu53w27YuNx/I6MQczRHtACcQTaCZHQJavPn+PpCQdEeOG
         qrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477400; x=1752082200;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZADzhB0tGPkPINVTAEgu5v6r+MhKSj9WHZf4In+Lqg8=;
        b=Wfg32yf2MyoS7Jg/+xm6H74bobt+ho1co96YCBM2OTBc6NB7/Pbzxg3F+qga1DB2pr
         FwCFliGky/XzaSwJU69y1yd7kS9vWOs0b9Um7DuGpulJ7AcatNOz4OPNR9LFPsyt7fla
         X+27LgU3karM/IazrBRmeoRu7pjH0Kw24XltIO0ecfaxVVK9wEM2XKaKouUc+gXeH3CZ
         KtyCodtqJ13HImIRwIumRI61uuRhKcCvZNshpr+cphlWG9apArO9sI7VvTY3FxKTL/X4
         mh4BZbKSEpFfVxGbVnZSxMeU7MYzo6K7tD9zJ0LrkUNhhg/LzA27RE215Ci38iepHnjO
         GK4g==
X-Forwarded-Encrypted: i=1; AJvYcCUnzbMLyyV0OpUF7mVVArP/2fOQHSBxFhen23Os6yL7mhh9enP9qtpgM1JMUUcHfsiVJ7UajS9FLxfaoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWso+jLdVJ9DueM/xPWpXtmekQX/5P7MoM129wh+jNetG/7Eg1
	NVmjRepq9V+3EekSWoOGXOD6DTOVLeUJOxojBB24z/A8vHiztuBHgHfHC4WmzCnv9RY=
X-Gm-Gg: ASbGncvWxzqyaMZsJj0B9XzsYCt40oyVV6VVkJiTXZISlcKBHSvc9vQ3tNn3bzcbEkn
	pGCcZn7wai+zKAA5XD8qYO/NAcWj1XLoHs1hiBJlcJGR82jDD/pyiNFdrD0uy7OZmgw3gB7U2kr
	BwP9/FjrUCmMMXxHnTx139dxLIiQzg028HuG4haxNUdtuz0l8IE8/3xJn9zaC550nnWv7UFh26m
	2I/i3SIg08YFKpXv/0av4/Qd2kQse+KdIIlsXtvq0SZ7NCWl6El0O7ZzKqcGzh925lZzexwBfzv
	Z+7cylxEm1JROV7M2aqFJVZK51mvepAg6BYsP/pMBUnjNCh9hwZju7ocGwVWyrwvpmCJa5BJKlD
	ay+LTzO6cP3Vxv++I
X-Google-Smtp-Source: AGHT+IEfOQFJI6veKFLQlVa2zWoRIMxh8SnGzBs5NT7bOsSo7eus1IUx4prX/QXJiCHikJTdp2nWwg==
X-Received: by 2002:a05:600c:4e91:b0:453:78fd:1769 with SMTP id 5b1f17b1804b1-454a370c4e2mr16384675e9.4.1751477400198;
        Wed, 02 Jul 2025 10:30:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f92esm16709494f8f.90.2025.07.02.10.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:29:59 -0700 (PDT)
Message-ID: <85c3e526-b654-473c-82f7-0183e5fb5dd3@linaro.org>
Date: Wed, 2 Jul 2025 19:29:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
 <7ee61b56-4c93-f6e2-d405-9f88f69af675@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <7ee61b56-4c93-f6e2-d405-9f88f69af675@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 19:20, Vikash Garodia wrote:
>>  
>>  const struct vpu_ops iris_vpu2_ops = {
>> -	.power_off_hw = iris_vpu_power_off_hw,
>> -	.power_off_controller = iris_vpu_power_off_controller,
>> +	.power_off_hw = iris_vpu2_power_off_hw,
>> +	.power_off_controller = iris_vpu2_power_off_controller,
> There was a reason to name it as VPU* independent, as it can be used for
> multiple VPUs. There isn't any VPU specific code within iris_vpu_power_off_hw
> that it needs to be associated to any VPU.
> 
>>  	.calc_freq = iris_vpu2_calc_freq,
>>  };
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 9b7c9a1495ee..a2c8a1650153 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>  
>>  disable_power:
>> -	iris_vpu_power_off_hw(core);
>> +	iris_vpu2_power_off_hw(core);
> Again, its like VPU3 does something specific and then reuses the common handling.
> 
> I do not see a point in making this change.

The point is expressed in commit msg so address that. Also, this will
not be even correct for SM8750.

> 
> Regards,
> Vikash
>>  }
>>  
>>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>> @@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>  

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

Best regards,
Krzysztof

