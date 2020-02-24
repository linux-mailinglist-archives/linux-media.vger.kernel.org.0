Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 864A516B1D2
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 22:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgBXVLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 16:11:10 -0500
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:47400 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbgBXVLK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 16:11:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 57E073F405;
        Mon, 24 Feb 2020 22:11:07 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=p6641goU;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id L0CohpgLZcrE; Mon, 24 Feb 2020 22:11:06 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 377FD3F3F8;
        Mon, 24 Feb 2020 22:11:03 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 711BB360161;
        Mon, 24 Feb 2020 22:11:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1582578663; bh=zRGhG19geIcw0C2+kLiix3NQfLVNZmZoqSBS7rSc4Ug=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=p6641goUrGWQh44HhUU5w0CEXG3IlDRWl8Gs5V7EOJEJSW9tCqBh1trALmXY8F7A4
         AADbseN5Ya2uzLEUpa8NwECJFpYta78yGKw7rUj7R0nuKs/QdHIuevLNRRKLkSvARp
         d7PjqKBist5TE7dZSZ/vULfnwMqmCutHyb1FAnW0=
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
 <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
 <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <73b6d3db-4263-5bad-5d56-dbaacba000b3@shipmail.org>
Date:   Mon, 24 Feb 2020 22:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/24/20 7:46 PM, Christian König wrote:
> Am 23.02.20 um 17:54 schrieb Thomas Hellström (VMware):
>> On 2/23/20 4:45 PM, Christian König wrote:
>>> Am 21.02.20 um 18:12 schrieb Daniel Vetter:
>>>> [SNIP]
>>>> Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly 
>>>> degenerating
>>>> into essentially a global lock. But only when there's actual 
>>>> contention
>>>> and thrashing.
>>>
>>> Yes exactly. A really big problem in TTM is currently that we drop 
>>> the lock after evicting BOs because they tend to move in again 
>>> directly after that.
>>>
>>> From practice I can also confirm that there is exactly zero benefit 
>>> from dropping locks early and reacquire them for example for the VM 
>>> page tables. That's just makes it more likely that somebody needs to 
>>> roll back and this is what we need to avoid in the first place.
>>
>> If you have a benchmarking setup available it would be very 
>> interesting for future reference to see how changing from WD to WW 
>> mutexes affects the roll back frequency. WW is known to cause 
>> rollbacks much less frequently but there is more work associated with 
>> each rollback.
>
> Not of hand. To be honest I still have a hard time to get a grip on 
> the difference between WD and WW from the algorithm point of view. So 
> I can't judge that difference at all.

OK. I don't think a detailed understanding of the algorithms is strictly 
necessary, though. If we had had a good testcase we'd just have to 
change DEFINE_WD_CLASS in dma-resv.c to DEFINE_WW_CLASS and benchmark 
relevant figures.


>
>>> Contention on BO locks during command submission is perfectly fine 
>>> as long as this is as lightweight as possible while we don't have 
>>> trashing. When we have trashing multi submission performance is best 
>>> archived to just favor a single process to finish its business and 
>>> block everybody else.
>>
>> Hmm. Sounds like we need a per-manager ww_rwsem protecting manager 
>> allocation, taken in write-mode then there's thrashing. In read-mode 
>> otherwise. That would limit the amount of "unnecessary" locks we'd 
>> have to keep and reduce unwanted side-effects, (see below):
>
> Well per-manager (you mean per domain here don't you?)
yes.
> doesn't sound like that useful because we rarely use only one domain,

Well the difference to keeping all locks would boil down to:
"Instead of keeping all locks of all bos we evict from thrashing 
domains, keep locks of all thrashing domains in write mode". This means 
that for domains that are not thrashing, we'd just keep read locks.


> but I'm actually questioning for quite a while if the per BO lock 
> scheme was the right approach.
>
> See from the performance aspect the closest to ideal solution I can 
> think of would be a ww_rwsem per user of a resource.
>
> In other words we don't lock BOs, but instead a list of all their 
> users and when you want to evict a BO you need to walk that list and 
> inform all users that the BO will be moving.
>
> During command submission you then have the fast path which rather 
> just grabs the read side of the user lock and check if all BOs are 
> still in the expected place.
>
> If some BOs were evicted you back off and start the slow path, e.g. 
> maybe even copy additional data from userspace then grab the write 
> side of the lock etc.. etc...
>
> That approach is similar to what we use in amdgpu with the per-VM BOs, 
> but goes a step further. Problem is that we are so used to per BO 
> locks in the kernel that this is probably not doable any more.

I think we need some-sort of per-bo lock to protect bo metadata. But 
yes, relying solely on them to resolve other resource (domain) 
contention may not be (or rather probably isn't) the right choice.

>
>>> Because of this I would actually vote for forbidding to release 
>>> individual ww_mutex() locks in a context.
>>
>> Yes, I see the problem.
>>
>> But my first reaction is that this might have undersirable 
>> side-effects. Let's say somebody wanted to swap the evicted BOs out?
>
> Please explain further, I off hand don't see the problem here.

Lets say thread A evicts a lot of thread B's bos, and keeps the locks of 
those bos for a prolonged time. Then thread C needs memory and wants to 
swap out thread B's bos. It can't, or at least not during a certain 
delay because thread A unnecessarily holds the locks.

>
> In general I actually wanted to re-work TTM in a way that BOs in the 
> SYSTEM/SWAPABLE domain are always backed by a shmem file instead of 
> the struct page array we currently have.

That would probably work well if there are no SYSTEM+write-combined 
users anymore. Typically in the old AGP days, you wouldn't change 
caching mode when evicting from write-combine AGP to SYSTEM because of 
the dead slow wbinvd() operation.
>
>> Or cpu-writes to them causing faults, that might also block the 
>> mm_sem, which in turn blocks hugepaged?
>
> Mhm, I also only have a higher level view how hugepaged works so why 
> does it grabs the mm_sem on the write side?

If I understand it correctly, it's needed when collapsing PMD 
directories to huge PMD pages. But this was merely an example. For this 
particular case the RETRY mechanism in the TTM fault handler we've 
discussed before will try reasonably hard to release the mmap_sem when 
sleeping on a bo lock.

Thanks,
Thomas



>
> Thanks,
> Christian.
>
>>
>> Still it's a fairly simple solution to a problem that seems otherwise 
>> hard to solve efficiently.
>>
>> Thanks,
>> Thomas
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> -Daniel
>>
>>

