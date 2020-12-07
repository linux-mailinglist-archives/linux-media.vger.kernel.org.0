Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10742D1CA7
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 23:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgLGWCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 17:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbgLGWCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 17:02:22 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A92CC061749
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 14:01:42 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id f14so2085338qto.12
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Q7Ylx07o+/JahthgdmHwQPVsWJ8C5R62kicZ2/haW3A=;
        b=Ofy9fpq317k0Vftilb9jr8vGXapwoJPOgbIpKedXJnbc9qgUKGE8Wc53Q1XfXXSl1H
         ja6G6Y1gnSHWEnxZ44Ez3ayUnI3hnEU6ioH0E3XAS1hJn333RDRUt+tkHSth9sOEVH1I
         mQbm23TPKGbJ6yCsjGQsrbX+WqgHTC91RqafBe7oV6/QGz5NAw+5ysla4ql6EV0GtX74
         89pGp395Gk5u/8rwsUHh7ePxBbo46mqOmPGZS6j9Ze52fv/JNm7nEE+csOEfo/VDyggP
         Rxxgou9/kk2K+2YOpbkMLZJ0q53gPuKaf3P/klGVw0CHiNzyqRc8tGgExVqvCIpQFB2y
         UXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Q7Ylx07o+/JahthgdmHwQPVsWJ8C5R62kicZ2/haW3A=;
        b=ViyREZvioicV0booHjBalsu4VpjUFyk4dto3KldZs+/TEe54d3AWdfGUEoVJii/Wq2
         TAp8Is4lTmz64vbz66C3QXdMLku74BpEmIcpf7wmMSvMt4pw798lCYf+lfkZ75omYmsz
         eRCt35P09Q/530Mg7zchpyvI7Vg4+S5s1auFqYObWb7B3pWUaB9lpn25TM+ZoOWdjEXG
         /eFwLdtu9OuGNyW9fDcw6jy+G4d/xKtWgJmYP4mal4CQnyqq0005K2xedfJJkDa9ispI
         pRFSv/m7LGBtaAwPkrg2qzL9aun5b9a8e3wzg7Vh9MwfhsoQqLJwSfG3WZKKEGjuCNtM
         XwrQ==
X-Gm-Message-State: AOAM532Wr1jtd2eUJ0//6rOOF/G4g5odtw3N0dhL9KKSAAehtUuhlVlm
        ziM/cE1eq2T2Ly4fwle9Qwe31w==
X-Google-Smtp-Source: ABdhPJw0Tsw5DRQWxnduIU77WDJDB0ah7MDETR9cHRnakFol3vvXmc13qTrEExC33LEzE59SUfWGwQ==
X-Received: by 2002:ac8:785:: with SMTP id l5mr3491343qth.187.1607378501622;
        Mon, 07 Dec 2020 14:01:41 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 17sm12745778qtb.17.2020.12.07.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 14:01:40 -0800 (PST)
Message-ID: <d00dd8793efafb3a4437e2a4c7576b4d8c3cb6bc.camel@ndufresne.ca>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system
 heap & a system-uncached implementation
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Daniel Vetter <daniel@ffwll.ch>,
        John Stultz <john.stultz@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?ISO-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Date:   Mon, 07 Dec 2020 17:01:38 -0500
In-Reply-To: <20201113203933.GT401619@phenom.ffwll.local>
References: <20201110034934.70898-1-john.stultz@linaro.org>
         <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
         <20201112093237.GS401619@phenom.ffwll.local>
         <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
         <20201113203933.GT401619@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 13 novembre 2020 à 21:39 +0100, Daniel Vetter a écrit :
> On Thu, Nov 12, 2020 at 08:11:02PM -0800, John Stultz wrote:
> > On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > > > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org>
> > > > wrote:
> > > > > 
> > > > > Hey All,
> > > > >   So just wanted to send my last revision of my patch series
> > > > > of performance optimizations to the dma-buf system heap.
> > > > 
> > > > Thanks very much for your patches - I think the first 5 patches look
> > > > good to me.
> > > > 
> > > > I know there was a bit of discussion over adding a new system-uncached
> > > > heap v/s using a flag to identify that; I think I prefer the separate
> > > > heap idea, but lets ask one last time if any one else has any real
> > > > objections to it.
> > > > 
> > > > Daniel, Christian: any comments from your side on this?
> > > 
> > > I do wonder a bit where the userspace stack for this all is, since tuning
> > > allocators without a full stack is fairly pointless. dma-buf heaps is a
> > > bit in a limbo situation here it feels like.
> > 
> > As mentioned in the system-uncached patch:
> > Pending opensource users of this code include:
> > * AOSP HiKey960 gralloc:
> >   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
> >   - Visibly improves performance over the system heap
> > * AOSP Codec2 (possibly, needs more review):
> >   - 
> > https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> > 
> > Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
> > able to use the current dmabuf heaps instead of ION.
> > 
> > So I'm not sure what you mean by limbo, other than it being in a
> > transition state where the interface is upstream and we're working on
> > moving vendors to it from ION (which is staged to be dropped in 5.11).
> > Part of that work is making sure we don't regress the performance
> > expectations.
> 
> The mesa thing below, since if we test this with some downstream kernel
> drivers or at least non-mesa userspace I'm somewhat worried we're just
> creating a nice split world between the android gfx world and the
> mesa/linux desktop gfx world.
> 
> But then that's kinda how android rolls, so *shrug*
> 
> > > Plus I'm vary of anything related to leaking this kind of stuff beyond the
> > > dma-api because dma api maintainers don't like us doing that. But
> > > personally no concern on that front really, gpus need this. It's just that
> > > we do need solid justification I think if we land this. Hence back to
> > > first point.
> > > 
> > > Ideally first point comes in the form of benchmarking on android together
> > > with a mesa driver (or mesa + some v4l driver or whatever it takes to
> > > actually show the benefits, I have no idea).
> > 
> > Tying it with mesa is a little tough as the grallocs for mesa devices
> > usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
> > allocation path for dmabuf heaps there gets a little complex as last I
> > tried that (when trying to get HiKey working with Lima graphics, as
> > gbm wouldn't allocate the contiguous buffers required by the display),
> > I ran into issues with the drm_hwcomposer and mesa expecting the gbm
> > private handle metadata in the buffer when it was passed in.
> > 
> > But I might take a look at it again. I got a bit lost digging through
> > the mesa gbm allocation paths last time.
> > 
> > I'll also try to see if I can find a benchmark for the codec2 code
> > (using dmabuf heaps with and without the uncached heap) on on db845c
> > (w/ mesa), as that is already working and I suspect that might be
> > close to what you're looking for.
> 
> tbh I think trying to push for this long term is the best we can hope for.
> 
> Media is also a lot more *meh* since it's deeply fragmented and a lot less
> of it upstream than on the gles/display side.

Sorry to jump in, but I'd like to reset a bit. The Media APIs are a lot more
generic, most of the kernel API is usable without specific knowledge of the HW.
Pretty much all APIs are exercised through v4l2-ctl and v4l2-compliance on the
V4L2 side (including performance testing). It would be pretty straight forward
to demonstrate the use of DMABuf heaps (just do live resolution switching,
you'll beat the internal V4L2 allocator without even looking at DMA cache
optimization).

> 
> I think confirming that this at least doesn't horrible blow up on a
> gralloc/gbm+mesa stack would be useful I think.
> -Daniel


