Return-Path: <linux-media+bounces-24727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3368A10F15
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38C7188A29B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 18:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20CD211A20;
	Tue, 14 Jan 2025 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaIk6jRn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D61FBEB1
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877683; cv=none; b=d31xwkPXgR2K+F2S5P/oWJnI+rOw9mEbgVMKyYIj5GTXe1rkdu1t4Zt9+DTYV+eK78prn4PK2sa1RQGzu52DgxE2yp4nWLXC6M6/OYWy8OFIHkxGgEWD4/8ddW7JsL+Jn1Dhcy3bJokisqQ4yceXg/pNXPrMD2cbTmA9mrKMUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877683; c=relaxed/simple;
	bh=J15WbASwEzR9ADVteW0AQsTzF/kWkDhIgJakrGw7qOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtSULsNW9OOUuJsJprwfQasi1s9qG6cLDytWhOeEQXB+bxkumFgn+2ityFIvt8FTpfZ7DtdwsBn0uWfeff7qt99QfcmfHuJiZG1jeICig9kJUOm+AJNTJJVtxWvoODUHOjOJIpNPKdRH/Cz/naoNy1vsftLQUiy46AED25Rr+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaIk6jRn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3c47434eso5448689e87.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 10:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736877679; x=1737482479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cju5Y6mvqeTO2cqpR/OIEtMM4g/7/RRmURfA2z2Xecg=;
        b=WaIk6jRn5iA+McsLGVal3KhsRWmfXlPFQJ8nLz8H+1oUzdH3BiWA9KjxK7SUKUzvoj
         4py0bNDc2IDQFNGuZFbpcB5uFEI/HZuZJYGIt2+0nzeftuMmKaDULad11STREqK/5KXP
         TDFfyyVhSpiu80Esrjhnt+so3Z9OGOKSRBZ7IEPRbskiYYbjfo7rnMUnV21vrSu28oMY
         EZleY1cRildCqD1zKfZje4Ghozi1QO8j/AJUSojX7LOdA1mzSXalWDajrEKqlGJYGmNi
         76WMjg9phPAzKIoAzUbrPSuHlxMGwzWgohQZ2AQpLwMTgsa7wS1k2YnWDASkKGiQAxbg
         rzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736877679; x=1737482479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cju5Y6mvqeTO2cqpR/OIEtMM4g/7/RRmURfA2z2Xecg=;
        b=vC4DaqEVI2/ALl+4qmSqW5wnr0sJ7AEfi2qroDj1xMEML3n8NVKpfRfQaRBGPtDPpk
         vFDZOSZ7z4E9MBHl3+PYTnqfkU0axwXNg/9037jQ4CbqwR1PtRsof2wrcwe29UF0WodT
         TpLDgm5QyuxCqTpI1sIPBVBhOoJ1MkHzptKcYnrVPjpbV5/60L1TaII/RCJbZg0ZuSan
         Cb8Z4rGy7WGIYbAgfErN3XBBARmsDVkBqijPZt9JHqsDCTPb/RHnzFiA02xEPp9f3U/A
         uUXNvtu3agJV2wF1ImxlYib9JBzt2DhOBsH2pdEDVlLrBoMrAdruIN0OZcLHHuh5aHBm
         je1g==
X-Forwarded-Encrypted: i=1; AJvYcCXjV4zDYihfyFfgGYnaNrg9y2sD0vMb22HRVAnTJnaaLrA7Yc69i6t5QZGVG5O0e5cQYy9EYBm6wbVhPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPTQRjwr3zGO/RjVU0+fmBJxrxOM3JORzuqcV7YxBrfil2aXb
	oxFODGhqeRwv+9PP30jd8f1AY2+BFxx6PyjmflRmsoEJGUpo1sqb
X-Gm-Gg: ASbGncsDCndYb40er6trtmhu2Lhm+7oQqE9lD4yuiCmSk7T70L+QJN3TWrPYMtkjeHm
	0onrzAXCYSg5RT+RAOxmRurKCvvoi57t8eazRmCsRwX5NjTsRwvrleDw8GMKR9zXLMCqTHSn4eC
	K1RbUNFlWDksscAAMw31SovSXVmfQ/Yii7nmV15Xplh7V1OYo7B7BiQh6IKkU0muXCuWy/wROrt
	BjxSsDWzpDR5gCrTqmeLXgOi9EhRvimt9iRk/G7e0CKkVaI89mfVlJy8F8S8An0bkcpTtj9jY2S
	5wy11KDM
X-Google-Smtp-Source: AGHT+IGwEgbnHids9nYgvMDHcSzYTQ9BXROnAH3k1VivGZ2rYT6TX0AMPYdkILOX/lqcK0Qz9GApsA==
X-Received: by 2002:a05:6512:3046:b0:542:2999:399c with SMTP id 2adb3069b0e04-542847fe788mr8313174e87.46.1736877678760;
        Tue, 14 Jan 2025 10:01:18 -0800 (PST)
Received: from [192.168.15.130] (94-240-0-14.lukman.pl. [94.240.0.14])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bf031aesm1790090e87.4.2025.01.14.10.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 10:01:17 -0800 (PST)
Message-ID: <51173416-c185-47a8-b342-04d4ba2c3625@gmail.com>
Date: Tue, 14 Jan 2025 19:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hantro H1 Encoding Upstreaming
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
 ming.qian@oss.nxp.com, linux-media <linux-media@vger.kernel.org>,
 linux-imx@nxmp.com, paulk@sys-base.io,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Gustavo Padovan <gus@collabora.com>
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


W dniu 14.01.2025 o 17:16, Nicolas Dufresne pisze:
> Hi everyone,
> 
> despite Andrzej having left the community, we are not giving up on the encoder
> work. In 2025, we aim at working more seriously on the V4L2 spec, as just

I'm glad you continue working on that. Can you define the "community" here?

Regards,

Andrzej

> writing driver won't cut it. Each class of codecs needs a general workflow spec
> similar to what we have already for stateful encoder/decoder and stateless
> decoder.
> 
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateless-decoder.html
> 
> It is on top of this, that for each codec we have to add controls (mostly
> compound) specifics and details that suites stateless accelerators.
> 
>  From a community stand point, the most important focus is to write and agree on
> spec and controls. Once we have that, vendors will be able to slowly move away
> from their custom solution, and compete on actual hardware rather then
> integration.
> 
> It is also time to start looking toward the future, since Hantro H1 is very
> limited and ancient encoder. On same brand, if someone could work on VC8000E
> shipped on IMX8M Plus, or Rockchip codecs, that will certainly help progress. We
> can also get inspiration from many other stateless encoding APIs now, notably
> VA, DXVA and Vulkan Video.
> 
> Of course, folks likes to know when this will happen, stateless decoders took 5
> years from start to the first codec being merged, hopefully we don't beat that
> record. I personally aim for producing work during the summer, and mostly focus
> on the spec. Its obvious for me that testing on H1 with a GStreamer
> implementation is the most productive, though I have strong interest in having
> an ecosystem of drivers. A second userspace implementation, perhaps ffmpeg ?,
> could also be useful.
> 
> If you'd like to take a bite, this is a good thread to discuss forward. Until
> the summer, I planned to reach to Paul, who made this great presentation [1] at
> FOSDEM last year and start moving the RFC into using these ideas. One of the
> biggest discussion is rate control, it is clear to me that modern HW integrated
> RC offloading, though some HW specific knobs or even firmware offloading, and
> this is what Paul has been putting some thought into.
> 
> If decoders have progressed so much in quality in the last few years, it is
> mostly before we have better ways to test them. It is also needed to start
> thinking how do we want to test our encoders. The stateful scene is not all
> green, with a very organic groth and difficult to unify set of encoders. And we
> have no metric of how good or bad they are either.
> 
> regards,
> Nicolas
> 
> Le lundi 13 janvier 2025 à 18:08 -0300, Daniel Almeida a écrit :
>> +cc Nicolas
>>
>>
>> Hey Adam,
>>
>>
>>>
>>> Daniel,
>>>
>>> Do you know if anyone will be picking up the H1 encoder?
>>>
>>> adam
>>>>
>>>> — Daniel
>>>>
>>>
>>
>> I think my colleague Nicolas is the best person to answer this.
>>
>> — Daniel
> 


