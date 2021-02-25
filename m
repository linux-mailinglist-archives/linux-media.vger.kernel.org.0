Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDBE3252C1
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 16:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhBYPud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 10:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhBYPub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 10:50:31 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B006C061574
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 07:49:50 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id h38so1470767ooi.8
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=66axxPgwk3y05kB6nKdd5S7hoUR2QbV0PBw5haTS2vs=;
        b=UkUb6lYM0OqUY3i9FUThvV8RMHyrZ2S8hl0K66TNTtVDMzFiYLKnas85uCzMga/5uF
         ErR5NNobcwUwyefHR6o2XoqihokuelRklf150sryisbyHHCyzmWrecZzxsZ9R28NwLPI
         t+CnXHuTGRaUYX4r06wpOfwtk/IY3uZ9NChrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=66axxPgwk3y05kB6nKdd5S7hoUR2QbV0PBw5haTS2vs=;
        b=AjY6Wkimm+xzMNDxZUcnKL2McjFw9lBnhz2SwNBuBV3+B/Ch54nE6mK+WhF2xDFf2k
         LncjFEFTv56poaeGImHwuvbdfq1EFEXREzGmUos27193EuRrn8YbLAF+Pkn57YAoiBzz
         EY53KPuboLXV79EpS6vvoDGccBfPnIm7eO5vO2eyaJix010/KFFrEI9NA55OxOgOmuiY
         Gcgx/Jo20gQmQU0PSQw04QsIArHOCDLL3b8xy/t/JyiJ5wlo8zpaSYpgWs8aj8fd1Bwi
         McugxprN2VwIOI5LZYu0Ns+5OFcYeh6wzpvCHYrxVsl6uNP4DSA3EIOR3y7PW/50PQ0O
         xlLg==
X-Gm-Message-State: AOAM532DL0WcasOXTmNzPWIYnblfdmDzxidDmyj4fv+iqJqLcvPJ7+N5
        3zh43SurBMj/NxhjUT6FsY4Ra33YLrOHLci+ybvrbA==
X-Google-Smtp-Source: ABdhPJz39Q8y6xrB2+kTt8RumQPbOjQYl9WE9QhULnlXSouL9frT3IALzZMloRVIqo/UupTpwCivyAkSOGQkuUnakGc=
X-Received: by 2002:a4a:c697:: with SMTP id m23mr2848326ooq.28.1614268189468;
 Thu, 25 Feb 2021 07:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org> <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org> <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com> <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
In-Reply-To: <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 25 Feb 2021 16:49:38 +0100
Message-ID: <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
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

On Thu, Feb 25, 2021 at 11:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Feb 25, 2021 at 11:28:31AM +0100, Christian K=C3=B6nig wrote:
> > Am 24.02.21 um 10:31 schrieb Daniel Vetter:
> > > On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellstr=C3=B6m (Intel)
> > > <thomas_os@shipmail.org> wrote:
> > > >
> > > > On 2/24/21 9:45 AM, Daniel Vetter wrote:
> > > > > On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellstr=C3=B6m (Intel)
> > > > > <thomas_os@shipmail.org> wrote:
> > > > > > On 2/23/21 11:59 AM, Daniel Vetter wrote:
> > > > > > > tldr; DMA buffers aren't normal memory, expecting that you ca=
n use
> > > > > > > them like that (like calling get_user_pages works, or that th=
ey're
> > > > > > > accounting like any other normal memory) cannot be guaranteed=
.
> > > > > > >
> > > > > > > Since some userspace only runs on integrated devices, where a=
ll
> > > > > > > buffers are actually all resident system memory, there's a hu=
ge
> > > > > > > temptation to assume that a struct page is always present and=
 useable
> > > > > > > like for any more pagecache backed mmap. This has the potenti=
al to
> > > > > > > result in a uapi nightmare.
> > > > > > >
> > > > > > > To stop this gap require that DMA buffer mmaps are VM_PFNMAP,=
 which
> > > > > > > blocks get_user_pages and all the other struct page based
> > > > > > > infrastructure for everyone. In spirit this is the uapi count=
erpart to
> > > > > > > the kernel-internal CONFIG_DMABUF_DEBUG.
> > > > > > >
> > > > > > > Motivated by a recent patch which wanted to swich the system =
dma-buf
> > > > > > > heap to vm_insert_page instead of vm_insert_pfn.
> > > > > > >
> > > > > > > v2:
> > > > > > >
> > > > > > > Jason brought up that we also want to guarantee that all ptes=
 have the
> > > > > > > pte_special flag set, to catch fast get_user_pages (on archit=
ectures
> > > > > > > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL doe=
s) would
> > > > > > > still allow vm_insert_page, but limiting to VM_PFNMAP will ca=
tch that.
> > > > > > >
> > > > > > >    From auditing the various functions to insert pfn pte enti=
res
> > > > > > > (vm_insert_pfn_prot, remap_pfn_range and all it's callers lik=
e
> > > > > > > dma_mmap_wc) it looks like VM_PFNMAP is already required anyw=
ay, so
> > > > > > > this should be the correct flag to check for.
> > > > > > >
> > > > > > If we require VM_PFNMAP, for ordinary page mappings, we also ne=
ed to
> > > > > > disallow COW mappings, since it will not work on architectures =
that
> > > > > > don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_no=
rmal_page()).
> > > > > Hm I figured everyone just uses MAP_SHARED for buffer objects sin=
ce
> > > > > COW really makes absolutely no sense. How would we enforce this?
> > > > Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either =
that
> > > > or allowing MIXEDMAP.
> > > >
> > > > > > Also worth noting is the comment in  ttm_bo_mmap_vma_setup() wi=
th
> > > > > > possible performance implications with x86 + PAT + VM_PFNMAP + =
normal
> > > > > > pages. That's a very old comment, though, and might not be vali=
d anymore.
> > > > > I think that's why ttm has a page cache for these, because it ind=
eed
> > > > > sucks. The PAT changes on pages are rather expensive.
> > > > IIRC the page cache was implemented because of the slowness of the
> > > > caching mode transition itself, more specifically the wbinvd() call=
 +
> > > > global TLB flush.
> >
> > Yes, exactly that. The global TLB flush is what really breaks our neck =
here
> > from a performance perspective.
> >
> > > > > There is still an issue for iomem mappings, because the PAT valid=
ation
> > > > > does a linear walk of the resource tree (lol) for every vm_insert=
_pfn.
> > > > > But for i915 at least this is fixed by using the io_mapping
> > > > > infrastructure, which does the PAT reservation only once when you=
 set
> > > > > up the mapping area at driver load.
> > > > Yes, I guess that was the issue that the comment describes, but the
> > > > issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
> > > >
> > > > > Also TTM uses VM_PFNMAP right now for everything, so it can't be =
a
> > > > > problem that hurts much :-)
> > > > Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
> > > >
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/=
ttm_bo_vm.c#L554
> > > Uh that's bad, because mixed maps pointing at struct page wont stop
> > > gup. At least afaik.
> >
> > Hui? I'm pretty sure MIXEDMAP stops gup as well. Otherwise we would hav=
e
> > already seen tons of problems with the page cache.
>
> On any architecture which has CONFIG_ARCH_HAS_PTE_SPECIAL vm_insert_mixed
> boils down to vm_insert_pfn wrt gup. And special pte stops gup fast path.
>
> But if you don't have VM_IO or VM_PFNMAP set, then I'm not seeing how
> you're stopping gup slow path. See check_vma_flags() in mm/gup.c.
>
> Also if you don't have CONFIG_ARCH_HAS_PTE_SPECIAL then I don't think
> vm_insert_mixed even works on iomem pfns. There's the devmap exception,
> but we're not devmap. Worse ttm abuses some accidental codepath to smuggl=
e
> in hugepte support by intentionally not being devmap.
>
> So I'm really not sure this works as we think it should. Maybe good to do
> a quick test program on amdgpu with a buffer in system memory only and tr=
y
> to do direct io into it. If it works, you have a problem, and a bad one.

That's probably impossible, since a quick git grep shows that pretty
much anything reasonable has special ptes: arc, arm, arm64, powerpc,
riscv, s390, sh, sparc, x86. I don't think you'll have a platform
where you can plug an amdgpu in and actually exercise the bug :-)

So maybe we should just switch over to VM_PFNMAP for ttm for more clarity?
-Daniel


>
> >
> > Regards,
> > Christian.
> >
> > > Christian, do we need to patch this up, and maybe fix up ttm fault
> > > handler to use io_mapping so the vm_insert_pfn stuff is fast?
> > > -Daniel
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
