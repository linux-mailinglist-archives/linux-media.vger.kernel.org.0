Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0D31FC80F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgFQH6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 03:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgFQH6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 03:58:07 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15613C061755
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 00:58:06 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id a3so1000854oid.4
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X+Qtu+2ZAyZXkh/oo1Lz6E9/PFmVPHRpkYwfH9QQzoY=;
        b=Rnq7BerEC1NJ+s3KJhsfuws9Kg+j4pWFkQJLmI518tzrC8znQHM1y1XOVL+e9QQvGC
         mOcEQIpeKlQI3Ch0XEzDajgEy3Ss5YB513C5XhgrGC29v//2jcdDFh59xMl7mJC4egNc
         wZOOJ+JmjjXVx9gZJsvcArI7aR28zLTWFwR6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+Qtu+2ZAyZXkh/oo1Lz6E9/PFmVPHRpkYwfH9QQzoY=;
        b=RWn+jVRgCnlpum9OZeXv3boCAEZwI/wk3AtAEv+TPP3pY/F2smQjvydcsDuh933DjO
         w74kNUkHxOyHWJ/CP80jHZwi0a+Ym72mZc2bMdVRoGPdzprV7L8h8QdldSWv3uUCgERy
         o42GIQY9DxtOUv+eLWKkiol9aaNgwjnGYS3MJiPT7dhOlTHZhRL0+9j3TovBT/qV8OdK
         5afhzGqvPOSu6TY/kzuaK9XF8Nw1J5cNU+0bGgKONeoMj/UlU5zROE5OYe8W76rCDce8
         11MBYRrwVb5WdCrKCaubNBiSrhyiDzfUT7sNecA00zd68IDy8dmz7GAuOugJr09GR5KA
         9psA==
X-Gm-Message-State: AOAM531SOcOJK9fZcS8bd43kB2C1IKZNKeAaM8jXYaSHw2mLQCbzFdtU
        5fLR/ejsx157Rlqb6q9M6Gq0sn7/OWVJor1MdHVsbw==
X-Google-Smtp-Source: ABdhPJyg/qc6FJuRZYZqNNd5IMYVmnKGSrITOouFVSzC2Mh6TfEGJcQ4YwgOLOvW4cWrgZZvjXq69o3dCj+ez8idqyo=
X-Received: by 2002:aca:ed42:: with SMTP id l63mr6006514oih.101.1592380685425;
 Wed, 17 Jun 2020 00:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch> <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local> <20200616145312.GC6578@ziepe.ca>
In-Reply-To: <20200616145312.GC6578@ziepe.ca>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 17 Jun 2020 09:57:54 +0200
Message-ID: <CAKMK7uER6ax1zr14xYLKqDfDZp+ycBsY9Yx7JaVkKQ849VfSPg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 17, 2020 at 9:27 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jun 16, 2020 at 02:07:19PM +0200, Daniel Vetter wrote:
> > > > I've pinged a bunch of armsoc gpu driver people and ask them how much this
> > > > hurts, so that we have a clear answer. On x86 I don't think we have much
> > > > of a choice on this, with userptr in amd and i915 and hmm work in nouveau
> > > > (but nouveau I think doesn't use dma_fence in there).
> > >
> > > Right, nor will RDMA ODP.
> >
> > Hm, what's the context here? I thought RDMA side you really don't want
> > dma_fence in mmu_notifiers, so not clear to me what you're agreeing on
> > here.
>
> rdma does not use dma_fence at all, and though it is hard to tell, I
> didn't notice a dma_fence in the nouveau invalidation call path.

Nouveau for compute has hw page faults. It doesn't have hw page faults
for non-compute fixed function blocks afaik, so there's a hybrid model
going on. But nouveau also doesn't support userspace memory (instead
of driver-allocated buffer objects) for these fixed function blocks,
so no need to have a dma_fence_wait in there.

> At the very least I think there should be some big warning that
> dma_fence in notifiers should be avoided.

Yeah I'm working on documentation, and also the notifiers here
hopefully make it clear it's massive pain. I think we could even make
a hard rule that dma_fence in mmu notifier outside of drivers/gpu is a
bug/misfeature.

Might be a good idea to add a MAINTAINERS entry with a K: regex
pattern, so that you can catch such modifiers. We do already have such
a pattern for dma-fence, to catch abuse. So if you want I could type
up a documentation patch for this, get your and others acks and the
dri-devel folks would enforce that the dma_fence_wait madness doesn't
leak beyond drivers/gpu

> Ie it is strange that the new totally-not-a-gpu drivers use dma_fence,
> they surely don't have the same constraints as the existing GPU world,
> and it would be annoying to see dma_fence notifiers spring up in them

If you mean drivers/misc/habanalabs, that's going to get taken care of:


commit ed65bfd9fd86dec3772570b0320ca85b9fb69f2e
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon May 11 11:11:42 2020 +0200

    habanalabs: don't set default fence_ops->wait

    It's the default.

    Also so much for "we're not going to tell the graphics people how to
    review their code", dma_fence is a pretty core piece of gpu driver
    infrastructure. And it's very much uapi relevant, including piles of
    corresponding userspace protocols and libraries for how to pass these
    around.

    Would be great if habanalabs would not use this (from a quick look
    it's not needed at all), since open source the userspace and playing
    by the usual rules isn't on the table. If that's not possible (because
    it's actually using the uapi part of dma_fence to interact with gpu
    drivers) then we have exactly what everyone promised we'd want to
    avoid.

    Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
    Reviewed-by: Oded Gabbay <oded.gabbay@gmail.com>
    Signed-off-by: Oded Gabbay <oded.gabbay@gmail.com>

Oded has agreed to remove the dma-fence usage, since they really don't
need it (and all the baggage that comes with it), plain old completion
is enough for their use. This use is also why I added the regex to
MAINTAINERS, so that in the future we can catch people who try to use
dma_fence because it looks cute and useful, and are completely
oblivious to all the pain and headaches involved.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
