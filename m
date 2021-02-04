Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4144330FBBE
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 19:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238978AbhBDSkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 13:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239259AbhBDSiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 13:38:50 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1606FC06178A
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 10:38:10 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id c1so3174633qtc.1
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 10:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2fIZukpi2sIkAo6dCSdzu+YLGU4yBN0ZS259eTftrmo=;
        b=ZDrg721g9DWz6gMDSvDwcOshGXi43jOvhKY731U9A/W+nuH688MaMKCgUMSVaEuPlO
         u5+zBIVhUE92SR3JQnmAHjF6kTJhmuYcERtH6w6deiWyQm+4KFkhJpcv2rEqKYKJVGvi
         RVpjfxbJub7GmDSp8kzhVOKIgOxxn+S6y80T7yBceMOXc+7hFFm8eF/HSxlhcW7Pk2De
         ot3NI99mADEPnWIzSgFaztVZseNUyGZi+exOu+R4eons5v/t2nBw7nEcVuw4KsnGkvxs
         t66tm0egg5z/aBOZRhgHPfox7TSV82aXYH1YTeRSK0osTfMxz+B+eE3YJz/vpZGwwyne
         48gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2fIZukpi2sIkAo6dCSdzu+YLGU4yBN0ZS259eTftrmo=;
        b=if39JV4dXtloieazG+25FVczWT4x2O9YyRj2lY/Iy5oc8VU1sUkJvnQ+UNcVIH8S/v
         pBOKVO96f3pETTvNQFY3l1HBKnMHFLNrF4Megsh0AGz6oKZdE3gBBGNuBtHRiJe/ZxSL
         KLL3g+Qoz/obciwZXp9j2ltarRr0l7gLIcM+sSIDXJXzr+i5aytfcbbilkll/ZmeEC8Y
         NHZ4Z1Fg8cpNXs6aZpq6Sf0pR9w/g0QCwOY5F2+jTofNuy5GkQZZsbU7ybzecjZPYGN+
         YRISdEd3zFP5Ls9IfKGLUBJay3nSDizarjZt4+vTIBS/0i1QllMNX7Hne1DW20WjRFAZ
         cRvw==
X-Gm-Message-State: AOAM532jku6UGLZiZ9c3WNMEOIFtF6nLoFehgJpwE4dGAtA3Kjd5FOC7
        1zLcgNtLijNYBkVlSqKRkRRqhg==
X-Google-Smtp-Source: ABdhPJyswAPCEbvkwu8uoUdREU+JcFm5YBJnWbEhEdYe1zXUwlPWir/3dhSNStZTV+xow3F8NOw2ZA==
X-Received: by 2002:ac8:7768:: with SMTP id h8mr860973qtu.331.1612463889312;
        Thu, 04 Feb 2021 10:38:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id r64sm6041832qkf.121.2021.02.04.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 10:38:08 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l7jW4-003Xte-3o; Thu, 04 Feb 2021 14:38:08 -0400
Date:   Thu, 4 Feb 2021 14:38:08 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Message-ID: <20210204183808.GY4718@ziepe.ca>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 04, 2021 at 06:16:27PM +0100, Daniel Vetter wrote:
> On Thu, Feb 4, 2021 at 5:13 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
> > > tldr; DMA buffers aren't normal memory, expecting that you can use
> > > them like that (like calling get_user_pages works, or that they're
> > > accounting like any other normal memory) cannot be guaranteed.
> > >
> > > Since some userspace only runs on integrated devices, where all
> > > buffers are actually all resident system memory, there's a huge
> > > temptation to assume that a struct page is always present and useable
> > > like for any more pagecache backed mmap. This has the potential to
> > > result in a uapi nightmare.
> > >
> > > To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> > > blocks get_user_pages and all the other struct page based
> > > infrastructure for everyone. In spirit this is the uapi counterpart to
> > > the kernel-internal CONFIG_DMABUF_DEBUG.
> >
> > Fast gup needs the special flag set on the PTE as well.. Feels weird
> > to have a special VMA without also having special PTEs?
> 
> There's kinda no convenient & cheap way to check for the pte_special
> flag. This here should at least catch accidental misuse, people
> building their own ptes we can't stop. Maybe we should exclude
> VM_MIXEDMAP to catch vm_insert_page in one of these.
> 
> Hm looking at code I think we need to require VM_PFNMAP here to stop
> vm_insert_page. And looking at the various functions, that seems to be
> required (and I guess VM_IO is more for really funky architectures
> where io-space is somewhere else?). I guess I should check for
> VM_PFNMAP instead of VM_SPECIAL?

Well, you said the goal was to block GUP usage, that won't happen
without the PTE special flag, at least on x86

So, really, what you are saying is all dmabuf users should always use
vmf_insert_pfn_prot() or something similar - and never insert_page/etc?

It might make sense to check the vma flags in all the insert paths, eg
vm_insert_page() can't work with VMAs that should not have struct
pages in them (eg VM_SPECIAl, VM_PFNMAP, !VM_MIXEMAP if I understand
it right)

At least as some VM debug option

Jason
