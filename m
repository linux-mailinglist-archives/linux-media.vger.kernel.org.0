Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B052B01FF
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 10:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKLJco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 04:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgKLJcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 04:32:43 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CA7C0613D4
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 01:32:42 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c16so4831606wmd.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 01:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yi1OMf/gd5HyvbzJ7IKPIRAKF/of2XlvAeMy3R2I3KU=;
        b=ClGwd9PImy4lshiA+U9TgHm3wMtpgX29mRHTW1PJ2Z/B04KEA5sYxSwmqwHFInajPL
         bBgGwHoANnPrek4f/2fTZmkNXn4ZXMfy6/P/wzzDLZ0D+o59/USQC5sh8s8BLMNMRT23
         2JQ2SimoqOAPzXBp9UgIXN67enji1ANRDCQMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=yi1OMf/gd5HyvbzJ7IKPIRAKF/of2XlvAeMy3R2I3KU=;
        b=XqugfYa0AK2Pg9ldLHrOCjBzhq2Jp9CV0AiGTqrNeqfAeb0YnFu7DeLkLt53YY/rIF
         EduI3a32aRqnpgFupHa8zF8aCB7eiOLEy2zloRaO0+SBbuhLAqPmpoRXvwNOdBfp273m
         8fFNEt8T1FOI0snHqrZcT4Whxy5eentofwRk+X7MM0fLaHk5pTwb/0fObqrT5AHOxxsb
         70faDfOW5Uhhtm/4YUC4xMEsS/5XwXwggGkVz44T/odHqjXopXcHGwFglWYjP0L7GBr2
         jsXAB2YPbj1I7Nl+IGpDdwToNhDSFhxfo8QmTkyoJUdjy/CeCkIbLb4b2Lc1sXT8M6Bn
         SiVA==
X-Gm-Message-State: AOAM533jFSk56sSQZ5qUxRZrfkkSNld6wBiXK/G4xtDTLL9axodcxTRb
        4fznd1KMOnEyKg0OQid6LgUqOQ==
X-Google-Smtp-Source: ABdhPJyCyDhy97NTajt/L+ZmaByBkxvp9KnxOaVEKwIx5lRydWZdS/DGH3dvRWY0NjD8L6XIb4eELw==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr8871662wmc.181.1605173560677;
        Thu, 12 Nov 2020 01:32:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g20sm5717032wmh.20.2020.11.12.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:32:39 -0800 (PST)
Date:   Thu, 12 Nov 2020 10:32:37 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
Message-ID: <20201112093237.GS401619@phenom.ffwll.local>
Mail-Followup-To: Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> Hi John,
> 
> On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> >
> > Hey All,
> >   So just wanted to send my last revision of my patch series
> > of performance optimizations to the dma-buf system heap.
> 
> Thanks very much for your patches - I think the first 5 patches look good to me.
> 
> I know there was a bit of discussion over adding a new system-uncached
> heap v/s using a flag to identify that; I think I prefer the separate
> heap idea, but lets ask one last time if any one else has any real
> objections to it.
> 
> Daniel, Christian: any comments from your side on this?

I do wonder a bit where the userspace stack for this all is, since tuning
allocators without a full stack is fairly pointless. dma-buf heaps is a
bit in a limbo situation here it feels like.

Plus I'm vary of anything related to leaking this kind of stuff beyond the
dma-api because dma api maintainers don't like us doing that. But
personally no concern on that front really, gpus need this. It's just that
we do need solid justification I think if we land this. Hence back to
first point.

Ideally first point comes in the form of benchmarking on android together
with a mesa driver (or mesa + some v4l driver or whatever it takes to
actually show the benefits, I have no idea).
-Daniel

> 
> I am planning to merge this series to drm-misc this week if I hear no
> objections.
> >
> > This series reworks the system heap to use sgtables, and then
> > consolidates the pagelist method from the heap-helpers into the
> > CMA heap. After which the heap-helpers logic is removed (as it
> > is unused). I'd still like to find a better way to avoid some of
> > the logic duplication in implementing the entire dma_buf_ops
> > handlers per heap. But unfortunately that code is tied somewhat
> > to how the buffer's memory is tracked. As more heaps show up I
> > think we'll have a better idea how to best share code, so for
> > now I think this is ok.
> >
> > After this, the series introduces an optimization that
> > Ørjan Eide implemented for ION that avoids calling sync on
> > attachments that don't have a mapping.
> >
> > Next, an optimization to use larger order pages for the system
> > heap. This change brings us closer to the current performance
> > of the ION allocation code (though there still is a gap due
> > to ION using a mix of deferred-freeing and page pools, I'll be
> > looking at integrating those eventually).
> >
> > Finally, a reworked version of my uncached system heap
> > implementation I was submitting a few weeks back. Since it
> > duplicated a lot of the now reworked system heap code, I
> > realized it would be much simpler to add the functionality to
> > the system_heap implementation itself.
> >
> > While not improving the core allocation performance, the
> > uncached heap allocations do result in *much* improved
> > performance on HiKey960 as it avoids a lot of flushing and
> > invalidating buffers that the cpu doesn't touch often.
> >
> > Feedback on these would be great!
> >
> > thanks
> > -john
> >
> > New in v5:
> > * Added a comment explaining why the order sizes are
> >   chosen as they are
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Laura Abbott <labbott@kernel.org>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Sandeep Patil <sspatil@google.com>
> > Cc: Daniel Mentz <danielmentz@google.com>
> > Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> > Cc: Ørjan Eide <orjan.eide@arm.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: James Jones <jajones@nvidia.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> >
> > John Stultz (7):
> >   dma-buf: system_heap: Rework system heap to use sgtables instead of
> >     pagelists
> >   dma-buf: heaps: Move heap-helper logic into the cma_heap
> >     implementation
> >   dma-buf: heaps: Remove heap-helpers code
> >   dma-buf: heaps: Skip sync if not mapped
> >   dma-buf: system_heap: Allocate higher order pages if available
> >   dma-buf: dma-heap: Keep track of the heap device struct
> >   dma-buf: system_heap: Add a system-uncached heap re-using the system
> >     heap
> >
> >  drivers/dma-buf/dma-heap.c           |  33 +-
> >  drivers/dma-buf/heaps/Makefile       |   1 -
> >  drivers/dma-buf/heaps/cma_heap.c     | 324 +++++++++++++++---
> >  drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------
> >  drivers/dma-buf/heaps/heap-helpers.h |  53 ---
> >  drivers/dma-buf/heaps/system_heap.c  | 494 ++++++++++++++++++++++++---
> >  include/linux/dma-heap.h             |   9 +
> >  7 files changed, 753 insertions(+), 431 deletions(-)
> >  delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
> >  delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h
> >
> > --
> > 2.17.1
> >
> Thanks much,
> 
> Best,
> Sumit.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
