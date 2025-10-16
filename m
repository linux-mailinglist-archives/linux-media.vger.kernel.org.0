Return-Path: <linux-media+bounces-44690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77DBE215A
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F264618A01C5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD1E3002A2;
	Thu, 16 Oct 2025 08:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gWlGH7Os"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BE82FE569
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601828; cv=none; b=JOMT3g1bbkxQnnofweE0N9PfPoKJQzD0tmjZ4h/HuFJ42SGJGu4OmncRwT2gFTSoD0WHZp2s73PzEs/ykOZ5B/UH94sTpjh4Ugxr/FByPLklgdnjfXOn0yoSygDhqj7suaNyOx1I3wDIlIxwleoPcQ+aRprfH+Te2S0z8MfoZJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601828; c=relaxed/simple;
	bh=Upf+vZPf5FtAc5nFbo/GsuIEVrSiRNpKkQuMnHoDkKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChEHVvqUwlTYySByL73yTwBzQKr/FFSeSTryoJdkR3iNzba/voDAChC6l3ZeITlIiWvEx38dId/s4oLPwXRULajvz4/Y+nKkRgdPWuQl/GWcXuS2yNvvGcsheAqxHB8B2awZ609aGrAt6Z54ovHPqP0m8f8+CBd2DWIVa3tJleU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gWlGH7Os; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-591c7a913afso56812e87.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760601824; x=1761206624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SI3iJaG6AehsZaDVHen+J6EpKqRu7s9HPBybFYzEdgw=;
        b=gWlGH7Os+/ZnhKC7HSZP/PbQmY20AL8hDGE96MbwYi57o/couwbx84q3/gZyYBA4dJ
         optOTlN5VLfwO+ZaAjT7MX8446a/jfp0CBtJO0LTADsCzz7PvIS3bitSYM6vAviYn8OX
         SfxXF0zzCqCLrbD3/ARobYWmVM0NU02IqvP2bb87vWi4soAfHwHhHu9c/5ifAkhgnuXg
         WJI0miFxLcfCFGkMKPQFIJWWIbgluWUPyS34r/wStU7eyf4fvT4Sd4zOg7rSxAiHp7Ah
         ZZq6EYUUocgvij1x3Vq3SX9KOnTzFSOEfU6Vm3Q1lEEhcqCHaosbJSoJoXM8oy16AYsg
         mbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601824; x=1761206624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SI3iJaG6AehsZaDVHen+J6EpKqRu7s9HPBybFYzEdgw=;
        b=rn3AHwHJwNkvdezw1D1mhxaiMKC46L0meZxJzXH4OGRlFkDcAIGzqGBVXZ+EX1dbbp
         IQb2G5V2eM6PUkQXspK2FOAqA0r1PyzEZboChIKzXOyUekUO4sYdS+n9l1oAdPTMGIem
         6ZyJBQcXhGZDDUmfze+wnN8lJnN8nGfL/aj7zEG9Bwc9j4+Oe5QHTckGVHo8LBQxzbjg
         KvUW+1rhZUSqWUTlOiApiCsSmJsHBqVBRhw2p0CNHdE5cTpOSz0HvwBseOXyYE/URNzl
         h1+4JEPTSHQiw4Cc58jjiyNNCXnofZrmCX6I9yDVSf11mzoaiWwsSvECPw3/WA4ggpDc
         kJWA==
X-Forwarded-Encrypted: i=1; AJvYcCVqfRc/liQa2x01y1IVGoNlRWmAjZZLts2yDcFvRhfItn8LoSn3jKhJQ6U3yoCmGjUL7JYnH+08p9BU7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mBeT5Rdnls1A8ZPE7uHQy7h4xcIu8DsayfqJdThpZU9urY51
	GGmTlbFEc2QnOd8a4h8aHNzLKhiEDRSKHpg8Fcehx3XneRYhkw07R8QsVxnvbrvkf4k=
X-Gm-Gg: ASbGncupATWWAHzyFKL8mcQ++jRDc8W4yOuo0n96ABB4P1a+HMLdYRuzHR7AkdcUrvK
	ulwaRWPOt5BWXDH60DFIrHhgNrZyObckfR06Hjn/2bW2161ZxoaxSs9v/XUX6FLbi9JJVsDpvX+
	CiAajiqGBO8DMbHQbIwBuhYrvcyrfhwLY7KVo1vSvk33hSqvbB+Crzz7AGpAsy3MICR0H367KLx
	pT2WuK7XPhrxB3ArWKg0Er+Zhv4e+XA/XfPbwj821GQlGrb7qrNTjl3XI8QBaZiX5mg3VmxR7jQ
	/0OXFS9Rs73AABmrdIkA9GOoCB4dmRLcDkO4GaFYRTTDyF1yRvJ5rNphiJNSTBzVeCXnr8B5Fod
	9cGhHjXv3U+TviPO+EhFVce0Zye5o+cy0OW0U0LdW26y8iaHLbtxY4ARFKyo3yUfLg1SCoIq3mQ
	ZF8le3uLzP5xpD2h34cp7P2sm80u61I2GD3LduNCSqxXT/X3oofK04+e4A1TeT6VtkIJmf9Q==
X-Google-Smtp-Source: AGHT+IHcAxdLhGzdW1NI2UBF0IVQHMl6HFpUd/jJYBtOzICKf88GKwgE5spfrmYtn/8eULnHs4lGZg==
X-Received: by 2002:a05:6512:3dac:b0:57a:8ae1:6a8e with SMTP id 2adb3069b0e04-5906d8ec20bmr5447249e87.6.1760601824219;
        Thu, 16 Oct 2025 01:03:44 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f88ddsm6922497e87.31.2025.10.16.01.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:03:43 -0700 (PDT)
Message-ID: <3202275a-25ec-435a-93ff-80a7ff8a8153@linaro.org>
Date: Thu, 16 Oct 2025 11:03:42 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
 <a0d9389b-67a5-458a-858b-ffdd95f7ccc6@linaro.org>
 <62a3f09b-50d6-4ace-8229-d71585378ae1@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <62a3f09b-50d6-4ace-8229-d71585378ae1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 06:46, Vijay Kumar Tumati wrote:
> 
> On 10/15/2025 4:32 PM, Vladimir Zapolskiy wrote:
>> On 10/16/25 00:43, Bryan O'Donoghue wrote:
>>> On 15/10/2025 20:45, Vladimir Zapolskiy wrote:
>>>>> +  power-domains:
>>>>> +    items:
>>>>> +      - description:
>>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>>>> Controller.
>>>>> +
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: tfe0
>>>>> +      - const: tfe1
>>>>> +      - const: tfe2
>>>>
>>>> Please remove all 'tfeX' power domains, they are not going to be
>>>> utilized
>>>> any time soon.
>>>>
>>>> When 'power-domains' list is just a single Titan GDSC,
>>>> 'power-domain-names'
>>>> property is not needed.
>>>
>>> Each one of these TFEs powers an individually power-collapsible TFEs.
>>>
>>> This is also so with the other xFE power-domains on previous SoC
>>> generations.
>>
>> This is false, for instance there is no management of SFEx power domains
>> in SM8550 or X1E80100 CAMSS in the upstrem, neither there is no
>> management
>> of SBI, IPE, BPS, CPP and so on GDSC power domans given by CAMCCs.
>>
>> TFEx is no more special, if it's unused, then it should not be added.
> I agree with Bryan, if I understood the original comment correctly. This
> is no different to the IFE0/1/2 GDSCs on SM8550. All the other modules
> listed above (SFE, IPE, BPS etc.) are not supported by the CAMSS driver
> and hence there is no management. However, we need to manage the TOP and
> TFE0/1/2 GDSCs for the real time RDI paths.

Agreed, at first glance I didn't find the management of the TFE power domains
in the driver's change 3/6 from this series, however now I see it was added
along with the 6/6 change.

This my comment is answered, thank you.

>>
>>>
>>> You'll need the TFEx power-domain to process any data on TFEx with the
>>> 'lite' versions being tied to the TOP GDSC.
>>
>> When it is needed, the documentation will be updated accordingly,
>> right now
>> it is unknown what a data processing on TFEx looks like, it might happen
>> that there will be separate device tree nodes for TFEx.
>>
>> TFEx power domains shall be removed right now, unti; a usecase in the
>> upstream
>> CAMSS appears to use them, I haven't seen such code at the moment.
>>
> We attach these power power domains by name in the corresponding driver.
> For instance, the VFE driver attaches the TFE power domains mentioned
> here and are exercised from vfe_set_power() -> vfe_get()
> ->vfe_pm_domain_on(). You can also see the related codes with '.has_pd'
> and '.pd_name' properties in the CAMSS subdev resource structures. Hope
> this clarifies.
> 

-- 
Best wishes,
Vladimir

