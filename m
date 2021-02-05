Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505D53112F0
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 21:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbhBETPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 14:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbhBETOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 14:14:03 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF0BC061788
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 12:47:08 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a17so9374007ljq.2
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=49Crt4P52szXjupwP5YgHo/jUWzX8V+kBi/b4k1o3qk=;
        b=iM1yEZxc+tSQg7V5xAWAs+JC6oqsrhMhWorE9yR4wEHApkYoqxOW4/p31PZsuBnq9q
         Ms9J8KU+yokimD20QRkyUc8XN35G/SVor5ud2ZS8MQ8k8IJMBItKP8xn7JvUolgjBWc4
         g8MpkNpC/37gLh/mBjsfed+lJBfmNNuHabHsAPdq3pgZI5hpZEBgesN+0aoSkLpwdVdr
         eChARwzLLOA/nYjCMHv3ajh1xBkzV7t4lzaDDjdSW2NA9Ne+ae5XfbZOew9D5PKMXU5A
         UTIMNAUAn6av4EC0VMBhEoL8fTEwKVw9c+8U/F5DS9XnAjl1kYdAdyKaAWdAjAcNNmD+
         AEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=49Crt4P52szXjupwP5YgHo/jUWzX8V+kBi/b4k1o3qk=;
        b=bBoUKJfSIIzHfigY89oUQXvypIWB8QgnYnpnMe14eoRo20ECbXH9wm/1+Z669eh4nh
         oB93ckrsntlggLi6qC55pK0hgjxZ9xf8tC+4Y+jbuaYjmTbTKNuN5blC72kcziGgSx72
         xwFvAnp3UfIShkL0mqKLY5yHqN2dC8isslV86+FgYOW8eoyulXFHwhjUId3EQyn+qtA3
         1erQEPlyqI6AfxtfaR5sx644pGrefnX3UBdrHpef8k0gb6BEuonow0hmD3Athe6HWwD6
         Q9/RL8lIBoGJ7eUivMu69dbezlcvz0irmDduXwGBvYSaOrvXkiNXe5UVrY7eKkvf8b9O
         oNow==
X-Gm-Message-State: AOAM532lnxhr5fWxxk18chYPD1Gsqhf4L88gXRl8AvPz7YDMq/eCzevg
        PxoBkM2XiE4ZERsVWAMKRCt4g33MU86rdF52kCCYSA==
X-Google-Smtp-Source: ABdhPJwe84ph4525cpQjTcSn0erd6idcLu6jqrMD26ArOGJ27gblnijoY8iYbqcpA2UXJStfB/y2qg6gwNHuBh76zew=
X-Received: by 2002:a2e:914b:: with SMTP id q11mr3587238ljg.503.1612558026844;
 Fri, 05 Feb 2021 12:47:06 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
In-Reply-To: <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 5 Feb 2021 12:46:53 -0800
Message-ID: <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 5, 2021 at 12:47 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 05.02.21 um 09:06 schrieb John Stultz:
> > diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
> > new file mode 100644
> > index 000000000000..2139f86e6ca7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/page_pool.c
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0
>
> Please use a BSD/MIT compatible license if you want to copy this from
> the TTM code.

Hrm. This may be problematic, as it's not just TTM code, but some of
the TTM logic integrated into a page-pool implementation I wrote based
on logic from the ION code (which was GPL-2.0 before it was dropped).
So I don't think I can just make it MIT.  Any extra context on the
need for MIT, or suggestions on how to best resolve this?

> > +int drm_page_pool_get_size(struct drm_page_pool *pool)
> > +{
> > +     int ret;
> > +
> > +     spin_lock(&pool->lock);
> > +     ret =3D pool->count;
> > +     spin_unlock(&pool->lock);
>
> Maybe use an atomic for the count instead?
>

I can do that, but am curious as to the benefit? We are mostly using
count where we already have to take the pool->lock anyway, and this
drm_page_pool_get_size() is only used for debugfs output so far, so I
don't expect it to be a hot path.


> > +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
> > +{
> > +     spin_lock(&pool->lock);
> > +     list_add_tail(&page->lru, &pool->items);
> > +     pool->count++;
> > +     atomic_long_add(1 << pool->order, &total_pages);
> > +     spin_unlock(&pool->lock);
> > +
> > +     mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
> > +                         1 << pool->order);
>
> Hui what? What should that be good for?

This is a carryover from the ION page pool implementation:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/staging/android/ion/ion_page_pool.c?h=3Dv5.10#n28

My sense is it helps with the vmstat/meminfo accounting so folks can
see the cached pages are shrinkable/freeable. This maybe falls under
other dmabuf accounting/stats discussions, so I'm happy to remove it
for now, or let the drivers using the shared page pool logic handle
the accounting themselves?


> > +static struct page *drm_page_pool_remove(struct drm_page_pool *pool)
> > +{
> > +     struct page *page;
> > +
> > +     if (!pool->count)
> > +             return NULL;
>
> Better use list_first_entry_or_null instead of checking the count.
>
> This way you can also pull the lock into the function.

Yea, that cleans a number of things up nicely. Thank you!


> > +struct drm_page_pool *drm_page_pool_create(unsigned int order,
> > +                                        int (*free_page)(struct page *=
p, unsigned int order))
> > +{
> > +     struct drm_page_pool *pool =3D kmalloc(sizeof(*pool), GFP_KERNEL)=
;
>
> Why not making this an embedded object? We should not see much dynamic
> pool creation.

Yea, it felt cleaner at the time this way, but I think I will need to
switch to an embedded object in order to resolve the memory usage
issue you pointed out with growing the ttm_pool_dma, so thank you for
the suggestion!


> > +void drm_page_pool_destroy(struct drm_page_pool *pool)
> > +{
> > +     struct page *page;
> > +
> > +     /* Remove us from the pool list */
> > +     mutex_lock(&pool_list_lock);
> > +     list_del(&pool->list);
> > +     mutex_unlock(&pool_list_lock);
> > +
> > +     /* Free any remaining pages in the pool */
> > +     spin_lock(&pool->lock);
>
> Locking should be unnecessary when the pool is destroyed anyway.

I guess if we've already pruned ourself from the pool list, then your
right, we can't race with the shrinker and it's maybe not necessary.
But it also seems easier to consistently follow the locking rules in a
very unlikely path rather than leaning on subtlety.  Either way, I
think this becomes moot if I make the improvements you suggest to
drm_page_pool_remove().

> > +static int drm_page_pool_shrink_one(void)
> > +{
> > +     struct drm_page_pool *pool;
> > +     struct page *page;
> > +     int nr_freed =3D 0;
> > +
> > +     mutex_lock(&pool_list_lock);
> > +     pool =3D list_first_entry(&pool_list, typeof(*pool), list);
> > +
> > +     spin_lock(&pool->lock);
> > +     page =3D drm_page_pool_remove(pool);
> > +     spin_unlock(&pool->lock);
> > +
> > +     if (page)
> > +             nr_freed =3D drm_page_pool_free_pages(pool, page);
> > +
> > +     list_move_tail(&pool->list, &pool_list);
>
> Better to move this up, directly after the list_first_entry().

Sounds good!

Thanks so much for your review and feedback! I'll try to get some of
the easy suggestions integrated, and will have to figure out what to
do about the re-licensing request.

thanks
-john
