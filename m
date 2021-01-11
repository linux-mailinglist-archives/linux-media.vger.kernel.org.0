Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBED22F1BB2
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732849AbhAKRBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbhAKRBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:01:48 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12879C061786
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:01:08 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id v14so441830wml.1
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 09:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h0Vcdr3u2Wixid8zktcI7cI+5TKj52I2FHlTJKRSBHc=;
        b=kIa/HvmC5VFVR+bpiDN8EWfF1Ft5f8oGplJEb1RRZB5iSBFjlp6S+gufUJW/+0Sg9p
         gEk7J80sOTVLe9dP0l7xmrvNCNZZtUvOKJ1YtJ+zgKhzTyL2EnZ/Q/8XISk0mNO4J2IQ
         CU/YWPaRXAbEo28w2H72Bj4Ao5TZKb+EhUuvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h0Vcdr3u2Wixid8zktcI7cI+5TKj52I2FHlTJKRSBHc=;
        b=o3ugwwY00LdC6WSuMmUO+OkWanq+KEYraDuhPkJc2HBYdlnO/w1rK5lJGoHA9hxpe0
         G4wU34yeYg13owlmQ34aWzaoNKv+bM8KPdDW4e5xHQO9syMbEFQlt9uU3VGTHaVfM3FO
         qH1roWlBFewMpTkC9eY5x3T7bFEq6ghVSTy8QVR02J7uiu6eQVqHk0hzaMt/C4jJLJZi
         MGGG9u5RssuU8bYnYIQj43ZwGI2dBfePzo8DIgwI4/Gw+cjQj90M3Kc5kfl1wWdgVE1x
         cOoUup21kGoW/bBseiRlO+GmCCNi3iWF8bdcxBl5oOVcuEBWzqyPS/vgjhg2Y16mkntp
         7OSA==
X-Gm-Message-State: AOAM533ZqP1Kk1VjvzbMsBX00dLlgCNIuHcwwGOi+fAIbirpZFg5UQzV
        SKX2i62WiaIz0GUrgl+IwI68MR77yioU0S1i
X-Google-Smtp-Source: ABdhPJwL/K8/fonepgQIrr8Jh7d27AlEEHxuAM3nq6S2KLm42gWIC6KhBdKdioyLbnmUAZH47MqlaQ==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr577402wmj.88.1610384466811;
        Mon, 11 Jan 2021 09:01:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b12sm431296wmj.2.2021.01.11.09.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:01:06 -0800 (PST)
Date:   Mon, 11 Jan 2021 18:01:04 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run,
        eric@anholt.net, sam@ravnborg.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 07/13] drm/gm12u320: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yEUPX+H66Q129T@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 08, 2021 at 10:43:34AM +0100, Thomas Zimmermann wrote:
> Damage handling in gm12u320 requires a short-term mapping of the source
> BO. Use drm_gem_shmem_vmap_local().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 33f65f4626e5..b0c6e350f2b3 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -265,11 +265,16 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  	y1 = gm12u320->fb_update.rect.y1;
>  	y2 = gm12u320->fb_update.rect.y2;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = dma_resv_lock(fb->obj[0]->resv, NULL);
>  	if (ret) {
> -		GM12U320_ERR("failed to vmap fb: %d\n", ret);
> +		GM12U320_ERR("failed to reserve fb: %d\n", ret);
>  		goto put_fb;
>  	}
> +	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
> +	if (ret) {
> +		GM12U320_ERR("failed to vmap fb: %d\n", ret);
> +		goto unlock_resv;
> +	}
>  	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	if (fb->obj[0]->import_attach) {
> @@ -321,8 +326,11 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  		if (ret)
>  			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
>  	}
> +
> +unlock_resv:
> +	dma_resv_unlock(fb->obj[0]->resv);

Unlock before vunmap.
-Daniel

>  vunmap:
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> +	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
>  put_fb:
>  	drm_framebuffer_put(fb);
>  	gm12u320->fb_update.fb = NULL;
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
