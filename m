Return-Path: <linux-media+bounces-33037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2DABFA07
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F41B9E547A
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77E1223704;
	Wed, 21 May 2025 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEhNxhO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9E21579C;
	Wed, 21 May 2025 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841895; cv=none; b=aiJTQq5mx7je0l9+XHh1SM7EtRpFaniWTh8WlKUJMTrEnX9VAFtWO9znrY3iLgyr1/jIZZ/NuduaYAJFa6csUIQkIb2UtEVVQne2F46Yklf7Q7+iw7jCJ2MlyJgPpvoaEWCLC5AqIyfhtU1cDPbQkLyuooEAegz4xgZF2cKcmqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841895; c=relaxed/simple;
	bh=j7sDhLAJG1NCqa/6sMKvVWjsSSAhvNNZC8wGEuMPu5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsohMNCNsz5oVGdJcGgbgoBVJhESRwt1QC/1VB2Atkss3XbgnEbE4weBbJkvkCYHtVrWn9e2Bn8j8mqKx2bK9GHEbWc3dEbmS8pgBLYVlVMVLGWhkCvkwHpf9FCynZDyeU46GY/N3q0VQTEU/jjdsjdtuS3BQDLiRixXq33CLUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEhNxhO4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so8542565e87.3;
        Wed, 21 May 2025 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747841891; x=1748446691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xX1GdWOhUQkZGneOEdWqA8kdYMe8hW7mvNhj+I9O+wM=;
        b=bEhNxhO4X8MG8eEB8Qfrr7VJ6sBLkhdoUDXGQiYYQQEMYG/jZQk1EfQw3jLRg45A2F
         ZccldgAhyIB+yOrwkgoxr/8j3c4u48+Ai9z8OE5nNpkt2E9ZUyAEEhOyCGJfbIH4cBBC
         0Iupb4zP810Xbb1vai3ysljislp6nA7qegoV8Ba/ZNLMmrT35+J0mSQvkUHG/qOc+gUQ
         RGTD24ZbU3sPGT8pvNgeUzQijub5yekvb/clBfWQmVtOCAKsBDzvs9XbJg9thuJktzuq
         ZZ5O5AmneLduMUoWClaozYBs7DtEcspRKG2x5dwZ28vzZ3AJkYAb6BtzKOUAvRuGPbGU
         pMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841891; x=1748446691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xX1GdWOhUQkZGneOEdWqA8kdYMe8hW7mvNhj+I9O+wM=;
        b=wSe8xqJKqfzok3CJugvOkd878S2Khjgfq94SI7dDhU5XCS7VF5oqjVo6fWn01CqdLq
         /l7zHKlKlT8ph/GaZLBA3z89oZ3MJF9UxKCAKZy0k+LT2VDkqpZhXwt4HwIi4SHmNldZ
         UrzkANdYKRkZfry9k43zR7iEdraP+jJmExlyNrOM1QvQCvLi5+4V55YZ4M3SYxsJk4yv
         eG3OvUO4Fo1JR/UFcruy6RU8tQhWfnF8pJiqjYbmzfmVuvbE17E2m6UaQqh+ZP+MSXTU
         TluPPUdtBOlIaAxp3hi2ELHtMci1wp+O+BUQWsMjjA8bEfazTe1QLEE8NfW3lv23sXMJ
         uz1w==
X-Forwarded-Encrypted: i=1; AJvYcCXn+XL1v/fEWtAV+WqHyXFtk7DPOgqfgKGnfnAjTojncgTUgUqqqUHzWCn3se2ZVwjRmHVq8PGiKx4zG2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCX47nlBWgMtgBswb+GVFaRR05MhRoaSuUwKwiih7loAp+QVQ
	KDAhHBgGs+xZ+EHkzlyD3BvxApbTcfxEEM0rVF1s+J4dH3FDbto6hZYZ
X-Gm-Gg: ASbGncug614nQ9hLn+dIb0kKGMunGkCpkjOydrcAv+k7PZgYo53bbrybnbQwEt2p15/
	Vaf7wYB4azE2JPg5MLAFvV7DSYtSM+FxGXlfpA9BnEBkZhv0ObT2etLVRyz6VkFrZki6n71s7hh
	9c9GMDGdixqGH4o8zAezQmtT/ZpT18HATDd3Mi9TOpQyc5WsN86VZEW8MHFO6Dwi3O2nTZcpKot
	Kqu2/Zy6nBP8kz9lRC7uWqd1YxSvb4JXfswX6GAQ7wlrqOtYBidqiidHJei3i/aLDR2oub98EE6
	/5CQCD2mltrskqLdjsdKR1CwDRh1paBeY93iTmqJxdPV9xuwuoQNgf5DRrp/HdkQzKJISiB+OgC
	jzinoT7pGMpAp9q+ZD3Q6FMJsY2GyRBeDFYoyZMX2Lk+BcRPfeaPav0SNnxZpJjSVMmUhPgrOlc
	KsjNOSscalo+Bp
X-Google-Smtp-Source: AGHT+IGJk/QA3hPb0+7+lQT4VfmFwPDxyEv47UVCzN+pVXLWlFipTvOAW7WEP1E09sDDyJ2Vmg3EGw==
X-Received: by 2002:a05:6512:1049:b0:549:55df:8af6 with SMTP id 2adb3069b0e04-550e726a158mr5906365e87.53.1747841891225;
        Wed, 21 May 2025 08:38:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:53:1500:e8f4:97c2:d311:5b15? (2001-14ba-53-1500-e8f4-97c2-d311-5b15.rev.dnainternet.fi. [2001:14ba:53:1500:e8f4:97c2:d311:5b15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e9cb4d69sm2793218e87.21.2025.05.21.08.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:38:10 -0700 (PDT)
Message-ID: <8bd31e5e-9f0a-48cc-9727-d2e6475ce046@gmail.com>
Date: Wed, 21 May 2025 18:38:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
To: Bagas Sanjaya <bagasdotme@gmail.com>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, corbet@lwn.net, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-3-hannelotta@gmail.com> <aCqKNg3p_VlGbce_@archie.me>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aCqKNg3p_VlGbce_@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 5/19/25 04:32, Bagas Sanjaya wrote:
> On Sat, May 17, 2025 at 04:27:10PM +0300, Hanne-Lotta Mäenpää wrote:
>> Fix typos and improve grammar in the documentation for
>> fwctl subsystem.
>>
>> Use the word user space consistently, instead of having
>> two variants (user space vs. userspace).
>>
>> Change wording of denied behaviour to be disallowed
>> behaviour when describing the interface.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>   Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/userspace-api/fwctl/fwctl.rst
>> index fdcfe418a83f..a74eab8d14c6 100644
>> --- a/Documentation/userspace-api/fwctl/fwctl.rst
>> +++ b/Documentation/userspace-api/fwctl/fwctl.rst
>> @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set of RPCs to administer the
>>   construction of drives within the HW RAID.
>>   
>>   In the past when devices were more single function, individual subsystems would
> 
> Do you mean that devices used to be singleton in its functionality? Or having
> multiple functions?

On this line I did not include any changes. On the next line I have 
added a comma. To answer your question though, the original author may 
have meant that devices had less functionality earlier, which resulted 
in multiple implementations of the common functions, and now with a lot 
more functionality it makes sense to have a common interface for those.

> 
>> -grow different approaches to solving some of these common problems. For instance
>> +grow different approaches to solving some of these common problems. For instance,
>>   monitoring device health, manipulating its FLASH, debugging the FW,
>>   provisioning, all have various unique interfaces across the kernel.
>>   
>> <snipped>...
>>    3. Write access to function & child debug information strictly compatible with
>>       the principles of kernel lockdown and kernel integrity protection. Triggers
>> -    a kernel Taint.
>> +    a kernel taint.
> 
> Improving grammar includes s/Taint/taint/?
> 
> Confused...
> 

Here the capitalized word is not in the beginning of a sentence or a 
name, which is why lowercase would be correct.

Best regards,

Hanne-Lotta Mäenpää


