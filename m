Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CCE403EB1
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 19:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235654AbhIHR4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 13:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240308AbhIHRz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 13:55:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D87C0613CF
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 10:54:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id s25so4117273edw.0
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=w24hLsRl7XZ5LbDSKhuzZ/Cfz4LFXM+tWc1TnSEUUss=;
        b=gewWGShr7Xr2Qy09YNJ3ZB3EE97D9zs6XnByfQ/9byau67LOFQ7/Pl37j7Ld6KiYMV
         CZuNmSoK1BnjvwIvkJxM2tTz+SYOqSAeW1Vx55yJcJ8tscSAuulR2d/2GtTTQlIVt9aq
         Fk4sBJSYv1cp2LvywuuLKQa5IOJdXteV+Sv3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=w24hLsRl7XZ5LbDSKhuzZ/Cfz4LFXM+tWc1TnSEUUss=;
        b=GZyvwK55JikypWurX5ErRISy9anOW0DNnSHu6gfkClpi0q/lQbNsnUfyL7Me4bQJY0
         5XZEUdOMFqsGklnF5qW9PvRWIX44WaHeuT+eV2PDp2i0nLvf5QfZwrQBtoDn7KxuKDnI
         S3ivES/aLV43suhFrQX4qLs36ofaU4TRNHnTpo/DPxXfvvXEeY576J5QxFXgv0pgYksj
         dUNP62pOtbW8Ru4ohIc5kAMNkxE1J5n/HXmaIEsAFra1NQi1UIBz4xZhjqjvakpq8Vio
         oKYb1sDmBFz7UF1v9Pp7Q0vTlr+ENIab31WxuZ+VFfUsWzvZq9z1NCFaPgOYteWvHRPf
         1URA==
X-Gm-Message-State: AOAM5336ZLs51mKCqG5jaWF4RkilYbCTxxexP93zRFthWFd/G4UW1JBW
        pJj7syAEsw8NTAPQ1tmY6m2qxw==
X-Google-Smtp-Source: ABdhPJxBIQkBjPF3Gt5WEu386lz3cQM0dwlAunhiFpiwa6VJYwYAF1IbUqPzkfujW1BiIhDKl7lybg==
X-Received: by 2002:a05:6402:1248:: with SMTP id l8mr4993687edw.94.1631123658998;
        Wed, 08 Sep 2021 10:54:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p8sm1365586ejo.2.2021.09.08.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:54:18 -0700 (PDT)
Date:   Wed, 8 Sep 2021 19:54:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 7/9] dma-buf/fence-chain: Add fence deadline support
Message-ID: <YTj4yPk1YuFk3oeL@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903184806.1680887-8-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 11:47:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 1b4cb3e5cec9..736a9ad3ea6d 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -208,6 +208,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
>  	dma_fence_free(fence);
>  }
>  
> +
> +static void dma_fence_chain_set_deadline(struct dma_fence *fence,
> +					 ktime_t deadline)
> +{
> +	dma_fence_chain_for_each(fence, fence) {
> +		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> +		struct dma_fence *f = chain ? chain->fence : fence;

Doesn't this just end up calling set_deadline on a chain, potenetially
resulting in recursion? Also I don't think this should ever happen, why
did you add that?
-Daniel

> +
> +		dma_fence_set_deadline(f, deadline);
> +	}
> +}
> +
>  const struct dma_fence_ops dma_fence_chain_ops = {
>  	.use_64bit_seqno = true,
>  	.get_driver_name = dma_fence_chain_get_driver_name,
> @@ -215,6 +227,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>  	.enable_signaling = dma_fence_chain_enable_signaling,
>  	.signaled = dma_fence_chain_signaled,
>  	.release = dma_fence_chain_release,
> +	.set_deadline = dma_fence_chain_set_deadline,
>  };
>  EXPORT_SYMBOL(dma_fence_chain_ops);
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
