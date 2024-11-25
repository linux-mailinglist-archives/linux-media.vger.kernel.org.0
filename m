Return-Path: <linux-media+bounces-22052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265A9D8D74
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 21:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DC7286F48
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF401C460B;
	Mon, 25 Nov 2024 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nerOAqEp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE576F06D;
	Mon, 25 Nov 2024 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732566884; cv=none; b=Umgk6zLjYxFajzm5aeP2L/nJ0cYeYvFpLBt4q7VMzHvMCO/uXmfdnc4A3B+5ofEb80lP2qbvCInb9HBl+JPYvPAN9XLhdzzLvVGldtDqHJ4AXeZs8XE2pb6T4PQ7EV8l35uwv28Bn8y/f+sk4c38iUdK/e8jrpRE4ohbkON2hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732566884; c=relaxed/simple;
	bh=qgK+N66L526d/7ueUwt/22n9/iXSOr8rDHzyJtR5PVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKJB/VAADqnyu5UFHPz49GwHcaXYLZ8CYOxdZ6pGaQGFobiDB3OCFhfc/OkPXGdxo95J0+f/iKaVxFjELKuuANui8OgWbM425TaeeXsWnPvL52mYM9wrf2afETdQg2uf5bAYUHd6G9GLNmuDUu6zeguePkOMCZR6pJvHUxKTHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nerOAqEp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431695fa98bso41882005e9.3;
        Mon, 25 Nov 2024 12:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732566880; x=1733171680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=seLzu6YCQkey0VOHenJ3XO5JYU4Jyftw4UtfIwoRvSM=;
        b=nerOAqEpTkv/TXslqqc/W1WacQ5DzpJNuO6qTmLlgoAh2+ICoDC3c4whTOtOXgScqx
         aND5U7U/MiyCcIRxVHuUmjfr/BOzMSh0CQVSbxDYYKIU5jH1rSEjZRDDeNSissfB1Tz3
         jGmWYWUf811ZZ2pUpJbW1ggXxvjs9NVkybSy8Z1pKJxDgN3ZN5Tmv/pu/w+ljgK3Imrb
         gOUh+UD9iymXjuXk33PxgO0B2o9+FqeKsIiKaR/ojKIPBuqk5Yk5z11wSNoGJ/zug2QP
         69jyIjSdlmyQGJYwH7wyn17X40fd8X/cUwKkWludhTM6W6ud4TJR9HByYCnwE+NRS1Ki
         Ahyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732566880; x=1733171680;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seLzu6YCQkey0VOHenJ3XO5JYU4Jyftw4UtfIwoRvSM=;
        b=nC97r0jljV4GfiKAOZlPFuUD0iYAb/+wACouqeRPSyRiigYEzAbHEA1QHDo22yeFBC
         IHm4e0XoDtu/VCeVnl+94nKYCW+MHshU5U+IZW3LqJle4Vsc+7gHHUn/Sqj0bjx2kQtD
         tgC7xr5MugP8ZDb1CzJbXJ0A9h/Qg9twP+PnWDwYoz17ovoxib9fLeQgLlvsF782WR3F
         HmHH2thaG3DirWZcjrT/KzhEMxD2sSodmSzqZ6qZAzgjp7a2UYEV/gbE2NlZhjOikNk0
         q5y9k9C6y30zRQ+kDt2SCxi88oIi4ypK2bfpsl+s6iYTZHeFAEcVzKBSfexlB7yq5Ile
         X6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVD0BBaILtBxKwblfLo2FBA76Rx1NgOYxrHRfDb8JtFnaby+4WAgz1V8ajdZIh7JaD+rNxBh9pf5PRbR+0=@vger.kernel.org, AJvYcCXhaS5dCEJUzCR1VNOVCsaMdR/GsPpWI0f7ehFi2Nf8ayn6uSeLwTmBIbPPVqr5gw3+HHWpMvLV0OAh2fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSicMihev5nAAjpUVEkvCoWBwarS1p0m8uL16DNduCj7O3R55S
	1C/QCPpF+ZL4qMkkAcjiD2PHyFOqX6BMDt25WrdFkmn+3Q2ucbBZ
X-Gm-Gg: ASbGncuxKOWsP5n/XgL3D9k9/+bHtY3+Z7chThIkqvp/5og1wxUDH4+PLvlfQkdl7AU
	k9oxBK8Z8YJLXNoRP1yXSCh8t5oEXX/xFHLOVIkbUa6YVFAecQsITcJ+Sh7xsxtKuFgqFdtgm+s
	NeeDCIXMrPDkRAAkxLoTWrQKHOQwmrOVoAkX0jT0+QHzcoXlJMX1H1Nq8AmVNYOUsgtg703DITb
	tuF8ohIRWn9nK2Ao6mTjUSKk5BBUGOzNRaZDK74BZnfCpLlrvVCYkZT
X-Google-Smtp-Source: AGHT+IGwy1qt3u9b2h6NurA1wEyaEjZyYiajEr0j07vXmWM81AlA8c2QQnLmoC0rj+boMfc4TQm5DA==
X-Received: by 2002:adf:e18c:0:b0:382:5aae:87ac with SMTP id ffacd0b85a97d-38260b8966dmr11894105f8f.32.1732566879953;
        Mon, 25 Nov 2024 12:34:39 -0800 (PST)
Received: from [192.168.0.100] ([188.24.69.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedf40sm11221141f8f.98.2024.11.25.12.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 12:34:39 -0800 (PST)
Message-ID: <09aac96d-554c-400d-9ec1-c87617d9df65@gmail.com>
Date: Mon, 25 Nov 2024 22:34:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l: subdev: Use dev_err() to print errors and
 clarify
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241122153343.237308-1-demonsingur@gmail.com>
 <20241123213203.GC19573@pendragon.ideasonboard.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20241123213203.GC19573@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/24 11:32 PM, Laurent Pinchart wrote:
> Hi Cosmin,
> 
> On Fri, Nov 22, 2024 at 05:33:39PM +0200, Cosmin Tanislav wrote:
>> The error values end up being returned to userspace, it makes sense to
>> have some useful information printed when debugging them, even if the
>> reason for the errors are bad configs or internal driver issues.
>>
>> Replace dev_dbg() with dev_err() for errors.
> 
> We use dev_dbg() on purpose for all errors that can be triggered
> directly by applications. This includes in particular all pipeline
> validation errors.
> 
> The error paths in this specific patch shouldn't be in that category, as
> all the validation should have been performed before starting subdevs
> (assuming all drivers are correctly implemented, which is of course not
> a given, but those issues should be fixed). I think we could therefore
> switch to dev_err() here. However, I'm wondering what kind of issues
> triggered this patch. What errors did you run into that would have
> benefited from being reported more loudly, and were they caused by
> driver bugs or userspace misconfiguring the device ?
> 

I've had this patch in my GMSL2 tree for some time now, I believe indeed
the reasons why I've hit these error cases were the drivers being
slightly broken, but I still think it is worthwhile to show an error
message, to aid with debugging. Adding the entity name to the messages
makes it even more clear where exactly the code is breaking.

I can split it up into separate patches for dev_dbg() -> dev_err() and
adding the entity name to the print statements for V2.

>> Also, when using complex pipelines with multiple bridges between the
>> video device and multiple source sub devices, printing just the video
>> device name for each error does not provide enough context as to which
>> operation failed.
>>
>> Add sub device entity name to the messages where possible to clarify the
>> source of the errors.
> 
> This can be considered as a standalone patch.
> 
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 4f0eecd7fd66f..d51b4594d11c5 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -2303,20 +2303,21 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>>   				    &found_streams, &enabled_streams);
>>   
>>   	if (found_streams != streams_mask) {
>> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
>> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
>>   			streams_mask & ~found_streams, sd->entity.name, pad);
>>   		ret = -EINVAL;
>>   		goto done;
>>   	}
>>   
>>   	if (enabled_streams) {
>> -		dev_dbg(dev, "streams 0x%llx already enabled on %s:%u\n",
>> +		dev_err(dev, "streams 0x%llx already enabled on %s:%u\n",
>>   			enabled_streams, sd->entity.name, pad);
>>   		ret = -EALREADY;
>>   		goto done;
>>   	}
>>   
>> -	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
>> +	dev_dbg(dev, "enable streams %s:%u:%#llx\n",
>> +		sd->entity.name, pad, streams_mask);
>>   
>>   	already_streaming = v4l2_subdev_is_streaming(sd);
>>   
>> @@ -2333,8 +2334,8 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>>   	}
>>   
>>   	if (ret) {
>> -		dev_dbg(dev, "enable streams %u:%#llx failed: %d\n", pad,
>> -			streams_mask, ret);
>> +		dev_err(dev, "enable streams %s:%u:%#llx failed: %d\n",
>> +			sd->entity.name, pad, streams_mask, ret);
>>   		goto done;
>>   	}
>>   
>> @@ -2403,20 +2404,21 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>>   				    &found_streams, &enabled_streams);
>>   
>>   	if (found_streams != streams_mask) {
>> -		dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
>> +		dev_err(dev, "streams 0x%llx not found on %s:%u\n",
>>   			streams_mask & ~found_streams, sd->entity.name, pad);
>>   		ret = -EINVAL;
>>   		goto done;
>>   	}
>>   
>>   	if (enabled_streams != streams_mask) {
>> -		dev_dbg(dev, "streams 0x%llx already disabled on %s:%u\n",
>> +		dev_err(dev, "streams 0x%llx already disabled on %s:%u\n",
>>   			streams_mask & ~enabled_streams, sd->entity.name, pad);
>>   		ret = -EALREADY;
>>   		goto done;
>>   	}
>>   
>> -	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
>> +	dev_dbg(dev, "disable streams %s:%u:%#llx\n",
>> +		sd->entity.name, pad, streams_mask);
>>   
>>   	if (!use_s_stream) {
>>   		/* Call the .disable_streams() operation. */
>> @@ -2432,8 +2434,8 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>>   	}
>>   
>>   	if (ret) {
>> -		dev_dbg(dev, "disable streams %u:%#llx failed: %d\n", pad,
>> -			streams_mask, ret);
>> +		dev_err(dev, "disable streams %s:%u:%#llx failed: %d\n",
>> +			sd->entity.name, pad, streams_mask, ret);
>>   		goto done;
>>   	}
>>   
> 


