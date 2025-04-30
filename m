Return-Path: <linux-media+bounces-31397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B14AA4663
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A326C163CF2
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A11621B182;
	Wed, 30 Apr 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hq7FSr8E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71101158DAC
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004044; cv=none; b=dsnQBnKzNTBzjuclHpoDlawyYcsap6Jg7nMLRtD+I6JsubsAE+iI4MqGwdtxx7YFZq2O7BMQ4578JSY/FuP/igFJxQOupQ4WbooucgKf4BIzYpKnYvMfoW8WjqIK5/KsX1yu+mwpDwiYgB1nvVCwg3+/e7EqhT9InfLrgXTnJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004044; c=relaxed/simple;
	bh=ADIGeyIn0AXN6Efao813jQKjmokUDmY/Tvwfo5zhrM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTs+gI9JCS68O/bxxQwQCdmo7sGVAW5mcgp5hd072dj2rKeyy2+6hfo+qixE8tmZe3+WbpgVIlBrLUbn4t0W2wHZVSMVKQjPvNGK6jo5QpQf5XZc+hEFyrdOLWZXceHS7uiODD/9m44x8CfoyRv/TbZOVov1rZEtHDJt1jlJXd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Hq7FSr8E; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acbb85ce788so1372534866b.3
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1746004041; x=1746608841; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QWzeqHvzoIOvidos86deilx7bNZ58NmjU0Ulih/C+JI=;
        b=Hq7FSr8Egf1+c8pKqlWtfgkfimkuHO/ZZdBOpG5h/FgnY2keii9eXoF4Igp+ah+Gvk
         W4UEHOTNnoz7QxwDLJKiZxr/0LZEKdGwxdOCE1yxOiAjy9s3B497a+/I5NETHxMY2MnU
         yBRlXWIb1fbrXxOce6oCnvaiV+6N0MRH2lP94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004041; x=1746608841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWzeqHvzoIOvidos86deilx7bNZ58NmjU0Ulih/C+JI=;
        b=oQAB++LICwzgWW0F/xETIojLDnfIe5/BNDUTfLcG2lXtgMnz5hiHr12/lT3Vg157zt
         2H41tZTkfLPzclOpaVUKrvVEOHbIy7wW/mYsoMqPtbnkSNMFry4t6/uJlGy2F5SREmgO
         mLtXJjaMNjJorCiNiksKOW6NNWw6XEzkr3sItm1OrQZnfeErKLvkki9Mlc92H+IRsdgK
         LGgIPQdfoMzp7eK6sURpsen8GA4HmGGTX0Bhj6HxyWZpEyDV/6VoxP6AyKX56PQiOGYS
         thB9OkNROwMnBstjEl5alMoG0RUVQmBzZSbYa2ZLM4NsIrqtOPVa2K8cNboxq/tPlInv
         QUFw==
X-Forwarded-Encrypted: i=1; AJvYcCULWUvfpvoPQNNQJrP3lgCNqRFZket6l4mr1o5uHtRHU1jrJudrXLU96YYXuIieYCHMmwdvOMt5Pwo/yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fV0L1qta/TmHLQI3dnZ8f0Ur/5SB1+xTdMbBvicbHeNwvfzv
	wSXxnK8lixWCv/PgpChQefsCsNJ+l8J234tzvNzrzG4OGkH5dP+ENdyyld+f9UY=
X-Gm-Gg: ASbGnctBgv4vve/iQrchc9VSUvjNJxOlSmq6MzrQjUZnJ+AtlicdMpsDNaaxx6WFPZH
	ftxFzCgGqmDI6kn7y1SCFbG0XJt7XN3ZxwjYK9juoAf8EqcL69qfdIjwSxxyEHXjigx2o3aWYfr
	7E0unTek1JjiH/A5gOSsFjjTmmdCyundhrULE5OA9m3xKtKix51KnQQBDKtSjO8r8Yw1TIHMjZT
	Qyoq1OMdRvXAOJXgnK+DYN5zVEpLpJ1kV9kW/1fTn9GwXWkKUD4QuGCDNPBfDWP/8RKvNnyKtEJ
	1dWaEnPuCc3sRH8NE9lFjFmG3DESo0z0Q2Fl7B3TjOHyfB/FlzsBldf/n7SY/Ag=
X-Google-Smtp-Source: AGHT+IGVf8MxbpkAU9HqqZmA/jVqKf1xEVujvougTjPKVL/Z0oIU+ggvLP+fYJeMXLuFrQNOnmqtyw==
X-Received: by 2002:a17:907:1b0d:b0:aca:c532:cf07 with SMTP id a640c23a62f3a-acedc65d3famr272653566b.35.1746004040489;
        Wed, 30 Apr 2025 02:07:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acebe7a4ee8sm313017166b.74.2025.04.30.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:07:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:07:17 +0200
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
Message-ID: <aBHoRTdsdOLFhzfg@phenom.ffwll.local>
References: <20250416065820.26076-1-tzimmermann@suse.de>
 <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_96e7Lv-sEDUS6U@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.22-amd64 

On Wed, Apr 16, 2025 at 11:38:03AM +0200, Simona Vetter wrote:
> On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote:
> > Test struct drm_gem_object.import_attach to detect imported objects.
> > 
> > During object clenanup, the dma_buf field might be NULL. Testing it in
> > an object's free callback then incorrectly does a cleanup as for native
> > objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> > clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
> > 
> > v3:
> > - only test for import_attach (Boris)
> > v2:
> > - use import_attach.dmabuf instead of dma_buf (Christian)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> > Reported-by: Andy Yan <andyshrk@163.com>
> > Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> > Tested-by: Andy Yan <andyshrk@163.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Anusha Srivatsa <asrivats@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Also quick doc request: We do have a bit of overview documentation for
prime here about specifically this lifetime fun, and why there's a chain
of references and hence a distinction between imported foreign dma-buf and
re-imported native dma-buf:

https://dri.freedesktop.org/docs/drm/gpu/drm-mm.html#reference-counting-for-gem-drivers

I think it would be good to augment this with more links to functions
(like this one recently added and fixed in this patch here) and struct
members to that overview. And maybe also link from key function and struct
functions back to that overview doc. Otherwise I think the next person
will get confused by this rather tricky code again and break a corner
cases.

Thanks, Sima

> 
> > ---
> >  include/drm/drm_gem.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 9b71f7a9f3f8..a3133a08267c 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -588,8 +588,7 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
> >   */
> >  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
> >  {
> > -	/* The dma-buf's priv field points to the original GEM object. */
> > -	return obj->dma_buf && (obj->dma_buf->priv != obj);
> > +	return !!obj->import_attach;
> >  }
> >  
> >  #ifdef CONFIG_LOCKDEP
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

