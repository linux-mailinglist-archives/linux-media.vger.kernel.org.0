Return-Path: <linux-media+bounces-4961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A07850F44
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 638EC1F226ED
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6263C101CA;
	Mon, 12 Feb 2024 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bmH7xL9d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BF101D0
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707728736; cv=none; b=m4nOTZs5nsxiYZBMHbXhlb8hqGaE5RdkEkHnoGpoE+7MsN4gzKimedZ3FXtC0PaecriA/UT6nAV94T/JL7Plp/BhqnX4ktrzF2GQeNQSjjrcgIAgTXNMeSjqwwRbIp/dbAT6E0B/zcmSLk5nrhG5ZP8NxnePtsW9zO/H7a4RyC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707728736; c=relaxed/simple;
	bh=gVkxZOW0qDNFYvxUR7rpHDkF6TSGRjxwh81qAxtr7IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhJWxsNJCX3vVYiREIzetvcMtz6XChD7J/IPOYrnYRXKaHdj21eEwXM9LQSJTS+jGXg818ydVKmbfiH+/T2x7mA3k65Nl7Tpt8RDl+FP7TvXr1v3XkOin9+ITWnpwbAT5LdxxglFkvI01rzvkwowMlJF0eJvgVEgS0XXhKfxdmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bmH7xL9d; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5116063585aso3540974e87.1
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707728733; x=1708333533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZnKAadz2mGqyTSo/WNR6RbUGVWdGOd/LAxiL7KSVdY=;
        b=bmH7xL9dROZwwSdZehl1/d/78S/8hrQVLAJI5BpCeRRcCEldsgIpC0chSR6H0+d3qA
         xUh9SF9hXuKCxqd0x9TGegrjAgp0E+Gf++JFxDQF4R0nmLekECLsONNgpRCSXo9pmq8a
         YTNnW5ycccKRgXlfcOjVIk8mVK3fibXao5oOErh69O2LS0vqEmkhx+UpCGRhM8AUEUmS
         mjhKSA9xbZAH+gTK2u/lqCnw1q26Z6N83HQ5TVXQ+iMmfV2kJDvGtZm3V2Z67MI7WAsD
         EKPhQP1fLzJhX09rXuyxe6Ue6EbLh7QneemC7bwKBmxVSNKLyC4e7A4/kwfQmNzUsKbF
         3Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707728733; x=1708333533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZnKAadz2mGqyTSo/WNR6RbUGVWdGOd/LAxiL7KSVdY=;
        b=goMlY5MMKEef0YSBCW8tMq+7aiUAE57PUvWEBIaGaAKDY7xUntzmHJugeeQGbH1ZWB
         Me+3DND/VkCh2KRfEdZDkK3Qdr0J3tPnb2Vg+zY4N1wSE6crX/NXHf0xG8BLNjs44KZR
         A7HvZ0wdF6ZPmUVUQ9Bl5G28w73nqV4+9K9sHG7REMIn7Dy9xDSVlH+CFmPSsm1YF7dw
         QRZUcxUN1gnxk3TZHGFrbsI+cAQSl+xdUXESS6ivQhXYqws59PkFjsoIKPtSLXLGhq4W
         jTAC9/7ftE73m3NMoFXilEnBhu/O1I5fJe4z1yofnIlwrOHDc0km0QwkSYISN+igxi6s
         kuTw==
X-Gm-Message-State: AOJu0Yz6BlfuLPdaQCcPhRn6KqDPyaVmdW8bcxa0e/i0d23ff7wfnDWV
	h+AtfCRP+sk5pEs6ByGwRwT16nrhD1jxLvgChYb1zbaLjeGwHP890mSJZBqFh/8=
X-Google-Smtp-Source: AGHT+IG5mnRjQlIZ27VLKJ59THK0Z0Se2SHAX8bkSt8PnxJT86zPMPDJ5WnROW0bmeffBM0F+EiPig==
X-Received: by 2002:ac2:46c9:0:b0:511:86c0:dad2 with SMTP id p9-20020ac246c9000000b0051186c0dad2mr2672727lfo.62.1707728732982;
        Mon, 12 Feb 2024 01:05:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWR2czG3Y96UGkARwGAUo7SpRzhiB+tP4Q8pXmXXuwMV2Ot7p+t0oBsmdB8kSVAPZp0rKfsbmosI0RyykH48hq3AFLQve66BOlsLztiC3o1/KMAMUIUqq0DJ3IVk7bnK+IzNfY1ct+HclF/KJ2Vpo53b4EqSuq09C40aTg1iWo8EOQUryq4mLN4/Dt/02MpnBBDjngBMVTV3lCojueD1y2VWqFTjyQBV4AvPGDAiz4KAsLdh5RUoIV3cv3JUsvfEJoIesOcn+XBvu1SbOSi52yOUcblHT4pUwTeMK7AD8XA+6er8sAcTqm6yl8FdNbrtU0y83u1dibSvv9/2LjWx95EtzSh85kqmJXpBmoKIxg1rrlodsjb1dXrvzgja4noh7V7wgf2hwtwEG9VXC6ahaLs8q0VLKj494Oz23qGgAODVy5wtJiTyeBkMEt290YkpPRvkMraCd/wmx15kiLx1ZDVLvspiH9H4ra2E/ZxapSQj8olbAxMSvWo+l7L7GGr5eiNbNrQ4uZcvp/eaaMVh2xOIG7PFa8qSSM2Fwxu/ffVj86r82Q5/GLI1eeKHCY7v+F8ZPIhcZM3
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c1d1500b00410e638357asm1140338wms.10.2024.02.12.01.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:05:32 -0800 (PST)
Message-ID: <b55f4d1e-2e77-4539-8d18-8d8f2185b501@linaro.org>
Date: Mon, 12 Feb 2024 10:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Plowman <david.plowman@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
 <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
 <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2024 09:50, Jacopo Mondi wrote:

>>> +properties:
>>> +  compatible:
>>> +    const: raspberrypi,pispbe
>>
>> Nothing more specific? No model name, no version? It's quite generic
>> compatible which in general should not be allowed. I would assume that
>> at least version of Pi could denote some sort of a model... unless
>> version is detectable?
>>
> 
> The driver matches on a version register and that should be enough to
> handle quirks which are specific to an IP revision in the driver
> itself.
> 
> Considering how minimal the integration with the SoC is (one clock, one
> interrupt and one optional iommu reference) even if we'll get future
> revisions of the SoC I don't think there will be any need to match on
> a dedicated compatible for bindings-validation purposes.
> 
> However I understand that to be future-proof it's good practice to
> allow a more flexible scheme, so we can have a generic fallback and a
> revision-specific entry.
> 
> Would
> 
>   compatible:
>     items:
>       - enum:
>         - raspberrypi,pipspbe-bcm2712

bcm2712 is manufactured by Broadcom, not Raspberry Pi, so it should be
rather Pi model?

>       - const: raspberrypi,pispbe
> 
> do in this case ?
> 
> Also, let's see what RPi think as they are certainly more informed
> than me on what a good revision-specific match could be

I am fine with auto-detection, though.

...

>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    rpi1 {
>>
>> soc {
>>
> 
> Are you sure ? This will only ever live in the 'rp1' node.

What is "rp1" node? Does not look like a generic name.


> 
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        isp: pisp_be@880000  {
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>> so: isp@
>>
>> and drop unused label
> 
> ok
> 
> Thanks
>   j
> 
> PS:
> on v6.8-rc1 I'm seeing
> 
> LINT    Documentation/devicetree/bindings
> usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files]
>                 [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v]
>                 [FILE_OR_DIR ...]
> 
> when running dt_binding_check
> 
> My setup should be reasonably up-to-date, is it me only seeing this ?

I think you need to update your yamllint.

Best regards,
Krzysztof


