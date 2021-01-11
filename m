Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A8F2F1BA2
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 17:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731091AbhAKQ66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 11:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbhAKQ65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 11:58:57 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33802C061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 08:58:17 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a12so479579wrv.8
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4FqdUl+82w6WQ3AgKtaR9Ms7/D3PccxuSOkwBbIHSfQ=;
        b=gLQy7sdd++mPhIh7HsdZgDZ44VQV66IhNyV451vLAxIg3dfS1nbu5hONh7WShiRdt6
         hxqD7CVEtKcgBfagdN7Uu6VJjJvp3A+a6+CDvRuYPIMC32E6l2xL/idb0BPgfBKcYFn2
         IJsVDrwX/LtG9DxNZcwhZnO+ZAo6lap5GsSwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4FqdUl+82w6WQ3AgKtaR9Ms7/D3PccxuSOkwBbIHSfQ=;
        b=kin1l1uIJCea2AP4x7hok2WjJ71/8dPCNkJsju0Yok+uFPo8RoTjr1ojMfUADmVMu0
         o582nEhnM3f9VyNkio0yM4U6cXjHrKhUvwSIKU5hH44A2lT6ZA2P0VRZpAD/pb3s/nqT
         2YiJckt0yfGefofJertTd6jUCzCYeywqx2DDoK2nkIXjynpLno+3BKeZxXJ77ZwV9Rct
         573Sp2LBRlM4C0hKrj8Tx4c18j5Y971NQwhFe0O9R3XVOZzuvzyUiD9kDRFFoZSOLopK
         7++Sg7nZV/90uXZI2ATZDpcvfJrdfQnKrOA2TgjEO9bqSnOwpp4QIXUjiYnl6Q/CmbU5
         0VVg==
X-Gm-Message-State: AOAM532GXli5GOQR8hGXpMX50qhJ1jcM9kiZXk7QOxg3csyzZOGvomY8
        Apje1Usvm++ZRna9Ti+4N/XUug==
X-Google-Smtp-Source: ABdhPJzUUtudaQHIkwtOF8q9nDHaJ26/sAlo6U/GtHff2RUsJVajVjlbhR+QS23CmuIMHVZP8Twt1Q==
X-Received: by 2002:adf:e406:: with SMTP id g6mr44798wrm.255.1610384296005;
        Mon, 11 Jan 2021 08:58:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p15sm296486wrt.15.2021.01.11.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 08:58:15 -0800 (PST)
Date:   Mon, 11 Jan 2021 17:58:13 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 05/13] drm/mgag200: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yDpZbtRhe2YlCp@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-6-tzimmermann@suse.de>
 <X/yClQZQ0B5AMfEP@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/yClQZQ0B5AMfEP@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 11, 2021 at 05:53:41PM +0100, Daniel Vetter wrote:
> On Fri, Jan 08, 2021 at 10:43:32AM +0100, Thomas Zimmermann wrote:
> > Damage handling in mgag200 requires a short-term mapping of the source
> > BO. Use drm_gem_shmem_vmap_local().
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On second thought, strike that r-b, I have a confused question.
> 
> > ---
> >  drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > index 1dfc42170059..a33e28d4c5e9 100644
> > --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > @@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
> >  		      struct drm_rect *clip)
> >  {
> >  	struct drm_device *dev = &mdev->base;
> > +	struct drm_gem_object *obj = fb->obj[0];
> >  	struct dma_buf_map map;
> >  	void *vmap;
> >  	int ret;
> >  
> > -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> > +	ret = dma_resv_lock(obj->resv, NULL);
> >  	if (drm_WARN_ON(dev, ret))
> > -		return; /* BUG: SHMEM BO should always be vmapped */
> > +		return;
> > +	ret = drm_gem_shmem_vmap_local(obj, &map);
> > +	if (drm_WARN_ON(dev, ret))
> > +		goto err_dma_resv_unlock; /* BUG: SHMEM BO should always be vmapped */

Why is this guaranteed? I tried to hunt for a vmap in mga200g code, and
dind't find any. I'd ahve expected something in prepare/finish_fb.

Also since this is not a vram-helper using driver, why convert it over to
vmap_local? I guess that should also be explained in the commit message a
bit better.
-Daniel

> >  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
> >  
> >  	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> >  
> > -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> > +	drm_gem_shmem_vunmap_local(obj, &map);
> > +	dma_resv_unlock(obj->resv);
> >  
> >  	/* Always scanout image at VRAM offset 0 */
> >  	mgag200_set_startadd(mdev, (u32)0);
> >  	mgag200_set_offset(mdev, fb);
> > +
> > +	return;
> > +
> > +err_dma_resv_unlock:
> > +	dma_resv_unlock(obj->resv);
> >  }
> >  
> >  static void
> > -- 
> > 2.29.2
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
