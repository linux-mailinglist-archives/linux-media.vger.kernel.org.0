Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C72F29D9AC
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 00:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731423AbgJ1XAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 19:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387732AbgJ1W6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:58:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211A8C0613CF
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 15:58:41 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d24so993099ljg.10
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 15:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gi/uzMl9VgWE8vfQyPlznR/izU6XqxRO/ItVHtgT6AU=;
        b=BYAiD8gd7/RdlmG6htb6N56H/X78L1jnBPlSQsOiLfJ8Xuehl4KVRK2+nfZDbrQSNN
         6HeXnW8sOhQe/KPg+0DEYbganV9P8xDkB3E96+4qLtkxzS5+sJuPHrrPGOCni+MM7t2u
         rhSDKTicAJ+0dla6vBFQ0SgJNdOuJRhKmV0/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gi/uzMl9VgWE8vfQyPlznR/izU6XqxRO/ItVHtgT6AU=;
        b=GwHiDEIPfH3nEZb2iZ7JXQ2H6VBMKkUcnxN8FGbc9a1IBBeSTC0njjwAf+DR+NqYTu
         XwAxITo7KAagtkmBA3JnmNT2v1nc+JmSyf+X3M6xMrQ/05AyYJXt1DKlPAIXz9Zs/nkF
         Ohymq9ZvCI4qLkHIBkl6KXewXVBhvc2pgQzrrygHH5kIxQsKgkHyDZbdpMGigaOSxIYG
         aPXo7PE0rCoqQKYPqIIFVw3E6ZweZZvWfiCO7dJawKkJ7j/0QbejEUzgry0ZJDwsq71Z
         RytKw4DAZ4dbizr90+PWEexVp1KQ9AGBwych1KflR1K5+L8y4T1tSKGIQpTffUDpH9TW
         cZ5g==
X-Gm-Message-State: AOAM533tkhV41phq1hKjdsxvd68bgEtQHOtoxI552RftHnytVofRlYph
        XdnK7tzY0CSjGqdmhtpQ0urlQ8LHrRYREmVg
X-Google-Smtp-Source: ABdhPJyOzC7JNC7emtn0O/VIBDwemcIbpeRQF/UNhWe4y22pcew6DFyQi941pJPlBIMnwsDLyrEplA==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr7620352wrv.286.1603880268229;
        Wed, 28 Oct 2020 03:17:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm3287974wrx.13.2020.10.28.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 03:17:47 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:17:44 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org,
        piotr.oniszczuk@gmail.com, Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/shme-helpers: Fix dma_buf_mmap forwarding bug
Message-ID: <20201028101744.GV401619@phenom.ffwll.local>
References: <20201027214922.3566743-1-daniel.vetter@ffwll.ch>
 <20201028094415.7a7782b8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201028094415.7a7782b8@collabora.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 28, 2020 at 09:44:15AM +0100, Boris Brezillon wrote:
> On Tue, 27 Oct 2020 22:49:22 +0100
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > When we forward an mmap to the dma_buf exporter, they get to own
> > everything. Unfortunately drm_gem_mmap_obj() overwrote
> > vma->vm_private_data after the driver callback, wreaking the
> > exporter complete. This was noticed because vb2_common_vm_close blew
> > up on mali gpu with panfrost after commit 26d3ac3cb04d
> > ("drm/shmem-helpers: Redirect mmap for imported dma-buf").
> > 
> > Unfortunately drm_gem_mmap_obj also acquires a surplus reference that
> > we need to drop in shmem helpers, which is a bit of a mislayer
> > situation. Maybe the entire dma_buf_mmap forwarding should be pulled
> > into core gem code.
> > 
> > Note that the only two other drivers which forward mmap in their own
> > code (etnaviv and exynos) get this somewhat right by overwriting the
> > gem mmap code. But they seem to still have the leak. This might be a
> > good excuse to move these drivers over to shmem helpers completely.
> > 
> > Note to stable team: There's a trivial context conflict with
> > d693def4fd1c ("drm: Remove obsolete GEM and PRIME callbacks from
> > struct drm_driver"). I'm assuming it's clear where to put the first
> > hunk, otherwise I can send a 5.9 version of this.
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Fixes: 26d3ac3cb04d ("drm/shmem-helpers: Redirect mmap for imported dma-buf")
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Patch pushed to drm-misc-fixes, thanks for taking a look.
-Daniel

> 
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: <stable@vger.kernel.org> # v5.9+
> > Reported-and-tested-by: piotr.oniszczuk@gmail.com
> > Cc: piotr.oniszczuk@gmail.com
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c              | 4 ++--
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++++-
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 1da67d34e55d..d586068f5509 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1076,6 +1076,8 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
> >  	 */
> >  	drm_gem_object_get(obj);
> >  
> > +	vma->vm_private_data = obj;
> > +
> >  	if (obj->funcs->mmap) {
> >  		ret = obj->funcs->mmap(obj, vma);
> >  		if (ret) {
> > @@ -1096,8 +1098,6 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
> >  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> >  	}
> >  
> > -	vma->vm_private_data = obj;
> > -
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_gem_mmap_obj);
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index fb11df7aced5..8233bda4692f 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -598,8 +598,13 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> >  	/* Remove the fake offset */
> >  	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> >  
> > -	if (obj->import_attach)
> > +	if (obj->import_attach) {
> > +		/* Drop the reference drm_gem_mmap_obj() acquired.*/
> > +		drm_gem_object_put(obj);
> > +		vma->vm_private_data = NULL;
> > +
> >  		return dma_buf_mmap(obj->dma_buf, vma, 0);
> > +	}
> >  
> >  	shmem = to_drm_gem_shmem_obj(obj);
> >  
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
