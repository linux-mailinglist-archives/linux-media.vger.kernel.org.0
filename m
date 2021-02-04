Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E28B30FDA9
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 21:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239832AbhBDUCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 15:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238594AbhBDUAw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 15:00:52 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0E1C06178B
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 12:00:12 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id w8so5038206oie.2
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 12:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=90M/71bjC9CGs3ogusHe7Lln0a+4v/EBmrZ9cb/rWvE=;
        b=D7GIO8jpHe/gkbaLe1baKOL9WZpSqRpl716zCmqa5VLl2L9Zpy3N8TgnimejTOU6HB
         XvrWwU+YnHtkmzTov45MWoarwGWvCOpuiwJo24Z4f6M7OODaT86zF01Vw7MhaQz3fqhe
         6d+LDr7ndJ1xlwpd8eVeUJz+/Ii+hqBbqeaUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90M/71bjC9CGs3ogusHe7Lln0a+4v/EBmrZ9cb/rWvE=;
        b=mqTNXTl0TmOHNT1JCfhfKSJpI0tPapuzu+eodCQ2fRZnYk1Yb+OJVw4T7Do3C5aRdg
         sC0ow5zS1uBkTvtHib9e7mW+JwEeC9FMtJiAFb4/uEd7BvceBglUo+ox08dYDX7eAP1G
         ZucELUi92FKlUbZl7/tBcYw55/K4ashPefBUhrJrBIDklIioLwac73e/5e1VV6XoRhPY
         r0WlJ4cCbID1ef94/5gYfg+CX6CJr8cjE96R9n5g4At+rToB+l5EEYIgHHp5V3BdjxR+
         Ly6Y4/79b0weG5cvdRLOKA5VQCIM3qt/x7uTIp3BSbhCogHOI5merBj8G+xnERdTxZaI
         vyTw==
X-Gm-Message-State: AOAM531hxgpAREgrlSOcdNVJGeCU7Esri9viIxMZ1qP/LHomiPMS4AJ3
        0r2GsP25kWi/CwLgM2g4xDV+53kg2i4ou1fKhXLMJg==
X-Google-Smtp-Source: ABdhPJwTuzNhAKxR0BkOyvj49dEx6Ja/iHwKoMWy60qW2EMYu8xTXD6u0yZN04biYADL17T3361IvWxlLPIJipMbnB4=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr794397oia.14.1612468811660;
 Thu, 04 Feb 2021 12:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca> <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
In-Reply-To: <20210204183808.GY4718@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 4 Feb 2021 20:59:59 +0100
Message-ID: <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 7:38 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 04, 2021 at 06:16:27PM +0100, Daniel Vetter wrote:
> > On Thu, Feb 4, 2021 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
> > > > tldr; DMA buffers aren't normal memory, expecting that you can use
> > > > them like that (like calling get_user_pages works, or that they're
> > > > accounting like any other normal memory) cannot be guaranteed.
> > > >
> > > > Since some userspace only runs on integrated devices, where all
> > > > buffers are actually all resident system memory, there's a huge
> > > > temptation to assume that a struct page is always present and useable
> > > > like for any more pagecache backed mmap. This has the potential to
> > > > result in a uapi nightmare.
> > > >
> > > > To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> > > > blocks get_user_pages and all the other struct page based
> > > > infrastructure for everyone. In spirit this is the uapi counterpart to
> > > > the kernel-internal CONFIG_DMABUF_DEBUG.
> > >
> > > Fast gup needs the special flag set on the PTE as well.. Feels weird
> > > to have a special VMA without also having special PTEs?
> >
> > There's kinda no convenient & cheap way to check for the pte_special
> > flag. This here should at least catch accidental misuse, people
> > building their own ptes we can't stop. Maybe we should exclude
> > VM_MIXEDMAP to catch vm_insert_page in one of these.
> >
> > Hm looking at code I think we need to require VM_PFNMAP here to stop
> > vm_insert_page. And looking at the various functions, that seems to be
> > required (and I guess VM_IO is more for really funky architectures
> > where io-space is somewhere else?). I guess I should check for
> > VM_PFNMAP instead of VM_SPECIAL?
>
> Well, you said the goal was to block GUP usage, that won't happen
> without the PTE special flag, at least on x86
>
> So, really, what you are saying is all dmabuf users should always use
> vmf_insert_pfn_prot() or something similar - and never insert_page/etc?
>
> It might make sense to check the vma flags in all the insert paths, eg
> vm_insert_page() can't work with VMAs that should not have struct
> pages in them (eg VM_SPECIAl, VM_PFNMAP, !VM_MIXEMAP if I understand
> it right)

Well that's what I've done, and it /looks/ like all the checks are
there already, as long as we use VM_PFNMAP. vm_insert_page tries to
auto-add VM_MIXEDMAP, but bails out with a BUG_ON if VM_PFNMAP is set.
And all the vm_insert_pfn_prot/remap_pfn_range functions require (or
set) VM_PFNMAP.

So I think just checking for VM_PFNMAP after the vma is set up should
be enough to guarantee we'll only have pte_special ptes in there,
ever. But I'm not sure, this stuff all isn't really documented much
and the code is sometimes a maze (to me at least).

> At least as some VM debug option

Seems to be there already unconditionally.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
