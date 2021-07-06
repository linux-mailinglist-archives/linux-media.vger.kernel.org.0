Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517093BDECB
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 23:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhGFVRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 17:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhGFVRw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 17:17:52 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF6BC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 14:15:12 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 75-20020a9d08510000b02904acfe6bcccaso135151oty.12
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xIjT/sBHJXjEFjRplpqxe3dXJOAOtIbCbm1/QruaXLI=;
        b=RAkqqjXwrM6iUcf4C2PO/bAO5ZwBDkES0GDc6hW7OW32sQPEYuHYBoBduI250xRAG5
         9pkyB5uuCqtDg/p4iXcxbH9Z1QRxnzpRZSe+j2vxeiSmZaE3gP18mJd/xcKjAvHV8bOy
         btYXsqbfPmrGqfQbmgtQMWJ+Z5w8k1cPFnN3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xIjT/sBHJXjEFjRplpqxe3dXJOAOtIbCbm1/QruaXLI=;
        b=J/mTFhOX7lSQcM/3wPQG9OwhMAdl9Rs00DynB3c0AyTpfkydxXwVO6yaTrrjwulMim
         9umqfbH8gtKVDsvClzwzsJxTX8qQgGEhA6Pt0X7oqUpmISv4TbN3gwuNzORA/IiWstPX
         oTw24/c194WSMxBJo0B9l5n6FAGKtiq3t02MNLVEtEfCeC/aHqM29F0+GrbrCN5pnxIi
         FtUtaX0Itcqvut8rkv8mfNPV8ctzklAUQ+V29zJb2dRpio2U+mZ6BkLmF5CKaKurIIjw
         d50mGJlhM9scjaA4rGd6EZfWVC+sl01ksi3E0IrGeatTwyEKnC5I3uwRIB7bto641o60
         NJDg==
X-Gm-Message-State: AOAM531sdB+46Ud1eeBDw7f/fc7iT4nx4JvObWwFcFWieoTNTwHdCDc7
        QECfjhXHMd1wd1e5X915USmDF9qqzwVirrNdrwQjxA==
X-Google-Smtp-Source: ABdhPJzQRomLtHp/v5BB4qJrTZ0fnAfav/eGEc9VqP9SfaPAf/7GIQUh7zTDva0IVwhe7V7p5AhdlU5if5vICDmb99g=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr16838523otb.281.1625606112115;
 Tue, 06 Jul 2021 14:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org> <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
 <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com>
 <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com> <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
In-Reply-To: <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 6 Jul 2021 23:15:00 +0200
Message-ID: <CAKMK7uH+X8dvrD1=rpmozGvC5R88BOFL--_m9ezbgQjaSjGQ_w@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
To:     John Stultz <john.stultz@linaro.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
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

On Tue, Jul 6, 2021 at 11:04 PM John Stultz <john.stultz@linaro.org> wrote:
> On Wed, Jun 30, 2021 at 11:52 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 01.07.21 um 00:24 schrieb John Stultz:
> > > On Wed, Jun 30, 2021 at 2:10 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 30.06.21 um 03:34 schrieb John Stultz:
> > >>> +static unsigned long page_pool_size; /* max size of the pool */
> > >>> +
> > >>> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page =
pool");
> > >>> +module_param(page_pool_size, ulong, 0644);
> > >>> +
> > >>> +static atomic_long_t nr_managed_pages;
> > >>> +
> > >>> +static struct mutex shrinker_lock;
> > >>> +static struct list_head shrinker_list;
> > >>> +static struct shrinker mm_shrinker;
> > >>> +
> > >>> +/**
> > >>> + * drm_page_pool_set_max - Sets maximum size of all pools
> > >>> + *
> > >>> + * Sets the maximum number of pages allows in all pools.
> > >>> + * This can only be set once, and the first caller wins.
> > >>> + */
> > >>> +void drm_page_pool_set_max(unsigned long max)
> > >>> +{
> > >>> +     if (!page_pool_size)
> > >>> +             page_pool_size =3D max;
> > >>> +}
> > >>> +
> > >>> +/**
> > >>> + * drm_page_pool_get_max - Maximum size of all pools
> > >>> + *
> > >>> + * Return the maximum number of pages allows in all pools
> > >>> + */
> > >>> +unsigned long drm_page_pool_get_max(void)
> > >>> +{
> > >>> +     return page_pool_size;
> > >>> +}
> > >> Well in general I don't think it is a good idea to have getters/sett=
ers
> > >> for one line functionality, similar applies to locking/unlocking the
> > >> mutex below.
> > >>
> > >> Then in this specific case what those functions do is to aid
> > >> initializing the general pool manager and that in turn should absolu=
tely
> > >> not be exposed.
> > >>
> > >> The TTM pool manager exposes this as function because initializing t=
he
> > >> pool manager is done in one part of the module and calculating the
> > >> default value for the pages in another one. But that is not somethin=
g I
> > >> would like to see here.
> > > So, I guess I'm not quite clear on what you'd like to see...
> > >
> > > Part of what I'm balancing here is the TTM subsystem normally sets a
> > > global max size, whereas the old ION pool didn't have caps (instead
> > > just relying on the shrinker when needed).
> > > So I'm trying to come up with a solution that can serve both uses. So
> > > I've got this drm_page_pool_set_max() function to optionally set the
> > > maximum value, which is called in the TTM initialization path or set
> > > the boot argument. But for systems that use the dmabuf system heap,
> > > but don't use TTM, no global limit is enforced.
> >
> > Yeah, exactly that's what I'm trying to prevent.
> >
> > See if we have the same functionality used by different use cases we
> > should not have different behavior depending on what drivers are loaded=
.
> >
> > Is it a problem if we restrict the ION pool to 50% of system memory as
> > well? If yes than I would rather drop the limit from TTM and only rely
> > on the shrinker there as well.
>
> Would having the default value as a config option (still overridable
> via boot argument) be an acceptable solution?

We're also trying to get ttm over to the shrinker model, and a first
cut of that even landed, but didn't really work out yet. So maybe just
aiming for the shrinker? I do agree this should be consistent across
the board, otherwise we're just sharing code but not actually sharing
functionality, which is a recipe for disaster because one side will
end up breaking the other side's use-case.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
