Return-Path: <linux-media+bounces-39070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D78B8B1DD30
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 20:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934A318913CA
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 18:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E36219A8A;
	Thu,  7 Aug 2025 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YR7JxWEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A961C258A
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592052; cv=none; b=B3JUov737icPp7W39rWoq3atzNJ8mOon0bdv7c88TNMDCl6hF+EXeTc1r7kIQ9JMvHAZqIZzyyK+GT6UEYNxCw3u5ef7ny2yjmniKNGAB48JJWjHgRvZu18uygFgi8ecZi3YnbV7MQTAEBs8I6FMNCRndFrdSYhdW+nyI5AAv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592052; c=relaxed/simple;
	bh=i3aP6A/MxuAB3Zt7C+xzxPLkUUuAStt1/hot+djOP8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sX5EhahIshrkK1/mI6SoG17dgLgbpPZh+k+zep/lNTQfbqHGaoc5C5oMYhc3bAw7nJMA6lZ2hqFzL55Pfj8F9td3kVM2VVYNLsHHlFlMJsgclgcH80GyTK4zFVGa1/idX04BJBLsjwzkARHzD6++W01L7ibWNWpL8DJ9Kv7Z0aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YR7JxWEy; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e3ef0024acso11576805ab.0
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 11:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754592049; x=1755196849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XERiuoNAWPSGK7EG1EKcaSMoPUBK2/kua/o26DD/qk4=;
        b=YR7JxWEy1FbbD2lJIAfRulKLjaT90Lb4ClG3h4D8XA60hhq6jHiPDCceB0ndcFfAuT
         JbF8YiWpbavSbfFzscHQn7tURqjKNrBNzs3i7JwMpLGWHBYBA0bQGlRVOyFsGhpOZXZm
         QNa6A83NJYWS6RjjgJZnUh+yzzcvNeHtVrLXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754592049; x=1755196849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XERiuoNAWPSGK7EG1EKcaSMoPUBK2/kua/o26DD/qk4=;
        b=tdN6eGzNEBCHT08gjvYhj+L8Klt6lwVzeH5hyi+V+tRJ1yw6fXXRLzCV+7/ZGdkiK+
         EWtkdsj9MAe+lRznSXvgJL7vQUQVLLsxWWUciJ/POKs2Vrr6D03j7S2sC+lbHkQInePk
         c/jreT9b1Y8xfe8vDupf9+Ut2GZpeY30gjwQxp/X3b0kyxg6vQulPFVzJxE37k45u3fh
         TKjHpPUTUWTRaOxloR0n7cQuiLL+OGlR6/Hoz2b58azU8OpEKwiaGjjQEXFOZklyChVf
         VKIy61StIVOuEY14WBIv3BhiRqpWhR5QMq5UJtZp6GtbUEVIkiOwC6f5gZwZ9fPTSx0j
         vS7w==
X-Forwarded-Encrypted: i=1; AJvYcCW4ElFE7vbHVY/qmpq7xbUGdGA7CiIhig0Mjy7yC3oYkHQZIxitn81mRe9WjfSALZUDLA6jR4tYuBA9Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLLeqJYI2jCxYebrApUKf/ppnkld4oL9URde1JW7JCNWHJYNd
	PkHahIjWMRcU/VbcNvBEuyT2DQK7fK5QVgaPJPXNO4hVkCkftMlHKG2u9drsQW1ytJo=
X-Gm-Gg: ASbGncvES++YrumPWV1AhEVUccik1pkd5FdXOJsD99/7fTzPyKFXPxjZUQX4MVkSDuh
	2aRDH6pCCgEBp91Y7dzAssMyyZ59FMQuPtbUVOzDqp+I9oeNrKX+0L6oPiO0LfTIlZ7WWJSZUr7
	h51yCiQlAvYob6IUwiZ3vfjIZ/MwN9dg9ooR4aksdF4GY6ixaOr/Y8WHiV6cDkWADCKa5uOmWDL
	eZXFM4fyp3z7WVYopEcbN9Jx/tHLmUZ3ERTKPWwms/MFj3gHEmYT5HjYr1ZU49YnE1IRxnCin6i
	5kK+4qbZLNklhR9A0PqyvqPNvo0yWTZ9r4DYiKfFAkwzJ5NxXLVQs7kwMXYiicBtHzitEGcRDYM
	W5mnmiBCgG0YgUjXNvfIP9gsveenrUQHVyQ==
X-Google-Smtp-Source: AGHT+IEoPUIs8QXxDDX65uueSQcuOznUJ1A7kJhXS34684tBvm94g8joM6RL35rGIzOjEg7hyzRFAQ==
X-Received: by 2002:a05:6e02:198e:b0:3e2:c5ff:382 with SMTP id e9e14a558f8ab-3e5249ab86bmr68723065ab.5.1754592049349;
        Thu, 07 Aug 2025 11:40:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e402acacf1sm73867425ab.39.2025.08.07.11.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 11:40:48 -0700 (PDT)
Message-ID: <b2430686-3da9-4fb9-8f91-5bb7da1920b0@linuxfoundation.org>
Date: Thu, 7 Aug 2025 12:40:48 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Log driver load in uvc_probe function
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Imene Jaziri <imenjazirii18@gmail.com>, linux-media@vger.kernel.org,
 hansg@kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250801145326.28560-1-imenjazirii18@gmail.com>
 <20250801150430.GC4906@pendragon.ideasonboard.com>
 <452a1263-2ec3-4174-9082-078445e67637@foss.st.com>
 <20250807081408.GB11583@pendragon.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250807081408.GB11583@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/7/25 02:14, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> (CC'ing Shuah)
> 
> On Thu, Aug 07, 2025 at 09:53:41AM +0200, Benjamin Mugnier wrote:
>> On 8/1/25 17:04, Laurent Pinchart wrote:
>>> On Fri, Aug 01, 2025 at 03:53:26PM +0100, Imene Jaziri wrote:
>>>> Add a pr_info() in the uvc_probe function to trace when the
>>>> uvcvideo driver is loaded. This is for learning purposes.
>>>
>>> What part of the learning instructions you are following instructed you
>>> to submit this patch to kernel mailing lists ? We are regularly spammed
>>> by similar patches, which indicates the instructions are not clear
>>> enough.
>>>
>>
>> I got curious too. It comes from the Linux Foundation training LFD103
>> [1]. Chapter 8 describes this patch pretty much, and chapter 9 describes
>> how to send the patch, but with a warning not to do so :
>>
>>    [...]
>>    At this time, you can run:
>>
>>    git format-patch -1 <commit ID> --to=maintainer1 --to=maintainer2
>> --cc=maillist1 --cc=maillist2
>>
>>    This will generate a patch.
>>
>>    Important Note:
>>    Please note that this is just an example. Don’t send this patch upstream.
>>
>>    You can revert this commit now.
>>
>>    Please refer to the Select the recipients for your patch section in
>> the Submitting patches: the essential guide to getting your code into
>> the kernel document.
>>
>>    When you have your own patch ready for submittal, you can follow this
>> example process to generate the patch and send it upstream using the
>> following command:
>>
>>    git send-email <patch_file>
>>    [...]
> 
> Imene provided me with that information in private.
> 
>> Looking at it I guess it's pretty easy to miss the note.
> 
> Yes, reading the text, I really can't blame the people training the
> course for missing it. It's a bit like if a mushroom foraging book said
> 
> - go pick those red mushrooms with white dots on the cap in the forest
> - cut them in pieces, pan-fry them with butter
> - add a couple of eggs, salt and pepper to make an omelette
> - the dish is ready ! enjoy your meal !
> - you won't be eating that, it's poisonous. throw it away
> 
> :-)
> 
>> Maybe
>> requesting to add '--dry-run' to the git send-email command could be a
>> simple fix to prevent from copy/pasting ?

No question that the material is confusing. The material is in
a publicly available fee course.

> 
> I've contacted Shuah, who told me she updated the training material.
> Hopefully we'll soon stop getting such patches.

It is fixed now and the spam should stop. This course has been in
use for 6 years, this is the first time we are seeing spam.

Sorry for the oversight that resulted in spam.

thanks,
-- Shuah

