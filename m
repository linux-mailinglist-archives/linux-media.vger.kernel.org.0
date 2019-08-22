Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D497198F49
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732126AbfHVJ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:27:45 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:53220 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730111AbfHVJ1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:27:45 -0400
Received: by mail-wm1-f47.google.com with SMTP id o4so4911247wmh.2
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g7ZZbN3DUy71dVoz0z0l3baVtDJM3rxcrjy1vNmPfVU=;
        b=uJpX8ORywghR9QAwS5D6S84vB77KNlKjR4KfhhahVmm45/7ioU4XfVf83RwXdXSBS6
         H8zRLwmLc9Y+3s4DRZt2Mv33gynVF1xD/miLs7pC7+CgCzIGrh5co46FUGhfeOiCP+GW
         jnwFpW6XArlcpwDaH7dSBzZFT/cHCNWvn3y4u07Edow/7L3sBy25fe9teppzeUfZnbMj
         PQsIsVNhKZ3UYmkRTYoqVtth80TZ441/vI5pOyHXXQHDm8ShMLC0HnNghm19Exu+7miv
         OWKfAeoNMYPWK6JYAV4phCbug5iOE/2LFjUJYnF94WAXZXlhtiLVPoUzVAqs3MIgcehD
         AOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=g7ZZbN3DUy71dVoz0z0l3baVtDJM3rxcrjy1vNmPfVU=;
        b=qMiYpxrRctZFIzrRxwlIItJ/p6Xk/t94iAN4vQoPzGz21lZuWY6PBXTkgbXZNHlYKN
         zESpW0PVDD89fGUBrkhKBx0u7D1qAwUK+atYvKkU7nUwqqwlf81cwFZyckh8aEt9Xs1s
         4KQs15h8KFHcRVo9D7y5UPAWR8zpSLn8j2xz6/J2bZx84Re2baQDNtL3TuZzpLj+64RQ
         gSgb8wV/5sxjaynuAFNmz03s54PpKfh/mR6K89NIigUkTmCoEfRd3kIMS0EfbZkEILbt
         VZmE0oxnZdzm8PmsItUKZgboeL7k2elOUTtCH2stppKi0rd3HWvyICjbipGJtTuHdJUm
         /5Dw==
X-Gm-Message-State: APjAAAX2h/mJt8Xen6P8VOAJKRD7XlotKZd0hwfPXUMt4n3Wa6Rm0piJ
        Y0f1GXG+NVhSqtki6ReNCByK8zXF
X-Google-Smtp-Source: APXvYqyH289Vwwcr1q/gdvWBZ90Qsk1anSmEsRmuhIkpXYGXYw04I9pscORliBaigIf167Zj9ioJDA==
X-Received: by 2002:a05:600c:24d0:: with SMTP id 16mr4956693wmu.83.1566466062565;
        Thu, 22 Aug 2019 02:27:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id g26sm2252015wmh.32.2019.08.22.02.27.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 02:27:42 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [RFC] replacing dma_resv API
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821161327.GO11147@phenom.ffwll.local>
 <20190821200534.GS11147@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1b75c744-5e23-2f9b-4a0a-69d92c8e15be@gmail.com>
Date:   Thu, 22 Aug 2019 11:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821200534.GS11147@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.08.19 um 22:05 schrieb Daniel Vetter:
> On Wed, Aug 21, 2019 at 06:13:27PM +0200, Daniel Vetter wrote:
>> On Wed, Aug 21, 2019 at 02:31:37PM +0200, Christian König wrote:
>>> Hi everyone,
>>>
>>> In previous discussion it surfaced that different drivers use the shared
>>> and explicit fences in the dma_resv object with different meanings.
>>>
>>> This is problematic when we share buffers between those drivers and
>>> requirements for implicit and explicit synchronization leaded to quite a
>>> number of workarounds related to this.
>>>
>>> So I started an effort to get all drivers back to a common understanding
>>> of what the fences in the dma_resv object mean and be able to use the
>>> object for different kind of workloads independent of the classic DRM
>>> command submission interface.
>>>
>>> The result is this patch set which modifies the dma_resv API to get away
>>> from a single explicit fence and multiple shared fences, towards a
>>> notation where we have explicit categories for writers, readers and
>>> others.
>>>
>>> To do this I came up with a new container called dma_resv_fences which
>>> can store both a single fence as well as multiple fences in a
>>> dma_fence_array.
>>>
>>> This turned out to actually be even be quite a bit simpler, since we
>>> don't need any complicated dance between RCU and sequence count
>>> protected updates any more.
>>>
>>> Instead we can just grab a reference to the dma_fence_array under RCU
>>> and so keep the current state of synchronization alive until we are done
>>> with it.
>>>
>>> This results in both a small performance improvement since we don't need
>>> so many barriers any more, as well as fewer lines of code in the actual
>>> implementation.
>> I think you traded lack of barriers/retry loops for correctness here, see
>> reply later on. But I haven't grokked the full thing in details, so easily
>> might have missed something.
>>
>> But high level first, and I don't get this at all. Current state:
>>
>> Ill defined semantics, no docs. You have to look at the implementations.
>>
>> New state after you patch series:
>>
>> Ill defined semantics (but hey different!), no docs. You still have to
>> look at the implementations to understand what's going on.
>>
>> I think what has actually changed (aside from the entire implementation)
>> is just these three things:
>> - we now allow multiple exclusive fences
> This isn't really new, you could just attach a dma_fence_array already to
> the exclusive slot. So not really new either.

Correct, the problem is really that in this case we still wouldn't have 
a clear semantic what means which.

>> - exclusive was renamed to writer fences, shared to reader fences
> Bit more context why I think this is a pure bikeshed: We've had (what at
> least felt like) a multi-year bikeshed on what to call these, with the two
> options writer/readers and exclusive/shared. Somehow (it's not documented,
> hooray) we ended up going with exlusive/shared. Switching that over to the
> other bikeshed again, still without documenting what exactly you should be
> putting there (since amdgpu still doesn't always fill out the writer,
> because that's not how amdgpu works), feels really silly.

I simple haven't change the implementation in amdgpu because I wanted to 
negotiated what we are actually going to do first.

>> - there's a new "other" group, for ... otherwordly fences?
> I guess this is to better handle the amdkfd magic fence, or the vm fences?

Both, this is simply for fences which doesn't participate in implicit 
synchronization at all.

> Still no idea since not used.
>
> One other thing I've found while trying to figure out your motivation here
> (since I'm not getting what you're aiming) is that setting the exclusive
> fence through the old interface now sets both exclusive and shared fences.
>
> I guess if that's all (I'm assuming I'm blind) we can just add a "give me
> all the fences" interface, and use that for the drivers that want that.
>
>> Afaiui we have the following to issues with the current fence semantics:
>> - amdgpu came up with a totally different notion of implicit sync, using
>>    the owner to figure out when to sync. I have no idea at all how that
>>    meshes with multiple writers, but I guess there's a connection.
>> - amdkfd does a very fancy eviction/preempt fence. Is that what the other
>>    bucket is for?
>>
>> I guess I could read the amdgpu/ttm code in very fine detail and figure
>> this out, but I really don't see how that's moving stuff forward.
>>
>> Also, I think it'd be really good to decouple semantic changes from
>> implementation changes, because untangling them if we have to revert one
>> or the other is going to be nigh impossible. And dma_* is not really an
>> area where we can proudly claim that reverts don't happen.
> I think we should go even further with this, and start earlier.
>
> step 1: Document the current semantics.

I don't think that this is a good idea, because we don't have a clear 
current semantics.

What we have is a container with fences and no definition what those 
fences mean.

We would just spend a lot of time and documenting that we messed it up 
with no gain at all.

The aim of this patch set is to:
a) replace the current container with something which can be re-used 
multiple times.
b) actually define what the fences in the container actually mean.

I mixed those two goals up in a single patch and you are absolutely 
correct that this wasn't a good idea, going to fix that for the next 
iteration.

Maybe it becomes clearer then what I try to do here,
Christian.

> Once we have that, we can look at the amdkfd and amdgpu vm stuff and
> whatever else there is, and figure out what's missing. Maybe even throw in
> the exact thing you're doign in amdkfd/gpu into the above documentation,
> in an effort to cover what's done. I can add some entertaining things from
> i915's side too :-)
>
> And I mean actual real docs that explain stuff, not oneliner kerneldocs
> for functions and that's it. Without that I think we'll just move in
> circles and go nowhere at all.
> -Daniel

