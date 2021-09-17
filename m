Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C3340FA2C
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 16:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241700AbhIQObu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 10:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242067AbhIQObt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 10:31:49 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591C7C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:30:27 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q11so15511437wrr.9
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LTgceRItxCskPGD9mK8ds5+kNeb1YVY2nB0jNStUWmQ=;
        b=HfwITsUoMJHONS2WGXclE07EfONvEtsztGhCym/dTBsuJxrar6E3yelgCVgMf0Nl7C
         dfF5pTr6UhVSqjN0SvCnWxHtvbeOvRFDGW97I3VnK8VHZVfTEK0jdzd4ShytL3D78LXb
         U1PkXl/HTHr6iwI52Kqb7W2wXQ8H+z8XTMYlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LTgceRItxCskPGD9mK8ds5+kNeb1YVY2nB0jNStUWmQ=;
        b=Eo49LJHIOAXLVxVYjKGpdnxjSUYPPsS54Amo5kzWfqRaBfWy6HwIJ4iVz/quX1CaB4
         6jSbpIgPnPHrTlT3ohzzwEpVbPEVmSmYF/fIEQ+WR6z0s2S6vThB5ZGCxWogO9wfY1hx
         jCMkx/VoJbvbK8qd7sHQLQVOKdWUF5KgxtlyiLuJ4M1oZ+ASEd8E2lbzXnu0COfjMfpv
         8Wl6KLu5yzuXiSZExcLT7SAvrpRf3uuopjes6x/6Km+d+flIqkrOUjWSY1+8rSDxWiO9
         gPjoqAAv6KfWlrhXp3LvU2/Xlj/W9+WZj5P21d9aCl17ADNDfdkhnr1iDdHHesHF9mdi
         n2YQ==
X-Gm-Message-State: AOAM533++D5YyAYjIKj/cLraMdUd+794cQnWtWZ9eKTCs2VaZiuWSob4
        vUB1BfmY8hmetJLejgpLFL2qpg==
X-Google-Smtp-Source: ABdhPJzM1VgTlaxky0q6rmKHArHS7veG3JWcy8nTvTP6iYnY9Bl3If8kVXkbzRebWXtuGIP8j95YxQ==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr12550526wrp.435.1631889025894;
        Fri, 17 Sep 2021 07:30:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z79sm6894186wmc.17.2021.09.17.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 07:30:25 -0700 (PDT)
Date:   Fri, 17 Sep 2021 16:30:23 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: Re: [PATCH 02/26] dma-buf: add dma_resv_for_each_fence
Message-ID: <YUSmf3ZHpEz97YMi@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-3-christian.koenig@amd.com>
 <YUSX2+WP45XYmD2r@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUSX2+WP45XYmD2r@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 17, 2021 at 03:27:55PM +0200, Daniel Vetter wrote:
> On Fri, Sep 17, 2021 at 02:34:49PM +0200, Christian König wrote:
> > A simpler version of the iterator to be used when the dma_resv object is
> > locked.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/dma-buf/dma-resv.c | 33 +++++++++++++++++++++++++++++++++
> >  include/linux/dma-resv.h   | 17 +++++++++++++++++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 3e77cad2c9d4..a3c79a99fb44 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -384,6 +384,39 @@ struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
> >  }
> >  EXPORT_SYMBOL_GPL(dma_resv_iter_walk_unlocked);
> >  
> > +/**
> > + * dma_resv_iter_walk - walk over fences in a dma_resv obj
> > + * @cursor: cursor to record the current position
> > + * @first: if we should start over
> > + *
> > + * Return all the fences in the dma_resv object while holding the
> > + * dma_resv::lock.

I think we should document here that the fence is valid for as long as the
dma_resv_lock is held, which is not like the _unlocked version, where the
fence stops being valid either on the next call to iter_next() or on the
call to iter_end() to clean up everything.

Might be good to clarify that also for the unlocked version to be really
precise here when the fence is valid and when not.
-Daniel

> > + */
> > +struct dma_fence *dma_resv_iter_walk(struct dma_resv_iter *cursor, bool first)
> > +{
> > +	dma_resv_assert_held(cursor->obj);
> > +
> > +	cursor->is_first = first;
> > +	if (first) {
> > +		struct dma_fence *fence;
> > +
> > +		cursor->index = -1;
> > +		cursor->fences = dma_resv_shared_list(cursor->obj);
> > +
> > +		fence = dma_resv_excl_fence(cursor->obj);
> > +		if (fence)
> > +			return fence;
> > +	}
> 
> I think you can still use the shared iter_begin/end functions even with my
> suggestions for patch 1, but would mean changes here too.
> 
> > +
> > +	if (!cursor->all_fences || !cursor->fences ||
> > +	    ++cursor->index >= cursor->fences->shared_count)
> > +		return NULL;
> > +
> > +	return rcu_dereference_protected(cursor->fences->shared[cursor->index],
> > +					 dma_resv_held(cursor->obj));
> > +}
> > +EXPORT_SYMBOL_GPL(dma_resv_iter_walk);
> > +
> >  /**
> >   * dma_resv_copy_fences - Copy all fences from src to dst.
> >   * @dst: the destination reservation object
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 693d16117153..8c968f8c9d33 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -179,6 +179,7 @@ struct dma_resv_iter {
> >  
> >  struct dma_fence *dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor,
> >  					      bool first);
> > +struct dma_fence *dma_resv_iter_walk(struct dma_resv_iter *cursor, bool first);
> >  
> >  /**
> >   * dma_resv_iter_begin - initialize a dma_resv_iter object
> > @@ -233,6 +234,22 @@ static inline bool dma_resv_iter_is_exclusive(struct dma_resv_iter *cursor)
> >  	for (fence = dma_resv_iter_walk_unlocked(cursor, true);		\
> >  	     fence; fence = dma_resv_iter_walk_unlocked(cursor, false))
> >  
> > +/**
> > + * dma_resv_for_each_fence - fence iterator
> > + * @cursor: a struct dma_resv_iter pointer
> > + * @obj: a dma_resv object pointer
> > + * @all_fences: true if all fences should be returned
> > + * @fence: the current fence
> > + *
> > + * Iterate over the fences in a struct dma_resv object while holding the
> > + * dma_resv::lock. @all_fences controls if the shared fences are returned as
> 
> &dma_resv.lock is how you reference struct members in kerneldoc. I think
> you had this also in patch 1.
> 
> > + * well. The cursor initialisation is part of the iterator.
> 
> Please also link to the iter_begin/end functions here.
> 
> Aside from doc nits and obviously changes due to changes in patch 1 (if we
> do them), this looks good.
> -Daniel
> 
> > + */
> > +#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
> > +	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
> > +	     fence = dma_resv_iter_walk(cursor, true); fence;	\
> > +	     fence = dma_resv_iter_walk(cursor, false))
> > +
> >  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> >  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> >  
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
