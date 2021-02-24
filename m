Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F01D323985
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 10:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbhBXJc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 04:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbhBXJcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 04:32:04 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D23AC061574
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 01:31:23 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id s23so351726oot.12
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yO64SmF65dLY5inu45BzDUbRVbnNPzs6fQ+9WkgdAR8=;
        b=TIsLL882GLiZNhcHf5unEMZEEnFIa54ZLe5U8QQXYUbIS6B83GgN3p5lTRVgVBteTN
         ux2DpZTQ3C82WU0Aakm66BUOZZtmhfWzbUltanmo61Xfc+9Lv4z45CwhhJ/u849ho1Tt
         8T7j/EuCTQeq3/akwjtS/+t0ObWgku+D7wFc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yO64SmF65dLY5inu45BzDUbRVbnNPzs6fQ+9WkgdAR8=;
        b=IyJQMP7AcKf11HsTQGU0ZBDqmfZ4zMan9hCo/avitrvab1vSsrvspudAdxe+MIVDSs
         1UeNGMESC4dws268cnusxJip99jW0tYSmjEaEaWe2G42l7e0b6EGAwVXv1qU+8HLUStB
         q+7BRqyAwjsIrOTGTqdzesO02/s0juPG1KSEJKnKEmxAsz50uM1DTZEIuYPDvRvt7UZO
         FFTtfo4zHpxVxt2s7vEPsKO/iTlN9jJ3Ceof5J+YSyChu5N5tu+OtDEjryQ3fMhhEy1+
         C4CuVBUwH7OowpZ/cTgsTIDL3D7zU52KLdROLKXY7dWYsKbUEng2hOlBemJvlrM0II/a
         qCWQ==
X-Gm-Message-State: AOAM530ggziefZltxbZr1MNXAha+4aIQqssgVDTQauUl+soHUjaML69m
        0bjdO34nTIqaqJWTlnP1J6O4GgQUldYcRdaqeLALmDl75Oo=
X-Google-Smtp-Source: ABdhPJxlGpWmTxsLgmVmbNO5tD2KdzisUXxYIdnLolzjBnYjQ/PpY6Z8HGSVScSYuQZ6smpaISRIESBzC9ltbmHvb3k=
X-Received: by 2002:a4a:be01:: with SMTP id l1mr18496246oop.89.1614159082849;
 Wed, 24 Feb 2021 01:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org> <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
In-Reply-To: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 24 Feb 2021 10:31:11 +0100
Message-ID: <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
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

On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
>
> On 2/24/21 9:45 AM, Daniel Vetter wrote:
> > On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellstr=C3=B6m (Intel)
> > <thomas_os@shipmail.org> wrote:
> >>
> >> On 2/23/21 11:59 AM, Daniel Vetter wrote:
> >>> tldr; DMA buffers aren't normal memory, expecting that you can use
> >>> them like that (like calling get_user_pages works, or that they're
> >>> accounting like any other normal memory) cannot be guaranteed.
> >>>
> >>> Since some userspace only runs on integrated devices, where all
> >>> buffers are actually all resident system memory, there's a huge
> >>> temptation to assume that a struct page is always present and useable
> >>> like for any more pagecache backed mmap. This has the potential to
> >>> result in a uapi nightmare.
> >>>
> >>> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> >>> blocks get_user_pages and all the other struct page based
> >>> infrastructure for everyone. In spirit this is the uapi counterpart t=
o
> >>> the kernel-internal CONFIG_DMABUF_DEBUG.
> >>>
> >>> Motivated by a recent patch which wanted to swich the system dma-buf
> >>> heap to vm_insert_page instead of vm_insert_pfn.
> >>>
> >>> v2:
> >>>
> >>> Jason brought up that we also want to guarantee that all ptes have th=
e
> >>> pte_special flag set, to catch fast get_user_pages (on architectures
> >>> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> >>> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that=
.
> >>>
> >>>   From auditing the various functions to insert pfn pte entires
> >>> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> >>> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> >>> this should be the correct flag to check for.
> >>>
> >> If we require VM_PFNMAP, for ordinary page mappings, we also need to
> >> disallow COW mappings, since it will not work on architectures that
> >> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_pa=
ge()).
> > Hm I figured everyone just uses MAP_SHARED for buffer objects since
> > COW really makes absolutely no sense. How would we enforce this?
>
> Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either that
> or allowing MIXEDMAP.
>
> >> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
> >> possible performance implications with x86 + PAT + VM_PFNMAP + normal
> >> pages. That's a very old comment, though, and might not be valid anymo=
re.
> > I think that's why ttm has a page cache for these, because it indeed
> > sucks. The PAT changes on pages are rather expensive.
>
> IIRC the page cache was implemented because of the slowness of the
> caching mode transition itself, more specifically the wbinvd() call +
> global TLB flush.
>
> >
> > There is still an issue for iomem mappings, because the PAT validation
> > does a linear walk of the resource tree (lol) for every vm_insert_pfn.
> > But for i915 at least this is fixed by using the io_mapping
> > infrastructure, which does the PAT reservation only once when you set
> > up the mapping area at driver load.
>
> Yes, I guess that was the issue that the comment describes, but the
> issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
>
> >
> > Also TTM uses VM_PFNMAP right now for everything, so it can't be a
> > problem that hurts much :-)
>
> Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/ttm_bo=
_vm.c#L554

Uh that's bad, because mixed maps pointing at struct page wont stop
gup. At least afaik.

Christian, do we need to patch this up, and maybe fix up ttm fault
handler to use io_mapping so the vm_insert_pfn stuff is fast?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
