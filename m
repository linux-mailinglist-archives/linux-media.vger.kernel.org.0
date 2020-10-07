Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B311285FBB
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 15:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgJGNGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 09:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbgJGNGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 09:06:14 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA2EC0613D3
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 06:06:12 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g3so1662199qtq.10
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4HblAtS9AKrNcXdrIqeiy/kTpr6U/GTX51Mfam+LA6U=;
        b=gaxle5XVgPiB2J0+XM9zX2irfLEeu+2lzv07I3+3U3SMukmTi39ED8XpWUwdoBcdzg
         sq4EXuxHEnLK8EARG7U4otO1hCCHLRTqMxs1/NAPPc5nyn85tvWrubmlDncTe23EKOaB
         jE9OLIPsLyZnVnoyWAxZ4tlHkPbS9aVO8FiyQjpuMA02++qPCVMiDzO5QLl8lWlJbMD3
         4VK5mAfkVwdhlyMZrArW6rVvJKOeuBU228bcPTy37fSP1ncOhV7pl1K6TD9+VWj6isag
         XGFgvwC3r0uqNL2CEDLuYG1PhamsDOLiaI3s/SgFk61PX6WsySN+n5YF0I2fOeQwZAjk
         4vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4HblAtS9AKrNcXdrIqeiy/kTpr6U/GTX51Mfam+LA6U=;
        b=LlT9nZ+GJRWzaPZ85HJ/FClHxOStRgaGMXavo35/fK8g1WzMSBQ/q2zCZtkLqvMYCL
         QQGfqcGk3FnHgkJ5b9plUpNIx49Xh8wL01A3JxVc4iES1om976D3FeirlxBZNbzfOvvF
         ndS72HG4WBDxkvepezSMnRQESQ6b3cfd58pJ8KrllMYX/7JOx/14Wnsceu6zzoH7TzKY
         6vnUThQYcMfAc3UcZkO8YyDmTUAsq5t/6fQi9yce1SF7tDKe42WqVKLFEdoOksi4OjIE
         XpaqdLJrmekOVCdsuRMSRUtA17F+AqBsRyH73sy77NFDAwDPmSYUael56UhrNQ4F3vry
         NfgA==
X-Gm-Message-State: AOAM530SYYJEsr6aq474TmiA3KIYv52D4Ob6h37m+ooFQJWFRjv4r0KC
        i1Lc72XW3UXgyLVnBgHxaAuVDg==
X-Google-Smtp-Source: ABdhPJz13fEMZDLnus1GsnlhL3kh+zUp6oNCWrGj1oRDvFmd97g/P2fkBStxQRO5aVdvng5Hk9Rc3A==
X-Received: by 2002:ac8:4807:: with SMTP id g7mr3141587qtq.54.1602075971639;
        Wed, 07 Oct 2020 06:06:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id d14sm1449111qtr.62.2020.10.07.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 06:06:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQ990-000tst-7Q; Wed, 07 Oct 2020 10:06:10 -0300
Date:   Wed, 7 Oct 2020 10:06:10 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007130610.GP5177@ziepe.ca>
References: <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 07, 2020 at 02:58:33PM +0200, Daniel Vetter wrote:
> On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> > >
> > > There is no guarentee that holding a get on the file says anthing
> > > about the VMA. This needed to check that the file was some special
> > > kind of file that promised the VMA layout and file lifetime are
> > > connected.
> > >
> > > Also, cloning a VMA outside the mm world is just really bad. That
> > > would screw up many assumptions the drivers make.
> > >
> > > If it is all obsolete I say we hide it behind a default n config
> > > symbol and taint the kernel if anything uses it.
> > >
> > > Add a big comment above the follow_pfn to warn others away from this
> > > code.
> >
> > Sadly it's just verbally declared as deprecated and not formally noted
> > anyway. There are a lot of userspace applications relying on user
> > pointer support.
> 
> userptr can stay, it's the userptr abuse for zerocpy buffer sharing
> which doesn't work anymore. At least without major surgery (you'd need
> an mmu notifier to zap mappings and recreate them, and that pretty
> much breaks the v4l model of preallocating all buffers to make sure we
> never underflow the buffer queue). And static mappings are not coming
> back I think, we'll go ever more into the direction of dynamic
> mappings and moving stuff around as needed.

Right, and to be clear, the last time I saw a security flaw of this
magnitude from a subsystem badly mis-designing itself, Linus's
knee-jerk reaction was to propose to remove the whole subsystem.

Please don't take status-quo as acceptable, V4L community has to work
to resolve this, uABI breakage or not. The follow_pfn related code
must be compiled out of normal distro kernel builds.

Jason
