Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7095B26DF96
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 17:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgIQPZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 11:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbgIQPZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 11:25:06 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FF7C061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 08:24:58 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id r8so2121481qtp.13
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/MIjfA84FROcmh2Yr+++vHpa0nobfYfMg9k42KNVp2M=;
        b=KItZq7TLRwXkeSUDV7TVakSYOYYpYVj1lFuOvU0VuV2nyeTZkDl+5SDk5YU6xRfdQb
         mmJrGXwRgXiqpqZBf8DLOJr/gMeGErqhZkM8rZSmNzY3KpK/NJt55cQb3C29WXfmsp40
         KJdpWLxQBDyknwAoYt/ULy2EsSn//x6zNDDJW/sQmVP1idUubfNstwrhi9t017rZ3QZJ
         3sDqFSKs5FzHiMnyyMyLtAnPX0Naf0m0oIbzEeYFHkliee0CZ1/6R0VN7TcyiVwxLFrO
         JOOOGOMacxM9ezg1v7YEt3scmLEmwNPGkyrd88i/jnPrnz/LvnJkdxDuuHZJUSvAh0TC
         tmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/MIjfA84FROcmh2Yr+++vHpa0nobfYfMg9k42KNVp2M=;
        b=LwbrqoBsbk5XuTKnCt9BoZFInEM8Pt57mDjtTQW9L1ohiOmFGGIq3il4uIW3klOr4c
         JaQOaCngyvloRLwN6te65diaTBR8tBsir78TyXwoZNh9yUXbwI6p/Zse/xz7KD3RCn1G
         CY8sZZf8t2omb7AUSeHZL6X7CMaHvMO29b8sDcOh2tet7oPaiY9Rk5rCA85mtaQRpaCr
         cadVOO6V6e5bkHugtJPOKxUNCithAJtTGug8wAravyz4lYreJSKYD4VmyOkRsUfOBGJK
         6Ol6ls9gDkYjc8TJptxv12WNhH1zIU2swNlscwIsM+KlOO6IIOFo9N261JQ3eYR9v46Z
         nSeQ==
X-Gm-Message-State: AOAM530gus9shZyXI6mjpuZCIMmTO65J/K1lqzK/Li9xLE8W5Ijs9A2t
        hlwFUOSMIT53HdIMA7gOiSZOrA==
X-Google-Smtp-Source: ABdhPJyml2ehbabsQ2p5uBo50b15HPhlS1qE50x7EQpnsGFfmEF+Ym7+K38vhRLvzw2lQSd1AWRM1Q==
X-Received: by 2002:ac8:5d04:: with SMTP id f4mr16143583qtx.290.1600356297898;
        Thu, 17 Sep 2020 08:24:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id z74sm86638qkb.11.2020.09.17.08.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 08:24:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kIvmK-000VsL-KF; Thu, 17 Sep 2020 12:24:56 -0300
Date:   Thu, 17 Sep 2020 12:24:56 -0300
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
Message-ID: <20200917152456.GH8409@ziepe.ca>
References: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 04:54:44PM +0200, Christian König wrote:
> Am 17.09.20 um 16:35 schrieb Jason Gunthorpe:
> > On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian König wrote:
> > > Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
> > > > On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian König wrote:
> > > > > Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> > > > > > On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
> > > > > > 
> > > > > > > Yeah, but it doesn't work when forwarding from the drm chardev to the
> > > > > > > dma-buf on the importer side, since you'd need a ton of different
> > > > > > > address spaces. And you still rely on the core code picking up your
> > > > > > > pgoff mangling, which feels about as risky to me as the vma file
> > > > > > > pointer wrangling - if it's not consistently applied the reverse map
> > > > > > > is toast and unmap_mapping_range doesn't work correctly for our needs.
> > > > > > I would think the pgoff has to be translated at the same time the
> > > > > > vm->vm_file is changed?
> > > > > > 
> > > > > > The owner of the dma_buf should have one virtual address space and FD,
> > > > > > all its dma bufs should be linked to it, and all pgoffs translated to
> > > > > > that space.
> > > > > Yeah, that is exactly like amdgpu is doing it.
> > > > > 
> > > > > Going to document that somehow when I'm done with TTM cleanups.
> > > > BTW, while people are looking at this, is there a way to go from a VMA
> > > > to a dma_buf that owns it?
> > > Only a driver specific one.
> > Sounds OK
> > 
> > > For TTM drivers vma->vm_private_data points to the buffer object. Not sure
> > > about the drivers using GEM only.
> > Why are drivers in control of the vma? I would think dma_buf should be
> > the vma owner. IIRC module lifetime correctness essentially hings on
> > the module owner of the struct file
> 
> Because the page fault handling is completely driver specific.
>
> We could install some DMA-buf vmops, but that would just be another layer of
> redirection.

If it is already taking a page fault I'm not sure the extra function
call indirection is going to be a big deal. Having a uniform VMA
sounds saner than every driver custom rolling something.

When I unwound a similar mess in RDMA all the custom VMA stuff in the
drivers turned out to be generally buggy, at least.

Is vma->vm_file->private_data universally a dma_buf pointer at least?

> > So, user VA -> find_vma -> dma_buf object -> dma_buf operations on the
> > memory it represents
> 
> Ah, yes we are already doing this in amdgpu as well. But only for DMA-bufs
> or more generally buffers which are mmaped by this driver instance.

So there is no general dma_buf service? That is a real bummer

Jason
