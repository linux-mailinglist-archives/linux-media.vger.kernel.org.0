Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FBC45DE20
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346976AbhKYQAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348870AbhKYP6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:58:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B95FC061399
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:47:27 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r8so12522157wra.7
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GrYTK8K69bBPxxO0M+FvuVC8uOT906Mq4gG8ozU4uk4=;
        b=d3wDvLB9aibDUksaMaJq0BzCsxenfX7o/qh4G09m6w3hGehD+WLtkdEKOfV/7xmM4p
         o1alxzNE3KLzxu4Ad0ohpwHVVU1k6iqQd5mAQ6qjNGXOdwNMEZBir978i8nB25cdn6JY
         n2oFt7seHvCaEi8DaO6BIa6O8e0mZYu8KAOKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GrYTK8K69bBPxxO0M+FvuVC8uOT906Mq4gG8ozU4uk4=;
        b=TCb2ikXwGZFQ1iH5wL4vlEt0IZrnt3Vygt2lptnR5RcqpO+Lo+u11uDmRkv3Dvqnq3
         hfCIZnNkW0/7hcKqIhYM+sTzA+xMJsilDHL2MpMWB2R1660umdd2FD9sncGE9k0gHkJi
         IGsPUzUD8ay8/30KvoZ6p7Ri/INb6Ux/xln8KhGvT+tm5tnVTD9qKpA+W6gAVfS9VsZO
         MGSaiHvkQd83fcTK4BC/VOGIsds3z2sZLjsM7266Vz68leWa+6ZJ6US3ihCo24hkueG7
         82DmVqAbY1VWz5CH9IqBMqzcNNrW0/9VxJskAXAVoaHJGxxgOAeHlqDw5XZORgOnixly
         gy8w==
X-Gm-Message-State: AOAM530KDwx2GLjXTDf4Y6iGv8opXhoq0JInfhWskXiYNCQqPp1t2Uv2
        Frx9K+op89D/pcLAU/mjgh5kWA==
X-Google-Smtp-Source: ABdhPJyJKxgo85AFU7bZqlQKZR/U22Xtoer9r53DLE3Pttwt+lXpKP86T5A0OTOsLHUXdHbcZKm8Dw==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr7272141wrt.327.1637855246069;
        Thu, 25 Nov 2021 07:47:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f18sm3113464wre.7.2021.11.25.07.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:47:25 -0800 (PST)
Date:   Thu, 25 Nov 2021 16:47:23 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, daniel@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 19/26] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Message-ID: <YZ+wCxjFSI4EAIvx@phenom.ffwll.local>
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-20-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123142111.3885-20-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 23, 2021 at 03:21:04PM +0100, Christian König wrote:
> Use dma_resv_get_singleton() here to eventually get more than one write
> fence as single fence.

Yeah this is nice, atomic commit helpers not supporting multiple write
fences was really my main worry in this entire endeavour. Otherwise looks
all rather reasonable.

I'll try to find some review bandwidth, but would be really if you can
volunteer others too (especially making sure ttm drivers set the KERNEL
fences correctly in all cases).
-Daniel


> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index c3189afe10cb..9338ddb7edff 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,25 +143,21 @@
>   */
>  int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> -	struct dma_resv_iter cursor;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
> +	int ret;
>  
>  	if (!state->fb)
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	dma_resv_iter_begin(&cursor, obj->resv, false);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		/* TODO: Currently there should be only one write fence, so this
> -		 * here works fine. But drm_atomic_set_fence_for_plane() should
> -		 * be changed to be able to handle more fences in general for
> -		 * multiple BOs per fb anyway. */
> -		dma_fence_get(fence);
> -		break;
> -	}
> -	dma_resv_iter_end(&cursor);
> +	ret = dma_resv_get_singleton(obj->resv, false, &fence);
> +	if (ret)
> +		return ret;
>  
> +	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
> +	 * to handle more fences in general for multiple BOs per fb.
> +	 */
>  	drm_atomic_set_fence_for_plane(state, fence);
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
