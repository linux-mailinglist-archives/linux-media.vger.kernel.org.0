Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4357D48EE22
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 17:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbiANQbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 11:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiANQbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 11:31:45 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546BDC061574
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 08:31:45 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso8409364wmj.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 08:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8ZqzIawu0QyaTiMFz27T67G+Yf8xefUPYq90QjjXlkQ=;
        b=RMXS/avKKanTfnN7P3/KBZyTM1qCaUiQDcyxS20vaZzCOkrmDqVd40/8A5VZ+JR0GX
         PJckM5E58bWjfjlY4Sps6GzXepLoa3k8zuSNL5dgYNk8i0pxBxbDpSVuFgUrZCqB5Rtn
         4DyphykAmsb5ievTbXag0zZ1zP6tkqNbFfHR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8ZqzIawu0QyaTiMFz27T67G+Yf8xefUPYq90QjjXlkQ=;
        b=TQgRpbb+LroFFDfni1nXS4KZ4LF2+tItR4ahiFsUV6i1Ue0j+2+R28cBJf1M0Ywfmq
         fP+/MTpM4x2UrwsOshfQcnHVJ9QYHRkrWbxQg/hES3OdB5q55nzrJRxqv2haardjUkm8
         Emb/XR62yPhsmZZCbHLj5Eb+tgubB66DbZayBqk7FJd17ovXsT6bc3U1bVRHOjEvlcR7
         w6svKgK/zHuwFENSSf+81kK8Zyz6GaDKJ7MgmiwTrhLOQYm4vtuoqsCtnkt0hahAeTPD
         8uIeFuqUsuoKHyp1PN1jb33G+BDtX2/QvqS7ja7q+zYqICHQdf2mYUp44IDlsDxFGM1y
         rILA==
X-Gm-Message-State: AOAM530XqILKPiQOt7vat/5Eqn1HFyzoFpT8+Oe8HoFwk5Uj/2wrwGPx
        ZCZtaIt1VbkIKI5Ux9COHBbC6A==
X-Google-Smtp-Source: ABdhPJyyHOC2gTWNp2dP/f99Fv7JuO0mp0qBSLL0h6dWVFh9Z+dmCX1xElKKN+nZEeq+souOF2buQg==
X-Received: by 2002:a05:600c:1c9f:: with SMTP id k31mr5262867wms.40.1642177903847;
        Fri, 14 Jan 2022 08:31:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l4sm6892697wry.85.2022.01.14.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:31:42 -0800 (PST)
Date:   Fri, 14 Jan 2022 17:31:40 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
Message-ID: <YeGlbLXXuUITZlQP@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-5-christian.koenig@amd.com>
 <YcOWyHzY22ZCCvef@phenom.ffwll.local>
 <95929048-b381-78d1-462c-e7b910c784b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95929048-b381-78d1-462c-e7b910c784b0@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 03, 2022 at 12:13:41PM +0100, Christian König wrote:
> Am 22.12.21 um 22:21 schrieb Daniel Vetter:
> > On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian König wrote:
> > > Add a function to simplify getting a single fence for all the fences in
> > > the dma_resv object.
> > > 
> > > v2: fix ref leak in error handling
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-resv.c | 52 ++++++++++++++++++++++++++++++++++++++
> > >   include/linux/dma-resv.h   |  2 ++
> > >   2 files changed, 54 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index 480c305554a1..694716a3d66d 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > > @@ -34,6 +34,7 @@
> > >    */
> > >   #include <linux/dma-resv.h>
> > > +#include <linux/dma-fence-array.h>
> > >   #include <linux/export.h>
> > >   #include <linux/mm.h>
> > >   #include <linux/sched/mm.h>
> > > @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
> > >   }
> > >   EXPORT_SYMBOL_GPL(dma_resv_get_fences);
> > > +/**
> > > + * dma_resv_get_singleton - Get a single fence for all the fences
> > > + * @obj: the reservation object
> > > + * @write: true if we should return all fences
> > > + * @fence: the resulting fence
> > > + *
> > > + * Get a single fence representing all the fences inside the resv object.
> > > + * Returns either 0 for success or -ENOMEM.
> > > + *
> > > + * Warning: This can't be used like this when adding the fence back to the resv
> > > + * object since that can lead to stack corruption when finalizing the
> > > + * dma_fence_array.
> > Uh I don't get this one? I thought the only problem with nested fences is
> > the signalling recursion, which we work around with the irq_work?
> 
> Nope, the main problem is finalizing the dma_fence_array.
> 
> E.g. imagine that you build up a chain of dma_fence_array objects like this:
> a<-b<-c<-d<-e<-f.....
> 
> With each one referencing the previous dma_fence_array and then you call
> dma_fence_put() on the last one. That in turn will cause calling
> dma_fence_put() on the previous one, which in turn will cause
> dma_fence_put() one the one before the previous one etc....
> 
> In other words you recurse because each dma_fence_array instance drops the
> last reference of it's predecessor.
> 
> What we could do is to delegate dropping the reference to the containing
> fences in a dma_fence_array as well, but that would require some changes to
> the irq_work_run_list() function to be halve way efficient.o
> 
> > Also if there's really an issue with dma_fence_array fences, then that
> > warning should be on the dma_resv kerneldoc, not somewhere hidden like
> > this. And finally I really don't see what can go wrong, sure we'll end up
> > with the same fence once in the dma_resv_list and then once more in the
> > fence array. But they're all refcounted, so really shouldn't matter.
> > 
> > The code itself looks correct, but me not understanding what even goes
> > wrong here freaks me out a bit.
> 
> Yeah, IIRC we already discussed that with Jason in length as well.
> 
> Essentially what you can't do is to put a dma_fence_array into another
> dma_fence_array without causing issues.
> 
> So I think we should maybe just add a WARN_ON() into dma_fence_array_init()
> to make sure that this never happens.

Yeah I think this would be much clearer instead of sprinkling half the
story as a scary&confusing warning over all kinds of users which
internally use dma fence arrays.

And then if it goes boom I guess we could fix it internally in
dma_fence_array_init by flattening fences down again. But only if actually
needed.

What confused me is why dma_resv is special, and from your reply it sounds
like it really isn't.
-Daniel


> 
> Regards,
> Christian.
> 
> > 
> > I guess something to figure out next year, I kinda hoped I could squeeze a
> > review in before I disappear :-/
> > -Daniel
> > 
> > > + */
> > > +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> > > +			   struct dma_fence **fence)
> > > +{
> > > +	struct dma_fence_array *array;
> > > +	struct dma_fence **fences;
> > > +	unsigned count;
> > > +	int r;
> > > +
> > > +	r = dma_resv_get_fences(obj, write, &count, &fences);
> > > +        if (r)
> > > +		return r;
> > > +
> > > +	if (count == 0) {
> > > +		*fence = NULL;
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (count == 1) {
> > > +		*fence = fences[0];
> > > +		kfree(fences);
> > > +		return 0;
> > > +	}
> > > +
> > > +	array = dma_fence_array_create(count, fences,
> > > +				       dma_fence_context_alloc(1),
> > > +				       1, false);
> > > +	if (!array) {
> > > +		while (count--)
> > > +			dma_fence_put(fences[count]);
> > > +		kfree(fences);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	*fence = &array->base;
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> > > +
> > >   /**
> > >    * dma_resv_wait_timeout - Wait on reservation's objects
> > >    * shared and/or exclusive fences.
> > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > index fa2002939b19..cdfbbda6f600 100644
> > > --- a/include/linux/dma-resv.h
> > > +++ b/include/linux/dma-resv.h
> > > @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
> > >   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> > >   int dma_resv_get_fences(struct dma_resv *obj, bool write,
> > >   			unsigned int *num_fences, struct dma_fence ***fences);
> > > +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> > > +			   struct dma_fence **fence);
> > >   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> > >   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
> > >   			   unsigned long timeout);
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
