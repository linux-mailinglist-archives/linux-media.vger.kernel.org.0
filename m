Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BED1163D24
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 07:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgBSGmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 01:42:40 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:43305 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgBSGmj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 01:42:39 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E3E593F79D;
        Wed, 19 Feb 2020 07:42:35 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=AfhADrK7;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MomjvTK9eKdP; Wed, 19 Feb 2020 07:42:31 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 45C3C3F6FA;
        Wed, 19 Feb 2020 07:42:28 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 4AE3F36012D;
        Wed, 19 Feb 2020 07:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1582094548; bh=EbNfVbfVOJNZ8SGwCtVcWurcs/Y7hbj7D01WzwWEw3I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AfhADrK7ekrnDUh9TTTdb+JJoRRXuX4yIVbi3UKZZJk4gb/yMsuj7xta2QKCJfpnf
         x6ZTnd+96T8uj1KAMYZwQRGmWS4HIbUuh2OM6sZgbmSMIczeXVX7E+7uC+Vyv7foo1
         YP5Hzi8y3r6RKXdm7AC57P2n8PlxqzgaDJ5V+m2E=
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
Date:   Wed, 19 Feb 2020 07:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/18/20 10:01 PM, Daniel Vetter wrote:
> On Tue, Feb 18, 2020 at 9:17 PM Thomas Hellström (VMware)
> <thomas_os@shipmail.org> wrote:
>> On 2/17/20 6:55 PM, Daniel Vetter wrote:
>>> On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian König wrote:
>>>> Implement the importer side of unpinned DMA-buf handling.
>>>>
>>>> v2: update page tables immediately
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66 ++++++++++++++++++++-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
>>>>    2 files changed, 71 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> index 770baba621b3..48de7624d49c 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>>>>       return ERR_PTR(ret);
>>>>    }
>>>>
>>>> +/**
>>>> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
>>>> + *
>>>> + * @attach: the DMA-buf attachment
>>>> + *
>>>> + * Invalidate the DMA-buf attachment, making sure that the we re-create the
>>>> + * mapping before the next use.
>>>> + */
>>>> +static void
>>>> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>>>> +{
>>>> +    struct drm_gem_object *obj = attach->importer_priv;
>>>> +    struct ww_acquire_ctx *ticket = dma_resv_locking_ctx(obj->resv);
>>>> +    struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>>> +    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>> +    struct ttm_operation_ctx ctx = { false, false };
>>>> +    struct ttm_placement placement = {};
>>>> +    struct amdgpu_vm_bo_base *bo_base;
>>>> +    int r;
>>>> +
>>>> +    if (bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
>>>> +            return;
>>>> +
>>>> +    r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
>>>> +    if (r) {
>>>> +            DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);
>>>> +            return;
>>>> +    }
>>>> +
>>>> +    for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
>>>> +            struct amdgpu_vm *vm = bo_base->vm;
>>>> +            struct dma_resv *resv = vm->root.base.bo->tbo.base.resv;
>>>> +
>>>> +            if (ticket) {
>>> Yeah so this is kinda why I've been a total pain about the exact semantics
>>> of the move_notify hook. I think we should flat-out require that importers
>>> _always_ have a ticket attach when they call this, and that they can cope
>>> with additional locks being taken (i.e. full EDEADLCK) handling.
>>>
>>> Simplest way to force that contract is to add a dummy 2nd ww_mutex lock to
>>> the dma_resv object, which we then can take #ifdef
>>> CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).
>>>
>>> Now the real disaster is how we handle deadlocks. Two issues:
>>>
>>> - Ideally we'd keep any lock we've taken locked until the end, it helps
>>>     needless backoffs. I've played around a bit with that but not even poc
>>>     level, just an idea:
>>>
>>> https://cgit.freedesktop.org/~danvet/drm/commit/?id=b1799c5a0f02df9e1bb08d27be37331255ab7582
>>>
>>>     Idea is essentially to track a list of objects we had to lock as part of
>>>     the ttm_bo_validate of the main object.
>>>
>>> - Second one is if we get a EDEADLCK on one of these sublocks (like the
>>>     one here). We need to pass that up the entire callchain, including a
>>>     temporary reference (we have to drop locks to do the ww_mutex_lock_slow
>>>     call), and need a custom callback to drop that temporary reference
>>>     (since that's all driver specific, might even be internal ww_mutex and
>>>     not anything remotely looking like a normal dma_buf). This probably
>>>     needs the exec util helpers from ttm, but at the dma_resv level, so that
>>>     we can do something like this:
>>>
>>> struct dma_resv_ticket {
>>>        struct ww_acquire_ctx base;
>>>
>>>        /* can be set by anyone (including other drivers) that got hold of
>>>         * this ticket and had to acquire some new lock. This lock might
>>>         * protect anything, including driver-internal stuff, and isn't
>>>         * required to be a dma_buf or even just a dma_resv. */
>>>        struct ww_mutex *contended_lock;
>>>
>>>        /* callback which the driver (which might be a dma-buf exporter
>>>         * and not matching the driver that started this locking ticket)
>>>         * sets together with @contended_lock, for the main driver to drop
>>>         * when it calls dma_resv_unlock on the contended_lock. */
>>>        void (drop_ref*)(struct ww_mutex *contended_lock);
>>> };
>>>
>>> This is all supremely nasty (also ttm_bo_validate would need to be
>>> improved to handle these sublocks and random new objects that could force
>>> a ww_mutex_lock_slow).
>>>
>> Just a short comment on this:
>>
>> Neither the currently used wait-die or the wound-wait algorithm
>> *strictly* requires a slow lock on the contended lock. For wait-die it's
>> just very convenient since it makes us sleep instead of spinning with
>> -EDEADLK on the contended lock. For wound-wait IIRC one could just
>> immediately restart the whole locking transaction after an -EDEADLK, and
>> the transaction would automatically end up waiting on the contended
>> lock, provided the mutex lock stealing is not allowed. There is however
>> a possibility that the transaction will be wounded again on another
>> lock, taken before the contended lock, but I think there are ways to
>> improve the wound-wait algorithm to reduce that probability.
>>
>> So in short, choosing the wound-wait algorithm instead of wait-die and
>> perhaps modifying the ww mutex code somewhat would probably help passing
>> an -EDEADLK up the call chain without requiring passing the contended
>> lock, as long as each locker releases its own locks when receiving an
>> -EDEADLK.
> Hm this is kinda tempting, since rolling out the full backoff tricker
> across driver boundaries is going to be real painful.
>
> What I'm kinda worried about is the debug/validation checks we're
> losing with this. The required backoff has this nice property that
> ww_mutex debug code can check that we've fully unwound everything when
> we should, that we've blocked on the right lock, and that we're
> restarting everything without keeling over. Without that I think we
> could end up with situations where a driver in the middle feels like
> handling the EDEADLCK, which might go well most of the times (the
> deadlock will probably be mostly within a given driver, not across).
> Right up to the point where someone creates a deadlock across drivers,
> and the lack of full rollback will be felt.
>
> So not sure whether we can still keep all these debug/validation
> checks, or whether this is a step too far towards clever tricks.

I think we could definitely find a way to keep debugging to make sure 
everything is unwound before attempting to restart the locking 
transaction. But the debug check that we're restarting on the contended 
lock only really makes sense for wait-die, (and we could easily keep it 
for wait-die). The lock returning -EDEADLK for wound-wait may actually 
not be the contending lock but an arbitrary lock that the wounded 
transaction attempts to take after it is wounded.

So in the end IMO this is a tradeoff between added (possibly severe) 
locking complexity into dma-buf and not being able to switch back to 
wait-die efficiently if we need / want to do that.

/Thomas


>
> But definitely a neat idea ...
> -Daniel


