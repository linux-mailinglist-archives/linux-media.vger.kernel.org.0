Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E8E2D73C0
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 11:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgLKKQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 05:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405096AbgLKKP2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 05:15:28 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7903EC0613CF
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 02:14:48 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 3so8027307wmg.4
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tFibnX3/+2uQLJigmsH9b8s5hxcI5Nnzsyfczlow2uY=;
        b=dGhq32YMkTjWI/ie2Hq+RdFI2qUl+7/r+2hNI1hmc7rqmjb1bUxt3I38/+V1gaz4Bi
         tpO9bNBaMSzFzrAzfieUISFFy1nzZP5xUTiHgEVpnG8Edk2NmeOVM06D8pAO9yjnKpZu
         f+AcH6sPBkStWxgnvgOfJo3dI+Mu2HsWk3EYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tFibnX3/+2uQLJigmsH9b8s5hxcI5Nnzsyfczlow2uY=;
        b=F2emM0+FD2dQmBAx8x8vtgx6Xv9D7++5RavE0+vcaDEC/VDrMlkQMVyx5iy2F/iNa9
         E+hD1wcZG+0YEXQQrFJExqs0MAUfSE070ElhTkt1tR46YhPw+YgxVrEhbEfOk6JOeKFG
         9fEMJCjDnM3oaqs4PPU4Ml024F+orKB7YCLTz+lwmmpKizDHj6s1nzyEuwXIt48LlSKM
         y5EYO6RffgvBjfRfL7DqpgPgqHuzK6nVUqyDbQaWgBGpgTIsbEqZfw9h+E0LlvOCwdo6
         uXL8DsASPeu6TX+FtVldQ/feipLn5c2fBgm9oFhB50SNpUzGA77x32fodSxOlpOGrQj2
         C5ZA==
X-Gm-Message-State: AOAM533/g1yqx2HmpuXalq0pgt5Lg8mZu27g4Ysc4QqZdUuQD5rnouUj
        D09QtU4FdCq8fJH5FTkyttAO1w==
X-Google-Smtp-Source: ABdhPJyVgqHgjlCiunOK9t3N8S0FIge5kEeCAE3w010OLYNrBIfSd131FdYBTILVWy8GablsJBC0KA==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr12989334wmk.14.1607681687220;
        Fri, 11 Dec 2020 02:14:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y2sm13440927wma.6.2020.12.11.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 02:14:46 -0800 (PST)
Date:   Fri, 11 Dec 2020 11:14:44 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 1/8] drm/ast: Don't pin cursor source BO explicitly
 during update
Message-ID: <20201211101444.GP401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209142527.26415-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 09, 2020 at 03:25:20PM +0100, Thomas Zimmermann wrote:
> Vmapping the cursor source BO contains an implicit pin operation,
> so there's no need to do this manually.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ast/ast_cursor.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 742d43a7edf4..68bf3d33f1ed 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -180,12 +180,9 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  
>  	gbo = drm_gem_vram_of_gem(fb->obj[0]);
>  
> -	ret = drm_gem_vram_pin(gbo, 0);
> -	if (ret)
> -		return ret;
>  	ret = drm_gem_vram_vmap(gbo, &map);
>  	if (ret)
> -		goto err_drm_gem_vram_unpin;
> +		return ret;
>  	src = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
> @@ -194,13 +191,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
>  	update_cursor_image(dst, src, fb->width, fb->height);
>  
>  	drm_gem_vram_vunmap(gbo, &map);
> -	drm_gem_vram_unpin(gbo);
>  
>  	return 0;
> -
> -err_drm_gem_vram_unpin:
> -	drm_gem_vram_unpin(gbo);
> -	return ret;
>  }
>  
>  static void ast_cursor_set_base(struct ast_private *ast, u64 address)
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
