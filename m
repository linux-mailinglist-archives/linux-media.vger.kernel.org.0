Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377EC30FEF7
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 22:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhBDVAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 16:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBDVAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 16:00:09 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E2FC061786
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 12:59:29 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id h21so2429541qvb.8
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n75WBNg1x50BJcg3mKAtGr4x+uvExRbP1rZgvduFmms=;
        b=RyiAT71F0FJOBykjnRAtTmjDMlrx+acOs03Y0CKW08rrIua5YWgoJbMj2/iylKhF9r
         0l/PGPuxcHM8XapGcE2CI8r0tumV9Z/hBb2syhg5AUajNngEL6SAhTjpSTKqNbOp9p68
         55nBdiSh49453WXuZJtxZ1OV9WKR3OS05DHcEFFA3bs0LXl1yIghd+xylBLh7Alnlq71
         ftTlc3eITnv8GzMkDxHWGZsxTRA/Fbe5+O3PXEdhReUTi5vyEEE/xlHwI36EZttpk0GL
         XZFIJxBeqVHYCpxO+xHBMAOC+cP10uMZSEX7FXuYrBNyoxPFj5Qn4+J3VjDHUqyJ1wUE
         7wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n75WBNg1x50BJcg3mKAtGr4x+uvExRbP1rZgvduFmms=;
        b=joRK7ad+Tipl/D3Ktxc3cXAvtNuDydOMpR8IgpiGugF2yQAfuy6wbYtd+asuF/GVsy
         nkiUkq+SEGi+3rdGbnn2b6hiWTHtY9QdXQFdxaIhsVvv8kQh0C6d95EzUl0nAEygT5Ln
         BR0CPvI2rCWYhRNgKE2GhBNccbp8r/3kiLzxKBVlZqIYuv4Em/fWhk0ReMzRaWom12ef
         0F+gM4lYV7Ifwc/BdCq5OKDRRGuCtWV9LAR2cqfnmgNxuqP/JusJkopdskFekjVPZY/o
         E6zJ2Bed0iofGGdHgnJKMU/v6IEbxuPaRQ+A8BWEvZ69Fr63H9VOKbGW24YLSlylZDHc
         Ggkw==
X-Gm-Message-State: AOAM531A4PFVOdEf05LZ1i/jY2xKP+GoZhiGc8KNj0vAQYCfjZi/xJEA
        OEzPsMwnTl6VA9V1WDdmPeZN+Q==
X-Google-Smtp-Source: ABdhPJwZFWZ6awvFHqdJL4UUnlowU47Qi5VzIFfgn2cHYsy3nLxwm+reeVZdpy6RJAskbYGuv2tdqw==
X-Received: by 2002:a05:6214:208:: with SMTP id i8mr1409808qvt.31.1612472368614;
        Thu, 04 Feb 2021 12:59:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id e7sm5507808qtj.48.2021.02.04.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:59:28 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l7lip-003bwW-ME; Thu, 04 Feb 2021 16:59:27 -0400
Date:   Thu, 4 Feb 2021 16:59:27 -0400
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
Message-ID: <20210204205927.GD4718@ziepe.ca>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
 <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
 <20210204200918.GA4718@ziepe.ca>
 <CAKMK7uEU_TJEUF2go6WRuVn+=-DSD5kRw1beJhC_1Y4HTXbYVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEU_TJEUF2go6WRuVn+=-DSD5kRw1beJhC_1Y4HTXbYVQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 04, 2021 at 09:19:57PM +0100, Daniel Vetter wrote:
> On Thu, Feb 4, 2021 at 9:09 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:
> >
> > > So I think just checking for VM_PFNMAP after the vma is set up should
> > > be enough to guarantee we'll only have pte_special ptes in there,
> > > ever. But I'm not sure, this stuff all isn't really documented much
> > > and the code is sometimes a maze (to me at least).
> >
> > Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
> > check after the VMA is populated
> >
> > But how do you stuff special pfns into a VMA outside the fault
> > handler?
> 
> Many drivers we have don't have dynamic buffer management (kinda
> overkill for a few framebuffers on a display-only IP block), so the
> just remap_pfn_range on ->mmap, and don't have a fault handler at all.

remap_pfn_range() makes sense, do you expect drivers using struct page
backed memory to call that as well?

Jason
