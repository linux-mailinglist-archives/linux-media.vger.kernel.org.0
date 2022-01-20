Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6245494CEA
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 12:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbiATL2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 06:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiATL2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 06:28:21 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE1BC06173F
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 03:28:21 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id v10-20020a4a244a000000b002ddfb22ab49so2045517oov.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uYSWNCpwj3EcDVRlvDI+HMEzXe1EebRtVZ3sqUOfrPA=;
        b=lca+zkQHFZo9+SysCeuiwXqjoKM1gFgSJJRO0ctrKrS81y/ZBqQRmjwgnIOQ7wOZwD
         KtobN6qSJorsFSKsJwcN8mKO7GC20B5L35QPU3rcLVX9o8Ef7Lz75ZVJD50XTrd+nqMo
         QnFyy3mbfH3oR9l2ThxU3puk7E10Z5HCMggfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uYSWNCpwj3EcDVRlvDI+HMEzXe1EebRtVZ3sqUOfrPA=;
        b=aQFajgm/71ev7d4o2/lgHnwxEih1FVRikkY7vGqr2gBCwHaZuYH7bU2ui9S3wUKHyk
         8gFAfp+rmzOHfKxhnSLwN4Cdx0b8YEXRklw77t6DMUKS1wqs8KOZT85MPBChhulBLBi0
         Bolqlf2VbbRMC8GeG8nzBULxaDC3azR5loDVgLpBdueKRwAUJUOfjmhQ4J7jkSlI9FqM
         SL4LBHjn/kuv8JJtw0mhxCF/svX0tTGuw9An6D3O9jpkY8YoCrGd6A/1e8r8UJmsEsfk
         v44OvHAvR9dH4XW7JcrwA3eHKF7jeh3NnL61TkMZBn/fuwoAZFjljPwjdUDletyZOrRU
         muUw==
X-Gm-Message-State: AOAM532TWM3mR2w35ua1Hb8100MT9xLIV9I5sy59cJHyujyL+0/MTsJO
        48pTNvaVxETMxX6vm3Av7223aKDgcTxkVv5FSqKxbw==
X-Google-Smtp-Source: ABdhPJxgq/FzI+hd7qihDIH2TGq7xD1E26h1aZDHeiGLoA6btiwmMF4q1xWIjZhnYVxoB9YvP1LJEM6Ni2koUxHCKoE=
X-Received: by 2002:a05:6808:3a3:: with SMTP id n3mr7266911oie.128.1642678100819;
 Thu, 20 Jan 2022 03:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <YehHX7ID/of9kxmE@phenom.ffwll.local> <364f8edb-07b5-c1b4-71ea-0003b45ce7e3@gmail.com>
In-Reply-To: <364f8edb-07b5-c1b4-71ea-0003b45ce7e3@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 20 Jan 2022 12:28:09 +0100
Message-ID: <CAKMK7uG6AL6iU2Vmei_4Hb0dLuP0jpqXzaF_DCEBNiC2=YJ9Ug@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: consolidate dma_fence subclass checking
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 20, 2022 at 9:50 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 19.01.22 um 18:16 schrieb Daniel Vetter:
> > On Wed, Jan 19, 2022 at 02:43:36PM +0100, Christian K=C3=B6nig wrote:
> >> Consolidate the wrapper functions to check for dma_fence
> >> subclasses in the dma_fence header.
> >>
> >> This makes it easier to document and also check the different
> >> requirements for fence containers in the subclasses.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   include/linux/dma-fence-array.h | 15 +------------
> >>   include/linux/dma-fence-chain.h |  3 +--
> >>   include/linux/dma-fence.h       | 38 +++++++++++++++++++++++++++++++=
++
> >>   3 files changed, 40 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence=
-array.h
> >> index 303dd712220f..fec374f69e12 100644
> >> --- a/include/linux/dma-fence-array.h
> >> +++ b/include/linux/dma-fence-array.h
> >> @@ -45,19 +45,6 @@ struct dma_fence_array {
> >>      struct irq_work work;
> >>   };
> >>
> >> -extern const struct dma_fence_ops dma_fence_array_ops;
> >> -
> >> -/**
> >> - * dma_fence_is_array - check if a fence is from the array subsclass
> >> - * @fence: fence to test
> >> - *
> >> - * Return true if it is a dma_fence_array and false otherwise.
> >> - */
> >> -static inline bool dma_fence_is_array(struct dma_fence *fence)
> >> -{
> >> -    return fence->ops =3D=3D &dma_fence_array_ops;
> >> -}
> >> -
> >>   /**
> >>    * to_dma_fence_array - cast a fence to a dma_fence_array
> >>    * @fence: fence to cast to a dma_fence_array
> >> @@ -68,7 +55,7 @@ static inline bool dma_fence_is_array(struct dma_fen=
ce *fence)
> >>   static inline struct dma_fence_array *
> >>   to_dma_fence_array(struct dma_fence *fence)
> >>   {
> >> -    if (fence->ops !=3D &dma_fence_array_ops)
> >> +    if (!fence || !dma_fence_is_array(fence))
> >>              return NULL;
> >>
> >>      return container_of(fence, struct dma_fence_array, base);
> >> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence=
-chain.h
> >> index 54fe3443fd2c..ee906b659694 100644
> >> --- a/include/linux/dma-fence-chain.h
> >> +++ b/include/linux/dma-fence-chain.h
> >> @@ -49,7 +49,6 @@ struct dma_fence_chain {
> >>      spinlock_t lock;
> >>   };
> >>
> >> -extern const struct dma_fence_ops dma_fence_chain_ops;
> >>
> >>   /**
> >>    * to_dma_fence_chain - cast a fence to a dma_fence_chain
> >> @@ -61,7 +60,7 @@ extern const struct dma_fence_ops dma_fence_chain_op=
s;
> >>   static inline struct dma_fence_chain *
> >>   to_dma_fence_chain(struct dma_fence *fence)
> >>   {
> >> -    if (!fence || fence->ops !=3D &dma_fence_chain_ops)
> >> +    if (!fence || !dma_fence_is_chain(fence))
> >>              return NULL;
> >>
> >>      return container_of(fence, struct dma_fence_chain, base);
> >> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >> index 1ea691753bd3..775cdc0b4f24 100644
> >> --- a/include/linux/dma-fence.h
> >> +++ b/include/linux/dma-fence.h
> >> @@ -587,4 +587,42 @@ struct dma_fence *dma_fence_get_stub(void);
> >>   struct dma_fence *dma_fence_allocate_private_stub(void);
> >>   u64 dma_fence_context_alloc(unsigned num);
> >>
> >> +extern const struct dma_fence_ops dma_fence_array_ops;
> >> +extern const struct dma_fence_ops dma_fence_chain_ops;
> >> +
> >> +/**
> >> + * dma_fence_is_array - check if a fence is from the array subclass
> >> + * @fence: the fence to test
> >> + *
> >> + * Return true if it is a dma_fence_array and false otherwise.
> >> + */
> >> +static inline bool dma_fence_is_array(struct dma_fence *fence)
> >> +{
> >> +    return fence->ops =3D=3D &dma_fence_array_ops;
> >> +}
> >> +
> >> +/**
> >> + * dma_fence_is_chain - check if a fence is from the chain subclass
> >> + * @fence: the fence to test
> >> + *
> >> + * Return true if it is a dma_fence_chain and false otherwise.
> >> + */
> >> +static inline bool dma_fence_is_chain(struct dma_fence *fence)
> >> +{
> >> +    return fence->ops =3D=3D &dma_fence_chain_ops;
> >> +}
> >> +
> >> +/**
> >> + * dma_fence_is_container - check if a fence is a container for other=
 fences
> >> + * @fence: the fence to test
> >> + *
> >> + * Return true if this fence is a container for other fences, false o=
therwise.
> >> + * This is important since we can't build up large fence structure or=
 otherwise
> >> + * we run into recursion during operation on those fences.
> >> + */
> >> +static inline bool dma_fence_is_container(struct dma_fence *fence)
> > Code looks all good, but I'm not super enthusiastic about exporting the
> > ops to drivers and letting them do random nonsense. At least i915 does
> > pretty enormous amounts of stuff with that instead of having pushed
> > priority boosting into dma-fence as a proper concept. And maybe a few
> > other things.
> >
> > Now i915-gem team having gone off the rails of good upstream conduct is
> > another thing maybe, but I'd like to not encourage that.
> >
> > So could we perhaps do this all in header which is entirely private to
> > drivers/dma-buf, like dma-fence-internal or so? And maybe whack a big
> > fixme onto the current abuse in drivers (of which __dma_fence_is_chain(=
)
> > gets a special price for "not how upstream should be done" *sigh*).
>
> WTF is __dma_fence_is_chain? Seeing that for the first time now.

Yes :-/

> And yes even if you do priority boosting manually that code in i915 is
> just way to complicated.
>
> I'm sure you don't have any objections that I clean up that mess now you
> pointed it out :)

Go for it. I think ideally we could get rid of the dma_fence_chain_ops
export. Btw similar situation exists for dma_fence_is_array, so maybe
check those out too.

I think if we do want an interface for drivers then really the only
thing that should be accessible is a dma_fence_is_container and a
dma_fence_container_for_each_fence. Really no one's business to dig
into deeper details (at least once your dma_resv series has landed).

Thanks, Daniel

> Thanks,
> Christian.
>
> >
> > Cheers, Daniel
> >
> >> +{
> >> +    return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
> >> +}
> >> +
> >>   #endif /* __LINUX_DMA_FENCE_H */
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
