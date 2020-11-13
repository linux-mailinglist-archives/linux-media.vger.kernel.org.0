Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943ED2B25A9
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 21:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgKMUjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 15:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgKMUjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 15:39:40 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6263C0617A6
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 12:39:38 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id h2so10710457wmm.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 12:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=XWKyPPQcb/AO4HvcVyMm86Eaa/Twuh8I1tqipU5mjZM=;
        b=GN9r9oFngY/SvOuMbZNIzlQ63VYdQzlMSPwL1+bmiJVB7UgUh1Udsp2b7O3eVtHF0+
         9yObcXMc//LCwL8wimKzjNlEO9uqIAOHPTzKJYrqR/dnoRWBEfmm8YGGTc/R3N54ZYGS
         udDoW9ANgKUsGryqCfbVOynoWh8BTKMSE9ieI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=XWKyPPQcb/AO4HvcVyMm86Eaa/Twuh8I1tqipU5mjZM=;
        b=nrqkq5LZymQnAVe/1nOLOKbYXWM+DIJY39CNO+v5fFPSknZXKKRyfXJrsPdW0Un/YL
         To5jEnPAdh9ZHODSmMGrReHGPuFtUni16rTwoouGQjFiChbM46WE89E7GM1slmUz9fbD
         EKVAjKq0YIZsw9MdoUd3tbgBbn/v4h5OlubIDbziETdl2rA5BlSFRSqyyN1O/xmbovpQ
         AjnOX3LiTM/hcAkHmgbSLsme+rijx3rNuVTxVhUgBJLX8SSE+iCFmJDbfzk77b6tr4v5
         hw0VRXjJTnOdmtLE4MB0zFmB1qo+HVzPH48HgwLGkOko7uO9aTr8kkthpviLfUh4xr/y
         Q4dA==
X-Gm-Message-State: AOAM530KV32w/rOJPcs7canLGV5T2YxGqrFlJA3PdUFGeoiuIOnGtu8c
        kCNEU++EM+fchlV49B4LG4rwIA==
X-Google-Smtp-Source: ABdhPJyG8uSi7GDgo56uwn/BFw9jLIRvCkgy4SgRpip/q3lvnyuvzlLo15d9SWqKdQqMed8cWB3Pkw==
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr4422946wmg.5.1605299977359;
        Fri, 13 Nov 2020 12:39:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y200sm13494151wmc.23.2020.11.13.12.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 12:39:35 -0800 (PST)
Date:   Fri, 13 Nov 2020 21:39:33 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     John Stultz <john.stultz@linaro.org>
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
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
Message-ID: <20201113203933.GT401619@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
 <20201112093237.GS401619@phenom.ffwll.local>
 <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 08:11:02PM -0800, John Stultz wrote:
> On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> > > >
> > > > Hey All,
> > > >   So just wanted to send my last revision of my patch series
> > > > of performance optimizations to the dma-buf system heap.
> > >
> > > Thanks very much for your patches - I think the first 5 patches look good to me.
> > >
> > > I know there was a bit of discussion over adding a new system-uncached
> > > heap v/s using a flag to identify that; I think I prefer the separate
> > > heap idea, but lets ask one last time if any one else has any real
> > > objections to it.
> > >
> > > Daniel, Christian: any comments from your side on this?
> >
> > I do wonder a bit where the userspace stack for this all is, since tuning
> > allocators without a full stack is fairly pointless. dma-buf heaps is a
> > bit in a limbo situation here it feels like.
> 
> As mentioned in the system-uncached patch:
> Pending opensource users of this code include:
> * AOSP HiKey960 gralloc:
>   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
>   - Visibly improves performance over the system heap
> * AOSP Codec2 (possibly, needs more review):
>   - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> 
> Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
> able to use the current dmabuf heaps instead of ION.
> 
> So I'm not sure what you mean by limbo, other than it being in a
> transition state where the interface is upstream and we're working on
> moving vendors to it from ION (which is staged to be dropped in 5.11).
> Part of that work is making sure we don't regress the performance
> expectations.

The mesa thing below, since if we test this with some downstream kernel
drivers or at least non-mesa userspace I'm somewhat worried we're just
creating a nice split world between the android gfx world and the
mesa/linux desktop gfx world.

But then that's kinda how android rolls, so *shrug*

> > Plus I'm vary of anything related to leaking this kind of stuff beyond the
> > dma-api because dma api maintainers don't like us doing that. But
> > personally no concern on that front really, gpus need this. It's just that
> > we do need solid justification I think if we land this. Hence back to
> > first point.
> >
> > Ideally first point comes in the form of benchmarking on android together
> > with a mesa driver (or mesa + some v4l driver or whatever it takes to
> > actually show the benefits, I have no idea).
> 
> Tying it with mesa is a little tough as the grallocs for mesa devices
> usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
> allocation path for dmabuf heaps there gets a little complex as last I
> tried that (when trying to get HiKey working with Lima graphics, as
> gbm wouldn't allocate the contiguous buffers required by the display),
> I ran into issues with the drm_hwcomposer and mesa expecting the gbm
> private handle metadata in the buffer when it was passed in.
> 
> But I might take a look at it again. I got a bit lost digging through
> the mesa gbm allocation paths last time.
> 
> I'll also try to see if I can find a benchmark for the codec2 code
> (using dmabuf heaps with and without the uncached heap) on on db845c
> (w/ mesa), as that is already working and I suspect that might be
> close to what you're looking for.

tbh I think trying to push for this long term is the best we can hope for.

Media is also a lot more *meh* since it's deeply fragmented and a lot less
of it upstream than on the gles/display side.

I think confirming that this at least doesn't horrible blow up on a
gralloc/gbm+mesa stack would be useful I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
