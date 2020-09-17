Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF2F26DE85
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 16:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbgIQOhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 10:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbgIQOgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 10:36:47 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1A9C061355
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 07:35:53 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id q63so2422934qkf.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4FMmUqw3Ogf5DWfrcaBYE+88tcXzyk3qcn9Gd5hl3YQ=;
        b=j5oYloPvYL7s4CPTt81wv4olgyoI/6IlhT6aI8lDvNqHADWP/JsUZ4WNwSAnarJJVd
         Jdd7y5LK3H4qrJDXIzo4GzxtRtRdSn74TO+sPmBQ+A3UTKrWoV2qqwIgla/t6cN1mEzh
         YgB03e2F1hYq89gJy2In7h5LX8mfdp/lJ8vauS8eQJrPZEuv9vFNxus3W1QS8aEEh2jU
         aNgxQzkQEHZvN34u0lGhLEgUFKJXoYCaI/tF+nC0CovO/q9P121VcOoAOdmqbPSwPlwQ
         9k8ecPtmJZWZCMPSONUM47C13l3uQbZ64/zvk+EFKCwijs/wPUYHVUJBOSzB9UTR274e
         bIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4FMmUqw3Ogf5DWfrcaBYE+88tcXzyk3qcn9Gd5hl3YQ=;
        b=d5cT4X9Z44DkO4+32jqeLYvYyQimwXZtYatCZ72iVCb4w9rIfwwdfpMueYPlst+4g8
         TnLQr7MWa5fAZjP0ycOeBA2V6psp0uTehijSzvV0JQM2FcTBKeCG4QlUaArrjypMmLCM
         BM9GBFLtj/wbjjVCRuIiXV5ngbCUe85WrhomJp8eLfy7GMBsI0VkRPua6o4Ptec0XdR9
         3me2jVkoJtNatt8XyTcnW//LBeiYwyQtkzvPF0JpM29P8qOYDT8/O2zp3fpD8VhJlWrb
         uj7aneaa/j4M5tea2RoMVYwDblBEcXDV60volZYvZupZYX0ESZbSSqeAARk8jkiYeh46
         wrXw==
X-Gm-Message-State: AOAM532ATAA8CU16XDOCCS4wGV57MRquVoIpKwScnwvEpdq2M3sPCPAG
        +1iTc26nAA18mTdsuRC6LrWDnA==
X-Google-Smtp-Source: ABdhPJzS5DvFjFRz09F8HD5ZwD/CTVt6TV63hE1mZt++JvtsXfCWDtAegDUHikgXHQCiEAeg2s8xdA==
X-Received: by 2002:a05:620a:15ac:: with SMTP id f12mr27633534qkk.19.1600353352699;
        Thu, 17 Sep 2020 07:35:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m36sm20906770qtd.10.2020.09.17.07.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 07:35:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kIv0p-000VC1-Ed; Thu, 17 Sep 2020 11:35:51 -0300
Date:   Thu, 17 Sep 2020 11:35:51 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     christian.koenig@amd.com
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917143551.GG8409@ziepe.ca>
References: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian König wrote:
> Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
> > On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
> > > Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> > > > On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
> > > > 
> > > > > Yeah, but it doesn't work when forwarding from the drm chardev to the
> > > > > dma-buf on the importer side, since you'd need a ton of different
> > > > > address spaces. And you still rely on the core code picking up your
> > > > > pgoff mangling, which feels about as risky to me as the vma file
> > > > > pointer wrangling - if it's not consistently applied the reverse map
> > > > > is toast and unmap_mapping_range doesn't work correctly for our needs.
> > > > I would think the pgoff has to be translated at the same time the
> > > > vm->vm_file is changed?
> > > > 
> > > > The owner of the dma_buf should have one virtual address space and FD,
> > > > all its dma bufs should be linked to it, and all pgoffs translated to
> > > > that space.
> > > Yeah, that is exactly like amdgpu is doing it.
> > > 
> > > Going to document that somehow when I'm done with TTM cleanups.
> > BTW, while people are looking at this, is there a way to go from a VMA
> > to a dma_buf that owns it?
> 
> Only a driver specific one.

Sounds OK

> For TTM drivers vma->vm_private_data points to the buffer object. Not sure
> about the drivers using GEM only.

Why are drivers in control of the vma? I would think dma_buf should be
the vma owner. IIRC module lifetime correctness essentially hings on
the module owner of the struct file

> Why are you asking?

I'm thinking about using find_vma on something that is not
get_user_pages()'able to go to the underlying object, in this case dma
buf.

So, user VA -> find_vma -> dma_buf object -> dma_buf operations on the
memory it represents

Jason
