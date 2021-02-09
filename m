Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5E031552B
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 18:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhBIRfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 12:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbhBIRec (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 12:34:32 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297F9C0617A7
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 09:33:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id g10so23025131wrx.1
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7JkPvEjrFUyCkgVos6hGetPZONkwMar8Z/Kg7PYRhYM=;
        b=upyLM52zFkyCnjZekJtVFisSt9rvMDn2DCkv9o/ozl6Syfy0R8POrLtaFtvHM4IuLW
         YR3AZehBmbIDTcrj4AOyggAtW7xGtgKG9FgBAll0SNnvhOf51tH3hZmhTjtW88pFcNKI
         SQnWSwloX7GlynYWOjWqRGCIvYfsUfegRsIGtpH2r2CPaPhIOyrkCaeBBzu7pB5qbnNZ
         sPtzYMXMTzBibIkvKwk8Yxp6mWXyVER8whJp7y3VTO7TwqZFy7UpCqxW7U5ZODAbBDhf
         BUYFOQUFamp9MuioB8GMfBbWejqqYQX1QbFUK6KfjUwdS1+DIGJRZMgHYhowuL2cBR9u
         nXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7JkPvEjrFUyCkgVos6hGetPZONkwMar8Z/Kg7PYRhYM=;
        b=h3aP+ZNIaBEwdzIUpsuAS9148aLk8tL2Va11CsdZTabfn8U1W5iYHE03QuYPj4aHoi
         ctwfsOhvDFUheebUzfr79nYXlJ5R+XdpfFWQVKAu6cv7xAc7DBvEhV42cKhCT5wHC5MK
         9ytVvITzYgOuN8EofWZVoh1wmxb52rzSwdO6Xg8BqVfxHnjM+SOaa6aomexYp+C4VelZ
         ksKiL4ykUb828xWSfPuMus4YPNHtgwYEfnnVlDPuD3QDcJd00H3nm5JNHnlDPMY0IycU
         QkP6jPoDvG8v/GOpqhbBAYtedxHTVB8rxowVyeWymfxsRXznmRNdfdeY2QILNAzlmvVL
         xAmw==
X-Gm-Message-State: AOAM533LRP+mxR5miynbns6Eo3DYnvYc5qthPXciUOsYo4oHcgq4aCua
        wmBocLezFWfpCYSpd5SKEBBr+7Y82OMl+uv+gbsejA==
X-Google-Smtp-Source: ABdhPJxR0ME6EaFYPYk1Mxyp+BLFYVz+IlCCpKcDmPoDo8b3MwPtvt9CrFW7ON0rxhIUPKcWxdh5dbPKlpFBtmJQ6us=
X-Received: by 2002:adf:ed45:: with SMTP id u5mr26626811wro.358.1612892006726;
 Tue, 09 Feb 2021 09:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org> <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com> <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
In-Reply-To: <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 9 Feb 2021 09:33:15 -0800
Message-ID: <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool implementation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
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

On Tue, Feb 9, 2021 at 4:57 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 09.02.21 um 13:11 schrieb Christian K=C3=B6nig:
> > [SNIP]
> >>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *pag=
e)
> >>>> +{
> >>>> +     spin_lock(&pool->lock);
> >>>> +     list_add_tail(&page->lru, &pool->items);
> >>>> +     pool->count++;
> >>>> +     atomic_long_add(1 << pool->order, &total_pages);
> >>>> +     spin_unlock(&pool->lock);
> >>>> +
> >>>> +     mod_node_page_state(page_pgdat(page),
> >>>> NR_KERNEL_MISC_RECLAIMABLE,
> >>>> +                         1 << pool->order);
> >>> Hui what? What should that be good for?
> >> This is a carryover from the ION page pool implementation:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftr=
ee%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&=
amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cc4eadb0a9cf6491d99ba08d8c=
a173457%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637481548325174885%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3DFUjZK5NSDMUYfU7vGeE4fDU2HCF%2FYyNBwc30aoLLP=
Q4%3D&amp;reserved=3D0
> >>
> >>
> >> My sense is it helps with the vmstat/meminfo accounting so folks can
> >> see the cached pages are shrinkable/freeable. This maybe falls under
> >> other dmabuf accounting/stats discussions, so I'm happy to remove it
> >> for now, or let the drivers using the shared page pool logic handle
> >> the accounting themselves?
>
> Intentionally separated the discussion for that here.
>
> As far as I can see this is just bluntly incorrect.
>
> Either the page is reclaimable or it is part of our pool and freeable
> through the shrinker, but never ever both.

IIRC the original motivation for counting ION pooled pages as
reclaimable was to include them into /proc/meminfo's MemAvailable
calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
non-slab kernel pages" seems like a good place to account for them but
I might be wrong.

>
> In the best case this just messes up the accounting, in the worst case
> it can cause memory corruption.
>
> Christian.
