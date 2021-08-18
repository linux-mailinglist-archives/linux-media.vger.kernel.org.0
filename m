Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B333F015A
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 12:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhHRKLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 06:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbhHRKLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 06:11:45 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A68AC061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:11:10 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n12so2277631edx.8
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=H6PUEJyT8yWFOs/eHUeXPFvL6SwbW/T0LWe0T2e8WmE=;
        b=GKjpI8oonPri08s2r40yIS07xBV5kd2Qcb0M+wEuCc48wKNdDQIcz1gsIg0w4AFPZH
         fTpmm7yg9dJmucZ4YwxqzV+MpHC7nNcfaQkUUDSl0ws5L1i10t9UlUGKJQLYp2Mrjnr1
         vXTDxTOZGh7Zh9xS2H8s1TXo6uM0qU+/eBKhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=H6PUEJyT8yWFOs/eHUeXPFvL6SwbW/T0LWe0T2e8WmE=;
        b=OeqPmFgkDMEee25d+QgFbv0NDMjAQbq5r+ZPZX+T8A2qTOlB+o0lE22ZGw8KuyqmKN
         J/0VoxzUTjCFy/gHyx9O2FHqievS828GGD3/J7L6CYsVwK9HnuXpYi+l16+BGhnehD11
         sjTOPBwlEw9ZLusMZw31I12MbjOnHsMNGdYQVCJ0ohycA4D9li4F7kfFWloyI+l1ZDCP
         NY3xPIZE6EefPYHG22DpUXgv3LhFlaPaSDQV5X0YvY1cd/Dc0X/stC/T/HFaPLlpD9qt
         7I6NcK/dN4pUFUF7WmPNzqmojjwWpaQsaWF+6LEOsbi/R6i6Wtv0sJ+8jN6ssPZojK/a
         3qZw==
X-Gm-Message-State: AOAM533GHHM3w/xCIGrRaY7yd7JcwxDC69xUl32vP3cNE3gIUOBaqQ93
        0B35g/GckJOiI5jEZxDEDhZskQ==
X-Google-Smtp-Source: ABdhPJxpWiWQ18UJm+hCSjJLPLxbcWNd9HkyUYKyAPssMAGCuTk1/N1o8a5V6hH6cJCPXAjYQUffNg==
X-Received: by 2002:a05:6402:b88:: with SMTP id cf8mr9311655edb.281.1629281469070;
        Wed, 18 Aug 2021 03:11:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j22sm1805495ejt.11.2021.08.18.03.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 03:11:08 -0700 (PDT)
Date:   Wed, 18 Aug 2021 12:11:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 4/9] drm: fix potential null ptr dereferences in
 drm_{auth,ioctl}
Message-ID: <YRzcuiQrLFsWowas@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
        tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-5-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-5-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 03:38:19PM +0800, Desmond Cheong Zhi Xi wrote:
> There are three areas where we dereference struct drm_master without
> checking if the pointer is non-NULL.
> 
> 1. drm_getmagic is called from the ioctl_handler. Since
> DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
> any check that drm_file.master has been set.
> 
> 2. Similarly, drm_getunique is called from the ioctl_handler, but
> DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
> drm_file.master has been set.

I think the above two are impossible, due to the refcounting rules for
struct file.

> 3. drm_master_release can also be called without having a
> drm_file.master set. Here is one error path:
>   drm_open():
>     drm_open_helper():
>       drm_master_open():
>         drm_new_set_master(); <--- returns -ENOMEM,
>                                    drm_file.master not set
>       drm_file_free():
>         drm_master_release(); <--- NULL ptr dereference
>                                    (file_priv->master->magic_map)
> 
> Fix these by checking if the master pointers are NULL before use.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
>  drivers/gpu/drm/drm_ioctl.c |  5 +++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f9267b21556e..b7230604496b 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
>  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  {
>  	struct drm_auth *auth = data;
> +	struct drm_master *master;
>  	int ret = 0;
>  
>  	mutex_lock(&dev->master_mutex);
> +	master = file_priv->master;
> +	if (!master) {
> +		mutex_unlock(&dev->master_mutex);
> +		return -EINVAL;
> +	}
> +
>  	if (!file_priv->magic) {
> -		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
> +		ret = idr_alloc(&master->magic_map, file_priv,
>  				1, 0, GFP_KERNEL);
>  		if (ret >= 0)
>  			file_priv->magic = ret;
> @@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
>  
>  	mutex_lock(&dev->master_mutex);
>  	master = file_priv->master;
> +
> +	if (!master)
> +		goto unlock;

This is a bit convoluted, since we're in the single-threaded release path
we don't need any locking for file_priv related things. Therefore we can
pull the master check out and just directly return.

But since it's a bit surprising maybe a comment that this can happen when
drm_master_open in drm_open_helper fails?

Another option, and maybe cleaner, would be to move the drm_master_release
from drm_file_free into drm_close_helper. That would be fully symmetrical
and should also fix the bug here?
-Daniel


> +
>  	if (file_priv->magic)
> -		idr_remove(&file_priv->master->magic_map, file_priv->magic);
> +		idr_remove(&master->magic_map, file_priv->magic);
>  
>  	if (!drm_is_current_master_locked(file_priv))
>  		goto out;
> @@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
>  		drm_master_put(&file_priv->master);
>  		spin_unlock(&dev->master_lookup_lock);
>  	}
> +unlock:
>  	mutex_unlock(&dev->master_mutex);
>  }
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 26f3a9ede8fe..4d029d3061d9 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
>  
>  	mutex_lock(&dev->master_mutex);
>  	master = file_priv->master;
> +	if (!master) {
> +		mutex_unlock(&dev->master_mutex);
> +		return -EINVAL;
> +	}
> +
>  	if (u->unique_len >= master->unique_len) {
>  		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
>  			mutex_unlock(&dev->master_mutex);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
