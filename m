Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA1A3BDEB3
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 23:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhGFVGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 17:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbhGFVGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 17:06:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82711C061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 14:04:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n14so159695lfu.8
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GCr9dR1B9S9xq9AszxUseP+SiyvelPfjfJ3LYfvLk30=;
        b=YTZ+5+qz57rgaRvigWO+axhDE6L/fF5mjwph4prQN7ju5u0+amqQ6czi4/Lc1SYQgW
         NqJSaAtqLmUdy8IVyuzwtoZseQ/lsl+IiAJNIxZh8f8E29qlGqzpT8p9JvVVgB5V+ZuU
         o1Nij7KOqASObEvNoHQs+3O2lwNLhXoD7kzX5vwAGyjSOPo3gUsP+w6XVlsfAEfJ7k71
         m75lkW/tKPnRDOYBIq5OqMw1O1CQAiYkIU2p/nWps+4ksrY9sjg430sZxv6g31tDjPxi
         NpzMR2/4Fi1nMHGF0FDovSfD/ybOh4GKFxE1OdRd63nznPPlJbMWSiI/zQdmDFVHwhP/
         m1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GCr9dR1B9S9xq9AszxUseP+SiyvelPfjfJ3LYfvLk30=;
        b=GTJgs2eeQF4QLnM1fjxN82jLM3EB1lUrmMSizmYY5LJxEjFGf5zFjKwog8X4HcXx5R
         qTTKqLhWdZBOjNnPjJGpZxncthS1I66i5xayEJ3rSmnydPpi5T6hnKXvzB2q9LuIasMf
         231xEQ7aBBaR9yxJi5/gzOqp1uhe84SlMuG3WR1TGTVtaobIK5xXxiszkEyWSiVva98X
         QOrvewYDkG0KvpUokPZJK78iL2gycIjFaCbzEQaAWF9p3F0rwT0Syf8aWw8CcfCpiVxR
         YPrp0QwdBDiLyyvI4tjt4hdUo1qAQwjXwetcFDP0A4bfWXj3tqokx8OqUhM4+1V1sEbU
         eeHg==
X-Gm-Message-State: AOAM5306tPQcReU8xXQfVqw6kyF1bHKlsvCnVYOlPQMPUODblemSCLdk
        w3MvkEd9gZ3bpYmwwywDY0yjKHk+/s8Sp+JXtjaBDQ==
X-Google-Smtp-Source: ABdhPJyQY/P067tXLBOneScrLN2H7JnhxkuJjO0A7ZDRwnec+6MHaVd2CnVvcnLxIBIeYHDuBCOWVBUBBIjPebRPw6o=
X-Received: by 2002:a05:6512:22cc:: with SMTP id g12mr8444627lfu.535.1625605446875;
 Tue, 06 Jul 2021 14:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org> <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
 <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com> <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com>
In-Reply-To: <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 6 Jul 2021 14:03:58 -0700
Message-ID: <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
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

On Wed, Jun 30, 2021 at 11:52 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.07.21 um 00:24 schrieb John Stultz:
> > On Wed, Jun 30, 2021 at 2:10 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 30.06.21 um 03:34 schrieb John Stultz:
> >>> +static unsigned long page_pool_size; /* max size of the pool */
> >>> +
> >>> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page po=
ol");
> >>> +module_param(page_pool_size, ulong, 0644);
> >>> +
> >>> +static atomic_long_t nr_managed_pages;
> >>> +
> >>> +static struct mutex shrinker_lock;
> >>> +static struct list_head shrinker_list;
> >>> +static struct shrinker mm_shrinker;
> >>> +
> >>> +/**
> >>> + * drm_page_pool_set_max - Sets maximum size of all pools
> >>> + *
> >>> + * Sets the maximum number of pages allows in all pools.
> >>> + * This can only be set once, and the first caller wins.
> >>> + */
> >>> +void drm_page_pool_set_max(unsigned long max)
> >>> +{
> >>> +     if (!page_pool_size)
> >>> +             page_pool_size =3D max;
> >>> +}
> >>> +
> >>> +/**
> >>> + * drm_page_pool_get_max - Maximum size of all pools
> >>> + *
> >>> + * Return the maximum number of pages allows in all pools
> >>> + */
> >>> +unsigned long drm_page_pool_get_max(void)
> >>> +{
> >>> +     return page_pool_size;
> >>> +}
> >> Well in general I don't think it is a good idea to have getters/setter=
s
> >> for one line functionality, similar applies to locking/unlocking the
> >> mutex below.
> >>
> >> Then in this specific case what those functions do is to aid
> >> initializing the general pool manager and that in turn should absolute=
ly
> >> not be exposed.
> >>
> >> The TTM pool manager exposes this as function because initializing the
> >> pool manager is done in one part of the module and calculating the
> >> default value for the pages in another one. But that is not something =
I
> >> would like to see here.
> > So, I guess I'm not quite clear on what you'd like to see...
> >
> > Part of what I'm balancing here is the TTM subsystem normally sets a
> > global max size, whereas the old ION pool didn't have caps (instead
> > just relying on the shrinker when needed).
> > So I'm trying to come up with a solution that can serve both uses. So
> > I've got this drm_page_pool_set_max() function to optionally set the
> > maximum value, which is called in the TTM initialization path or set
> > the boot argument. But for systems that use the dmabuf system heap,
> > but don't use TTM, no global limit is enforced.
>
> Yeah, exactly that's what I'm trying to prevent.
>
> See if we have the same functionality used by different use cases we
> should not have different behavior depending on what drivers are loaded.
>
> Is it a problem if we restrict the ION pool to 50% of system memory as
> well? If yes than I would rather drop the limit from TTM and only rely
> on the shrinker there as well.

Would having the default value as a config option (still overridable
via boot argument) be an acceptable solution?

Thanks again for the feedback!

thanks
-john
