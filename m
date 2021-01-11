Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC262F1BB0
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732008AbhAKRB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:01:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730357AbhAKRB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:01:27 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64B9C061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:00:46 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id r4so534657wmh.5
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2g3cL0wvqzFtjOXKvL27N3/6q4I3I6VjBCf04+f3nDE=;
        b=YSeFsVkQUGuMr6ClwjwgyiCvAMpCC8zdnAEfvKUnXOz1m8X1YoR8E6Ep7qChYjNulz
         wDn2DK37HTP8OCjHIFqqy7aqBu4NZnEbFccLp70XXGNqgl4xfWvDq8Tgdu68wSZ6bf6B
         1YvgKovLReX1CPlXQkswsENSMsfBD/xsMmOEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2g3cL0wvqzFtjOXKvL27N3/6q4I3I6VjBCf04+f3nDE=;
        b=YozitJ2GxSLawNpWEo0pLPp/ZMe2ayPeGyHnaNanajD6ELzv/dev5XDZBIHSkabBrL
         CjRIHpQ45NJ5X7sYxuHMtJWLM1uAE/XHTd+x+iV8MPFnDTOeFWG55ObVBSbtaucVy/Fw
         VG55vzOZeFABGI3rfPKj09hXYqxDq7/3f0ILK9uxx01Z5QUKiNYBnC6ZSRUNoNdaLNTF
         b8Hyyxf5rcPSVEpa6/3VEF9dhNSjSVN3OvzpbXL7ZeUHT0A3wXw4oOKpec9yEQS1d1of
         UeN3eZd7Ei2Q9kWDNGWCyGU2O22W8by+xOX/COpTxct9m0CdpkNFWyDHrA1pP6Bs6IS5
         nXZQ==
X-Gm-Message-State: AOAM531dsCaMEGAtxAQupbfCqdceqjDq7HWqN+W38i3Czxy9MD9pwxSb
        OdFjVy9l1wUETz39+tQzUbF2PQ==
X-Google-Smtp-Source: ABdhPJyG0LrXbaUIyyZRlVK36Q2xpcxqNl5BuI6ZeTG2aGDwDFmf1Yi6zoWIMIlGAfmk+GjScniy3Q==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr590675wma.22.1610384445461;
        Mon, 11 Jan 2021 09:00:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z13sm432713wmz.3.2021.01.11.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:00:44 -0800 (PST)
Date:   Mon, 11 Jan 2021 18:00:42 +0100
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
Message-ID: <X/yEOiDNYmRo+17/@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-7-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 08, 2021 at 10:43:33AM +0100, Thomas Zimmermann wrote:
> Damage handling in cirrus requires a short-term mapping of the source
> BO. Use drm_gem_shmem_vmap_local().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm more possible errors that we don't report to userspace ... Why don't we
vmap/vunmap these in prepare/cleanup_fb? Generally we'd want a long-term
vmap here to make sure this all works nicely.

Since it's nothing new, on this patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tiny/cirrus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index a043e602199e..21cd7056d45f 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  			       struct drm_rect *rect)
>  {
>  	struct cirrus_device *cirrus = to_cirrus(fb->dev);
> +	struct drm_gem_object *obj = fb->obj[0];
>  	struct dma_buf_map map;
>  	void *vmap;
>  	int idx, ret;
> @@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	if (!drm_dev_enter(&cirrus->dev, &idx))
>  		goto out;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = dma_resv_lock(obj->resv, NULL);
>  	if (ret)
>  		goto out_dev_exit;
> +	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
> +	if (ret)
> +		goto out_dma_resv_unlock;
>  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	if (cirrus->cpp == fb->format->cpp[0])
> @@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	else
>  		WARN_ON_ONCE("cpp mismatch");
>  
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
>  	ret = 0;
>  
> +	drm_gem_shmem_vunmap_local(obj, &map);
> +out_dma_resv_unlock:
> +	dma_resv_unlock(obj->resv);
>  out_dev_exit:
>  	drm_dev_exit(idx);
>  out:
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
