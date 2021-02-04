Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4850A30F634
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 16:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237291AbhBDPYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 10:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237304AbhBDPXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 10:23:44 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7853FC061788
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 07:23:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id a16so6153572wmm.0
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FOhHJFN1Uk3imxDHDCmlGLnl9VnriOFj98ccGjxS3EU=;
        b=F1sXbq67W/pxmK1zXgV072u16BTrlrCAVP0it0HAR2Fp+Zt8xtCTCV7y3dnPlv8saB
         C+cdlziGxcEaC41JXpDQHnBBFrlli0RiOpXwtfNzva6k49/rHVQWlo7T6bMUHbsWzn6Y
         S/kZWGhIJchjl7dG5v++X+mpllv4Fcml2LDrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=FOhHJFN1Uk3imxDHDCmlGLnl9VnriOFj98ccGjxS3EU=;
        b=fGgRUqFlqn8extnQ4j7O1TcExBsgwfg5D0djG8QQ44ZHQxKfL12R0uNCv8LgEn/Knc
         FryuTiuTJD6Uq6x40CF+vU3xNOTuwpJ4PECWGDP/bBjMJ0mkymnd7zvWaMhZc4r8dvyd
         0b6w1uUoBZWuD5/6fSyLubEWpcNrV114GssdkaTgHNR6VvcauTR4bvRrUGsOQiELbn3a
         uLHIwQkbd+a7iPdr+rh3dFHM2kQvU/dVL84ivmRYuBNb5JAp4zrotW9MzRvgouv+yuLI
         hR5FnJcWSJAQBegNpIwXRgwXB6onrLxlUGiQftkCv9l6YDlXFrS0iELKaqcEQ/R7TdbZ
         +9qg==
X-Gm-Message-State: AOAM530o92BDBvVVqfnxdNn2wTr22HLP4IlGPyDxjD+pTFhZIWOncw5x
        JXtoriJxLGm7djHgKFH00nWZPg==
X-Google-Smtp-Source: ABdhPJzWUE8+keCZMjDw4Qd96B14poTeso3FJmwHG+VBS+pVfTYio5MuASNi3L9GB8fNZbR908SB5g==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr6103154wmk.163.1612452183199;
        Thu, 04 Feb 2021 07:23:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v6sm8776760wrx.32.2021.02.04.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:23:02 -0800 (PST)
Date:   Thu, 4 Feb 2021 16:22:59 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Sandeep Patil <sspatil@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        James Jones <jajones@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        Minchan Kim <minchan@kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        John Stultz <john.stultz@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
Message-ID: <YBwRU1nrE3mfYbWK@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Sandeep Patil <sspatil@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        James Jones <jajones@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        Minchan Kim <minchan@kernel.org>, Linux MM <linux-mm@kvack.org>,
        John Stultz <john.stultz@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
 <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
 <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com>
 <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 04, 2021 at 09:16:32AM +0100, Christian König wrote:
> Am 03.02.21 um 22:41 schrieb Suren Baghdasaryan:
> > [SNIP]
> > > > How many semi-unrelated buffer accounting schemes does google come up with?
> > > > 
> > > > We're at three with this one.
> > > > 
> > > > And also we _cannot_ required that all dma-bufs are backed by struct
> > > > page, so requiring struct page to make this work is a no-go.
> > > > 
> > > > Second, we do not want to all get_user_pages and friends to work on
> > > > dma-buf, it causes all kinds of pain. Yes on SoC where dma-buf are
> > > > exclusively in system memory you can maybe get away with this, but
> > > > dma-buf is supposed to work in more places than just Android SoCs.
> > > I just realized that vm_inser_page doesn't even work for CMA, it would
> > > upset get_user_pages pretty badly - you're trying to pin a page in
> > > ZONE_MOVEABLE but you can't move it because it's rather special.
> > > VM_SPECIAL is exactly meant to catch this stuff.
> > Thanks for the input, Daniel! Let me think about the cases you pointed out.
> > 
> > IMHO, the issue with PSS is the difficulty of calculating this metric
> > without struct page usage. I don't think that problem becomes easier
> > if we use cgroups or any other API. I wanted to enable existing PSS
> > calculation mechanisms for the dmabufs known to be backed by struct
> > pages (since we know how the heap allocated that memory), but sounds
> > like this would lead to problems that I did not consider.
> 
> Yeah, using struct page indeed won't work. We discussed that multiple times
> now and Daniel even has a patch to mangle the struct page pointers inside
> the sg_table object to prevent abuse in that direction.
> 
> On the other hand I totally agree that we need to do something on this side
> which goes beyong what cgroups provide.
> 
> A few years ago I came up with patches to improve the OOM killer to include
> resources bound to the processes through file descriptors. I unfortunately
> can't find them of hand any more and I'm currently to busy to dig them up.
> 
> In general I think we need to make it possible that both the in kernel OOM
> killer as well as userspace processes and handlers have access to that kind
> of data.
> 
> The fdinfo approach as suggested in the other thread sounds like the easiest
> solution to me.

Yeah for OOM handling cgroups alone isn't enough as the interface - we
need to make sure that oom killer takes into account the system memory
usage (ideally zone aware, for CMA pools).

But to track that we still need that infrastructure first I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
