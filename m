Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908A5347540
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 11:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbhCXKCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 06:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbhCXKBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 06:01:49 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32956C061763
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 03:01:47 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id a132-20020a1c668a0000b029010f141fe7c2so832110wmc.0
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rx9Rrt/z2zFgoBGaEEFsYywvK+LMAW4MrtxKYsFOxi8=;
        b=jFre5dwClSH3ihB4O1rKSqw+4vWvAXTVpllJLmcWCS9AgfYt6KOglUjZBQIycdVaEt
         tBt1wuUwWXtozPuxBmfMZpgCLLrCgdwINZBRvlfwlPyocmCJ1DaaSzXk0p3miF6bLb7N
         aA0x6yhgA6Y7KfzxCpdm9tixP/U2cPfInnFfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Rx9Rrt/z2zFgoBGaEEFsYywvK+LMAW4MrtxKYsFOxi8=;
        b=cYDGmVJqISHUUPQJJLXTFsDTqHg9FalGbqQrvay26ARiTSkIwzsJm0lN4fczgR5Cn8
         AdTWB1PFru6p/v4g2WnD813FOX+UB8Khse+rg2voxyEr3f7Wazx6pW57+BJ1Na4wpyeZ
         qwgZFs2M7vuu+Oq3WULormHWflnDn4KfFA7ZtkqKmmgzaxWsh5X26GuLN3Lu+l2dsg4s
         hqdXyKYx1Q36Eg6YHVdkB+Z44oZebYlGQlIP03nm2qQ6LoXljskhDmatNMVsQaaXQegm
         Ry9B8KLOP3aPErRcO+r6S7bHQyPqMT6hnnoengjfXj/TCccsd8YA+8tSKcC+8QyJXllD
         mUmA==
X-Gm-Message-State: AOAM532Fim/fUNEgLlP/pw9ynmgLc61qSoUkplPc2+pSTkCJZ66Y1is/
        iu2ImRulAUkNr4ojCXjGz9qOiA==
X-Google-Smtp-Source: ABdhPJzZO9UI2vZj6xofrTq7y71eZw5LhOLy8ME2YPH+gQPzgAUK1BFVHzywoWotW3V4Wde3lxsOXQ==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr2074690wmh.153.1616580105822;
        Wed, 24 Mar 2021 03:01:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e13sm2443665wrg.72.2021.03.24.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 03:01:45 -0700 (PDT)
Date:   Wed, 24 Mar 2021 11:01:43 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Liam Howlett <liam.howlett@oracle.com>
Cc:     "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] i915_vma: Rename vma_lookup to i915_vma_lookup
Message-ID: <YFsOB5fWBJSxo03E@phenom.ffwll.local>
Mail-Followup-To: Liam Howlett <liam.howlett@oracle.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20210323134208.3077275-1-Liam.Howlett@Oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323134208.3077275-1-Liam.Howlett@Oracle.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 23, 2021 at 01:42:21PM +0000, Liam Howlett wrote:
> Use i915 prefix to avoid name collision with future vma_lookup() in mm.
> 
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Applied to i915-gem-next branch for 5.13. We have a bit a branch shuffling
going on right now so unusal path, it should show up in linux-next through
drm-next hopefully this week still.
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_vma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index caa9b041616b..ee0028c697f6 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -230,7 +230,7 @@ vma_create(struct drm_i915_gem_object *obj,
>  }
>  
>  static struct i915_vma *
> -vma_lookup(struct drm_i915_gem_object *obj,
> +i915_vma_lookup(struct drm_i915_gem_object *obj,
>  	   struct i915_address_space *vm,
>  	   const struct i915_ggtt_view *view)
>  {
> @@ -278,7 +278,7 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>  	GEM_BUG_ON(!atomic_read(&vm->open));
>  
>  	spin_lock(&obj->vma.lock);
> -	vma = vma_lookup(obj, vm, view);
> +	vma = i915_vma_lookup(obj, vm, view);
>  	spin_unlock(&obj->vma.lock);
>  
>  	/* vma_create() will resolve the race if another creates the vma */
> -- 
> 2.30.0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
