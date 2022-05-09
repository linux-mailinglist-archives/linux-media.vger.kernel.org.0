Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B867D51F51B
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 09:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbiEIHDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 03:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbiEIHAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 03:00:44 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5A21498C3
        for <linux-media@vger.kernel.org>; Sun,  8 May 2022 23:56:46 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id n10so24907069ejk.5
        for <linux-media@vger.kernel.org>; Sun, 08 May 2022 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Uq2DhAFu4Cg4UFP594g3Fp+5VGJkH4S95/a8MfzJx7M=;
        b=GbY8CFQpGULE/DlHQnQp/taRU+BgKU/ngdqdKa3BLxzHNlZiot4Sn6NwmVn+uQXkt2
         ektG4W349/xOsUcaKyWDv+NH9tK3JjlqnTyuxMPpsMMXqdJsFZ1ZZhRNS0Gb80BSrCuh
         fBi54iNq/0feObvpOM+x74o8gtf0SBY1Vg7tPC17xhUpI3n8W1q3IQH4Nmk2UMz/NPbO
         e3yk+JbdG6g2IjZKxHbt49VDPeTO10zI7+RArUAE4/YzEy5JYFf2ce7s/dYG5KkU79dm
         QzvtX8/NRdmg3tuwgrIv6XdAeVmty60GOrMi2+pJ2agZ76qs+Y4YehFpa1iLN6sH263X
         P5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Uq2DhAFu4Cg4UFP594g3Fp+5VGJkH4S95/a8MfzJx7M=;
        b=kEaurjmYx2dy8crzOyDnFv2L4eQN8g4QD8k56guNLWWXgh5G3pg7KAhHSmr1e7Nhku
         mWF7W68aLWUxSOSHGMwFi4oqQxUrx/bJ8rosuJq8Ul4HS6Ui3hQesKiyGG6woWuV+3yB
         qm/NT229BoAwTjkyyJ9Eqnc3Te4ZtTva2nHynHpR7NDQqP8i3ViKxpVJyYTjFeimKtjX
         8xY14xjKK8Bv9GwX13KyrDZ9zNns40tBSSbc2QPBWuEqfUUknJuBvmNYD4biVUC92OOI
         VEOidSgeQ0xi0D/Q0DBa5ZDds6FKetZUif++YYcY3Bbnw2MV5FHXVUxAO+ZVLV980djO
         h76g==
X-Gm-Message-State: AOAM5306O21uX8i45x86vuXZN347RXXWHfJ0NpR6Dx/U1prwNITEO62j
        5n31E8346Lk5OLblfWiLvSk=
X-Google-Smtp-Source: ABdhPJzWIlwjPvKjr7JP2olqRlmmXwTeurwvfJnbxgDOkUMJKIMCvHbrbHRjBGUUw6elgQKQKQlwfg==
X-Received: by 2002:a17:906:4741:b0:6f4:3f05:3941 with SMTP id j1-20020a170906474100b006f43f053941mr13053937ejs.691.1652079403832;
        Sun, 08 May 2022 23:56:43 -0700 (PDT)
Received: from [192.168.178.21] (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
        by smtp.gmail.com with ESMTPSA id t13-20020a056402524d00b0041d527833b9sm5899120edd.3.2022.05.08.23.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 May 2022 23:56:43 -0700 (PDT)
Message-ID: <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
Date:   Mon, 9 May 2022 08:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Tackling the indefinite/user DMA fence problem
Content-Language: en-US
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     jason@jlekstrand.net, daniels@collabora.com, skhawaja@google.com,
        maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YnJQs1iusrBvpuMs@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.05.22 um 12:08 schrieb Daniel Vetter:
> On Mon, May 02, 2022 at 06:37:07PM +0200, Christian König wrote:
>> Hello everyone,
>>
>> it's a well known problem that the DMA-buf subsystem mixed
>> synchronization and memory management requirements into the same
>> dma_fence and dma_resv objects. Because of this dma_fence objects need
>> to guarantee that they complete within a finite amount of time or
>> otherwise the system can easily deadlock.
>>
>> One of the few good things about this problem is that it is really good
>> understood by now.
>>
>> Daniel and others came up with some documentation:
>> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
>>
>> And Jason did an excellent presentation about that problem on last years
>> LPC: https://lpc.events/event/11/contributions/1115/
>>
>> Based on that we had been able to reject new implementations of
>> infinite/user DMA fences and mitigate the effect of the few existing
>> ones.
>>
>> The still remaining down side is that we don't have a way of using user
>> fences as dependency in both the explicit (sync_file, drm_syncobj) as
>> well as the implicit (dma_resv) synchronization objects, resulting in
>> numerous problems and limitations for things like HMM, user queues
>> etc....
>>
>> This patch set here now tries to tackle this problem by untangling the
>> synchronization from the memory management. What it does *not* try to do
>> is to fix the existing kernel fences, because I think we now can all
>> agree on that this isn't really possible.
>>
>> To archive this goal what I do in this patch set is to add some parallel
>> infrastructure to cleanly separate normal kernel dma_fence objects from
>> indefinite/user fences:
>>
>> 1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some
>> existing driver defines). To note that a certain dma_fence is an user
>> fence and *must* be ignore by memory management and never used as
>> dependency for normal none user dma_fence objects.
>>
>> 2. The dma_fence_array and dma_fence_chain containers are modified so
>> that they are marked as user fences whenever any of their contained
>> fences are an user fence.
>>
>> 3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be
>> used with indefinite/user fences and separates those into it's own
>> synchronization domain.
>>
>> 4. The existing dma_buf_poll_add_cb() function is modified so that
>> indefinite/user fences are included in the polling.
>>
>> 5. The sync_file synchronization object is modified so that we
>> essentially have two fence streams instead of just one.
>>
>> 6. The drm_syncobj is modified in a similar way. User fences are just
>> ignored unless the driver explicitly states support to wait for them.
>>
>> 7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers
>> can use to indicate the need for user fences. If user fences are used
>> the atomic mode setting starts to support user fences as IN/OUT fences.
>>
>> 8. Lockdep is used at various critical locations to ensure that nobody
>> ever tries to mix user fences with non user fences.
>>
>> The general approach is to just ignore user fences unless a driver
>> stated explicitely support for them.
>>
>> On top of all of this I've hacked amdgpu so that we add the resulting CS
>> fence only as kernel dependency to the dma_resv object and an additional
>> wrapped up with a dma_fence_array and a stub user fence.
>>
>> The result is that the newly added atomic modeset functions now
>> correctly wait for the user fence to complete before doing the flip. And
>> dependent CS don't pipeline any more, but rather block on the CPU before
>> submitting work.
>>
>> After tons of debugging and testing everything now seems to not go up in
>> flames immediately and even lockdep is happy with the annotations.
>>
>> I'm perfectly aware that this is probably by far the most controversial
>> patch set I've ever created and I really wish we wouldn't need it. But
>> we certainly have the requirement for this and I don't see much other
>> chance to get that working in an UAPI compatible way.
>>
>> Thoughts/comments?
> I think you need to type up the goal or exact problem statement you're
> trying to solve first. What you typed up is a solution along the lines of
> "try to stuff userspace memory fences into dma_fence and see how horrible
> it all is", and that's certainly an interesting experiment, but what are
> you trying to solve with it?

Well, good point. I explained to much how it works, but now why.

In general I would describe the goal as: Providing a standard kernel 
infrastructure for user fences.

> Like if the issue is to enable opencl or whatever, then that's no problem
> (rocm on amdkfd is a thing, same maybe without the kfd part can be done
> anywhere else). If the goal is to enable userspace memory fences for vk,
> then we really don't need these everywhere, but really only in drm_syncobj
> (and maybe sync_file).

Yes, having an in kernel representation for vk user space fences is one 
of the goals.

And I was going back and forth if I should rather come up with a new 
structure for this or use the existing dma_fence with a flag as well.

I've decided to go down the later router because we have quite a lot of 
existing functionality which can be re-used. But if you have a good 
argument that it would be more defensive to come up with something 
completely new, I'm perfectly fine with that as well.

> If the goal is specifically atomic kms, then there's an entire can of
> worms there that I really don't want to think about, but it exists: We
> have dma_fence as out-fences from atomic commit, and that's already
> massively broken since most drivers allocate some memory or at least take
> locks which can allocate memory in their commit path. Like i2c. Putting a
> userspace memory fence as in-fence in there makes that problem
> substantially worse, since at least in theory you're just not allowed to
> might_faul in atomic_commit_tail.

Yes, that's unfortunately one of the goals as well and yes I completely 
agree on the can of worms. But I think I've solved that.

What I do in the patch set is to enforce that the out fence is an user 
fence when the driver supports user in fences as well.

Since user fences doesn't have the memory management dependency drivers 
can actually allocate memory or call I2C functions which takes locks 
which have memory allocation dependencies.

Or do I miss some other reason why you can't fault or allocate memory in 
atomic_commit_tail? At least lockdep seems to be happy about that now.

> If the goal is to keep the uapi perfectly compatible then your patch set
> doesn't look like a solution, since as soon as another driver is involved
> which doesn't understand userspace memory fences it all falls apart. So
> works great for a quick demo with amd+amd sharing, but not much further.
> And I don't think it's feasible to just rev the entire ecosystem, since
> that kinda defeats the point of keeping uapi stable - if we rev everything
> we might as well also rev the uapi and make this a bit more incremental
> again :-)

Yes, unfortunately the uapi needs to stay compatible as well and yes 
that means we need to deploy this to all drivers involved.

We at least need to be able to provide a stack on new hardware with (for 
example) Ubuntu 18.04 without replacing all the userspace components.

What we can replace is the OpenGL stack and if necessary libdrm, but not 
(for example) the X server and most likely not the DDX in some cases.

The same applies with surfaceflinger and to some extend Wayland as well.

Regards,
Christian.

>
> There's probably more to ponder here ...
>
> I'm not sure what exactly the problem statement is that matches your
> solution here though, so that seems to be missing.
> -Daniel

