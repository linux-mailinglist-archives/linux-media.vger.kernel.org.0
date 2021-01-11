Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910782F1BB8
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbhAKREW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbhAKREW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:04:22 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7035C061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:03:41 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m5so487816wrx.9
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ALtIbbdLffgue6tI4Zq52HkQm8jHa5cuL6H+tIYyZvw=;
        b=ON9Fdv13tvinQvVKGf0i/jKWuF/PWRDDEK2r2JYDitjAUwRTKDpqf4nufXzFYEAxsX
         vaN1mtOgXr0FDD2Qs9gTIFSK5vut7kwgRlCz5Vns/7LXRlrLXChAR/CToOVIGQqizCAl
         xeEu6htpOJh81BArqoLN2CQIS8Ltk6eWziloE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ALtIbbdLffgue6tI4Zq52HkQm8jHa5cuL6H+tIYyZvw=;
        b=TW5B4ll0d4C6+DAmcQ79HBjBZkAFLBI7v8Le0S1LFxCdetAQEvu0gG/o9elGB2T0YO
         1nMWfb4KPtUg67XojKgHXvamRdTIsPPEvBlgZZrxOYirC7d207TXUENDHs6rWY7Hqq93
         zh+5Nx7F4WmnqFcwKEmeLocTJpf4QXaHhTgZ9F2ITR4f5cLE1VM7Ga7ssujk5dR2Y/SZ
         W5qScWc/DYYBMcpINB7C0oPWQYrLS4ztgGfz14j8N4RvgCkWRtBZKP4C6bfV/pBCMZQW
         Z+2iu6Osa1UIfL5RLt5ujBGEEMtOkT9l7+B1g+PGe7R0WlCAi5Y4eaPQ5wOF23zVPPyV
         0HRw==
X-Gm-Message-State: AOAM531DAmwEOY2Ye+WsvHeShP6GXp3/VPVn1yuTub1fMi9NQClkBiPD
        Io2ty6huhA6Q91XsLTOC0GcmGA==
X-Google-Smtp-Source: ABdhPJxFI7jKE0bGZWc1WaBEC3v4a5PjcJyxs5JgUHTFcbju1xWGCLxnPt0/We5va+1YMmoe1yCj3g==
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr77723wrs.155.1610384620424;
        Mon, 11 Jan 2021 09:03:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b12sm439139wmj.2.2021.01.11.09.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:03:39 -0800 (PST)
Date:   Mon, 11 Jan 2021 18:03:37 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 06/13] drm/cirrus: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yE6bxLBpgXtiXy@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-7-tzimmermann@suse.de>
 <X/yEOiDNYmRo+17/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/yEOiDNYmRo+17/@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 11, 2021 at 06:00:42PM +0100, Daniel Vetter wrote:
> On Fri, Jan 08, 2021 at 10:43:33AM +0100, Thomas Zimmermann wrote:
> > Damage handling in cirrus requires a short-term mapping of the source
> > BO. Use drm_gem_shmem_vmap_local().
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Hm more possible errors that we don't report to userspace ... Why don't we
> vmap/vunmap these in prepare/cleanup_fb? Generally we'd want a long-term
> vmap here to make sure this all works nicely.
> 
> Since it's nothing new, on this patch:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ok, also strike this r-b here. This is called from that atomic commit
paths, and we cannot call dma_resv_lock here. This should splat with
lockdep enabled against the dma-fence annotations I've merged, I'm kinda
surprised it doesn't?
-Daniel

> 
> > ---
> >  drivers/gpu/drm/tiny/cirrus.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> > index a043e602199e..21cd7056d45f 100644
> > --- a/drivers/gpu/drm/tiny/cirrus.c
> > +++ b/drivers/gpu/drm/tiny/cirrus.c
> > @@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
> >  			       struct drm_rect *rect)
> >  {
> >  	struct cirrus_device *cirrus = to_cirrus(fb->dev);
> > +	struct drm_gem_object *obj = fb->obj[0];
> >  	struct dma_buf_map map;
> >  	void *vmap;
> >  	int idx, ret;
> > @@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
> >  	if (!drm_dev_enter(&cirrus->dev, &idx))
> >  		goto out;
> >  
> > -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> > +	ret = dma_resv_lock(obj->resv, NULL);
> >  	if (ret)
> >  		goto out_dev_exit;
> > +	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
> > +	if (ret)
> > +		goto out_dma_resv_unlock;
> >  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
> >  
> >  	if (cirrus->cpp == fb->format->cpp[0])
> > @@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
> >  	else
> >  		WARN_ON_ONCE("cpp mismatch");
> >  
> > -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> >  	ret = 0;
> >  
> > +	drm_gem_shmem_vunmap_local(obj, &map);
> > +out_dma_resv_unlock:
> > +	dma_resv_unlock(obj->resv);
> >  out_dev_exit:
> >  	drm_dev_exit(idx);
> >  out:
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
