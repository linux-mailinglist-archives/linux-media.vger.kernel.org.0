Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9733E30F95D
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 18:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbhBDRRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 12:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238390AbhBDRRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 12:17:20 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EA6C0613D6
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 09:16:40 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id t25so4133569otc.5
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 09:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJnVO3IRTh6jLTnURSMqZt6jb+mhY21ToLMIpLkV9R4=;
        b=DhM2acIpr+HIk3JVAZvNpFn5a6f9MUwyT7EWsFy2cOKrCeHyfYQt+p5Kh7UioqqHL1
         RnHG2tXuYB5AuR4K+IbXmPhqZQSGTGKUrGAGszVMQOtsx99l6BMz9GYjtfE3rwM9WtdJ
         UXNmWYZbNjQi3TqhxNOS+LsJ7E4aexI6FMs8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJnVO3IRTh6jLTnURSMqZt6jb+mhY21ToLMIpLkV9R4=;
        b=uesFu/R5AT8GRxrrMqB6cSug4ClgeknMPQx/7d9nzqcmhbKet5NwRW6jjT4GN6j+41
         lXp0NM1l4d6oIDUtgXifg0I0+uCxrRFgziOqFA+5mBgC7CprtzXeDKRpaxvVDGF9MecQ
         +IJwDLZXmL+rWNee01iinK5A/CX4hpBwjsJbWGJspWTUfRhXHpaFzt22fi/94PHTBzPV
         Li7ESvIcxc7sPyIlbFRAy5rpvUDDZcv41pOXVWdYZsiLELdQh/wRuSdOxrrJoO1DtEPs
         wHNgS7fpYCQWXKipCaZB6WIz8bjRFkSk6HHADUwOs8OcRj8Zt86CIWnShvOHuHEwzDYp
         aROQ==
X-Gm-Message-State: AOAM530cy+ujnlVmuj1TyqI2xUwgEDboae/foKqto6EhAgHnmRhXBh5L
        2We0H68azALak6WZFHD7O0Y6xxzSr5CvAx5bH6PeZQ==
X-Google-Smtp-Source: ABdhPJwAkGg4N4y18wGDr+SCd9/HnouTpio3RzotUFP5dy6ZXX80lPrKik+UQ1LGNd1ps7C62WHTl9aITStWc16IyCk=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr236633otr.303.1612458998103;
 Thu, 04 Feb 2021 09:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch> <20210204161339.GX4718@ziepe.ca>
In-Reply-To: <20210204161339.GX4718@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 4 Feb 2021 18:16:27 +0100
Message-ID: <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
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

On Thu, Feb 4, 2021 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
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
> > To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> > blocks get_user_pages and all the other struct page based
> > infrastructure for everyone. In spirit this is the uapi counterpart to
> > the kernel-internal CONFIG_DMABUF_DEBUG.
>
> Fast gup needs the special flag set on the PTE as well.. Feels weird
> to have a special VMA without also having special PTEs?

There's kinda no convenient & cheap way to check for the pte_special
flag. This here should at least catch accidental misuse, people
building their own ptes we can't stop. Maybe we should exclude
VM_MIXEDMAP to catch vm_insert_page in one of these.

Hm looking at code I think we need to require VM_PFNMAP here to stop
vm_insert_page. And looking at the various functions, that seems to be
required (and I guess VM_IO is more for really funky architectures
where io-space is somewhere else?). I guess I should check for
VM_PFNMAP instead of VM_SPECIAL?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
