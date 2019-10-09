Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61758D10E2
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 16:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbfJIOJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 10:09:18 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33463 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfJIOJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 10:09:18 -0400
Received: by mail-ed1-f68.google.com with SMTP id c4so2182865edl.0
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2019 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ggm5FnPBWudwKM7bMG2DlNAhhZbMe/QrjNBGIC21iLE=;
        b=YnqCuIIF4UjVn4HFsfE/AMYmTYKiPdUIcORH84mX/PlfmNBc/fSAWjPbb+SFtiEaj5
         CJwG0TCw8MvXNqBwWvRa5icbOZLDJc9LfzGCi4ILVlt+b596PwwqKJi2If4srCw+yT/J
         9iuCxay/yJEpJJgrY0i5Ld8SI7b05zSZ/NLc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=Ggm5FnPBWudwKM7bMG2DlNAhhZbMe/QrjNBGIC21iLE=;
        b=owRtFezXkjKwGDr21HiHPr8rQ8PtB3TS0y2J+fUMW1Au0xhSFDGpPxmzKPmcSdBm53
         V6CKbfyl/DPvmp13W945zxZ3GrxgTxaloeDHGgyIeppeOdTM1Brj1xK67LzvkBsrLLVT
         iQwtPwVDMY42Keki2vzTwjIeO6SXUEAz/ZCIW3stG3L/Hl97I9jPDbnyybnRp1Lg409Y
         qsKA8toQyCP+MIIW0nyQohiFomeEsPUsuaJ73U4N0c2sf4zATBOIcdJHnhbJ6ipXdP7y
         YK2CjX6eJpKWljFBzNYgQtjF8LigX+PTtMmZbjcUYm+NQbnlSukNCoNkTZ4oxkqGL2JW
         8FVg==
X-Gm-Message-State: APjAAAXV0zG2wNapnlGT5yOsG49Smf/OjQ5JMWnEsED+NjnaMM4AxT6d
        KGcb+x3sWDthZvapo+Z7IMID4g==
X-Google-Smtp-Source: APXvYqzkirb8on6ORe6NpqSckThXHb3Tav3Cj0WPhAo5jbAa/jP+L4b2aIMdTn9K+fFgrnr9a9Um2w==
X-Received: by 2002:a17:906:fcac:: with SMTP id qw12mr2982663ejb.31.1570630156129;
        Wed, 09 Oct 2019 07:09:16 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id t22sm375873edd.79.2019.10.09.07.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:09:15 -0700 (PDT)
Date:   Wed, 9 Oct 2019 16:09:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
Message-ID: <20191009140912.GY16989@phenom.ffwll.local>
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-3-christian.koenig@amd.com>
 <20191008092552.GG16989@phenom.ffwll.local>
 <d36c1631-1262-8c73-e62b-bbbddb708f1e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d36c1631-1262-8c73-e62b-bbbddb708f1e@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 09, 2019 at 03:10:09PM +0200, Christian König wrote:
> Am 08.10.19 um 11:25 schrieb Daniel Vetter:
> > On Thu, Aug 29, 2019 at 04:29:15PM +0200, Christian König wrote:
> > > This way we can even pipeline imported BO evictions.
> > > 
> > > v2: Limit this to only cases when the parent object uses a separate
> > >      reservation object as well. This fixes another OOM problem.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Since I read quite a bit of ttm I figured I'll review this too, but I'm
> > totally lost. And git blame gives me at best commits with one-liner commit
> > messages, and the docs aren't explaining much at all either (and generally
> > they didn't get updated at all with all the changes in the past years).
> > 
> > I have a vague idea of what you're doing here, but not enough to do review
> > with any confidence. And from other ttm patches from amd it feels a lot
> > like we have essentially a bus factor of 1 for all things ttm :-/
> 
> Yeah, that's one of a couple of reasons why I want to get rid of TTM in the
> long term.
> 
> Basically this is a bug fix for delay freeing ttm objects. When we hang the
> ttm object on a ghost object to be freed and the ttm object is an imported
> DMA-buf we run into the problem that we want to drop the mapping, but have
> the wrong lock taken (the lock of the ghost and not of the parent).

Got intrigued, did some more digging, I guess the bugfix part is related
to:

commit 841e763b40764a7699ae07f4cb1921af62d6316d
Author: Christian König <christian.koenig@amd.com>
Date:   Thu Jul 20 20:55:06 2017 +0200

    drm/ttm: individualize BO reservation obj when they are freed

and that's why you switch everything over to useing _resv instead of the
pointer. But then I still don't follow the details ...

> 

> Regards,
> Christian.
> 
> > -Daniel
> > 
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo_util.c | 16 +++++++++-------
> > >   1 file changed, 9 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index fe81c565e7ef..2ebe9fe7f6c8 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -517,7 +517,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
> > >   	kref_init(&fbo->base.kref);
> > >   	fbo->base.destroy = &ttm_transfered_destroy;
> > >   	fbo->base.acc_size = 0;
> > > -	fbo->base.base.resv = &fbo->base.base._resv;
> > > +	if (bo->base.resv == &bo->base._resv)
> > > +		fbo->base.base.resv = &fbo->base.base._resv;

I got confused a bit at first, until I spotted the

	fbo->base = *bo;

somewhere above. So I think that part makes sense, together with the above
cited patch. I think at least, confidence on this is very low ...

> > > +
> > >   	dma_resv_init(fbo->base.base.resv);
> > >   	ret = dma_resv_trylock(fbo->base.base.resv);

Shouldn't this be switched over to _resv too? Otherwise feels like
unbalanced locking.

> > >   	WARN_ON(!ret);
> > > @@ -716,7 +718,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> > >   		if (ret)
> > >   			return ret;
> > > -		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
> > > +		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
> > >   		/**
> > >   		 * If we're not moving to fixed memory, the TTM object
> > > @@ -729,7 +731,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
> > >   		else
> > >   			bo->ttm = NULL;
> > > -		ttm_bo_unreserve(ghost_obj);
> > > +		dma_resv_unlock(&ghost_obj->base._resv);
> > >   		ttm_bo_put(ghost_obj);
> > >   	}
> > > @@ -772,7 +774,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
> > >   		if (ret)
> > >   			return ret;
> > > -		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
> > > +		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
> > >   		/**
> > >   		 * If we're not moving to fixed memory, the TTM object
> > > @@ -785,7 +787,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
> > >   		else
> > >   			bo->ttm = NULL;
> > > -		ttm_bo_unreserve(ghost_obj);
> > > +		dma_resv_unlock(&ghost_obj->base._resv);

I guess dropping the lru part here (aside from switching from ->resv to
->_resv, which is your bugfix I think) doesn't matter since the ghost
object got all cleared up and isn't on any lists anyway? Otoh how does it
work then ...

Not clear to me why this is safe.

> > >   		ttm_bo_put(ghost_obj);
> > >   	} else if (from->flags & TTM_MEMTYPE_FLAG_FIXED) {
> > > @@ -841,7 +843,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
> > >   	if (ret)
> > >   		return ret;
> > > -	ret = dma_resv_copy_fences(ghost->base.resv, bo->base.resv);
> > > +	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
> > >   	/* Last resort, wait for the BO to be idle when we are OOM */
> > >   	if (ret)
> > >   		ttm_bo_wait(bo, false, false);
> > > @@ -850,7 +852,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
> > >   	bo->mem.mem_type = TTM_PL_SYSTEM;
> > >   	bo->ttm = NULL;
> > > -	ttm_bo_unreserve(ghost);
> > > +	dma_resv_unlock(&ghost->base._resv);
> > >   	ttm_bo_put(ghost);
> > >   	return 0;
> > > -- 
> > > 2.17.1
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
