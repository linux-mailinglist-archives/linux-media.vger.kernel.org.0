Return-Path: <linux-media+bounces-22038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1039D8C5A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9B22868E3
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 18:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3EF1B9831;
	Mon, 25 Nov 2024 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYGuk7AZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD51B652B;
	Mon, 25 Nov 2024 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560132; cv=none; b=QQpJW9n6LxlIVxk0v8JOg1pmnz7WJhDVEKQHbbXFOgdJKw4HyD8BYZsggAFzeM172kzGXsxXl13BmsotLYDPfH+xqt9Ch0RgtqWkGgHLg4bpI0p3wvJNfn62wyxdV59twrDGwck1nisEN0yoaWAGlV/L1OTRibc0B+OtAKnLpqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560132; c=relaxed/simple;
	bh=dgZ+UeCmkwK0Vijf271xrzGFo+4Ty6DrkxRMq/D+ito=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otF/RmgKuKY44kzod2xSwo8UYZYAihWN7QhmfbiegOzLIcoEa65leAFp3YqDje6AgLvKMMJ+WHxAWGWq+LlP0FaGRdjXvjsAesL8PFj+21EslFVXWSdnqfjhD1okGDcIEFkaEInTlC53F2DKOHdnlDR5s++R23L+W9BlSYofkbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYGuk7AZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so43936325e9.0;
        Mon, 25 Nov 2024 10:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732560129; x=1733164929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyafUgC9UrWMo882NxytVe254BCEEsjN5EAuC6Cx/xc=;
        b=XYGuk7AZsIVQFK8PjmqJhwF6IZk2uwmcAPmN2nxW0evCIMYAQKAnfWtV3gT3UvJTDf
         55rr/BD6w4gY/nKLZmaXeQOUE0qTJmmolTlSw+u0QnJSy6W3+U2XEQbt3k2EjJ/Fp5z/
         BueVFL/Vy+O+1nSqhEiS4u8AKj7YtBHoXqvd9uLfA7mtEXXrMBNndHoPno3L7PUZpwq4
         /YmFu1oKGf2RAItP8QLH4JimXaaad3qwHlsy09GVKnvIMyorea6suf8bUM0/LgcW3Zli
         NL0ehUuxGSeQZ8IFZU443pTJo7p6KE0sK3+G6SFYGpjsjCL1mO8nRfpR7PKW3o9bI79L
         qklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560129; x=1733164929;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyafUgC9UrWMo882NxytVe254BCEEsjN5EAuC6Cx/xc=;
        b=JzhGeFY4gf8cM3ky94i0rofxm4+ndQUWwnr/hVH1V7wiRHfgc6sZXFME0WM9bbmKFc
         gIXZAYaCo+lctj4yojaKmZrv+HAS+HG9qeM9ZmY/Cvdyot2ohbqnrVTICF1cnWpjxrSO
         uCzgP42wvOwP2ASnfMdXXQXPTXWHDQJ6FHLOxakL+03BtCAr9RAPIffqC00zjL0H5CS/
         h9vrZxpQVwWr2m80J2lkXpzYqWiQA5W9vIZmaquOHui7QN6sjYsZj6mN4ef7LakqfR5D
         +pg+q9vPYKGcH6+bAJCrIKRrAzZZx8qGMQe/guVra7G3Tf5fbLIOwWFt/dTg5/OVbjMh
         Ta6w==
X-Forwarded-Encrypted: i=1; AJvYcCU5yYrrmEHZYI64cE/F7gZwIA1s8O8Jq1RfqeHYrEu94G/vU1Ftw0WCfQ7uKc293mIEwCSn20B4+5L6IXo=@vger.kernel.org, AJvYcCXHrtIx/QhU5eWXL+H18VP9AA6epygFJXxOAzgDrVylzMQ3WhufdeS08gA7xZpk3aGKkOvG9OmkGCaCi6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3sSvuqeB1aYf8toRw4FLp3AdgxpsAGGqyiIIpxbk+b1Ibd1+
	773xWJCBeyTvaD1SOyJBNQxjFuvTIDT1Y3HLdtfEmVXJp5/3+SYZ
X-Gm-Gg: ASbGnctG+y8rHm+rEZaKULJYubPaoQ5jQ+W2ylKIrg+of2seYQJ7c4CMWIf2URpfPod
	bE8HlZWZ3A41SwnH1SSsG9T2Ou4qCcBExr6J8wC0PhuxnD4uxMnrw8vRh3iEMY9BvrHpzSuHkfL
	RUpa/w35LXpwhz76LAlReh3hZvlfqpIwM7U8OQTJ69p7HIizUvWsiWdpAk24rDfj8RiUcQ52M6S
	dNEx6bVD7tvQwMPBmhQbkB/k4PyLt0GUWtGVCCC9SC35kWdjxfT8bpH
X-Google-Smtp-Source: AGHT+IHoIAoo186eglbRk/selFUcgTV29fPopU5N4wJoqsr+aFGY1p8dnzG9pOa/nZA+pqAxJtZPrA==
X-Received: by 2002:a05:600c:3516:b0:432:d797:404a with SMTP id 5b1f17b1804b1-433ce49105emr108260885e9.22.1732560128901;
        Mon, 25 Nov 2024 10:42:08 -0800 (PST)
Received: from [192.168.0.100] ([188.24.69.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde98b4dsm138734125e9.43.2024.11.25.10.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 10:42:08 -0800 (PST)
Message-ID: <d9bc8759-f6e1-4390-b873-2ecd3f64a135@gmail.com>
Date: Mon, 25 Nov 2024 20:42:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l: subdev: Prevent NULL routes access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241122143717.173344-1-demonsingur@gmail.com>
 <Z0Q3ukermwmPax2b@kekkonen.localdomain>
 <0ff25743-30c6-4c26-955f-c4c26578ebb6@ideasonboard.com>
 <20241125120725.GI19573@pendragon.ideasonboard.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20241125120725.GI19573@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/24 2:07 PM, Laurent Pinchart wrote:
> On Mon, Nov 25, 2024 at 01:33:15PM +0200, Tomi Valkeinen wrote:
>> On 25/11/2024 10:39, Sakari Ailus wrote:
>>> On Fri, Nov 22, 2024 at 04:37:12PM +0200, Cosmin Tanislav wrote:
>>>> When using v4l2_subdev_set_routing to set a subdev's routing, and the
>>>> passed routing.num_routes is 0, kmemdup is not called to populate the
>>>> routes of the new routing (which is fine, since we wouldn't want to pass
>>>> a possible NULL value to kmemdup).
>>>>
>>>> This results in subdev's routing.routes to be NULL.
>>>>
>>>> routing.routes is further used in some places without being guarded by
>>>> the same num_routes non-zero condition.
>>>>
>>>> Fix it.
>>>
>>> While I think moving the code to copy the routing table seems reasonable,
>>> is there a need to make num_routes == 0 a special case? No memcpy()
>>> implementation should access destination or source if the size is 0.
>>
>> I think so too, but Cosmin convinced me that the spec says otherwise.
>>
>>   From the C spec I have, in "7.21.1 String function conventions":
>>
>> "
>> Where an argument declared as size_t n specifies the length of the array for a
>> function, n can have the value zero on a call to that function. Unless explicitly stated
>> otherwise in the description of a particular function in this subclause, pointer arguments
>> on such a call shall still have valid values, as described in 7.1.4.
>> "
>>
>> The memcpy section has no explicit mention that would hint otherwise.
>>
>> In 7.1.4 Use of library functions it says that unless explicitly stated
>> otherwise, a null pointer is an invalid value.
>>
>> That said, I would still consider memcpy() with size 0 always ok,
>> regardless of the src or dst, as the only memcpy implementation we need
>> to care about is the kernel's.
> 
> I was going to mention that too. The kernel C library API is modeled
> on the standard C library API, but it takes quite a few liberties.
> 
> What I think is important in the context of this patch is to ensure
> consistency in how we model our invariants. I'm less concerned about
> relying on memcpy() being a no-op that doesn't dereference pointers when
> the size is 0 (provided the caller doesn't otherwise trigger C undefined
> behaviours) than about the consistency in how we model routing tables
> with no entry. I'd like to make sure that num_routes == 0 always implies
> routes == NULL and vice versa (which may already be the case, I haven't
> checked).
> 

The following code inside v4l2_subdev_set_routing() assures that
num_routes == 0 results in routing.routes being NULL if num_routes is 0.

if (src->num_routes > 0) {
	new_routing.routes = kmemdup(src->routes, bytes, GFP_KERNEL);
	if (!new_routing.routes)
		return -ENOMEM;
}

Indeed v4l2_subdev_set_routing does not check if routing is NULL before
calling kmemdup on it as far as I can tell.

We should probably introduce a src->routes check in the above code in
the same patch since it already handles NULL access to routes.

We should also not limit src->routes to being NULL if num_routes is
NULL, since it adds unnecessary logic in the caller.

