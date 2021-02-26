Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F54326355
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 14:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhBZN3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 08:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhBZN3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 08:29:31 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D88C061574
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 05:28:51 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id f3so9657061oiw.13
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 05:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rGUH/q8yAWgGk2JZzWrNvzmyVDAtFz6BDlab6pKMIpc=;
        b=bqdkyNJYXY81XDx7+WubCMBYlPOOiz9IkMxB+hNHpAopHqy7XlpEYfnH5a68nbITG8
         By+/b5VTLzODg9fAsKe7X6v/fvjJ8hh01US9EHMNfy0GDu3bueBG3sEXM4cJx2TQHr6X
         L33pQWZtXhRTgCvaaPOJFuxlJ6xzPHI5UwIDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rGUH/q8yAWgGk2JZzWrNvzmyVDAtFz6BDlab6pKMIpc=;
        b=fxCUQq47apXxoq9X50GDwAEsowUkF/QPp2okFZCCn6ZzR0e1670LJftRLafTKapk7J
         6FNLpxdKw+SmPP10snUt8bMdh8gHtz2fhI9GEKJNAlT9ybP7rjcETdkVMQzg6EziLkW6
         uRWPZK3OBuSjzu7cB/m/xdbvkdXTzO1JfJrc1olVVKnCFYE9l2Xe1rYPFlYDJzZnIuJr
         jBAle+QKfWzu1DLl8wvvdggmFwmCNHW5sfrytzXo1TNHB8v7RpoXxg6+6ZiKN3tSGdxS
         KopLnPDdRs9sQaoofJ/wAev5x3/A2zs2DVFHYBxyYSWe5oO5n619bNNc32lAceGqM0bI
         +Cqg==
X-Gm-Message-State: AOAM530Igyel61Di9kkEvyGGEom2u8aDWvc4fcBL1KRW6WJNUhz8r5Wd
        3z7o90Wm+i/Z2GZk6Zlu3jP2oYfQp4UMyjaY2AWoSA==
X-Google-Smtp-Source: ABdhPJw/VWpmxq1i7heFrmobIfJ05+MLxWgqFl5REF3XLrtDecxTlqf3sUJgHdTYAyfp8mQU2GOoslzgLsT5LZ1dyvQ=
X-Received: by 2002:aca:c790:: with SMTP id x138mr1938632oif.14.1614346130427;
 Fri, 26 Feb 2021 05:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org> <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org> <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com> <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com> <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
In-Reply-To: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 26 Feb 2021 14:28:39 +0100
Message-ID: <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
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

On Fri, Feb 26, 2021 at 10:41 AM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
>
> On 2/25/21 4:49 PM, Daniel Vetter wrote:
> > On Thu, Feb 25, 2021 at 11:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Thu, Feb 25, 2021 at 11:28:31AM +0100, Christian K=C3=B6nig wrote:
> >>> Am 24.02.21 um 10:31 schrieb Daniel Vetter:
> >>>> On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellstr=C3=B6m (Intel)
> >>>> <thomas_os@shipmail.org> wrote:
> >>>>> On 2/24/21 9:45 AM, Daniel Vetter wrote:
> >>>>>> On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellstr=C3=B6m (Intel)
> >>>>>> <thomas_os@shipmail.org> wrote:
> >>>>>>> On 2/23/21 11:59 AM, Daniel Vetter wrote:
> >>>>>>>> tldr; DMA buffers aren't normal memory, expecting that you can u=
se
> >>>>>>>> them like that (like calling get_user_pages works, or that they'=
re
> >>>>>>>> accounting like any other normal memory) cannot be guaranteed.
> >>>>>>>>
> >>>>>>>> Since some userspace only runs on integrated devices, where all
> >>>>>>>> buffers are actually all resident system memory, there's a huge
> >>>>>>>> temptation to assume that a struct page is always present and us=
eable
> >>>>>>>> like for any more pagecache backed mmap. This has the potential =
to
> >>>>>>>> result in a uapi nightmare.
> >>>>>>>>
> >>>>>>>> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, wh=
ich
> >>>>>>>> blocks get_user_pages and all the other struct page based
> >>>>>>>> infrastructure for everyone. In spirit this is the uapi counterp=
art to
> >>>>>>>> the kernel-internal CONFIG_DMABUF_DEBUG.
> >>>>>>>>
> >>>>>>>> Motivated by a recent patch which wanted to swich the system dma=
-buf
> >>>>>>>> heap to vm_insert_page instead of vm_insert_pfn.
> >>>>>>>>
> >>>>>>>> v2:
> >>>>>>>>
> >>>>>>>> Jason brought up that we also want to guarantee that all ptes ha=
ve the
> >>>>>>>> pte_special flag set, to catch fast get_user_pages (on architect=
ures
> >>>>>>>> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) =
would
> >>>>>>>> still allow vm_insert_page, but limiting to VM_PFNMAP will catch=
 that.
> >>>>>>>>
> >>>>>>>>     From auditing the various functions to insert pfn pte entire=
s
> >>>>>>>> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> >>>>>>>> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway,=
 so
> >>>>>>>> this should be the correct flag to check for.
> >>>>>>>>
> >>>>>>> If we require VM_PFNMAP, for ordinary page mappings, we also need=
 to
> >>>>>>> disallow COW mappings, since it will not work on architectures th=
at
> >>>>>>> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_norm=
al_page()).
> >>>>>> Hm I figured everyone just uses MAP_SHARED for buffer objects sinc=
e
> >>>>>> COW really makes absolutely no sense. How would we enforce this?
> >>>>> Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either =
that
> >>>>> or allowing MIXEDMAP.
> >>>>>
> >>>>>>> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
> >>>>>>> possible performance implications with x86 + PAT + VM_PFNMAP + no=
rmal
> >>>>>>> pages. That's a very old comment, though, and might not be valid =
anymore.
> >>>>>> I think that's why ttm has a page cache for these, because it inde=
ed
> >>>>>> sucks. The PAT changes on pages are rather expensive.
> >>>>> IIRC the page cache was implemented because of the slowness of the
> >>>>> caching mode transition itself, more specifically the wbinvd() call=
 +
> >>>>> global TLB flush.
> >>> Yes, exactly that. The global TLB flush is what really breaks our nec=
k here
> >>> from a performance perspective.
> >>>
> >>>>>> There is still an issue for iomem mappings, because the PAT valida=
tion
> >>>>>> does a linear walk of the resource tree (lol) for every vm_insert_=
pfn.
> >>>>>> But for i915 at least this is fixed by using the io_mapping
> >>>>>> infrastructure, which does the PAT reservation only once when you =
set
> >>>>>> up the mapping area at driver load.
> >>>>> Yes, I guess that was the issue that the comment describes, but the
> >>>>> issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
> >>>>>
> >>>>>> Also TTM uses VM_PFNMAP right now for everything, so it can't be a
> >>>>>> problem that hurts much :-)
> >>>>> Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
> >>>>>
> >>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/=
ttm_bo_vm.c#L554
> >>>> Uh that's bad, because mixed maps pointing at struct page wont stop
> >>>> gup. At least afaik.
> >>> Hui? I'm pretty sure MIXEDMAP stops gup as well. Otherwise we would h=
ave
> >>> already seen tons of problems with the page cache.
> >> On any architecture which has CONFIG_ARCH_HAS_PTE_SPECIAL vm_insert_mi=
xed
> >> boils down to vm_insert_pfn wrt gup. And special pte stops gup fast pa=
th.
> >>
> >> But if you don't have VM_IO or VM_PFNMAP set, then I'm not seeing how
> >> you're stopping gup slow path. See check_vma_flags() in mm/gup.c.
> >>
> >> Also if you don't have CONFIG_ARCH_HAS_PTE_SPECIAL then I don't think
> >> vm_insert_mixed even works on iomem pfns. There's the devmap exception=
,
> >> but we're not devmap. Worse ttm abuses some accidental codepath to smu=
ggle
> >> in hugepte support by intentionally not being devmap.
> >>
> >> So I'm really not sure this works as we think it should. Maybe good to=
 do
> >> a quick test program on amdgpu with a buffer in system memory only and=
 try
> >> to do direct io into it. If it works, you have a problem, and a bad on=
e.
> > That's probably impossible, since a quick git grep shows that pretty
> > much anything reasonable has special ptes: arc, arm, arm64, powerpc,
> > riscv, s390, sh, sparc, x86. I don't think you'll have a platform
> > where you can plug an amdgpu in and actually exercise the bug :-)
>
> Hm. AFAIK _insert_mixed() doesn't set PTE_SPECIAL on system pages, so I
> don't see what should be stopping gup to those?

If you have an arch with pte special we use insert_pfn(), which afaict
will use pte_mkspecial for the !devmap case. And ttm isn't devmap
(otherwise our hugepte abuse of devmap hugeptes would go rather
wrong).

So I think it stops gup. But I haven't verified at all. Would be good
if Christian can check this with some direct io to a buffer in system
memory.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
