Return-Path: <linux-media+bounces-19411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A674F99A04C
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 11:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44B11C2107A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C82920FA91;
	Fri, 11 Oct 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kK/SpNBV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215E20B216
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728639695; cv=none; b=Tc5l6dgbHTL7m0DfR1vnMw+Z15zZHzgbpDpaviPucJaALhknd8x0EeMZ+Eo7tdq9OeNn/wLr8wYYBBu0bjc+KomBsEohJFSMdLFKkAqspZ+HCyRRQvELAXYENIp8nrwnJfeuZZTsF5ZUiMKZLDDvg4wfKugXX72t6GRLuQzL53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728639695; c=relaxed/simple;
	bh=LB/cH7x2pzJ5VQbbrLYaY3EItf/Da6k4gcFzSYfv/e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyPdGh8GP4++tz2QPG72wsY2snbdAL0GpucVSp/FdffOwzmf+xSONPuVb429Di6o9ynPRFfRZTp3xXjJg9keGjEPZ0Iq/e6Jh/wL8IxHuR03PQZnd+Aw9VbhJ/nOTUn+CvwQPETZ0imCxKZJhkvNPrksx0WnNtWhnVR2OPtFG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kK/SpNBV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso1892927a12.3
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728639692; x=1729244492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFkvV2tZLZ/lndmyybryC8gPmrkbcqQYe/2yy1vWRjI=;
        b=kK/SpNBVJL9rjb04xMzY1+kVp5QqktPjWtjYEeYfOSGsW62AeRQFzqKsM7CXWovk1E
         q4msfv76Svs9LBH+PnfKHB/V2xRt0Va0umQSgmEgw69+HVvpt9ktL2HyY9NvCrxRspS0
         JPScdQmsgGEccAMCDG6kJrcnjhERlkeBm5AjOP6+x8qSkemiJZygFXYFYsRxUVWzcseT
         LSDVkq/wZQOs4UkMsxtKch//izFEigmWkIw23p9Y9JUGz3oQsdwWY6kArN/d0IIEo24B
         DQWvu+xjOVBn0OnRt37oCjSUoI00Y7Lij60bXdJtn9jNzF2s67dNRVsXwDK0Fw1Dw+W8
         iQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728639692; x=1729244492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFkvV2tZLZ/lndmyybryC8gPmrkbcqQYe/2yy1vWRjI=;
        b=GlD0WIzMo4tOIuBlkYMInNVvYuDRQ5n/olV1Iyp837m4eA/0BLmves1wQ3YgubGekx
         ezbfTwFTwaNjY1s5GjMAObo9l6PNMwF2YvATJ6a1cCde1FB9lU1PajyQTuu9pGFwzWMz
         ir3LPh021Wh4RafhNkzAMO0ehEuYdgZy9fV0uorEowCM8rj5DzglE8HjWys/deMmiEx8
         1BvfosS6xoCmaZGCVlq4q2jKJANFVnlbIoj4lyeNp0DUef1Kf/a8QW0NHB0DVBjusRt7
         afEBzcuLdeZKOoNyuVusgh+m2FCGyqz4EQHsnc2sLKgjq+x3hPFA4ibms4YIno557++p
         rT4w==
X-Forwarded-Encrypted: i=1; AJvYcCUoO8bFwHzIua9rVFiY44eUGrfp6PwMOoZUo/iHuuC4m8YvBAaKnQIrj7GL5pdEOqivTSJsCFVQjpuIAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZyV2Ejl75DnuBYBz4261YvHEGpwzTRwArcn00G7pdWQ/A+Ea
	CVWZvIZO32skkEJZZVuVJiwR6+R0eTeMaO4EuVotDAawVKNw7jusKUbtsUxERx8=
X-Google-Smtp-Source: AGHT+IHV0FWz8LaMOoLNl/WDkD1DXo5etIuNQysLEeSCJN2NProFBfMgBdzY2Dvu325k2nHOpuwjZw==
X-Received: by 2002:a17:907:e6df:b0:a8a:91d1:5262 with SMTP id a640c23a62f3a-a99b957fdd6mr177786666b.28.1728639691710;
        Fri, 11 Oct 2024 02:41:31 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0723sm191604066b.135.2024.10.11.02.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 02:41:31 -0700 (PDT)
Message-ID: <d394fb33-2fe4-4a5a-b6fa-7f5598aede9b@linaro.org>
Date: Fri, 11 Oct 2024 10:41:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: camss NULL-deref on power on with 6.12-rc2
To: Johan Hovold <johan@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 10:33, Johan Hovold wrote:
> Hi,
> 
> This morning I hit the below NULL-deref in camss when booting a 6.12-rc2
> kernel on the Lenovo ThinkPad X13s.
> 
> I booted the same kernel another 50 times without hitting it again it so
> it may not be a regression, but simply an older, hard to hit bug.
> 
> Hopefully you can figure out what went wrong from just staring at the
> oops and code.
> 
> Johan
> 
> 
> [    5.657860] ov5675 24-0010: failed to get HW configuration: -517

So this caused it, I guess the sensor failed to power up.

You've booted 50 times in a row and hit a corner case where the sensor 
didn't power up leading to a NULL deference.

So, two bugs I'd say.

- What is the cirumcstance where the sensor doesn't power up
- What's the NULL either entity * or entity->pad I'd say.

<snip>
> [    6.594915] Call trace:
> [    6.594915]  camss_find_sensor+0x20/0x74 [qcom_camss]
Hmm, not sure looking at what we have.

                 pad = &entity->pads[0];
                 if (!(pad->flags & MEDIA_PAD_FL_SINK))
                         return NULL;

Is pad guaranteed after entity->pads[0] ?
We dereference it like its guaranteed.

Anyway thanks for the report, should be enough start digging.

---
bod

