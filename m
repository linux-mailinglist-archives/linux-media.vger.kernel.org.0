Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFAF337392
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhCKNRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbhCKNR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:17:26 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EA3C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:17:25 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id j22so1431120otp.2
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bKAvvOczb1CSflZNXffhAXafwD51ZVGwg+Gu9WS8Pc4=;
        b=JNvc6lh3uyr+9kw65lwP9oAVYfY0gxjHLch9GbO4UTX75se+kSVEAI6gde+UfHOesw
         P6kdxwPv0XA4uNYHlBc2UfWZWgZpe88+pYVbrVPCieaIMGlUUo26qkD/gRSV/dLiifeH
         pZsdVtVpfAqHAF5FVKSs/sHWZg4GGWk2lAy1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bKAvvOczb1CSflZNXffhAXafwD51ZVGwg+Gu9WS8Pc4=;
        b=VZZBebDJ7Sj/aeZQm08lyZAnpp8T1faBfx8Y/1aC1RYCUmw8uxK/fav8Qg60rxozHg
         v162uKIrNp7P8BOCCLxotYv1OIKu4MoOch+i9upz3s+GMA2vWps/RX0kOX+bm7bmP+s0
         343cwZqvQbrsnY/iYV9A0yoOrJc4MIbzjOlrxAeuIHiJ9a7qgGfe0JpFYTyUz96Vw+O4
         IjZaw6SxAxj/yMxrDEPfdDY0Y/Q+JQpd0/4ZftAMFR3CdaXLW+/dEdE7xiQqBwxdljaB
         dXrOvyxjmxvkNQemlk3L5XD6AWetW45Imzdz2CVq9o+KuGTn4lPIc0dKiGavjhKn4tUY
         5y/g==
X-Gm-Message-State: AOAM533j8UTFrzJktTYhDOq1EzRhlwAyjC32ozqgB0Oivn5e9wnyMDiM
        1pvy48xsmrHYLEzfzmS4U9VuYwfOZBkl9V2uDMEIeg==
X-Google-Smtp-Source: ABdhPJwd4ak1KIS8TV9epC3TsEBTX+WwoMHOG//pHBqfatuhwFAyhTu3lphRgW2AIHLOIFPrDzlcsh9ELmfwiD8l2OA=
X-Received: by 2002:a9d:648f:: with SMTP id g15mr6709694otl.188.1615468645194;
 Thu, 11 Mar 2021 05:17:25 -0800 (PST)
MIME-Version: 1.0
References: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org> <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org> <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org> <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
 <CAKMK7uHOe=LacUkvGC75dyWAt9TRm7ce8vgxasXOXn-6wJTVnA@mail.gmail.com>
 <9d608c61-c64c-dcde-c719-59a970144404@shipmail.org> <YEoUZe8BtvQdv3TG@phenom.ffwll.local>
 <0e15ae7a-58d3-c75e-9a6c-e397e11750a7@shipmail.org>
In-Reply-To: <0e15ae7a-58d3-c75e-9a6c-e397e11750a7@shipmail.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 11 Mar 2021 14:17:14 +0100
Message-ID: <CAKMK7uEzGKUc27xdWTv7KPESsyg1kCYCmVxP3b-HrzNCNO5x7g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 11, 2021 at 2:12 PM Thomas Hellstr=C3=B6m (Intel)
<thomas_os@shipmail.org> wrote:
>
> Hi!
>
> On 3/11/21 2:00 PM, Daniel Vetter wrote:
> > On Thu, Mar 11, 2021 at 11:22:06AM +0100, Thomas Hellstr=C3=B6m (Intel)=
 wrote:
> >> On 3/1/21 3:09 PM, Daniel Vetter wrote:
> >>> On Mon, Mar 1, 2021 at 11:17 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> Am 01.03.21 um 10:21 schrieb Thomas Hellstr=C3=B6m (Intel):
> >>>>> On 3/1/21 10:05 AM, Daniel Vetter wrote:
> >>>>>> On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellstr=C3=B6m (I=
ntel)
> >>>>>> wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On 3/1/21 9:28 AM, Daniel Vetter wrote:
> >>>>>>>> On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellstr=C3=B6m (Intel)
> >>>>>>>> <thomas_os@shipmail.org> wrote:
> >>>>>>>>> On 2/26/21 2:28 PM, Daniel Vetter wrote:
> >>>>>>>>>> So I think it stops gup. But I haven't verified at all. Would =
be
> >>>>>>>>>> good
> >>>>>>>>>> if Christian can check this with some direct io to a buffer in
> >>>>>>>>>> system
> >>>>>>>>>> memory.
> >>>>>>>>> Hmm,
> >>>>>>>>>
> >>>>>>>>> Docs (again vm_normal_page() say)
> >>>>>>>>>
> >>>>>>>>>       * VM_MIXEDMAP mappings can likewise contain memory with o=
r
> >>>>>>>>> without "struct
> >>>>>>>>>       * page" backing, however the difference is that _all_ pag=
es
> >>>>>>>>> with a struct
> >>>>>>>>>       * page (that is, those where pfn_valid is true) are refco=
unted
> >>>>>>>>> and
> >>>>>>>>> considered
> >>>>>>>>>       * normal pages by the VM. The disadvantage is that pages =
are
> >>>>>>>>> refcounted
> >>>>>>>>>       * (which can be slower and simply not an option for some =
PFNMAP
> >>>>>>>>> users). The
> >>>>>>>>>       * advantage is that we don't have to follow the strict
> >>>>>>>>> linearity rule of
> >>>>>>>>>       * PFNMAP mappings in order to support COWable mappings.
> >>>>>>>>>
> >>>>>>>>> but it's true __vm_insert_mixed() ends up in the insert_pfn()
> >>>>>>>>> path, so
> >>>>>>>>> the above isn't really true, which makes me wonder if and in th=
at
> >>>>>>>>> case
> >>>>>>>>> why there could any longer ever be a significant performance
> >>>>>>>>> difference
> >>>>>>>>> between MIXEDMAP and PFNMAP.
> >>>>>>>> Yeah it's definitely confusing. I guess I'll hack up a patch and=
 see
> >>>>>>>> what sticks.
> >>>>>>>>
> >>>>>>>>> BTW regarding the TTM hugeptes, I don't think we ever landed th=
at
> >>>>>>>>> devmap
> >>>>>>>>> hack, so they are (for the non-gup case) relying on
> >>>>>>>>> vma_is_special_huge(). For the gup case, I think the bug is sti=
ll
> >>>>>>>>> there.
> >>>>>>>> Maybe there's another devmap hack, but the ttm_vm_insert functio=
ns do
> >>>>>>>> use PFN_DEV and all that. And I think that stops gup_fast from t=
rying
> >>>>>>>> to find the underlying page.
> >>>>>>>> -Daniel
> >>>>>>> Hmm perhaps it might, but I don't think so. The fix I tried out w=
as
> >>>>>>> to set
> >>>>>>>
> >>>>>>> PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be
> >>>>>>> true, and
> >>>>>>> then
> >>>>>>>
> >>>>>>> follow_devmap_pmd()->get_dev_pagemap() which returns NULL and
> >>>>>>> gup_fast()
> >>>>>>> backs off,
> >>>>>>>
> >>>>>>> in the end that would mean setting in stone that "if there is a h=
uge
> >>>>>>> devmap
> >>>>>>> page table entry for which we haven't registered any devmap struc=
t
> >>>>>>> pages
> >>>>>>> (get_dev_pagemap returns NULL), we should treat that as a "specia=
l"
> >>>>>>> huge
> >>>>>>> page table entry".
> >>>>>>>
> >>>>>>>    From what I can tell, all code calling get_dev_pagemap() alrea=
dy
> >>>>>>> does that,
> >>>>>>> it's just a question of getting it accepted and formalizing it.
> >>>>>> Oh I thought that's already how it works, since I didn't spot anyt=
hing
> >>>>>> else that would block gup_fast from falling over. I guess really w=
ould
> >>>>>> need some testcases to make sure direct i/o (that's the easiest to=
 test)
> >>>>>> fails like we expect.
> >>>>> Yeah, IIRC the "| PFN_MAP" is the missing piece for TTM huge ptes.
> >>>>> Otherwise pmd_devmap() will not return true and since there is no
> >>>>> pmd_special() things break.
> >>>> Is that maybe the issue we have seen with amdgpu and huge pages?
> >>> Yeah, essentially when you have a hugepte inserted by ttm, and it
> >>> happens to point at system memory, then gup will work on that. And
> >>> create all kinds of havoc.
> >>>
> >>>> Apart from that I'm lost guys, that devmap and gup stuff is not
> >>>> something I have a good knowledge of apart from a one mile high view=
.
> >>> I'm not really better, hence would be good to do a testcase and see.
> >>> This should provoke it:
> >>> - allocate nicely aligned bo in system memory
> >>> - mmap, again nicely aligned to 2M
> >>> - do some direct io from a filesystem into that mmap, that should tri=
gger gup
> >>> - before the gup completes free the mmap and bo so that ttm recycles
> >>> the pages, which should trip up on the elevated refcount. If you wait
> >>> until the direct io is completely, then I think nothing bad can be
> >>> observed.
> >>>
> >>> Ofc if your amdgpu+hugepte issue is something else, then maybe we hav=
e
> >>> another issue.
> >>>
> >>> Also usual caveat: I'm not an mm hacker either, so might be completel=
y wrong.
> >>> -Daniel
> >> So I did the following quick experiment on vmwgfx, and it turns out th=
at
> >> with it,
> >> fast gup never succeeds. Without the "| PFN_MAP", it typically succeed=
s
> >>
> >> I should probably craft an RFC formalizing this.
> > Yeah I think that would be good. Maybe even more formalized if we also
> > switch over to VM_PFNMAP, since afaiui these pte flags here only stop t=
he
> > fast gup path. And slow gup can still peak through VM_MIXEDMAP. Or
> > something like that.
> >
> > Otoh your description of when it only sometimes succeeds would indicate=
 my
> > understanding of VM_PFNMAP vs VM_MIXEDMAP is wrong here.
>
> My understanding from reading the vmf_insert_mixed() code is that iff
> the arch has pte_special(), VM_MIXEDMAP should be harmless. But that's
> not consistent with the vm_normal_page() doc. For architectures without
> pte_special, VM_PFNMAP must be used, and then we must also block COW
> mappings.
>
> If we can get someone can commit to verify that the potential PAT WC
> performance issue is gone with PFNMAP, I can put together a series with
> that included.

Iirc when I checked there's not much archs without pte_special, so I
guess that's why we luck out. Hopefully.

> As for existing userspace using COW TTM mappings, I once had a couple of
> test cases to verify that it actually worked, in particular together
> with huge PMDs and PUDs where breaking COW would imply splitting those,
> but I can't think of anything else actually wanting to do that other
> than by mistake.

Yeah disallowing MAP_PRIVATE mappings would be another good thing to
lock down. Really doesn't make much sense.
-Daniel

> /Thomas
>
>
> >
> > Christian, what's your take?
> > -Daniel
> >
> >> /Thomas
> >>
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >> index 6dc96cf66744..72b6fb17c984 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >> @@ -195,6 +195,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_=
fault
> >> *vmf,
> >>          pfn_t pfnt;
> >>          struct ttm_tt *ttm =3D bo->ttm;
> >>          bool write =3D vmf->flags & FAULT_FLAG_WRITE;
> >> +       struct dev_pagemap *pagemap;
> >>
> >>          /* Fault should not cross bo boundary. */
> >>          page_offset &=3D ~(fault_page_size - 1);
> >> @@ -210,6 +211,17 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm=
_fault
> >> *vmf,
> >>          if ((pfn & (fault_page_size - 1)) !=3D 0)
> >>                  goto out_fallback;
> >>
> >> +       /*
> >> +        * Huge entries must be special, that is marking them as devma=
p
> >> +        * with no backing device map range. If there is a backing
> >> +        * range, Don't insert a huge entry.
> >> +        */
> >> +       pagemap =3D get_dev_pagemap(pfn, NULL);
> >> +       if (pagemap) {
> >> +               put_dev_pagemap(pagemap);
> >> +               goto out_fallback;
> >> +       }
> >> +
> >>          /* Check that memory is contiguous. */
> >>          if (!bo->mem.bus.is_iomem) {
> >>                  for (i =3D 1; i < fault_page_size; ++i) {
> >> @@ -223,7 +235,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_=
fault
> >> *vmf,
> >>                  }
> >>          }
> >>
> >> -       pfnt =3D __pfn_to_pfn_t(pfn, PFN_DEV);
> >> +       pfnt =3D __pfn_to_pfn_t(pfn, PFN_DEV | PFN_MAP);
> >>          if (fault_page_size =3D=3D (HPAGE_PMD_SIZE >> PAGE_SHIFT))
> >>                  ret =3D vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, wr=
ite);
> >>   #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> >> @@ -236,6 +248,21 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm=
_fault
> >> *vmf,
> >>          if (ret !=3D VM_FAULT_NOPAGE)
> >>                  goto out_fallback;
> >>
> >> +#if 1
> >> +       {
> >> +               int npages;
> >> +               struct page *page;
> >> +
> >> +               npages =3D get_user_pages_fast_only(vmf->address, 1, 0=
,
> >> &page);
> >> +               if (npages =3D=3D 1) {
> >> +                       DRM_WARN("Fast gup succeeded. Bad.\n");
> >> +                       put_page(page);
> >> +               } else {
> >> +                       DRM_INFO("Fast gup failed. Good.\n");
> >> +               }
> >> +       }
> >> +#endif
> >> +
> >>          return VM_FAULT_NOPAGE;
> >>   out_fallback:
> >>          count_vm_event(THP_FAULT_FALLBACK);
> >>
> >>
> >>
> >>
> >>



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
