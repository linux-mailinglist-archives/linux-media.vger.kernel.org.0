Return-Path: <linux-media+bounces-904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526D7F609A
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84DB2B2139E
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49E8250F1;
	Thu, 23 Nov 2023 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2uOT1hL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46311D7D
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 05:42:55 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-5079f6efd64so1088867e87.2
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700746973; x=1701351773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIX6Y6OmD18tbJ/H2yRFYnNOAfgH4KdfJCuauNIg3HA=;
        b=D2uOT1hLKrvZJBqbjWGSL7egFYpFSU8XxQdqC9em6RL8EKY2eW+LSOKvPIklt/Ef7j
         kr3e2YPMxl7H5uYUVqR4rfTZjkGpHw1ozxrMNyChrx9dnxoCb+FwNoB+8W5pAhcozlYB
         CsFr2jHHg/yOADB2Plk8xCQ/heJFUTOyMGgZ2qIOPwSlj0AHfJYXLQ2mR5IbPHqRFDuo
         n0hX8eKAtkBUili8y3We0E3FteID7jm3ck3fdCDBqcfID2Awdz+0ak1Z6TQVwck+XBBq
         JWvSd3OYCFSKixj/O27P5DMQXAP/P4jH5G1YTbv5iZaP+R0ON0xrjydieUV2gBo1ihgC
         Q3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700746973; x=1701351773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIX6Y6OmD18tbJ/H2yRFYnNOAfgH4KdfJCuauNIg3HA=;
        b=cfdidzzOrq46PYge8bJRp1Pgn8ymlRj+nWq9ag61on3ay7gAgnyB0oczL+uZTk5gax
         YLBl++FhAoE82c29/leVwd4WD6XDzEd3EjzL/DSAfYZypTDu34vvksEXW3IsT5irjtvL
         CcfPOG+TeFROlG6rVen6bhXxaID55z75IyoT8fhqDUBajt197+FYgmzvKBLA6kty0hMR
         OShPsoR3LAOBOMuw4RslFK+qlW/WNcAbXMYYGsyiaK9RxDkdwqGdr6hEXJKY5DYtU4vG
         fjH4NkAbCj8UupcTH0nW/T+rLOU3tE07kAeMLBUf04DL55/ktaGAeD6dEVLb6VSZAqR4
         R6kA==
X-Gm-Message-State: AOJu0Yy3x2XvW++fCmB4fqvAjT1PO5cRVw8TrTQa1cbMLI6UNPvvySA6
	IJEw16EVGtoT5NILgdNaeD7qHg==
X-Google-Smtp-Source: AGHT+IG0uOhnZ0oXGp4jok8uSMhhwwR3X72qhblR6OJOvkgTiQCc/tbk0F5CdiH2tbybJtIGVJbw+A==
X-Received: by 2002:a05:6512:32a7:b0:509:f68:ed8 with SMTP id q7-20020a05651232a700b005090f680ed8mr3763564lfe.61.1700746973454;
        Thu, 23 Nov 2023 05:42:53 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c475500b0040b2976eb02sm2067241wmo.10.2023.11.23.05.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 05:42:52 -0800 (PST)
Message-ID: <ee3f943d-3f29-415f-bcb0-94e6c8972597@linaro.org>
Date: Thu, 23 Nov 2023 13:42:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-5-55eb0f35a30a@linaro.org>
 <6e66875a-5cb1-42bc-86e0-b69cf73981c0@linaro.org>
 <339c3efd-8d2b-4b71-8dc1-cdc30ab7bb8a@linaro.org>
 <2628b928-248b-41c7-81e2-4e4252d2b0f7@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2628b928-248b-41c7-81e2-4e4252d2b0f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2023 11:49, Konrad Dybcio wrote:
> 
> 
> On 11/22/23 21:55, Bryan O'Donoghue wrote:
>> On 22/11/2023 19:55, Konrad Dybcio wrote:
>>>
>>>
>>> On 11/18/23 13:11, Bryan O'Donoghue wrote:
>>>> Right now we use fixed indexes to assign power-domains, with a
>>>> requirement for the TOP GDSC to come last in the list.
>>>>
>>>> Adding support for named power-domains means the declaration in the 
>>>> dtsi
>>>> can come in any order.
>>>>
>>>> After this change we continue to support the old indexing - if a SoC
>>>> resource declaration or the in-use dtb doesn't declare power-domain 
>>>> names
>>>> we fall back to the default legacy indexing.
>>>>
>>>>  From this point on though new SoC additions should contain named
>>>> power-domains, eventually we will drop support for legacy indexing.
>>>>
>>>> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>> So, this commit should be a NOP within this series?
>>>
>>> res->pd_name isn't defined anywhere afaics
>>>
>>> Konrad
>>
>> This series is mergeable though the linux-media tree standalone, yes.
>>
>> Once merged, the dtsi change given in the cover letter will be submitted.
> What I meant to say is that something similar to [1] is missing to
> make use of the infra introduced with this patch.
> 
> Konrad
> 
> [1] 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f43942091c01c1f263a6e7adbcd0ed8ce723a303

Yeah, to be honest I debated with myself whether or not to include that 
patch since once defined the code here will execute looking for named pd.

I'm not opposed to sending a v6 to include this additional change 
though, I've thoroughly tested on rb5.

---
bod

