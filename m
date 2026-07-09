Return-Path: <linux-media+bounces-67133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vVoiNORyT2rZgwIAu9opvQ
	(envelope-from <linux-media+bounces-67133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 12:07:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9E72F5FC
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 12:07:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="u/BOI4ro";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67133-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67133-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAA1530072B4
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199B2409281;
	Thu,  9 Jul 2026 10:04:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099C408631
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 10:04:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591487; cv=none; b=XOa0WQdN+lGT5Cu6WVW5ib4SBvWcSdzww9QaiZQcDZ3RdZlFE68+9dBTnHtRTQWmsN1qBW29ha/sJ/ddaVIsHzOWkJWMP1v8pTTwjsKbPP51i8PNPahR/SdANh9RZJu7WWDpldC5mE4wLTmKSA0qXX19o7pGeTSvOCP4N1lT4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591487; c=relaxed/simple;
	bh=jnRthcRh18ECwG4Qubk9hDmz59sP/LjpoR0YrTy21w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTx+7t4qTFwvILPZAGjrHk5ERotjKXeJ+pfC2TCZQee2z0Aho9KLCtEsRinxAwm+gbaamv0KPGqGvYxHWcYUjS0B1k72MS4p9CfSPV3oqUR9t9NLQjOEcIrtOI+uO0pTLYGjbtSEOut/d0m3D02wqxOvCCNJa9z8b+KBvynPiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/BOI4ro; arc=none smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15b75c9e48so232683166b.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783591484; x=1784196284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVm4IvduA/DyKHoGxNy4y6/zPAWfmeUpt6Sdfg7MdY4=;
        b=u/BOI4roAJCkcmxvCbpH6tTU4zGCxVYdUknBr9dXtno+1HA6Fn//ya3alj9d14RrI/
         QuF1eSS7v0ZoROcpofhzj/ixiXLSwhgBI1YQyTjR8nIpUwYb7xrg/Pd7viSM/aaPkLZH
         qIDNR0TN3kgeFo7NUA17VXmSGqPvLH17KPH/yq7A+awuEAxq+EGCrISyCCj1N7bwTPeh
         vFf662lyA/Gdc6s910ZU2f+4lNrgHOO9S6iF6fViXMl/b8h6uR+rnuPg7r+hCOiP5XJK
         1IaYkG28xwNiH4G4KJxVTJiErF8uRMoTimgAaz3WrywdVbdheXnyazQw40yk2Ej+mEUe
         wShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591484; x=1784196284;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVm4IvduA/DyKHoGxNy4y6/zPAWfmeUpt6Sdfg7MdY4=;
        b=ZEB8W0SFv52FNqZpLdSZfSVY2E278prJ1/FuHXnUVVKgxOiqhlVM6+MDAzoVBeVa8M
         kXodiG0FJLhtyzB2KBbjEY3hDIu4DPQTStfZNJw2yLXYVY1SFR0VgA/W+DHeoWMOzqRE
         9q1G1ruc0dz5TXctZ46YGSjm7J0tgItAatebklKmMiBDxSi7V/AH0H6xy1hqtlvg6PBr
         5hTppPE/VWmYd5bc7FQ8xXLNZn10sYtNJFx9LKJyPBFCjRItvDiuAn0dAoHu+WqtjaO6
         i8kMkyI2rSPFRYHVhZvVH+voe1VCM2BDUTC+GxgabZBC+P5qpR5mHAahZIaI2xRLZsGl
         dFqA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr+u2qvp85dupf4HLV8oyatL8Ol93+iLlxyVtcZcsHJKvkC15R+N2Kxo9u2CSzypmiO92CvAGxsuNbSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZ4GV/h7tHIVXfD4y3+023W6B8gHCKntvYLnmovqWwxOGh38Z
	XgODvuPoUBsQUzKP8/HWRpulLrf9m8gYsSMCxkvyxiiqXldipGFBKH+1tTFKHIxi8Kc=
X-Gm-Gg: AfdE7ckqnBGG8OqroF1oFPyKZyLNT/YDMz7fatOiyWYpT+c/TGPSOmlb4+1/beFhazc
	6wEOVop6UHDStWSXcji7+TFMEIsK3qih9atJn/eQ5WyCSq+7PBOu160T2jiGoRl2QZlJ9qilaRZ
	qZvRSU+0dIArcFZRKQApXWXBTj68iTTdd4cBqS25P9N4AIyGbYJ+vAQh+qknieX/R2viMJmQHnU
	ttvrYLs03s23deNlBfe+FUQtWWYwrii+ryMeD+357soKoOYebdCupn/LnZZwuYrTYK2YdGRPKqR
	EEGctZjjSWDwQ4swKQZ7he1cSWSdJO93jFiXuHysV1cIAhQswGJZWZ5VrKP92IkaDQFnWTlVTrB
	5RLDX7y0nXs3OVfltFVbdb+nk0eFlDxM94r0v0NFpK7o7ChzZscUtozLKadeH9ztxw+29RsBKy6
	kxLB1qOfKm0H6CzUYJvxEirNng
X-Received: by 2002:a17:907:960f:b0:c12:8c27:e2f6 with SMTP id a640c23a62f3a-c15cdec5297mr323277666b.13.1783591484174;
        Thu, 09 Jul 2026 03:04:44 -0700 (PDT)
Received: from [192.168.0.101] ([93.107.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15edfcdb9dsm46291766b.61.2026.07.09.03.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:04:43 -0700 (PDT)
Message-ID: <2ea78bd6-5abd-4ba8-8f8e-24057a587cdc@linaro.org>
Date: Thu, 9 Jul 2026 11:04:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, vladimir.zapolskiy@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
 <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67133-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDA9E72F5FC

On 09/07/2026 08:45, Loic Poulain wrote:
> On Thu, Jul 9, 2026 at 12:30 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Use devm_of_platform_populate() so that child nodes declared under the
>>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>>> platform devices. This is required now that CAMSS is modelled as a
>>> simple-bus and ISP blocks such as OPE are described as child nodes.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Looking at my commit logs I see this isn't my commit message ..
>>
>> Anyway.
>>
>>> ---
>>>    drivers/media/platform/qcom/camss/camss.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>>> index 2123f6388e3d..95e655a8b6aa 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -16,6 +16,7 @@
>>>    #include <linux/of.h>
>>>    #include <linux/of_device.h>
>>>    #include <linux/of_graph.h>
>>> +#include <linux/of_platform.h>
>>>    #include <linux/pm_runtime.h>
>>>    #include <linux/pm_domain.h>
>>>    #include <linux/slab.h>
>>> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>>>        if (!camss)
>>>                return -ENOMEM;
>>>
>>> +     devm_of_platform_populate(dev);
>>> +
>>>        camss->res = of_device_get_match_data(dev);
>>>
>>>        atomic_set(&camss->ref_count, 0);
>>
>> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do
>> the same with the CSIPHY and Loic the OPE.
>>
>> Modelling for subnodes is nice if you have the idea the camera block
>> should be a bus.
>>
>> But for what reason ? As you pointed out it should be possible to both
>> compile and run JPEG without the compat=camss node on sm8250.
>>
>> Making the camera block a bus is a nice idea for "reasons" as this
>> thread has shown, its a problem to implement with an upside we struggle
>> to define.
>>
>> When the facts change, I change my mind.
>>
>> You were right to argue to have this as a peer node. Lets do that.
> 
> Having a camera-subsystem bus/parent still makes sense, especially
> when dealing with shared resources. Whether that should be the
> existing camss node is indeed the question. Today, camss effectively
> describes only the VFE (including the CSID) and CSIPHY, so using it as
> the subsystem parent would introduce incorrect layering unless the
> node is significantly reworked/broken. So yes, for now, keeping the
> components as peers appears to be the simpler and more scalable
> approach.
> 
> Regards,
> Loic

I would _like_ a bus but the question is how do you mutate the existing 
IFE only node to a bus - without a big bang integration ?

There doesn't seem to be support with colleagues to gradually transition 
so we're best off making individual nodes - why BTW isn't wrong and has 
upsides - like clear separation of JPEG and IFE in this example.

---
bod

