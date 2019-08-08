Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E2986C22
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 23:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390430AbfHHVMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 17:12:22 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43922 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfHHVMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 17:12:22 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so44788468pfg.10
        for <linux-media@vger.kernel.org>; Thu, 08 Aug 2019 14:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ylddyGuuUpJhKUvK1ev1Q44hiLLmL8PwyC4MRMb3mUE=;
        b=ACf43qcDjfXfx13Z+1Gsw1UZV/Uosrf1yEiF0Agjii4NCq0aSJm4NT0QzSwLCl7Dc5
         gq+wLSnVQcR3qxZ0fm9hvoSL16jb4cCF5OkMFfCEBQn0MQdPfLlk2tDzdSCLPp3vIQBd
         UxRwIr8unIchMakLD/5qyLX3unblGeVjDLQfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ylddyGuuUpJhKUvK1ev1Q44hiLLmL8PwyC4MRMb3mUE=;
        b=k2lIcJZY9fSSc6XHRPG4/nEHgI5ZstHaNdIbVgh3ptctqReX1baVSULr98wid1ESx4
         0Ivne0HTn3a+4gqxD0j6JE5HKtozpTnR7Os/b2FU7OjFGf8wOjANVCuIdI9PDPEX1tWp
         Iks6muN6ns/c9uRni8u7xYPkGULcI80ONx9Bhg1JNJaPzFz2j7dMHHaSeCK01U4BYdv1
         pZHVPD8pZxCkXBPs0I6Of7wL4C9jROkDoIghmvkV3/bh0WWnyXySpJTSlZmlucRrO8sF
         tmEVCD3U7MtWwY3Ai4XN62OCNqJai0n+Fttfc6/eNr5SGE3de8pxG2EFEGjQxG+s50OQ
         Shpw==
X-Gm-Message-State: APjAAAUDO0hOfYquupBs2yQA6g2Zp57LzaNY79oerlkOFJMk/c0UfHtk
        S6hv0B5RfmHWN/8lyuHF98RIuw==
X-Google-Smtp-Source: APXvYqy0pdWoHPkerneL5407ilt1ySmaIIJNjNXYxB0G6sGkOR++FLPJzal2z8CcZbjPxvclbtt+OA==
X-Received: by 2002:a62:1750:: with SMTP id 77mr17827956pfx.172.1565298741745;
        Thu, 08 Aug 2019 14:12:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q19sm101457867pfc.62.2019.08.08.14.12.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 14:12:20 -0700 (PDT)
Date:   Thu, 8 Aug 2019 14:12:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will.deacon@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        dri-devel@lists.freedesktop.org,
        Kostya Serebryany <kcc@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <201908081410.C16D2BD@keescook>
References: <cover.1563904656.git.andreyknvl@google.com>
 <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
 <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
 <20190724142059.GC21234@fuggles.cambridge.arm.com>
 <20190806171335.4dzjex5asoertaob@willie-the-truck>
 <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zF01mxU+PkEYLkoVu-ZZM6jNfL_OwMJKRwLr-sdU4Myg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 07, 2019 at 07:17:35PM +0200, Andrey Konovalov wrote:
> On Tue, Aug 6, 2019 at 7:13 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Jul 24, 2019 at 03:20:59PM +0100, Will Deacon wrote:
> > > On Wed, Jul 24, 2019 at 04:16:49PM +0200, Andrey Konovalov wrote:
> > > > On Wed, Jul 24, 2019 at 4:02 PM Will Deacon <will@kernel.org> wrote:
> > > > > On Tue, Jul 23, 2019 at 08:03:29PM +0200, Andrey Konovalov wrote:
> > > > > > Should this go through the mm or the arm tree?
> > > > >
> > > > > I would certainly prefer to take at least the arm64 bits via the arm64 tree
> > > > > (i.e. patches 1, 2 and 15). We also need a Documentation patch describing
> > > > > the new ABI.
> > > >
> > > > Sounds good! Should I post those patches together with the
> > > > Documentation patches from Vincenzo as a separate patchset?
> > >
> > > Yes, please (although as you say below, we need a new version of those
> > > patches from Vincenzo to address the feedback on v5). The other thing I
> > > should say is that I'd be happy to queue the other patches in the series
> > > too, but some of them are missing acks from the relevant maintainers (e.g.
> > > the mm/ and fs/ changes).
> >
> > Ok, I've queued patches 1, 2, and 15 on a stable branch here:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/tbi
> >
> > which should find its way into -next shortly via our for-next/core branch.
> > If you want to make changes, please send additional patches on top.
> >
> > This is targetting 5.4, but I will drop it before the merge window if
> > we don't have both of the following in place:
> >
> >   * Updated ABI documentation with Acks from Catalin and Kevin
> 
> Catalin has posted a new version today.
> 
> >   * The other patches in the series either Acked (so I can pick them up)
> >     or queued via some other tree(s) for 5.4.
> 
> So we have the following patches in this series:
> 
> 1. arm64: untag user pointers in access_ok and __uaccess_mask_ptr
> 2. arm64: Introduce prctl() options to control the tagged user addresses ABI
> 3. lib: untag user pointers in strn*_user
> 4. mm: untag user pointers passed to memory syscalls
> 5. mm: untag user pointers in mm/gup.c
> 6. mm: untag user pointers in get_vaddr_frames
> 7. fs/namespace: untag user pointers in copy_mount_options
> 8. userfaultfd: untag user pointers
> 9. drm/amdgpu: untag user pointers
> 10. drm/radeon: untag user pointers in radeon_gem_userptr_ioctl
> 11. IB/mlx4: untag user pointers in mlx4_get_umem_mr
> 12. media/v4l2-core: untag user pointers in videobuf_dma_contig_user_get
> 13. tee/shm: untag user pointers in tee_shm_register
> 14. vfio/type1: untag user pointers in vaddr_get_pfn
> 15. selftests, arm64: add a selftest for passing tagged pointers to kernel
> 
> 1, 2 and 15 have been picked by Will.
> 
> 11 has been picked up by Jason.
> 
> 9, 10, 12, 13 and 14 have acks from their subsystem maintainers.
> 
> 3 touches generic lib code, I'm not sure if there's a dedicated
> maintainer for that.

Andrew tends to pick up lib/ patches.

> The ones that are left are the mm ones: 4, 5, 6, 7 and 8.
> 
> Andrew, could you take a look and give your Acked-by or pick them up directly?

Given the subsystem Acks, it seems like 3-10 and 12 could all just go
via Andrew? I hope he agrees. :)

-- 
Kees Cook
