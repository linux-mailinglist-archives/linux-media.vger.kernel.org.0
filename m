Return-Path: <linux-media+bounces-5494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C793085BABF
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 12:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1A91F21EB3
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 11:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A616773B;
	Tue, 20 Feb 2024 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBahXR/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E769948
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429071; cv=none; b=mC25GqIQ5LSx+vN4b9SRekBuXZSCfx5RwK+Ew9P9mxZ0PLpHgl+276mw3FWLPAFPBDkJVBFVLuIuU7DEAxzwuGJdiwK1XisdHgzagGXL0Cn9EbSs+NSkmU94QWwgVlPNLnGsH7LR55GS+oithG+0NSUD5qQMpB9PEXlX/iv95Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429071; c=relaxed/simple;
	bh=aCqm7zmGGwbfZRL15nYhI/q/NZRSI/X4Jngq4sAu76c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCliW9yo/80XRrL0n8PuF/+bdff9GZ1fwE48cxtt4BBO33NwmehJXlFOGcR3I99sTp7m5hbDyt+Q0vbbFF4xI5BvfSB/Z4ycpaQ3hSJ9FCyr1/ElEpxoh1pFd1VJdCcIoxGwcezSy8NpswpNZhsl79KwZ6YBAYKjKvxNAf8HeJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBahXR/D; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5648d92919dso2500419a12.1
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708429068; x=1709033868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMy/+tyqqxFBTAjRn0JPSAGjq/uZ/OhPdcX+w/Bl/V0=;
        b=DBahXR/DDCU/bUtXD4dXCNveRJHS0uUu6r/KNjgzxstNktrpLzlg42FPg5Hp1SWFzv
         lvGXkP53sCVoyFAy2rxeB/bjx3xxV8Clhm3TyBHgWIQjklUTGp/EIeMzUQq7YfnT6RAa
         2fVTcO4LsTwxpj81wqWm2qwzGM7zluTO50DOm/VA8oNcqh6lUDZK1RUOGOWO+uRu5VV/
         mKRGUWAsvS+q2oChzVDYqXpTiz09IAwkJN3Ooh86bzx/KKwPMMdM+ekfEi7KIvDsCS+k
         9XP42uNZeQNIPtOmYYkMfLBUzqvZSOtTGD2U/6+uSwdcDsxoz2/ApainZ0xa060LSgaz
         EZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429068; x=1709033868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMy/+tyqqxFBTAjRn0JPSAGjq/uZ/OhPdcX+w/Bl/V0=;
        b=qt7j0q4wO/MKR2iOvs6c0z0vBE72tciAYsS6F45et9S4a5PlcJLa0F6umvrrwrWV4E
         qQ6vjdBBnBkN9BO5zhED2kWWLAH3K45fsvbd2Xl75xw5STEbOXZu2CPsYWDAQbizqb4p
         tYmGucOG9ZonmjsO9OPH3CO449MN+gtxhA2XW5TMeGc0rn3VARI4ZloCtvnBxZOnqElK
         aw/yvkHBwzgIIPaam5msCn2QnYcjtW6z0A/LE8auhV0+xb3eYXXzyI0GKXVQSfc8R0KX
         IQfyx9VH8KOKmMHZTks16Sq6vYh28qdNWLWaSeoai9ArfsR5cQcJOc6LIGRCwoXL9bC3
         pc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjlixgCkEbqmDO4QZ0YwKM2qp+fUNkXFNOhRhWTio+WfEhKf1g4RB+UEhI4TY5vz/07o46e1yivmI632nvq3ZDFuww6UwUzZk4WfI=
X-Gm-Message-State: AOJu0YyF7HOP6FJwBWnkuY4lIMxA69TyHB7d7i1CgSpsY0N/RI1Dw2dd
	G8TKT6q3Oop3+ixDelM5LM/G58rRG4tMmC7V4VMDkTsQvTAOexEqZD9IUY7euDI=
X-Google-Smtp-Source: AGHT+IHxHZ7aaKdCIyzehZkgTGXYKIrhGtf9UcNgP1hoLqjXEnOBrasVQo0/L+RbgqjbdS+Ba5oaiA==
X-Received: by 2002:aa7:c90b:0:b0:564:a9ca:1c41 with SMTP id b11-20020aa7c90b000000b00564a9ca1c41mr1901125edt.6.1708429068400;
        Tue, 20 Feb 2024 03:37:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id e10-20020a50ec8a000000b00564d6840976sm234387edr.80.2024.02.20.03.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 03:37:48 -0800 (PST)
Message-ID: <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
Date: Tue, 20 Feb 2024 12:37:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 12:21, Bryan O'Donoghue wrote:
> On 20/02/2024 10:56 a.m., Marc Gonzalez wrote:
>> On 19/02/2024 20:24, Bryan O'Donoghue wrote:
>>
>>> On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
>>>
>>>> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio wrote:
>>>>>
>>>>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>>>>
>>>>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>>>>> breaks playback. Since the vendor kernel never calls it, we assume
>>>>>> it should not be called for this device/FW combo.
>>>>>
>>>>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>>>>> to name a couple.
>>>>
>>>> Then let's just disable it until it gets unbroken?
>>>
>>> Its functional on most of our upstream stuff though, why switch if off
>>> unless necessary ?
>>>
>>> Maybe it should be an opt-in instead of an opt-out, TBH my own feeling
>>> is its better to minimize the amount of work and opt as per the proposed
>>> patch.
>>>
>>> Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we
>>> come to tackling new HFI6XX and later SoCs ...
>>
>> I was wondering if the chosen property name might cause issues later...
>>
>> Thinking "qcom,no-low-power" might be a bit too general?
>> Perhaps would need to mention venus somewhere in the name,
>> to limit this to the video decoder?
>>
>> Regards
>>
> 
> Yep, the word venus should probably appear in the property name.

This is RFC, so I am ignoring it, but just in case before you send v2
with the same:

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

Best regards,
Krzysztof


