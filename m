Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319283238F6
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 09:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhBXIsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 03:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbhBXIqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 03:46:43 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DD6C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 00:46:03 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id z126so1670988oiz.6
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UBVHQngHUZ0hFzyvhknW/+6mcD59iwnz+U3N7eapU0U=;
        b=eq2XYiTGVtDvvK55/32jVi7zpdt152ufQPW9GCdhvatN7bJq1fJqf9L8H7hLFOCrBY
         fL9M1pn2Wcd0q+Qg6BKMIWBCswKMLS7ue931ex4gf/AvyW5CYIo95u3iU2i4PeFcoSk1
         Pl7Vxbl67bfcZ55H5DkaBnxK9ATAWzVQXEoG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UBVHQngHUZ0hFzyvhknW/+6mcD59iwnz+U3N7eapU0U=;
        b=CgNNG1YANDnoZn8WTJJlemlDjTkIoQJthl8g/WKXuUTWCP4aHcetCxrLcYVjK7iBDD
         CM5VIZhi2Y4ge6SfBRAtNEnGEBaTlsOmPAdRe9JBs+zSlWwOAyZOZNHtzDr8zNELWbg2
         ODuhrXBYX0KvrbL9cjPqvy6pzbB7dqmBlFgfCcV9BmdesEO2xG4N8LSfpLvWefbVXyOB
         03SWyppARXPWm8xY0YrJKEkBUYDADhZBPzkju8y6d6HUDKdsTFexX5eTqGw/dDlgYnOj
         +StF/JjhbM0BsCDulg7oiZyICMKd/21PmO/uIppZATfZkI/IWAx1H3OPLBAbm6FEmLHr
         ZvRA==
X-Gm-Message-State: AOAM531GWMZOesz4BxL0DwVh75hQ9LFBSFGDGMjpM1CIAapoLl50ZqIr
        cr5bRKOJ4GbOmIqb/D217HK2Qg9vfxy8YseowgNKbg==
X-Google-Smtp-Source: ABdhPJxewnoE3OYdDmeQhWuC52aIvi5BFeizNLN4c4XvgIM4Jw2qTr5RP6gk6PNE/9VKREBJNnEYEHtedMcL+yttr5o=
X-Received: by 2002:a05:6808:4c9:: with SMTP id a9mr2005718oie.101.1614156362400;
 Wed, 24 Feb 2021 00:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch> <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
In-Reply-To: <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 24 Feb 2021 09:45:51 +0100
Message-ID: <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
>
> On 2/23/21 11:59 AM, Daniel Vetter wrote:
> > tldr; DMA buffers aren't normal memory, expecting that you can use
> > them like that (like calling get_user_pages works, or that they're
> > accounting like any other normal memory) cannot be guaranteed.
> >
> > Since some userspace only runs on integrated devices, where all
> > buffers are actually all resident system memory, there's a huge
> > temptation to assume that a struct page is always present and useable
> > like for any more pagecache backed mmap. This has the potential to
> > result in a uapi nightmare.
> >
> > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > blocks get_user_pages and all the other struct page based
> > infrastructure for everyone. In spirit this is the uapi counterpart to
> > the kernel-internal CONFIG_DMABUF_DEBUG.
> >
> > Motivated by a recent patch which wanted to swich the system dma-buf
> > heap to vm_insert_page instead of vm_insert_pfn.
> >
> > v2:
> >
> > Jason brought up that we also want to guarantee that all ptes have the
> > pte_special flag set, to catch fast get_user_pages (on architectures
> > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> >
> >  From auditing the various functions to insert pfn pte entires
> > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > this should be the correct flag to check for.
> >
> If we require VM_PFNMAP, for ordinary page mappings, we also need to
> disallow COW mappings, since it will not work on architectures that
> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_page(=
)).

Hm I figured everyone just uses MAP_SHARED for buffer objects since
COW really makes absolutely no sense. How would we enforce this?

> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
> possible performance implications with x86 + PAT + VM_PFNMAP + normal
> pages. That's a very old comment, though, and might not be valid anymore.

I think that's why ttm has a page cache for these, because it indeed
sucks. The PAT changes on pages are rather expensive.

There is still an issue for iomem mappings, because the PAT validation
does a linear walk of the resource tree (lol) for every vm_insert_pfn.
But for i915 at least this is fixed by using the io_mapping
infrastructure, which does the PAT reservation only once when you set
up the mapping area at driver load.

Also TTM uses VM_PFNMAP right now for everything, so it can't be a
problem that hurts much :-)
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
