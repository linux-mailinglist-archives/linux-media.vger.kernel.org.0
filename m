Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF4032805E
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 15:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbhCAOKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 09:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbhCAOKL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 09:10:11 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F73C061756
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 06:09:22 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id h38so3967819ooi.8
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 06:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YUH5EUIda5YK6DlSSkyKQ01IANDb2D8ORYQ3oKUgDRU=;
        b=JDYqqj5BCDgXUs9H8YJS+WiJEsUO/1Xz8Hm0bpPZjjOo+PArWrSvKYG8VFPofOLI4C
         Smk48dW8RZWHWsbj+LWVY9URQLhMBrlM5kldi7vwixYCk4nlIg64t3c/c6laTGNKiylk
         o4m8ppWmLC+fQjzKSI2wafX8x6RJybyT4QqWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YUH5EUIda5YK6DlSSkyKQ01IANDb2D8ORYQ3oKUgDRU=;
        b=SzGWtt2EPn8nGfQ9vvo2Nexrg1iBlveqF8poEwudoL257i8MZuHS1yIjeLZeZJisVw
         /8wTuJ2PKm17t1v/atGKD4i4TwFWdXQchJRMjOlf7fKXZsNntftKKa53lJnYWtrAnREx
         r7Id5vhlSMJg6em2jj5+9Fz7qqO/R+N+cOx8K5XWEgGcNPa76nGQWLIWQdQWi6fQzf3g
         H2XR8A2I05W23EBzpQQsgCg0flHkhAVczqiTWTomROaG3BybWLj7rFGLetCkiOgNnrpg
         N3ny9yYXqW3wGjHSzvwqCwQSaZGtd8dhgSllVyc941qMeIRdbOkKCKfpiplQLgPR05By
         MEyg==
X-Gm-Message-State: AOAM530WZAad9Gscyrr54qq/CIWB/ryAzyPCYODOojU5QjaotMBWOH42
        9Pfj8VkFG4wU6zFTI+6Q4wDgVqmYQ0hF6Uq4wSL1fQ==
X-Google-Smtp-Source: ABdhPJwkM0Aff6KrgWWtKBeNRy3YzaeWNgL3B+GtsV5wTxsdWSxfooBVoV90lMA7mmrq/te6cx87TRRZycoTxwMtQLo=
X-Received: by 2002:a4a:c697:: with SMTP id m23mr12664957ooq.28.1614607761471;
 Mon, 01 Mar 2021 06:09:21 -0800 (PST)
MIME-Version: 1.0
References: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com> <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org> <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org> <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org> <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org> <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
In-Reply-To: <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 1 Mar 2021 15:09:10 +0100
Message-ID: <CAKMK7uHOe=LacUkvGC75dyWAt9TRm7ce8vgxasXOXn-6wJTVnA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
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

On Mon, Mar 1, 2021 at 11:17 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 01.03.21 um 10:21 schrieb Thomas Hellstr=C3=B6m (Intel):
> >
> > On 3/1/21 10:05 AM, Daniel Vetter wrote:
> >> On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellstr=C3=B6m (Intel=
)
> >> wrote:
> >>> Hi,
> >>>
> >>> On 3/1/21 9:28 AM, Daniel Vetter wrote:
> >>>> On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellstr=C3=B6m (Intel)
> >>>> <thomas_os@shipmail.org> wrote:
> >>>>> On 2/26/21 2:28 PM, Daniel Vetter wrote:
> >>>>>> So I think it stops gup. But I haven't verified at all. Would be
> >>>>>> good
> >>>>>> if Christian can check this with some direct io to a buffer in
> >>>>>> system
> >>>>>> memory.
> >>>>> Hmm,
> >>>>>
> >>>>> Docs (again vm_normal_page() say)
> >>>>>
> >>>>>     * VM_MIXEDMAP mappings can likewise contain memory with or
> >>>>> without "struct
> >>>>>     * page" backing, however the difference is that _all_ pages
> >>>>> with a struct
> >>>>>     * page (that is, those where pfn_valid is true) are refcounted
> >>>>> and
> >>>>> considered
> >>>>>     * normal pages by the VM. The disadvantage is that pages are
> >>>>> refcounted
> >>>>>     * (which can be slower and simply not an option for some PFNMAP
> >>>>> users). The
> >>>>>     * advantage is that we don't have to follow the strict
> >>>>> linearity rule of
> >>>>>     * PFNMAP mappings in order to support COWable mappings.
> >>>>>
> >>>>> but it's true __vm_insert_mixed() ends up in the insert_pfn()
> >>>>> path, so
> >>>>> the above isn't really true, which makes me wonder if and in that
> >>>>> case
> >>>>> why there could any longer ever be a significant performance
> >>>>> difference
> >>>>> between MIXEDMAP and PFNMAP.
> >>>> Yeah it's definitely confusing. I guess I'll hack up a patch and see
> >>>> what sticks.
> >>>>
> >>>>> BTW regarding the TTM hugeptes, I don't think we ever landed that
> >>>>> devmap
> >>>>> hack, so they are (for the non-gup case) relying on
> >>>>> vma_is_special_huge(). For the gup case, I think the bug is still
> >>>>> there.
> >>>> Maybe there's another devmap hack, but the ttm_vm_insert functions d=
o
> >>>> use PFN_DEV and all that. And I think that stops gup_fast from tryin=
g
> >>>> to find the underlying page.
> >>>> -Daniel
> >>> Hmm perhaps it might, but I don't think so. The fix I tried out was
> >>> to set
> >>>
> >>> PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be
> >>> true, and
> >>> then
> >>>
> >>> follow_devmap_pmd()->get_dev_pagemap() which returns NULL and
> >>> gup_fast()
> >>> backs off,
> >>>
> >>> in the end that would mean setting in stone that "if there is a huge
> >>> devmap
> >>> page table entry for which we haven't registered any devmap struct
> >>> pages
> >>> (get_dev_pagemap returns NULL), we should treat that as a "special"
> >>> huge
> >>> page table entry".
> >>>
> >>>  From what I can tell, all code calling get_dev_pagemap() already
> >>> does that,
> >>> it's just a question of getting it accepted and formalizing it.
> >> Oh I thought that's already how it works, since I didn't spot anything
> >> else that would block gup_fast from falling over. I guess really would
> >> need some testcases to make sure direct i/o (that's the easiest to tes=
t)
> >> fails like we expect.
> >
> > Yeah, IIRC the "| PFN_MAP" is the missing piece for TTM huge ptes.
> > Otherwise pmd_devmap() will not return true and since there is no
> > pmd_special() things break.
>
> Is that maybe the issue we have seen with amdgpu and huge pages?

Yeah, essentially when you have a hugepte inserted by ttm, and it
happens to point at system memory, then gup will work on that. And
create all kinds of havoc.

> Apart from that I'm lost guys, that devmap and gup stuff is not
> something I have a good knowledge of apart from a one mile high view.

I'm not really better, hence would be good to do a testcase and see.
This should provoke it:
- allocate nicely aligned bo in system memory
- mmap, again nicely aligned to 2M
- do some direct io from a filesystem into that mmap, that should trigger g=
up
- before the gup completes free the mmap and bo so that ttm recycles
the pages, which should trip up on the elevated refcount. If you wait
until the direct io is completely, then I think nothing bad can be
observed.

Ofc if your amdgpu+hugepte issue is something else, then maybe we have
another issue.

Also usual caveat: I'm not an mm hacker either, so might be completely wron=
g.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
