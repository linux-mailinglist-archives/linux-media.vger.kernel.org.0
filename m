Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1BF5452C46
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 08:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhKPH76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 02:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhKPH74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 02:59:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FABAC061570
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 23:56:59 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1mmtKr-0004aV-87; Tue, 16 Nov 2021 08:56:57 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1mmtKq-0004Qq-7w; Tue, 16 Nov 2021 08:56:56 +0100
Date:   Tue, 16 Nov 2021 08:56:56 +0100
From:   Sascha Hauer <sha@pengutronix.de>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Christian =?iso-8859-15?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 12/26] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Message-ID: <20211116075656.GD6556@pengutronix.de>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-13-christian.koenig@amd.com>
 <20211115140353.GC6556@pengutronix.de>
 <YZJp8Uj4NpeP+zui@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZJp8Uj4NpeP+zui@phenom.ffwll.local>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:55:02 up 271 days, 11:18, 130 users,  load average: 0.29, 0.23,
 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 03:08:49PM +0100, Daniel Vetter wrote:
> On Mon, Nov 15, 2021 at 03:03:53PM +0100, Sascha Hauer wrote:
> > Hi,
> > 
> > On Fri, Sep 17, 2021 at 02:34:59PM +0200, Christian König wrote:
> > > Simplifying the code a bit.
> > > 
> > > v2: use dma_resv_for_each_fence
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
> > >  1 file changed, 6 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 042c16b5d54a..5bc5f775abe1 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
> > >  					    struct drm_gem_object *obj,
> > >  					    bool write)
> > >  {
> > > +	struct dma_resv_iter cursor;
> > > +	struct dma_fence *fence;
> > >  	int ret;
> > > -	struct dma_fence **fences;
> > > -	unsigned int i, fence_count;
> > > -
> > > -	if (!write) {
> > > -		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> > > -
> > > -		return drm_sched_job_add_dependency(job, fence);
> > > -	}
> > > -
> > > -	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> > > -	if (ret || !fence_count)
> > > -		return ret;
> > >  
> > > -	for (i = 0; i < fence_count; i++) {
> > > -		ret = drm_sched_job_add_dependency(job, fences[i]);
> > > +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> > > +		ret = drm_sched_job_add_dependency(job, fence);
> > >  		if (ret)
> > > -			break;
> > > +			return ret;
> > >  	}
> > > -
> > > -	for (; i < fence_count; i++)
> > > -		dma_fence_put(fences[i]);
> > > -	kfree(fences);
> > > -	return ret;
> > > +	return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
> > >  
> > 
> > This patch lets the panfrost driver explode on v5.16-rc1 with the
> > following. I didn't bisect it, but it goes away when I revert this
> > patch. I only started weston, nothing more.
> > 
> > Any idea what goes wrong here?
> 
> Should be fixed in 13e9e30cafea1, but Christian pushed it to the wrong
> patch so it missed -rc1.

I can confirm 13e9e30cafea1 fixes the issue, thanks

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
