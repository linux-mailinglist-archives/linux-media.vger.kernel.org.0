Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F482F2B0C
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 10:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390441AbhALJRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 04:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389951AbhALJRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 04:17:54 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5910C061575
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 01:17:13 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r7so1658948wrc.5
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 01:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BkFPPAMUp2t1YrBY41qrS/Q9HpIRZgTIhFUpfiEfe3I=;
        b=cnwEUlV2QnvwNPkrS3zUaCdwjmeHQOssIIjMjbPTgCx7ymC6qa2UuAHdpQUkF7hMSu
         KSdMe9AaLfIe2eAvAxK6jNSO+4SAAKFPYG+xFYpsQ5xPpcXVnRpWpp5VWcxXOb2V4+62
         Rde1SXCDtujP5MblELcIKnpJEUx6jUPagkjrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BkFPPAMUp2t1YrBY41qrS/Q9HpIRZgTIhFUpfiEfe3I=;
        b=SZrKpjFvlQCYLWAhtERu+nVWsARq+JHKdRsyzRLmPu1RJgpmKyDP12E9NQ9zgTp1ev
         kHSsG+TRXX4AoeJLBHyD1iiLFzh7lTYqJn0BMfpEgGVUE/c3+6+2IVSZmTHvsiuOyGWC
         5g9JhYHK2W0Nl2F4tVC8h/V01CwKBXkfe6JxCnTbPycnrk6g1zPg3H7yZg96qVFrECdM
         /fSLC/bu94zUAfM7DT6iHwBO6gkmG5Lukvuiatge7qpeaGHIDVSOHfrHH8IaF4B0Ur9U
         B5xwf24MB/xWqFQnL9V1DSY0dnMSvDuf7nHjX1m1OkIGacEc+/0tr3kL67lMaGPv1It1
         8dwQ==
X-Gm-Message-State: AOAM5339hDm+evGDhkAgUb9RzHx//pbtp/S3Yx4ZRO2m/76OwlTcj02A
        YXLE9V0xiBwNTZbbhPwn7IaQyQ==
X-Google-Smtp-Source: ABdhPJx/V56gELooyGmDglikPZdA+XTA2xRFVdYCGu7EQxYoL6V/sTE/BkKNN5kG9dRt4iF6SIVi8g==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr3256036wrv.363.1610443032442;
        Tue, 12 Jan 2021 01:17:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l5sm3810117wrv.44.2021.01.12.01.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:17:11 -0800 (PST)
Date:   Tue, 12 Jan 2021 10:17:09 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        christian.koenig@amd.com, airlied@redhat.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 11/13] drm/vboxvideo: Use drm_gem_vram_vmap_local() in
 cursor update
Message-ID: <X/1pFaa9I7WFjtJW@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-12-tzimmermann@suse.de>
 <X/yFj9zIdW52UKk4@phenom.ffwll.local>
 <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a42dbfad-4280-eeea-5915-71061f732a4a@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 08:54:02AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.01.21 um 18:06 schrieb Daniel Vetter:
> > On Fri, Jan 08, 2021 at 10:43:38AM +0100, Thomas Zimmermann wrote:
> > > Cursor updates in vboxvideo require a short-term mapping of the
> > > source BO. Use drm_gem_vram_vmap_local() and avoid the pinning
> > > operations.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > All these drivers patches break the dma_resv_lock vs
> > dma_fence_begin/end_signalling nesting rules, so this doesn't work.
> > 
> > Generally this is what the prepare/cleanup_fb hooks are for, that's where
> > mappings (including vmaps) are meant to be set up, permanently.
> > 
> > I'm kinda not clear on why we need all these changes, I thought the
> > locking problem is just in the fb helper paths, because it's outside of
> > the atomic path and could conflict with an atomic update at the same time?
> > So only that one should get the vmap_local treatment, everything else
> > should keep the normal vmap treatment.
> 
> Kind of responding to all your comment on the driver changes:
> 
> These drivers only require short-term mappings, so using vmap_local would be
> the natural choice. For SHMEM helpers, it's mostly a cosmetic thing. For
> VRAM helpers, I was hoping to remove the vmap/vunmap helpers entirely. One
> cannot really map the BOs for the long-term, so not having the helpers at
> all would make sense.
> 
> But reading all your comments on the driver patches, I'd rather not update
> the drivers here but later convert them to use prepare_fb/cleanup_fb in the
> correct way.

Ack from me on this plan. I think I got all the other patches with an r-b
or ack?
-Daniel

> 
> Best regards
> Thomas
> 
> > -Daniel
> > > ---
> > >   drivers/gpu/drm/vboxvideo/vbox_mode.c | 15 +++++++++------
> > >   1 file changed, 9 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > index dbc0dd53c69e..215b37c78c10 100644
> > > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > > @@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
> > >   		container_of(plane->dev, struct vbox_private, ddev);
> > >   	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
> > >   	struct drm_framebuffer *fb = plane->state->fb;
> > > -	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
> > > +	struct drm_gem_object *obj = fb->obj[0];
> > > +	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
> > >   	u32 width = plane->state->crtc_w;
> > >   	u32 height = plane->state->crtc_h;
> > >   	size_t data_size, mask_size;
> > > @@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
> > >   	vbox_crtc->cursor_enabled = true;
> > > -	ret = drm_gem_vram_vmap(gbo, &map);
> > > +	ret = dma_resv_lock(obj->resv, NULL);
> > > +	if (ret)
> > > +		return;
> > > +	ret = drm_gem_vram_vmap_local(gbo, &map);
> > >   	if (ret) {
> > > -		/*
> > > -		 * BUG: we should have pinned the BO in prepare_fb().
> > > -		 */
> > > +		dma_resv_unlock(obj->resv);
> > >   		mutex_unlock(&vbox->hw_mutex);
> > >   		DRM_WARN("Could not map cursor bo, skipping update\n");
> > >   		return;
> > > @@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
> > >   	data_size = width * height * 4 + mask_size;
> > >   	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> > > -	drm_gem_vram_vunmap(gbo, &map);
> > > +	drm_gem_vram_vunmap_local(gbo, &map);
> > > +	dma_resv_unlock(obj->resv);
> > >   	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
> > >   		VBOX_MOUSE_POINTER_ALPHA;
> > > -- 
> > > 2.29.2
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
