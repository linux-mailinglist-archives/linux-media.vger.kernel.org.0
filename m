Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FF12883CE
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 09:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732264AbgJIHk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 03:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgJIHkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 03:40:53 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63521C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 00:40:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d81so8811903wmc.1
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y3zs5MyaJjxQczfNdG639aNsJL9caNjvPlFIB7wLkR4=;
        b=Re2HuNR4YnSz2NNNx0wCdYgdO3XvW6JJk1F7OiVGrn7H8vssSl0sr4fDhbdmRek7Ob
         J7NoAQOhGdhrEZhb81ooLcdoy9d15p/ullIXVzaI4OqRYddo1OdWO05Kov+w+RPBeDG+
         RLewmnU6pYoax9iu9ChjqA0AFepC7dSXIWdc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=Y3zs5MyaJjxQczfNdG639aNsJL9caNjvPlFIB7wLkR4=;
        b=nQfSPW+96ycovxGEuj7zAa2D37B7g6IrD2q6PBRsgJ+FTdi/L0d2sme5nnduO6Vqwm
         LVsvlbJJWyFeVHgwvY6yr7GBY8DoFgxjXqYw/0NPp2S3FnNDFsrLu9BEuvZUK4Wymosu
         jE3v8LbhHcBiKNEk6R1l3dBm51dzU+8WGCjo3rOw6Lg3BkB/P0qYDE0avCHPqROFfxO3
         QrqoZ0Ltu8f6NIF/wWwe9b+mewJ688VzS1EELHBFjWs+rUfCW+aNdrU+Yzh9EPAEn5ZO
         0DkS4mlXX9Y10ZXG/tZzt0mMcSj4AOrX4CtRoVy+MxBJtRyjhuuuG36K1DODbizzfroI
         9bag==
X-Gm-Message-State: AOAM530oeCLNsOr5WKrHXO1i42TvmOMV26towzc1UEskEW7I5dd8dvM2
        cSvB2l8kGsQo27PMjn27l9IhXw==
X-Google-Smtp-Source: ABdhPJzEZVjAyzHt2mUFBrus7xHA9Fz2PHmYxtWRjXFp1GdZ9Yug82fj27NzQMq9vnHe30s/bBamAQ==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr12070681wml.134.1602229250051;
        Fri, 09 Oct 2020 00:40:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n3sm10383741wmn.28.2020.10.09.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:40:49 -0700 (PDT)
Date:   Fri, 9 Oct 2020 09:40:47 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     christian.koenig@amd.com
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org,
        sumit.semwal@linaro.org
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
Message-ID: <20201009074047.GM438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com,
        akpm@linux-foundation.org, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
 <20201008140914.GF438822@phenom.ffwll.local>
 <20201008141419.GH438822@phenom.ffwll.local>
 <6cc96549-2724-6849-0f38-0de60ed6989c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cc96549-2724-6849-0f38-0de60ed6989c@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 09:36:41AM +0200, Christian König wrote:
> Am 08.10.20 um 16:14 schrieb Daniel Vetter:
> > On Thu, Oct 08, 2020 at 04:09:14PM +0200, Daniel Vetter wrote:
> > > On Thu, Oct 08, 2020 at 01:23:40PM +0200, Christian König wrote:
> > > > We have reoccurring requests on this so better document that
> > > > this approach doesn't work and dma_buf_mmap() needs to be used instead.
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_prime.c | 7 ++++++-
> > > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > > > index 4910c446db83..16fa2bfc271e 100644
> > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
> > > >   /**
> > > >    * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
> > > >    * @sgt: scatter-gather table to convert
> > > > - * @pages: optional array of page pointers to store the page array in
> > > > + * @pages: deprecated array of page pointers to store the page array in
> > > >    * @addrs: optional array to store the dma bus address of each page
> > > >    * @max_entries: size of both the passed-in arrays
> > > >    *
> > > > @@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
> > > >    *
> > > >    * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
> > > >    * implementation.
> > > > + *
> > > > + * Specifying the pages array is deprecated and strongly discouraged for new
> > > > + * drivers. The pages array is only useful for page faults and those can
> > > > + * corrupt fields in the struct page if they are not handled by the exporting
> > > > + * driver.
> > > >    */
> > > I'd make this a _lot_ stronger: Aside from amdgpu and radeon all drivers
> > > using this only need it for the pages array. Imo just open-code the sg
> > > table walking loop in amdgpu/radeon (it's really not much code), and then
> > > drop the dma_addr_t parameter from this function here (it's set to NULL by
> > > everyone else).
> > > 
> > > And then deprecate this entire function here with a big warning that a)
> > > dma_buf_map_attachment is allowed to leave the struct page pointers NULL
> > > and b) this breaks mmap, users must call dma_buf_mmap instead.
> > > 
> > > Also maybe make it an uppercase DEPRECATED or something like that :-)
> > OK I just realized I missed nouveau. That would be 3 places where we need
> > to stuff the dma_addr_t list into something ttm can take. Still feels
> > better than this half-deprecated function kludge ...
> 
> Mhm, I don't see a reason why nouveau would need the struct page either.
> 
> How about we split that up into two function?
> 
> One for converting the sg_table into a linear dma_addr array.
> 
> And one for converting the sg_table into a linear struct page array with a
> __deprecated attribute on it?

Yeah makes sense, since converting ttm to just use sgt iterations directly
everywhere is probably a bit too much. Maybe keep that converter in ttm
code, since outside of ttm the rough consensus is to converge on sgt for
handling buffers. Well, for those drivers not stuck on struct page arrays
:-)
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > -Daniel
> > > 
> > > >   int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
> > > >   				     dma_addr_t *addrs, int max_entries)
> > > > -- 
> > > > 2.17.1
> > > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
