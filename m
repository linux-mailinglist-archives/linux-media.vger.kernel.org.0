Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A74436111
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 14:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhJUMKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 08:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhJUMKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 08:10:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED4CC06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 05:08:24 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id i12so716204wrb.7
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=djJOEt6biCNzIxqdTk62h+b491lKskY6U3yacyivLEw=;
        b=c5tSrGe3CHMZl7DvRDR4efrUSRgSfTbn1NK8z9SBLd2TeMvrHf674NXN87YTkG7zxV
         tsOHF3eTlZjBz7DKbYflzdjTdn0rT3RXAvFdmrwAkFPoH1tLHYp7sx1pDRAsTusXRq1a
         4ndd2MIqdHYVqputO76fGvZJPD3oVqZopuOOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=djJOEt6biCNzIxqdTk62h+b491lKskY6U3yacyivLEw=;
        b=UE6zWoD455QTpnlu8dO6WQqXzPtw5qEiCITGxfZ093l4s8L8n+GIdVb1Yv9PRtYHFL
         TnXvFVCqvuw8cX8ikHov6qdwkb0u5lC6QB+NxpPIgXoQ7Hytrot5OH/00w+9b0fli2fA
         J54ozRDRe0976h0ZwwCJZ/8Mmur++1N6zjNiIlJAfbTrFv5V3KiNUkVgC5iRJcxIypon
         /O6jWTKKyoOIwAWOWVpKGC2JPnCTZgqL9uZI9EiXcUPug7mmQz1rmI3JjrOkEDBqsJcV
         bJysumUtRWgh/jzoIBNRxtlvENbg0PZC6ZNRF0/tDqmPA1p+EX19ryFbANLKBxaEAJHL
         ahkQ==
X-Gm-Message-State: AOAM5335z1va0qlEcJv019SOLdlx/QsUmHDPrnIcA/Qh1pZ0C1iI88Nc
        lUqbewmxtyRa6n9Adf7rynPlSA==
X-Google-Smtp-Source: ABdhPJwk2ijMk01v1uJB5E7SqZ7tASKWbjKG/5T1dTuTmqKek02XQ4pRXTflPK6lzGUhXJQWb663yg==
X-Received: by 2002:a5d:64c5:: with SMTP id f5mr6635604wri.321.1634818102689;
        Thu, 21 Oct 2021 05:08:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g33sm4267021wmp.45.2021.10.21.05.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 05:08:21 -0700 (PDT)
Date:   Thu, 21 Oct 2021 14:08:19 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [Linaro-mm-sig] [PATCH 2/2] dma-buf: Fix dma_resv_test_signaled.
Message-ID: <YXFYM/15tbTF2bi2@phenom.ffwll.local>
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-3-maarten.lankhorst@linux.intel.com>
 <ebf0714c-2f49-a0ad-1861-16394ade468d@amd.com>
 <9b7e43bb-e175-0aff-2cc1-cc10236fe8e5@linux.intel.com>
 <06fa85f5-3664-4da4-bde8-6d7d2f199251@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06fa85f5-3664-4da4-bde8-6d7d2f199251@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 15, 2021 at 02:56:59PM +0200, Christian König wrote:
> 
> 
> Am 15.10.21 um 14:52 schrieb Maarten Lankhorst:
> > Op 15-10-2021 om 14:07 schreef Christian König:
> > > Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
> > > > Commit 7fa828cb9265 ("dma-buf: use new iterator in dma_resv_test_signaled")
> > > > accidentally forgot to test whether the dma-buf is actually signaled, breaking
> > > > pretty much everything depending on it.
> > > NAK, the dma_resv_for_each_fence_unlocked() returns only unsignaled fences. So the code is correct as it is.
> > That seems like it might cause some unexpected behavior when that function is called with one of the fence locks held, if it calls dma_fence_signal().
> > 
> > Could it be changed to only test the signaled bit, in which case this patch would still be useful?
> 
> That's exactly what I suggested as well, but Daniel was against that because
> of concerns around barriers.

I don't want open-coded bitmask tests, because the current code we have in
dma-fence.c is missing barriers, and that doesn't get better if we spread
that all around. But if you want this then wrap it in some static inline
in dma-fence.h or so, that's fine. Just not open-coded outside of these
files, like i915-gem code does a lot (which imo is just plain a disaster).

> > Or at least add some lockdep annotations, that fence->lock might be taken. So any hangs would at least be easy to spot with lockdep.
> 
> That should be trivial doable.

might_lock is trivial to add, but it's more complicated. The spinlock is
provided by the fence code, which means there's lots of different lockdep
classes. A might_lock on fence->lock is better than nothing, but maybe not
good enough.

What we might need are a few more pieces:
- a fake dma-fence spinlock lockdep key, maybe call it dma_fence_lock_key
  or so.
- in dma_fence_init we lock dma_fence_lock_key, and then might_lock the
  actual spinlock passed as an argument. This establishes dependencies
  from that fake lock to all real fence spinlocks
- anywhere we need a might lock we take dma_fence_lock_key instead

The potential issue here is that this might result in lockdep splats in
cases where fences somehow naturally nest (maybe drm/sched job fence vs hw
fence). So perhaps too much.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
