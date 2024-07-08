Return-Path: <linux-media+bounces-14691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A64929CD8
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 09:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7EC81C20F81
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 07:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6C01CAB1;
	Mon,  8 Jul 2024 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8pOyX+e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6937BA930;
	Mon,  8 Jul 2024 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422859; cv=none; b=XsHFTkaefgHvxjhg6axjIaHPg5Szo8eMVsMO2wbZKDOauUJc2xLhADyp1iujTBIPayYMimK7jLylX66mSvsSdV5cpjSjhDcERatB6/JtCOvPLFCU/2iqTrRWksC+c6iXhXs39I+ge3/L/muImnhi+574A4z5Vn/EC/OkSlXdC3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422859; c=relaxed/simple;
	bh=jVPnjWFbFGgUdHE2F4RhwvmCDFOLH7C7z7xHSp2YNA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sgMuxyiK26gHKVm3kyqFd+vCO7Ec89BVBpxPHtpUO/x3+JtSZ8w7bAB9ThigNZdAGzjY34QG2uBo1mnZ27ErEzrWMYT9COfTX31kkOEMXHNXwMqMgmBxuzxYra585Bedhf3M2NOkKA2wZS/6Ti2680Iz8sR6WZ4eqVFN3v4tzr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8pOyX+e; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42662d80139so7550995e9.0;
        Mon, 08 Jul 2024 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720422856; x=1721027656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vcpZKxffh1BIPbGttr7eH91nbmnE8KOM65bYeiW3Qyg=;
        b=F8pOyX+eDvuTEUcG+d+rK0oBEd6m6dr2p+aT8ifpS5a1oJJNFoCof7ihahKI/7B5g2
         Br5uGW/DU4QT8naN65O4Hlg6ZiVIQNs2MxBuIzpqX3mRO2fRDebvTaOMARxqZt518c5/
         EYOCxwehjPA/QrzuwqBFt+Fa/yswLe0zj/WE9OnZ0iM8WnFADqIjVc7m+XJhU+oc/xs/
         nyMEDZXalPEdG9aNkaIsDV9hvDeVSEhZgxjWCdkwKFdBTHzfovMeFdvts3WJeOJsS//t
         EYSNVHZrn9hLQYvLID6WnToX/ELQlFkAdDTb4Qpa3mE35W1jq7b6A5yiKYAAEsfz/KbK
         IASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422856; x=1721027656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcpZKxffh1BIPbGttr7eH91nbmnE8KOM65bYeiW3Qyg=;
        b=Xb1UAzGaNz3imfGm130838yLn1zdiSWXz2AIY7+STDrfASq/pJO6t7h8lQxc3BoGyF
         vtPkamikk+1NzqRnMfTqm9rBgQmP/W0XUAMvCnLhpC1VKzJaLM0GURL+Nxx9FNpyOa1B
         MQXtsO1icOSWAOzL5f4lUCcp/fu5hpL43Y15jg6hl/lyACA2dOjEkQrqi8kECc8WxV10
         ZcY6AdiRa8ZbSYn0Vg57/5s2Hbvd4eFx2DG9GHt1YKe5Xno2h38dA/yqM7skz3xibE6I
         JpXF3GXha8Ypic4ctDRHe1kU4Rhvn+ABaaRs3z3xHBYuTit8vR0a46fXwZsN8sqa0t2h
         Oumw==
X-Forwarded-Encrypted: i=1; AJvYcCVUdLWkXshs0+QAK85PJWOt1s7qX+8FidJp2/kHEj5MOuyYG2nXa+KQGQdPx3DN5vy0iMG0lqLM9lShK+x9jkz7pmUwhZtPXaZfu0LUhOiaemnAz1ifZi5Qkca2owqo3ByZ17pvlwZA+cqgu4skqrPgNFCNvcEcnQ3i616/vmefbZzgZcCP
X-Gm-Message-State: AOJu0YwTq5vgYAkVyb0SdxD2UtXyPedVZEKlfJuYsvTdiH/0ow98Qw1a
	1HiWVzA7yvnqvxY2WpU3iBlbHRdv0wxwNF/106hDyKol+h8lzO3yCeoa8g==
X-Google-Smtp-Source: AGHT+IE7rimd7KEtTYGAglzE1thSHNWtvzIpA30fmoas+DNLkSTy3PEkmPXIgmyCB2YCS+utG0lcoA==
X-Received: by 2002:a05:600c:20c:b0:426:65bf:5cc2 with SMTP id 5b1f17b1804b1-42665bf5d8bmr23951935e9.1.1720422855227;
        Mon, 08 Jul 2024 00:14:15 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2519a4sm151263255e9.35.2024.07.08.00.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 00:14:14 -0700 (PDT)
Message-ID: <41859b82-fe75-451a-9e13-fec254bdaad5@gmail.com>
Date: Mon, 8 Jul 2024 09:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH 0/8] dma-buf: heaps: Support
 carved-out heaps and ECC related-flags
To: Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, John Stultz <jstultz@google.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier"
 <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
 <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
 <ZogSxHFPt8SpOa0w@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZogSxHFPt8SpOa0w@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.07.24 um 17:35 schrieb Daniel Vetter:
> Just figured I'll jump in on one detail here.
>
> On Fri, Jul 05, 2024 at 04:31:34PM +0200, Thierry Reding wrote:
>> On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
>>> On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
>>>> On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
>>>>>> On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
>>>>>>> On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
>>>>>>>> On Thu, May 16, 2024 at 3:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>> On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
>>>>>>>>>> But it makes me a little nervous to add a new generic allocation flag
>>>>>>>>>> for a feature most hardware doesn't support (yet, at least). So it's
>>>>>>>>>> hard to weigh how common the actual usage will be across all the
>>>>>>>>>> heaps.
>>>>>>>>>>
>>>>>>>>>> I apologize as my worry is mostly born out of seeing vendors really
>>>>>>>>>> push opaque feature flags in their old ion heaps, so in providing a
>>>>>>>>>> flags argument, it was mostly intended as an escape hatch for
>>>>>>>>>> obviously common attributes. So having the first be something that
>>>>>>>>>> seems reasonable, but isn't actually that common makes me fret some.
>>>>>>>>>>
>>>>>>>>>> So again, not an objection, just something for folks to stew on to
>>>>>>>>>> make sure this is really the right approach.
>>>>>>>>> Another good reason to go with full heap names instead of opaque flags on
>>>>>>>>> existing heaps is that with the former we can use symlinks in sysfs to
>>>>>>>>> specify heaps, with the latter we need a new idea. We haven't yet gotten
>>>>>>>>> around to implement this anywhere, but it's been in the dma-buf/heap todo
>>>>>>>>> since forever, and I like it as a design approach. So would be a good idea
>>>>>>>>> to not toss it. With that display would have symlinks to cma-ecc and cma,
>>>>>>>>> and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
>>>>>>>>> SoC where the display needs contig memory for scanout.
>>>>>>>> So indeed that is a good point to keep in mind, but I also think it
>>>>>>>> might re-inforce the choice of having ECC as a flag here.
>>>>>>>>
>>>>>>>> Since my understanding of the sysfs symlinks to heaps idea is about
>>>>>>>> being able to figure out a common heap from a collection of devices,
>>>>>>>> it's really about the ability for the driver to access the type of
>>>>>>>> memory. If ECC is just an attribute of the type of memory (as in this
>>>>>>>> patch series), it being on or off won't necessarily affect
>>>>>>>> compatibility of the buffer with the device.  Similarly "uncached"
>>>>>>>> seems more of an attribute of memory type and not a type itself.
>>>>>>>> Hardware that can access non-contiguous "system" buffers can access
>>>>>>>> uncached system buffers.
>>>>>>> Yeah, but in graphics there's a wide band where "shit performance" is
>>>>>>> defacto "not useable (as intended at least)".
>>>>>>>
>>>>>>> So if we limit the symlink idea to just making sure zero-copy access is
>>>>>>> possible, then we might not actually solve the real world problem we need
>>>>>>> to solve. And so the symlinks become somewhat useless, and we need to
>>>>>>> somewhere encode which flags you need to use with each symlink.
>>>>>>>
>>>>>>> But I also see the argument that there's a bit a combinatorial explosion
>>>>>>> possible. So I guess the question is where we want to handle it ...
>>>>>> Sorry for jumping into this discussion so late. But are we really
>>>>>> concerned about this combinatorial explosion in practice? It may be
>>>>>> theoretically possible to create any combination of these, but do we
>>>>>> expect more than a couple of heaps to exist in any given system?
>>>>> I don't worry too much about the number of heaps available in a given
>>>>> system, it would indeed be fairly low.
>>>>>
>>>>> My concern is about the semantics combinatorial explosion. So far, the
>>>>> name has carried what semantics we were supposed to get from the buffer
>>>>> we allocate from that heap.
>>>>>
>>>>> The more variations and concepts we'll have, the more heap names we'll
>>>>> need, and with confusing names since we wouldn't be able to change the
>>>>> names of the heaps we already have.
>>>> What I was trying to say is that none of this matters if we make these
>>>> names opaque. If these names are contextual for the given system it
>>>> doesn't matter what the exact capabilities are. It only matters that
>>>> their purpose is known and that's what applications will be interested
>>>> in.
>>> If the names are opaque, and we don't publish what the exact
>>> capabilities are, how can an application figure out which heap to use in
>>> the first place?
>> This would need to be based on conventions. The idea is to standardize
>> on a set of names for specific, well-known use-cases.
>>
>>>>>> Would it perhaps make more sense to let a platform override the heap
>>>>>> name to make it more easily identifiable? Maybe this is a naive
>>>>>> assumption, but aren't userspace applications and drivers not primarily
>>>>>> interested in the "type" of heap rather than whatever specific flags
>>>>>> have been set for it?
>>>>> I guess it depends on what you call the type of a heap. Where we
>>>>> allocate the memory from, sure, an application won't care about that.
>>>>> How the buffer behaves on the other end is definitely something
>>>>> applications are going to be interested in though.
>>>> Most of these heaps will be very specific, I would assume.
>>> We don't have any specific heap upstream at the moment, only generic
>>> ones.
>> But we're trying to add more specific ones, right?
>>
>>>> For example a heap that is meant to be protected for protected video
>>>> decoding is both going to be created in such a way as to allow that
>>>> use-case (i.e. it doesn't make sense for it to be uncached, for
>>>> example) and it's also not going to be useful for any other use-case
>>>> (i.e. there's no reason to use that heap for GPU jobs or networking,
>>>> or whatever).
>>> Right. But also, libcamera has started to use dma-heaps to allocate
>>> dma-capable buffers and do software processing on it before sending it
>>> to some hardware controller.
>>>
>>> Caches are critical here, and getting a non-cacheable buffer would be
>>> a clear regression.
>> I understand that. My point is that maybe we shouldn't try to design a
>> complex mechanism that allows full discoverability of everything that a
>> heap supports or is capable of. Instead if the camera has specific
>> requirements, it could look for a heap named "camera". Or if it can
>> share a heap with other multimedia devices, maybe call the heap
>> "multimedia".
>>
>> The idea is that heaps for these use-cases are quite specific, so you
>> would likely not find an arbitrary number of processes try to use the
>> same heap.
> Yeah the idea to sort this out was to have symlinks in sysfs from the
> device to each heap. We could then have priorities for each such link, so
> that applications can pick the "best" heap that will work with all
> devices. Or also special links for special use-cases, like for a
> display+render drm device you might want to have separate links for the
> display and the render-only use-case.
>
> I think trying to encode this all into the name of a heap without linking
> it to the device is not going to work well in general.
>
> We still have that entire "make sysfs symlinks work for dma-buf heaps" on
> our todos, and that idea is almost as old as dma-buf itself :-/

I still have the draft patches for that lying around on my harddisk 
somewhere with zero time to look into it.

If anybody wants to pick it up feel free to ping me, but be aware that 
you need to write more documentation than code.

Regards,
Christian.

> -Sima


