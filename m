Return-Path: <linux-media+bounces-33121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B30AC0C0C
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95C694E09C9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 12:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C8B28BA98;
	Thu, 22 May 2025 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fY+U8YtJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA47286415
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918671; cv=none; b=P927u9914bW2CJLsUoQosp61VTL//hUCotrneBz8apzPOeB6Rhb4tioAGm03potzYo7AL3NijVQ6mCLBs4BZb1O5FGQo/pIZHTneAGks/Cog5BDTwI+w+KbR4VIUs3Chp2McUyxG5IvGG8NCfFulXjVt8UtTb3ohb5kqUcpYLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918671; c=relaxed/simple;
	bh=D4dk659ElIXA7Fq5aXgCg81eo2vzP5vztZe+qk+vjPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eY0Cmjg7HJBog15GKL0bCSohq1vDNaq4ahk17qn5ARjTXQ74oMHpFw3zNVy3hbTTTZjqOaaH4cU0HB6eWXCQKfBbYsEkzl8pCd+QKMXRBnK7YoloS9PQOvUfh6LKGl1HSGWdmtA7yl6e9Ibg65lNcHm95GyqKaFyc+mLvoVGuV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=fY+U8YtJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a375888297so2925071f8f.1
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747918667; x=1748523467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
        b=fY+U8YtJOgKcxqZtmGGE0JOZeapbjRGVAGp6vzDSey5Dydte3xV/ljH0FY6QcB0ofg
         Vz2CE6Pba2tRhw70QEvXXVCPAy11gWKEX+NiVa3/ytnT23zSRJ6CpID4NT2gl2wT3Lml
         Skt/M3Tht+I+BzKTUZ00cOl0E/b9dsZezP4/mOdA78jWrlCseCKaYABMT5tByNbaivs0
         vYKJLR1xIcB9sDo6S84GJeZQ4w/NrLUTARsjwckMfyiuejAqd2TzTtANgCeViUJQH/js
         ImOnNMNuT4ZLKtHgmFVlujTAhCqVujAtQqKzGwL3wNKqiL8muVErNeniUEQR02tOnJ59
         F2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918667; x=1748523467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
        b=OA6ionKHbwUaQkKjLbDifDg9TK4MC3Q3eK4dARUFxBbdFCe3w9U0ncKPayTKS8sIzM
         LyQqJo89VCOTn6RMuLmYmKONPS3yZYpo3XNuI4EDQNHJZOVvZpchWfItgnFGidg55Q68
         r1/YR5XzfmQWtRKRT+kQTgWfR8riT/x1B5xjg04+3OFyNAFtrtOM6wj6iBlPSDvbUU2J
         hgQ14wtfFrha8xnp98X64w6+zEroxYTjH7T+4ITkePTHiyEStm8IJkxs/I5RpuA1lHYx
         OkgKeV5zY7+YYiUij0zVxMEa//JfGDzk9wFqJKVRVMZEqdhkcG4v6h/HWNh+Echlkclx
         tlig==
X-Forwarded-Encrypted: i=1; AJvYcCXt98XtKyLNY4Pyr+2YQBEr6pR93WaAPtsysdhmuHNzO4JG4BomCOER+6vAJAzt7s8vmzDQ/CgNojNIyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsbwCgRIwAJiGEu71AiNXUmPC29CW3HCBheigiy6+GT/bkFV5r
	+4NTd+DSD/+tGt0LAN5Smq8FzIep0EWZAS4XEQ11GtplHB/9nQ76VdAPotEan9To0IU=
X-Gm-Gg: ASbGncuR0ijT6W64GnpLWA6X2pKjqkzrKZWHacVZs2II9D3h6K/7LvlNHvDiJxGHatl
	fvcVU/34DIkgXAzmZ0TgRn+ANEJUIrLYDzj65SMf1ubv516kPxLRw/yhx2/U4h2uFjeg2yZ7di4
	lje7EXRJPaaMfaGmB6LdEOUyR60aT00BdbaiDUdbRqu6wQQWdXfoqDNirwQNaF5yY7MtIgYK7MF
	7nH9vUIUPiIjLeosS2I1syeQMhmEQY+27aMJD0apBfeGITW2ZpZrQstiAo9bvL8UQoHmY6wktkq
	00f2xqKA/SNVh8V9IIiElvcsifeo85TORLKnc63Wj2P/1JlEDZG5m8oA7pnQUs0uQA==
X-Google-Smtp-Source: AGHT+IHvgtQQC0r16ZhryOrtlBzgjmQhsHS0R3Z6+yIPce93CHi+ORR3bGFByrXrywpyK9wgMjlkUA==
X-Received: by 2002:a05:6000:40dd:b0:3a3:7816:3e17 with SMTP id ffacd0b85a97d-3a378163e38mr12097933f8f.8.1747918666820;
        Thu, 22 May 2025 05:57:46 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6210asm22857327f8f.41.2025.05.22.05.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:57:46 -0700 (PDT)
Message-ID: <096c06b8-2cb6-4231-93aa-7091ea558e22@ursulin.net>
Date: Thu, 22 May 2025 13:57:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/05/2025 13:34, Christian König wrote:
> On 5/22/25 14:20, Philipp Stanner wrote:
>> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>>> On 5/22/25 13:25, Philipp Stanner wrote:
>>>> dma_fence_is_signaled_locked(), which is used in
>>>> nouveau_fence_context_kill(), can signal fences below the surface
>>>> through a callback.
>>>>
>>>> There is neither need for nor use in doing that when killing a
>>>> fence
>>>> context.
>>>>
>>>> Replace dma_fence_is_signaled_locked() with
>>>> __dma_fence_is_signaled(), a
>>>> function which only checks, never signals.
>>>
>>> That is not a good approach.
>>>
>>> Having the __dma_fence_is_signaled() means that other would be
>>> allowed to call it as well.
>>>
>>> But nouveau can do that here only because it knows that the fence was
>>> issued by nouveau.
>>>
>>> What nouveau can to is to test the signaled flag directly, but that's
>>> what you try to avoid as well.
>>
>> There's many parties who check the bit already.
>>
>> And if Nouveau is allowed to do that, one can just as well provide a
>> wrapper for it.
> 
> No, exactly that's what is usually avoided in cases like this here.
> 
> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> 
> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> 
> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

But why? Say for example scheduler dependencies - why the scheduler 
couldn't ignore them at add time, but it can before trying to install a 
callback on them, and instead has to opportunistically signal someone 
else's fences?

I don't see it. But even if there is a reason, advantage of the helper 
is that it can document this at a centralised place.

Regards,

Tvrtko

>> That has the advantage of centralizing the responsibility and
>> documenting it.
>>
>> P.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> index d5654e26d5bc..993b3dcb5db0 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>>> nouveau_fence_chan *fctx, int error)
>>>>   
>>>>   	spin_lock_irqsave(&fctx->lock, flags);
>>>>   	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
>>>> {
>>>> -		if (error && !dma_fence_is_signaled_locked(&fence-
>>>>> base))
>>>> +		if (error && !__dma_fence_is_signaled(&fence-
>>>>> base))
>>>>   			dma_fence_set_error(&fence->base, error);
>>>>   
>>>>   		if (nouveau_fence_signal(fence))
>>>
>>
> 


