Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37B04519C8F
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 12:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347888AbiEDKMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 06:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347886AbiEDKMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 06:12:31 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC2825E9C
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 03:08:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id kq17so1927142ejb.4
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rDvB+eR1HPDPBgGgQVQu2odCTv9ee9o4/T9uHCg8jP4=;
        b=A56yDbl+jbM/gnxspFPWnGAYTEb0RqS2FzO7zYJrM+jL5V5PQog7tdfOOGVGOgj3g3
         74+mk4+8V5EvHB0v9xnXL2vZ6c1GpJtriJSGRQJWqXrHbhfpUI8mqVMqX/wilUanQVUA
         eT/ihO+r2X13yIcZwGtoxlBc5OH19/1ypIFW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rDvB+eR1HPDPBgGgQVQu2odCTv9ee9o4/T9uHCg8jP4=;
        b=6d4Q+1QTsg9dBtAhmKdAWrwUGQu9YAAaJaSqq7MTw3BHG4V1SxMldyLD8cW5rWzxHy
         6gooBZiM5ofsE5lVBJg8t3bCCWm8dzjjwfz665GiDgRnNN8TZXy7k1YlClRlRszzfxRG
         wnpGDG3kId4sDwAOrVfq/c5wDmbD121AUXTCX2zpaN2zBtQVh+KzskEt7b+A8dZEJ5Jj
         8vcXknjCzZdVdGAqws7ZNQecAd7lgaonvYh6w7JT09lwwgLB5eKaarpS+qgl0QnT4lmK
         rBJC7hCBX1SoUsB98RebGHT5of+K45MhKBpSHfR0/Qf/dZVdsq8h95pdUrLLyDdEDUPZ
         aZbQ==
X-Gm-Message-State: AOAM530rwVWtjq6Vb+BWhs5GNjTlPI06oH4jp6EpsQJDyokQVRnOiBah
        I6LqBeCcgYxwq0ZTZ2wqdbXW/w==
X-Google-Smtp-Source: ABdhPJwbjPuToa2SnetpxbPrTynYxAMYWjdHnaxw0b3HqZFbxYlHD3SMrwyEcKnvnOumNHYnDaOB8g==
X-Received: by 2002:a17:907:2064:b0:6f4:3f07:c76e with SMTP id qp4-20020a170907206400b006f43f07c76emr13671217ejb.462.1651658933850;
        Wed, 04 May 2022 03:08:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id hz19-20020a1709072cf300b006f3ef214df7sm5618514ejc.93.2022.05.04.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 03:08:53 -0700 (PDT)
Date:   Wed, 4 May 2022 12:08:51 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <YnJQs1iusrBvpuMs@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 02, 2022 at 06:37:07PM +0200, Christian König wrote:
> Hello everyone,
> 
> it's a well known problem that the DMA-buf subsystem mixed
> synchronization and memory management requirements into the same
> dma_fence and dma_resv objects. Because of this dma_fence objects need
> to guarantee that they complete within a finite amount of time or
> otherwise the system can easily deadlock.
> 
> One of the few good things about this problem is that it is really good
> understood by now.
> 
> Daniel and others came up with some documentation:
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
> 
> And Jason did an excellent presentation about that problem on last years
> LPC: https://lpc.events/event/11/contributions/1115/
> 
> Based on that we had been able to reject new implementations of
> infinite/user DMA fences and mitigate the effect of the few existing
> ones.
> 
> The still remaining down side is that we don't have a way of using user
> fences as dependency in both the explicit (sync_file, drm_syncobj) as
> well as the implicit (dma_resv) synchronization objects, resulting in
> numerous problems and limitations for things like HMM, user queues
> etc....
> 
> This patch set here now tries to tackle this problem by untangling the
> synchronization from the memory management. What it does *not* try to do
> is to fix the existing kernel fences, because I think we now can all
> agree on that this isn't really possible.
> 
> To archive this goal what I do in this patch set is to add some parallel
> infrastructure to cleanly separate normal kernel dma_fence objects from
> indefinite/user fences:
> 
> 1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some
> existing driver defines). To note that a certain dma_fence is an user
> fence and *must* be ignore by memory management and never used as
> dependency for normal none user dma_fence objects.
> 
> 2. The dma_fence_array and dma_fence_chain containers are modified so
> that they are marked as user fences whenever any of their contained
> fences are an user fence.
> 
> 3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be
> used with indefinite/user fences and separates those into it's own
> synchronization domain.
> 
> 4. The existing dma_buf_poll_add_cb() function is modified so that
> indefinite/user fences are included in the polling.
> 
> 5. The sync_file synchronization object is modified so that we
> essentially have two fence streams instead of just one.
> 
> 6. The drm_syncobj is modified in a similar way. User fences are just
> ignored unless the driver explicitly states support to wait for them.
> 
> 7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers
> can use to indicate the need for user fences. If user fences are used
> the atomic mode setting starts to support user fences as IN/OUT fences.
> 
> 8. Lockdep is used at various critical locations to ensure that nobody
> ever tries to mix user fences with non user fences.
> 
> The general approach is to just ignore user fences unless a driver
> stated explicitely support for them.
> 
> On top of all of this I've hacked amdgpu so that we add the resulting CS
> fence only as kernel dependency to the dma_resv object and an additional
> wrapped up with a dma_fence_array and a stub user fence.
> 
> The result is that the newly added atomic modeset functions now
> correctly wait for the user fence to complete before doing the flip. And
> dependent CS don't pipeline any more, but rather block on the CPU before
> submitting work.
> 
> After tons of debugging and testing everything now seems to not go up in
> flames immediately and even lockdep is happy with the annotations.
> 
> I'm perfectly aware that this is probably by far the most controversial
> patch set I've ever created and I really wish we wouldn't need it. But
> we certainly have the requirement for this and I don't see much other
> chance to get that working in an UAPI compatible way.
> 
> Thoughts/comments?

I think you need to type up the goal or exact problem statement you're
trying to solve first. What you typed up is a solution along the lines of
"try to stuff userspace memory fences into dma_fence and see how horrible
it all is", and that's certainly an interesting experiment, but what are
you trying to solve with it?

Like if the issue is to enable opencl or whatever, then that's no problem
(rocm on amdkfd is a thing, same maybe without the kfd part can be done
anywhere else). If the goal is to enable userspace memory fences for vk,
then we really don't need these everywhere, but really only in drm_syncobj
(and maybe sync_file).

If the goal is specifically atomic kms, then there's an entire can of
worms there that I really don't want to think about, but it exists: We
have dma_fence as out-fences from atomic commit, and that's already
massively broken since most drivers allocate some memory or at least take
locks which can allocate memory in their commit path. Like i2c. Putting a
userspace memory fence as in-fence in there makes that problem
substantially worse, since at least in theory you're just not allowed to
might_faul in atomic_commit_tail.

If the goal is to keep the uapi perfectly compatible then your patch set
doesn't look like a solution, since as soon as another driver is involved
which doesn't understand userspace memory fences it all falls apart. So
works great for a quick demo with amd+amd sharing, but not much further.
And I don't think it's feasible to just rev the entire ecosystem, since
that kinda defeats the point of keeping uapi stable - if we rev everything
we might as well also rev the uapi and make this a bit more incremental
again :-)

There's probably more to ponder here ...

I'm not sure what exactly the problem statement is that matches your
solution here though, so that seems to be missing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
