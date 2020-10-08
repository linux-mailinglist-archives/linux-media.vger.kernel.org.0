Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D092875AA
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 16:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbgJHOJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 10:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730471AbgJHOJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 10:09:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91112C0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 07:09:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so6751047wru.12
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=elZJD7XRgqQldYOtQwrqdR/qGnh8Wpkk/pfQRzrmtYM=;
        b=enBpRbP+Y+vrFIYrWPQNxBnkuaMmg25PgrMBeow6OQNpTFvPzN+XBpA5OiRQs3FnpH
         yn2sjyj5Z/cKTHqfztw85EqTF/+tUnU7Ggylp9H+9saopjbyB39hup7iipRvTm1N8QkU
         4hcPZCQBIGwlfCroWRjBD48VJcP3UF4X4GYKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=elZJD7XRgqQldYOtQwrqdR/qGnh8Wpkk/pfQRzrmtYM=;
        b=SkrkM8jUncEVVAiYXgT6n2ReqXb3nqef1SEYIByF7mWRaI48xYqA24gAX/L0jBZjHz
         6BxKPI8vBlCI+u09PCANZvuKMrxW6i5BW7kavbZVeV9fSPdnLucag10EvUyLeO8roTIj
         rFOqH3jL337ThLLYehCHgZiKAHbzEF1Edhj5bg0JEU6DlnHHJxCyHOX71RZKBrggDkRo
         lI98ZyXN1IuFEAtnEvoL45g99Wc6vGp+yQNcoP6po1lILnz4weB8Rwd9lw4M515OExVW
         B2Xx/mwtzlB6cFpZ0Yol4erZY4o1M+3zXto/+h6nyu/AgOMmryCnJSYN6e0eTQpKxf6S
         HPAA==
X-Gm-Message-State: AOAM532elHdFq2MzVTbWu3GRrRPQ2lrQmZYh4ujWpjlnlv4J5qgasqBc
        RHHYM3FD2Q3CNuFVdzwEaxevgQ==
X-Google-Smtp-Source: ABdhPJxnvjHp0B8DifTQr62vFQPdmb3m15u0GYpDuxfNs6OohHQD8sm0hL1lDYa4JXvQgG/WhvcUCQ==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr9290612wrq.282.1602166157191;
        Thu, 08 Oct 2020 07:09:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b200sm7777009wme.44.2020.10.08.07.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:09:16 -0700 (PDT)
Date:   Thu, 8 Oct 2020 16:09:14 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
Message-ID: <20201008140914.GF438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org,
        sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201008112342.9394-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 08, 2020 at 01:23:40PM +0200, Christian König wrote:
> We have reoccurring requests on this so better document that
> this approach doesn't work and dma_buf_mmap() needs to be used instead.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 4910c446db83..16fa2bfc271e 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
>  /**
>   * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
>   * @sgt: scatter-gather table to convert
> - * @pages: optional array of page pointers to store the page array in
> + * @pages: deprecated array of page pointers to store the page array in
>   * @addrs: optional array to store the dma bus address of each page
>   * @max_entries: size of both the passed-in arrays
>   *
> @@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
>   *
>   * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
>   * implementation.
> + *
> + * Specifying the pages array is deprecated and strongly discouraged for new
> + * drivers. The pages array is only useful for page faults and those can
> + * corrupt fields in the struct page if they are not handled by the exporting
> + * driver.
>   */

I'd make this a _lot_ stronger: Aside from amdgpu and radeon all drivers
using this only need it for the pages array. Imo just open-code the sg
table walking loop in amdgpu/radeon (it's really not much code), and then
drop the dma_addr_t parameter from this function here (it's set to NULL by
everyone else).

And then deprecate this entire function here with a big warning that a)
dma_buf_map_attachment is allowed to leave the struct page pointers NULL
and b) this breaks mmap, users must call dma_buf_mmap instead.

Also maybe make it an uppercase DEPRECATED or something like that :-)
-Daniel

>  int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
>  				     dma_addr_t *addrs, int max_entries)
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
