Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43792D7747
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394914AbgLKOBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 09:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395031AbgLKOBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 09:01:04 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA768C0613CF
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 06:00:23 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a6so7644200wmc.2
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 06:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d8tFMCsanGJNlY0eo5T2OA58hKATRtq8341bLyQUv+8=;
        b=Fi1Tf3C/8K7v5WWvJtBcGeox3Ft1mlUyad1rkSHtHus3E0E8eRZ/XA6xE1vh9q59HN
         2GWqtExDpcUDzDk20mQQiEHawhPfGx7pHcAZcAs1/z013CnZeh7YSilWYci/bHdRebLL
         QL/Yj67AoKbm7MMrBU/nQlXhFkBMUBab5q0VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d8tFMCsanGJNlY0eo5T2OA58hKATRtq8341bLyQUv+8=;
        b=rj1DLdA87oX8D3AyZnT+ggHVtPxq1kbixNCz0KS4H+2uqelQYNXldLKYxHrmOY5y+t
         InBbvn3xkvTbeS26pZiyryOdgCjNW5xubA4ZbWY9/03693RP2jtHVZmsqibpLiPmw/D1
         wd3UIDfqM3nZwOpA7MMhrNqqRRZyn2asNsSVMwzYIIjGfaTHNZ/napTL3yV5bfheSSyr
         UCRl9iSXdzLCOZwm6nnkZvZKOWAE57FLu98qb03xZCsXMWhJps51fB6vSRnTR452yp64
         4xfTScr2dOdn+9cj0mLt9By9pkC5Qej17GLwhXaUgAjZ7OkpS8WFY82Nwlzzla2TUPHK
         SbPA==
X-Gm-Message-State: AOAM5326ntNwKsAR3VT6vr7+pklrnBppnZB8hx+M96pRP1QdvtC1ZA5C
        5uhc1XbP4v7tw9+2Qk9NkOXcIw==
X-Google-Smtp-Source: ABdhPJy8r6Glu9Lw6Mp/XjSsYQ7YvWEXPIl2oivqQiMDXNDKTrOHyb+XfcH5y51l2KsyYgnp1WiIgw==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr13725696wmh.25.1607695222434;
        Fri, 11 Dec 2020 06:00:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b14sm15061137wrx.77.2020.12.11.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 06:00:21 -0800 (PST)
Date:   Fri, 11 Dec 2020 15:00:19 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        sam@ravnborg.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com,
        kraxel@redhat.com, virtualization@lists.linux-foundation.org,
        sean@poorly.run, christian.koenig@amd.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 8/8] drm/fb-helper: Move BO locking from DRM client to
 fbdev damage worker
Message-ID: <20201211140019.GS401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-9-tzimmermann@suse.de>
 <20201211100134.GN401619@phenom.ffwll.local>
 <e1b4d35a-f624-bca2-cd12-ca6dbaf860d1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1b4d35a-f624-bca2-cd12-ca6dbaf860d1@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 11, 2020 at 11:16:25AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.12.20 um 11:01 schrieb Daniel Vetter:
> > On Wed, Dec 09, 2020 at 03:25:27PM +0100, Thomas Zimmermann wrote:
> > > Fbdev emulation has to lock the BO into place while flushing the shadow
> > > buffer into the BO's memory. Remove any interference with pinning by
> > > using vmap_local functionality (instead of full vmap). This requires
> > > BO reservation locking in fbdev's damage worker.
> > > 
> > > The new DRM client functions for locking and vmap_local functionality
> > > are added for consistency with the existing style.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > The old vmap/vunmap in the client library aren't used anymore, please
> > delete. That will also make it clearer in the diff what's going on and
> > that it makes sense to have the client and fb-helper part in one patch.
> 
> They are still around for perma-mapped BOs where HW supports it (really only
> CMA-based drivers). See drm_fb_helper_generic_probe() and
> drm_fbdev_cleanup().

Ah right I didn't grep this carefully enough. I guess in that case
splitting this into the drm_client patch and fb-helper patch would be good
I think.

Also some kerneldoc commment addition for normal vmap that vmap_local is
preferred for short-term mappings, and for vmap_local that _vmap() gives
you the long term mapping. Just for more links and stuff in docs.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > > ---
> > >   drivers/gpu/drm/drm_client.c    | 91 +++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/drm_fb_helper.c | 41 +++++++--------
> > >   include/drm/drm_client.h        |  4 ++
> > >   3 files changed, 116 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> > > index ce45e380f4a2..795f5cb052ba 100644
> > > --- a/drivers/gpu/drm/drm_client.c
> > > +++ b/drivers/gpu/drm/drm_client.c
> > > @@ -288,6 +288,37 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
> > >   	return ERR_PTR(ret);
> > >   }
> > > +/**
> > > + * drm_client_buffer_lock - Locks the DRM client buffer
> > > + * @buffer: DRM client buffer
> > > + *
> > > + * This function locks the client buffer by acquiring the buffer
> > > + * object's reservation lock.
> > > + *
> > > + * Unlock the buffer with drm_client_buffer_unlock().
> > > + *
> > > + * Returns:
> > > + *	0 on success, or a negative errno code otherwise.
> > > + */
> > > +int
> > > +drm_client_buffer_lock(struct drm_client_buffer *buffer)
> > > +{
> > > +	return dma_resv_lock(buffer->gem->resv, NULL);
> > > +}
> > > +EXPORT_SYMBOL(drm_client_buffer_lock);
> > > +
> > > +/**
> > > + * drm_client_buffer_unlock - Unlock DRM client buffer
> > > + * @buffer: DRM client buffer
> > > + *
> > > + * Unlocks a client buffer. See drm_client_buffer_lock().
> > > + */
> > > +void drm_client_buffer_unlock(struct drm_client_buffer *buffer)
> > > +{
> > > +	dma_resv_unlock(buffer->gem->resv);
> > > +}
> > > +EXPORT_SYMBOL(drm_client_buffer_unlock);
> > > +
> > >   /**
> > >    * drm_client_buffer_vmap - Map DRM client buffer into address space
> > >    * @buffer: DRM client buffer
> > > @@ -348,6 +379,66 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
> > >   }
> > >   EXPORT_SYMBOL(drm_client_buffer_vunmap);
> > > +/**
> > > + * drm_client_buffer_vmap_local - Map DRM client buffer into address space
> > > + * @buffer: DRM client buffer
> > > + * @map_copy: Returns the mapped memory's address
> > > + *
> > > + * This function maps a client buffer into kernel address space. If the
> > > + * buffer is already mapped, it returns the existing mapping's address.
> > > + *
> > > + * Client buffer mappings are not ref'counted. Each call to
> > > + * drm_client_buffer_vmap_local() should be followed by a call to
> > > + * drm_client_buffer_vunmap_local(); or the client buffer should be mapped
> > > + * throughout its lifetime.
> > > + *
> > > + * The returned address is a copy of the internal value. In contrast to
> > > + * other vmap interfaces, you don't need it for the client's vunmap
> > > + * function. So you can modify it at will during blit and draw operations.
> > > + *
> > > + * Returns:
> > > + *	0 on success, or a negative errno code otherwise.
> > > + */
> > > +int
> > > +drm_client_buffer_vmap_local(struct drm_client_buffer *buffer, struct dma_buf_map *map_copy)
> > > +{
> > > +	struct dma_buf_map *map = &buffer->map;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * FIXME: The dependency on GEM here isn't required, we could
> > > +	 * convert the driver handle to a dma-buf instead and use the
> > > +	 * backend-agnostic dma-buf vmap_local support instead. This would
> > > +	 * require that the handle2fd prime ioctl is reworked to pull the
> > > +	 * fd_install step out of the driver backend hooks, to make that
> > > +	 * final step optional for internal users.
> > > +	 */
> > > +	ret = drm_gem_vmap_local(buffer->gem, map);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*map_copy = *map;
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_client_buffer_vmap_local);
> > > +
> > > +/**
> > > + * drm_client_buffer_vunmap_local - Unmap DRM client buffer
> > > + * @buffer: DRM client buffer
> > > + *
> > > + * This function removes a client buffer's memory mapping. Calling this
> > > + * function is only required by clients that manage their buffer mappings
> > > + * by themselves.
> > > + */
> > > +void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
> > > +{
> > > +	struct dma_buf_map *map = &buffer->map;
> > > +
> > > +	drm_gem_vunmap_local(buffer->gem, map);
> > > +}
> > > +EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
> > > +
> > >   static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
> > >   {
> > >   	int ret;
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index e82db0f4e771..a56a7d9f7e35 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -399,28 +399,34 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
> > >   	int ret;
> > >   	/*
> > > -	 * We have to pin the client buffer to its current location while
> > > -	 * flushing the shadow buffer. In the general case, concurrent
> > > -	 * modesetting operations could try to move the buffer and would
> > > -	 * fail. The modeset has to be serialized by acquiring the reservation
> > > -	 * object of the underlying BO here.
> > > -	 *
> > >   	 * For fbdev emulation, we only have to protect against fbdev modeset
> > >   	 * operations. Nothing else will involve the client buffer's BO. So it
> > >   	 * is sufficient to acquire struct drm_fb_helper.lock here.
> > >   	 */
> > >   	mutex_lock(&fb_helper->lock);
> > > -	ret = drm_client_buffer_vmap(buffer, &map);
> > > +	/*
> > > +	 * We have to keep the client buffer at its current location while
> > > +	 * flushing the shadow buffer. Concurrent operations could otherwise
> > > +	 * try to move the buffer. Therefore acquiring the reservation
> > > +	 * object of the underlying BO here.
> > > +	 */
> > > +	ret = drm_client_buffer_lock(buffer);
> > > +	if (ret)
> > > +		goto out_mutex_unlock;
> > > +
> > > +	ret = drm_client_buffer_vmap_local(buffer, &map);
> > >   	if (ret)
> > > -		goto out;
> > > +		goto out_drm_client_buffer_unlock;
> > >   	dst = map;
> > >   	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
> > > -	drm_client_buffer_vunmap(buffer);
> > > +	drm_client_buffer_vunmap_local(buffer);
> > > -out:
> > > +out_drm_client_buffer_unlock:
> > > +	drm_client_buffer_unlock(buffer);
> > > +out_mutex_unlock:
> > >   	mutex_unlock(&fb_helper->lock);
> > >   	return ret;
> > > @@ -946,15 +952,11 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
> > >   	drm_modeset_lock_all(fb_helper->dev);
> > >   	drm_client_for_each_modeset(modeset, &fb_helper->client) {
> > >   		crtc = modeset->crtc;
> > > -		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> > > -			ret = -EINVAL;
> > > -			goto out;
> > > -		}
> > > +		if (!crtc->funcs->gamma_set || !crtc->gamma_size)
> > > +			return -EINVAL;
> > > -		if (cmap->start + cmap->len > crtc->gamma_size) {
> > > -			ret = -EINVAL;
> > > -			goto out;
> > > -		}
> > > +		if (cmap->start + cmap->len > crtc->gamma_size)
> > > +			return -EINVAL;
> > >   		r = crtc->gamma_store;
> > >   		g = r + crtc->gamma_size;
> > > @@ -967,9 +969,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
> > >   		ret = crtc->funcs->gamma_set(crtc, r, g, b,
> > >   					     crtc->gamma_size, NULL);
> > >   		if (ret)
> > > -			goto out;
> > > +			return ret;
> > >   	}
> > > -out:
> > >   	drm_modeset_unlock_all(fb_helper->dev);
> > >   	return ret;
> > > diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> > > index f07f2fb02e75..df61e339a11c 100644
> > > --- a/include/drm/drm_client.h
> > > +++ b/include/drm/drm_client.h
> > > @@ -156,8 +156,12 @@ struct drm_client_buffer *
> > >   drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
> > >   void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> > >   int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
> > > +int drm_client_buffer_lock(struct drm_client_buffer *buffer);
> > > +void drm_client_buffer_unlock(struct drm_client_buffer *buffer);
> > >   int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map);
> > >   void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
> > > +int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer, struct dma_buf_map *map);
> > > +void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
> > >   int drm_client_modeset_create(struct drm_client_dev *client);
> > >   void drm_client_modeset_free(struct drm_client_dev *client);
> > > -- 
> > > 2.29.2
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
