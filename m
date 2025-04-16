Return-Path: <linux-media+bounces-30318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF33A8B599
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 11:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE24444D93
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 09:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EB12356A8;
	Wed, 16 Apr 2025 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jpsyb8gL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055CE20E6E4
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796289; cv=none; b=EXcSWxsP3SFQjpREgbMpopmLgUxEoRJH+75+FJwg8brOBP49iwUXJBzkvszgI8+E6+Nr3wPb3BG/Mx0hMIUHc6u+6DT3+uDtJ9JCAn13CRujLJeGAI+7/VdpDd1xFy9WAmdKth5uAlfmPKju5TSfPGwpuIsRm+yzDyzrtlFxNjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796289; c=relaxed/simple;
	bh=82oRP6Cvb1EnmR5a7w3bTcWMkcdBLpSjKborD7zK7U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egG94OxaxqCIgxnhG7BjIkbq6C0tKf9TVDuXhkl28jtny4n0iNGpRprJnPyAQCvdUmDI6cbYvVw1YFm+EfD5mlliOrjRa3Wowzmt3Wu/6RxDjZY8z4jGtapgR4Jn/Z8utdgL/A6W0e12zOZ+0KWl4Ne063ypcdEJoUUIaVwDGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=jpsyb8gL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so67580015e9.1
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1744796286; x=1745401086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bKiuW7fqLtKMzNZwknZ1q0ktAhIGPRJdFPZfswrIKzU=;
        b=jpsyb8gL1qpSKt3+ytcjzd4yf/AzD5kLTZ440F0tDQa/zDze4StviK31lm2Gvtxtjx
         Nv6NH/S03Dko+LxCwTY7VW3Zyg60POqyckuqywyHZtpGq5VWn3CuBqKyVKHTLNMy58nx
         5bDnfRy85QTF2o/onaKAzs86cyNK9QwDvhmnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796286; x=1745401086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKiuW7fqLtKMzNZwknZ1q0ktAhIGPRJdFPZfswrIKzU=;
        b=D/VVVyfUr5di4+ZBubeaVnRKRVhuPeG/UAzAmd4U65sHjSg4fsTM9xE+PYaTRI1Whk
         n7TUaFQLFX8wMYbQzFnZFnxguq+fB1650XcaW99j5Fc/mq6tBUF8U6u4Dz5hxwdx35iw
         +ss5Smma/xwE8714ICpGNg5HPgmGrMcVLcj6R8aSjfCCIEnp/L8sDxA63XP2OCAJwIZY
         BE+zw+r5z9auLHvcLkE2L7cOHqGED4QqKN7EXbkhk2qR0O+bmHlIE25RCxbIXtaq7WeD
         kvhyCaTsJRa+YZ8FydQTPnRPWkWVYV+HdrGZAt0wm8A2YiTn6wg4vGZIBOx/K3Hf9zCf
         VlDw==
X-Forwarded-Encrypted: i=1; AJvYcCVtessLJg9tSVTI3zDfAtn/zWB1saHrV/YRKqd4bvAnFll4tB8BC5IBobeIi8j9SkL5frZHlSdL6hiY2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvjVJchDO8XOOXLvKgTNn+1+ai+55ZjO5sLgbC6fAOScU8P0An
	z9hYgYWHKyn+dekDfn6c5EMDvRRe2Chl6EWVAYuhxTmjphyldac10b5JB7JWG2U=
X-Gm-Gg: ASbGncvxWh7Xf5Snna/HZVkIwnwGPjaDWyoV1IZBvRCQVeQWdrHNGnp9EYyScWNo44U
	WM1ztC4QeWHA4fkbjfhQdjZX2/yjQfnXUaPwEyHgQqngudF7hVrFNVBHSU81k6a1AIg7ZhzP7tS
	owf73RP9guIFb/irb/EnglLIEvOAHfeFJ42lZeaIKFwc0b2AxiQ+r8m345wVmWG/JA7cVm4AnLt
	hlGSl0PovRbLOYRwUNWM0J5/1DJcCxgi9RnNxv1iZvkc36sLr7nxC7doKyNmCpCNzjTwDrh2JJX
	Ros4cJDcViBb4/2ws8s78fnlbxKe1fUIWvfD2WJVnINSJX9vHtQ1
X-Google-Smtp-Source: AGHT+IGT29vjOpDw3vMAwVsrePPX+jcDC9ydgKM0NqiYaNb30P8su4lbmICy/WocBWwpqAePRHM6Wg==
X-Received: by 2002:a05:600c:1912:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-4405d6ab5f5mr10180325e9.26.1744796286017;
        Wed, 16 Apr 2025 02:38:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f25bbsm15824925e9.17.2025.04.16.02.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:38:05 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:38:03 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
	andyshrk@163.com, christian.koenig@amd.com,
	boris.brezillon@collabora.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
References: <20250416065820.26076-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416065820.26076-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.17-amd64 

On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote:
> Test struct drm_gem_object.import_attach to detect imported objects.
> 
> During object clenanup, the dma_buf field might be NULL. Testing it in
> an object's free callback then incorrectly does a cleanup as for native
> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
> 
> v3:
> - only test for import_attach (Boris)
> v2:
> - use import_attach.dmabuf instead of dma_buf (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> Reported-by: Andy Yan <andyshrk@163.com>
> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> Tested-by: Andy Yan <andyshrk@163.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/drm/drm_gem.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8..a3133a08267c 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -588,8 +588,7 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>   */
>  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  {
> -	/* The dma-buf's priv field points to the original GEM object. */
> -	return obj->dma_buf && (obj->dma_buf->priv != obj);
> +	return !!obj->import_attach;
>  }
>  
>  #ifdef CONFIG_LOCKDEP
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

