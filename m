Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFE920059C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 11:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732009AbgFSJnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 05:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgFSJnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 05:43:14 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7992EC0613EE
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 02:43:13 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so9049018wrc.7
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZHgTo7kQEBwdRaFjgsK02o5pMjtqk4kUjryXyM8W8mg=;
        b=CoZsWjEw4crs8eFjbuWv7h3NufmOpsUp8YVutr/xFMQRUYeusT/PjmHez75iUOPc8h
         gjJi1uNs2yXiJi5Ar4R8q73eqkRisjPzMLejgu6Sr3fFzwQ9nni2FeVTqlUVIHrjvJed
         LgiD4jddnUv1RgEgBbNcZvtz2rdYKEq0BXGwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ZHgTo7kQEBwdRaFjgsK02o5pMjtqk4kUjryXyM8W8mg=;
        b=MiOXqTsgHE3PmOeSUhIXmTOxctLIed2Jv7Gnz2VyiWb/xVL50jcOdd2ndni5yCyTga
         IZeN89Ed7X//qJZT8apEq3eCEbnqntmp2R9hrtfJQKcRn0GXve0QDU/n1Fj11d93NL03
         y5JswHCY2kAvpJoAR6kPSMVRm7VRFJDajaWIG11C6JFg4oaEabZYDjeku8qRD9oMlG0P
         6daO1AKdjLiEIGX2BvFdPD1cVIG/Yg+E3o2A4faRogykKrSs/uqNT0hFNoIcbAXUaoxy
         C+OENhKrahB8d4ze24e/wzL8I3g6azUE63IWfKzPN/7fF0aEFOmoFYUYyriev9LyUy01
         bSkQ==
X-Gm-Message-State: AOAM532EWX1cTexHOSsu5nqXQnjBYo/hx4MLiyCvsrUlzQVrmpP8aJnO
        peV6wzwZnz6lxSv2PYsAD5Q69w==
X-Google-Smtp-Source: ABdhPJwqgNUvffYXxa/S+rlBZrViACLxBhhTw7FlRJqnm8zxiB3mJ48YaBn2SIoIEMpe1hAXpHV3tg==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr3151783wrw.225.1592559792157;
        Fri, 19 Jun 2020 02:43:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s18sm7574797wra.85.2020.06.19.02.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 02:43:11 -0700 (PDT)
Date:   Fri, 19 Jun 2020 11:43:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Intel-gfx] [PATCH 03/18] dma-fence: basic lockdep annotations
Message-ID: <20200619094309.GT20149@phenom.ffwll.local>
Mail-Followup-To: Chris Wilson <chris@chris-wilson.co.uk>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <159186243606.1506.4437341616828968890@build.alporthouse.com>
 <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
 <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
 <159255511144.7737.12635440776531222029@build.alporthouse.com>
 <CAKMK7uHEwj6jiZkRZ5PaCUNWcuU9oE4KYm4XHZwHnFzEuChZ7w@mail.gmail.com>
 <159255801588.7737.4425728073225310839@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159255801588.7737.4425728073225310839@build.alporthouse.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 10:13:35AM +0100, Chris Wilson wrote:
> Quoting Daniel Vetter (2020-06-19 09:51:59)
> > On Fri, Jun 19, 2020 at 10:25 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Forcing a generic primitive to always be part of the same global map is
> > > horrible.
> > 
> > And  no concrete example or reason for why that's not possible.
> > Because frankly it's not horrible, this is what upstream is all about:
> > Shared concepts, shared contracts, shared code.
> > 
> > The proposed patches might very well encode the wrong contract, that's
> > all up for discussion. But fundamentally questioning that we need one
> > is missing what upstream is all about.
> 
> Then I have not clearly communicated, as my opinion is not that
> validation is worthless, but that the implementation is enshrining a
> global property on a low level primitive that prevents it from being
> used elsewhere. And I want to replace completion [chains] with fences, and
> bio with fences, and closures with fences, and what other equivalencies
> there are in the kernel. The fence is as central a locking construct as
> struct completion and deserves to be a foundational primitive provided
> by kernel/ used throughout all drivers for discrete problem domains.
> 
> This is narrowing dma_fence whereby adding
> 	struct lockdep_map *dma_fence::wait_map
> and annotating linkage, allows you to continue to specify that all
> dma_fence used for a particular purpose must follow common rules,
> without restricting the primitive for uses outside of this scope.

Somewhere else in this thread I had discussions with Jason Gunthorpe about
this topic. It might maybe change somewhat depending upon exact rules, but
his take is very much "I don't want dma_fence in rdma". Or pretty close to
that at least.

Similar discussions with habanalabs, they're using dma_fence internally
without any of the uapi. Discussion there has also now concluded that it's
best if they remove them, and simply switch over to a wait_queue or
completion like every other driver does.

The next round of the patches already have a paragraph to at least
somewhat limit how non-gpu drivers use dma_fence. And I guess actual
consensus might be pointing even more strongly at dma_fence being solely
something for gpus and closely related subsystem (maybe media) for syncing
dma-buf access.

So dma_fence as general replacement for completion chains I think just
wont happen.

What might make sense is if e.g. the lockdep annotations could be reused,
at least in design, for wait_queue or completion or anything else
really. I do think that has a fair chance compared to the automagic
cross-release annotations approach, which relied way too heavily on
guessing where barriers are. My experience from just a bit of playing
around with these patches here and discussing them with other driver
maintainers is that accurately deciding where critical sections start and
end is a job for humans only. And if you get it wrong, you will have a
false positive.

And you're indeed correct that if we'd do annotations for completions and
wait queues, then that would need to have a class per semantically
equivalent user, like we have lockdep classes for mutexes, not just one
overall.

But dma_fence otoh is something very specific, which comes with very
specific rules attached - it's not a generic wait_queue at all. Originally
it did start out as one even, but it is a very specialized wait_queue.

So there's imo two cases:

- Your completion is entirely orthogonal of dma_fences, and can never ever
  block a dma_fence. Don't use dma_fence for this, and no problem. It's
  just another wait_queue somewhere.

- Your completion can eventually, maybe through lots of convolutions and
  depdencies, block a dma_fence. In that case full dma_fence rules apply,
  and the only thing you can do with a custom annotation is make the rules
  even stricter. E.g. if a sub-timeline in the scheduler isn't allowed to
  take certain scheduler locks. But the userspace visible/published fence
  do take them, maybe as part of command submission or retirement.
  Entirely hypotethical, no idea any driver actually needs this.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
