Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D934E52F8
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 14:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244239AbiCWNXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 09:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244233AbiCWNXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 09:23:35 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBD8403E1
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 06:22:05 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id bi12so2825096ejb.3
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=l+1fp5Or9NGgTzSThmUALq6yPKXxdpqHP2QdwrJdAo0=;
        b=Yf2JS59+NhbHCjLE9Y4tEhd3k92P7PrN6SHNz0/g/qZNuMDTDmEgo2W9lrUvAKE+bl
         VlrQ1vduYx28iWr1CW9he97IrIh5lCOwHYU4QdgNiaBMr/ClyEfWFrGuj1/tv+IUsdH2
         hoXxM7xBcTRVNS+TphaGoNyz8G6t2mvdlVGHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=l+1fp5Or9NGgTzSThmUALq6yPKXxdpqHP2QdwrJdAo0=;
        b=BHSsN4oWKrqSDsMvCCiCW1ZAntD6XjdxQD7DFDofnlVuWipFaoQVMBIDz4bouqCYID
         AoOzKnrHtnUXGTZje4y44Xg6KJ0UCnTDJxAec5DfPoI5pgInMT84f2lc3gDxbo648YjW
         JwdgNd4Tw/IZfsWfwkla8WP1/AfluhL/Q7XQHdV5sAtaCZ/R702HJ4PKyoUuFfYC8JGv
         RETy+HvYwWsT1XFVroW+0tby/SN4O9hXNvMUvNFlnqeEl6BQpOqA3PaRbrtkhLKX7lqo
         1WngrCGpUepiyllEiIw7tPPQ8G86EBcxkLj2r3NtPtBkdsItGcJYys8Vp4Ak06x8AJex
         Vb0Q==
X-Gm-Message-State: AOAM531LFP6367QrOaY/5LOiktmQGZwMA6GO64PQ0WpR5b7ug6AMv8zP
        /EWBrvsT0yxiRNDGnmfzPq8Mjg==
X-Google-Smtp-Source: ABdhPJzrt4ulR2R6Mr81vt0b860rgmEcRf+dE4TvtYYJrPltu2t2sG4EBomF9g8Mx89gBVF/fzI0zw==
X-Received: by 2002:a17:906:c18c:b0:6d5:8518:e567 with SMTP id g12-20020a170906c18c00b006d58518e567mr31199507ejz.37.1648041723649;
        Wed, 23 Mar 2022 06:22:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s20-20020a056402015400b00418f9574a36sm9630743edu.73.2022.03.23.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:22:03 -0700 (PDT)
Date:   Wed, 23 Mar 2022 14:22:01 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Maor Gottlieb <maorg@nvidia.com>,
        Gal Pressman <galpress@amazon.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting
 the fence
Message-ID: <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 21, 2022 at 02:58:37PM +0100, Christian König wrote:
> Use dma_resv_wait() instead of extracting the exclusive fence and
> waiting on it manually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>

Jason, can you ack this for merging through drm trees please?

Thanks, Daniel

> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Maor Gottlieb <maorg@nvidia.com>
> Cc: Gal Pressman <galpress@amazon.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/infiniband/core/umem_dmabuf.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index f0760741f281..d32cd7538835 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -16,7 +16,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  {
>  	struct sg_table *sgt;
>  	struct scatterlist *sg;
> -	struct dma_fence *fence;
>  	unsigned long start, end, cur = 0;
>  	unsigned int nmap = 0;
>  	int i;
> @@ -68,11 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  	 * may be not up-to-date. Wait for the exporter to finish
>  	 * the migration.
>  	 */
> -	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
> -	if (fence)
> -		return dma_fence_wait(fence, false);
> -
> -	return 0;
> +	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
> +				     false, MAX_SCHEDULE_TIMEOUT);
>  }
>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
