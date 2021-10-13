Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C57E42C2C3
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhJMOVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhJMOVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:21:30 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646F3C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:19:27 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k7so8849322wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rqU/dmK8rMWcEtsgaBLNzDP806G75d0eV2L5USY78fM=;
        b=CIYkYXAy4JpmzOW6g9gA0zNKwRGBbSvFuljk1DL1L2ywvH1FCvtnW2S65eaX6DNgyJ
         HWqxlyvCYyze/QHURQcl3FSsBpdQjI7kXVcFkl6gPZ/TgUlF/Hy+yrL4UecoYx0qgCHJ
         UR7iyCL6EhiOQl1BjS0N/r3zORjxFyJjw8lyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rqU/dmK8rMWcEtsgaBLNzDP806G75d0eV2L5USY78fM=;
        b=f7rbv37Eh8eIrXjM5K9cLuhD69cLeKBfFz5t+2UP8I2wASvZu6PlAy+g4fRNdUAtQJ
         lrDyJUBTCLEs79h2CgPrndxujCtcelTPWHvlpMXsqy7m420doLD86ppYDXsP/jtOousN
         xrh677VpaGfxpZ8wxI4lGWHK7SsWIl6OufWXOipTn5KaEoa//TSfBM6YaVOmE+QNm4ea
         dNhmF2rYjkWCJAxv/9gHoXlV+LHzau8u/XPVLREairxWjz+IqvqT5rM4M6+xfewpmoiC
         RPrgmG/spI6Lanools3Rve7YUb9mwILNwxmS8vAyjP2pMyjRfCXxtSZbysn0ExxrDJjL
         tkZQ==
X-Gm-Message-State: AOAM5307yE+zZCzSX34jpz/JF3HazRDGqFgb6PwBxpSvo/ZxUmHKazRt
        yOTybke9mhKHhqVkcJB7gnHcjg==
X-Google-Smtp-Source: ABdhPJzsIIepLiJRjWr2jRRia7cpMVxh1CP0AxQBHtVpdv22ieiys1yU6Zib4paL8MeS0L0xXtDVsw==
X-Received: by 2002:adf:f481:: with SMTP id l1mr39278119wro.411.1634134765952;
        Wed, 13 Oct 2021 07:19:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r8sm13456121wrv.61.2021.10.13.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:19:25 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:19:23 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
Message-ID: <YWbq6yXUVayXTntI@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-18-christian.koenig@amd.com>
 <50b8ffb7-2720-619d-3140-af2f90450a21@linux.intel.com>
 <65e28697-6f0a-7f97-d49b-ebf8d0b8d23f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65e28697-6f0a-7f97-d49b-ebf8d0b8d23f@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 02:44:50PM +0200, Christian König wrote:
> Am 05.10.21 um 14:40 schrieb Tvrtko Ursulin:
> > 
> > On 05/10/2021 12:37, Christian König wrote:
> > > This makes the function much simpler since the complex
> > > retry logic is now handled else where.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Reminder - r-b was retracted until at least more text is added to commit
> > message about pros and cons. But really some discussion had inside the
> > i915 team on the topic.
> 
> Sure, going to move those to a different branch.
> 
> But I really only see the following options:
> 1. Grab the lock.
> 2. Use the _unlocked variant with get/put.
> 3. Add another _rcu iterator just for this case.
> 
> I'm fine with either, but Daniel pretty much already rejected #3 and #2/#1
> has more overhead then the original one.

Anything that removes open-code rcu/lockless magic from i915 gets my ack,
there's way too much of this everywhere. So on this:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I've asked Maarten to review the i915 ones for you, please pester him if
it's not happening :-)
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
> > >   1 file changed, 14 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > index 6234e17259c1..dc72b36dae54 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> > > @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void
> > > *data,
> > >   {
> > >       struct drm_i915_gem_busy *args = data;
> > >       struct drm_i915_gem_object *obj;
> > > -    struct dma_resv_list *list;
> > > -    unsigned int seq;
> > > +    struct dma_resv_iter cursor;
> > > +    struct dma_fence *fence;
> > >       int err;
> > >         err = -ENOENT;
> > > @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev,
> > > void *data,
> > >        * to report the overall busyness. This is what the wait-ioctl
> > > does.
> > >        *
> > >        */
> > > -retry:
> > > -    seq = raw_read_seqcount(&obj->base.resv->seq);
> > > -
> > > -    /* Translate the exclusive fence to the READ *and* WRITE engine */
> > > -    args->busy =
> > > busy_check_writer(dma_resv_excl_fence(obj->base.resv));
> > > -
> > > -    /* Translate shared fences to READ set of engines */
> > > -    list = dma_resv_shared_list(obj->base.resv);
> > > -    if (list) {
> > > -        unsigned int shared_count = list->shared_count, i;
> > > -
> > > -        for (i = 0; i < shared_count; ++i) {
> > > -            struct dma_fence *fence =
> > > -                rcu_dereference(list->shared[i]);
> > > -
> > > +    args->busy = 0;
> > > +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
> > > +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
> > > +        if (dma_resv_iter_is_restarted(&cursor))
> > > +            args->busy = 0;
> > > +
> > > +        if (dma_resv_iter_is_exclusive(&cursor))
> > > +            /* Translate the exclusive fence to the READ *and*
> > > WRITE engine */
> > > +            args->busy |= busy_check_writer(fence);
> > > +        else
> > > +            /* Translate shared fences to READ set of engines */
> > >               args->busy |= busy_check_reader(fence);
> > > -        }
> > >       }
> > > -
> > > -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
> > > -        goto retry;
> > > +    dma_resv_iter_end(&cursor);
> > >         err = 0;
> > >   out:
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
