Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9530139188B
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 15:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbhEZNLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 09:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhEZNLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 09:11:52 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDBBC061756
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 06:10:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id c20so2382472ejm.3
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AUsJLuID9e1pol3RiOS0EQTXGuh7p/LFKL5pMET/qdM=;
        b=k8NO22C2JVeN3oYYB8/wYFehRe8VyAND1XHAGRWMTU5Mn52IfMEUo4TKhcziTjSiol
         ajMle9cmfQkn5UtI0zuJQKEg7T0BR53wh8MTYQevUGRY0oLgw8tgB9THtAkw/d71ByPA
         k5CQUTjOSd0eCD/aUy0PznHO9215g4bfZeixU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=AUsJLuID9e1pol3RiOS0EQTXGuh7p/LFKL5pMET/qdM=;
        b=tJ9a4pW8XC2tvyiJkUgsGuV45lp6fYkk1sGJMdS63/rabpVnWMMRX1RVOhD/g5laLp
         t43Xr9RcF7lMAIYIOw0QJSf3yXatTs8kS2cXLhHhMTbFOuw7vygo++Gov56yrUHSOB3D
         wd7VVgr3iQMkQHq7Sxd+GAxEuIElqz3NQNsEJA5Asfko1yxNh4jufCV+Iby2Gh6aEH6z
         OSu/zN1CYBJpEykJ9iD8sSUKpSvXdtc0YPsF2dH/3mYtjSVTaV/8J/nhTE9jxc+NwO5i
         58zQUireaLRKZviuqCtvteeIvUHm5me0FQxaOBR+LGotxOe65wXyzgy9l7tot/tcsNqz
         pD0w==
X-Gm-Message-State: AOAM531hHsBVE3/uO9GaLIDtjMnS0eqX7zXaZkBx4cKjvgWDqJHOOLnS
        R6LwLZQD1fhUffIa1aBKD9twYA==
X-Google-Smtp-Source: ABdhPJwmdkY+oqxRRVXVQLIVhW6ISfuuutzmkODEclidb9s6n/KAGKJYcmP63SeNqDK4yFSFc1wLbQ==
X-Received: by 2002:a17:907:9612:: with SMTP id gb18mr7857293ejc.408.1622034618327;
        Wed, 26 May 2021 06:10:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j17sm484768ejb.123.2021.05.26.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:10:17 -0700 (PDT)
Date:   Wed, 26 May 2021 15:10:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Adam Jackson <ajax@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 30/34] drm/vgem/vgem_drv: Standard comment blocks should
 not use kernel-doc format
Message-ID: <YK5IuNcHtPySAfoz@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Adam Jackson <ajax@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-31-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526084726.552052-31-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 26, 2021 at 09:47:22AM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/vgem/vgem_drv.c:47: warning: expecting prototype for This is vgem, a (non-hardware(). Prototype was for DRIVER_NAME() instead
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Ben Widawsky <ben@bwidawsk.net>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Merged this one to drm-misc-next, thanks!
-Daniel
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index a0e75f1d5d016..bf38a7e319d14 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -25,7 +25,7 @@
>   *	Ben Widawsky <ben@bwidawsk.net>
>   */
>  
> -/**
> +/*
>   * This is vgem, a (non-hardware-backed) GEM service.  This is used by Mesa's
>   * software renderer and the X server for efficient buffer sharing.
>   */
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
