Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382D747D889
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhLVVIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhLVVIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:08:39 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDBCC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:08:39 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id y22so13515133edq.2
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GK96n6BYD0Hx1AhmkJkZJ0h4Yucg5xDH+N9i+w3wheU=;
        b=YVoz0a2B3XYq+O/vOi56jCgxQ4aoOR67vshk1MBkEFAMiW4UjN3/bkZTjC6a0Nhe4b
         MxkrH08Sp0nAl5EFqIBUX5P0q2sHHqJWeqGVrZQuGVGqs6EZMky7tv2DCoYq2wB/6Dbl
         W7x/D7eKF3ZTlztUgt88zoQAlWm+AyutNPINo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GK96n6BYD0Hx1AhmkJkZJ0h4Yucg5xDH+N9i+w3wheU=;
        b=gS/GawYnZODVCRbhG8n2uOSjWkxZ2/VrAbjcI5Y9dZE/0QpnEUrUH4OHZwe3zYwYf4
         H1E6gGKEUqGJWEjYMaoE9xrlOlQk+9uFHQB1TjlNR0CCS3LMfAETSCLMp2pd+SjsgHfU
         bjk6f3/koxoHU2QN7X40oDD8J2MyY87qPaCW5SfmFDjHrimfeKDbsakuryuMUWzdit+G
         hTcMtAt6TOp5ik7lAt769pYG0IQvXiT+54sV0orQlf/KWvgsIE8PIreC1YNNa/UbBTFI
         DXuOZ/W29y/VLDH+ovYy6znY0QxAotbEcKZ+Akr2w8BP7HOMa7iatRJykR31ht8LG3M0
         FWxA==
X-Gm-Message-State: AOAM531fQfINuy8xstP/8IFazZDRx14CH9zWNd8cB49hPpLZF5fLbQY8
        BldvjmCQeEp/aPrGkE3/3OgDEQ==
X-Google-Smtp-Source: ABdhPJwPsRkORZ18V8N5cjsZrqAnrGvLcv5o+Hrr8SNqd8RLauUArVrOCM6TxPp9cbCV4D0/KrLH0Q==
X-Received: by 2002:a05:6402:195:: with SMTP id r21mr4510534edv.174.1640207317822;
        Wed, 22 Dec 2021 13:08:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id hb17sm1033215ejc.195.2021.12.22.13.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:08:37 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:08:35 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 02/24] dma-buf: finally make the dma_resv_list private
Message-ID: <YcOT0z79tB2u/QeX@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:49PM +0100, Christian König wrote:
> Drivers should never touch this directly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 26 ++++++++++++++++++++++++++
>  include/linux/dma-resv.h   | 26 +-------------------------
>  2 files changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index a688dbded3d3..a12a3a39f280 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -56,6 +56,19 @@
>  DEFINE_WD_CLASS(reservation_ww_class);
>  EXPORT_SYMBOL(reservation_ww_class);
>  
> +/**
> + * struct dma_resv_list - a list of shared fences
> + * @rcu: for internal use
> + * @shared_count: table of shared fences
> + * @shared_max: for growing shared fence table
> + * @shared: shared fence table
> + */

Imo drop the kerneldoc here and just make these comments before the right
member if you feel like keeping them. Imo it's obvious enough what's going
on that the comments aren't necessary, and we don't kerneldoc document
internals generally at all - only interfaces relevant by drivers and
things outside of a subsystem.

> +struct dma_resv_list {
> +	struct rcu_head rcu;
> +	u32 shared_count, shared_max;
> +	struct dma_fence __rcu *shared[];
> +};
> +
>  /**
>   * dma_resv_list_alloc - allocate fence list
>   * @shared_max: number of fences we need space for
> @@ -133,6 +146,19 @@ void dma_resv_fini(struct dma_resv *obj)
>  }
>  EXPORT_SYMBOL(dma_resv_fini);
>  
> +/**
> + * dma_resv_shared_list - get the reservation object's shared fence list
> + * @obj: the reservation object
> + *
> + * Returns the shared fence list. Caller must either hold the objects
> + * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
> + * or one of the variants of each
> + */

Same here. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
> +{
> +	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
> +}
> +
>  /**
>   * dma_resv_reserve_shared - Reserve space to add shared fences to
>   * a dma_resv.
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index e0be34265eae..3baf2a4a9a0d 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -47,18 +47,7 @@
>  
>  extern struct ww_class reservation_ww_class;
>  
> -/**
> - * struct dma_resv_list - a list of shared fences
> - * @rcu: for internal use
> - * @shared_count: table of shared fences
> - * @shared_max: for growing shared fence table
> - * @shared: shared fence table
> - */
> -struct dma_resv_list {
> -	struct rcu_head rcu;
> -	u32 shared_count, shared_max;
> -	struct dma_fence __rcu *shared[];
> -};
> +struct dma_resv_list;
>  
>  /**
>   * struct dma_resv - a reservation object manages fences for a buffer
> @@ -440,19 +429,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
>  	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
>  }
>  
> -/**
> - * dma_resv_shared_list - get the reservation object's shared fence list
> - * @obj: the reservation object
> - *
> - * Returns the shared fence list. Caller must either hold the objects
> - * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
> - * or one of the variants of each
> - */
> -static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
> -{
> -	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
> -}
> -
>  void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
