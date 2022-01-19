Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBA7493EE6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 18:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354618AbiASRSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 12:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345023AbiASRSL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 12:18:11 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9B0C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:18:10 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n8so6462595wmk.3
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rQ+yyRcLTMO72ZwgIvbqK79p/62FdZWlD9ln/D9mqrQ=;
        b=O8gRtMbL0cQw6BEysGCr14KMg9Fo4AlYnDea8ecj2bJB8uhHsX56dubo/71ZtMcKZm
         uykyzjo6ZkvjCXHzkb78rjXN40K8GhnxI4mD+/Yimu5LOLJWWValLuVsqFPpAgmxSNJd
         lQOdJFcRYHIPHS3zTAjTUHvT9Oxh4hpgQ7Hn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rQ+yyRcLTMO72ZwgIvbqK79p/62FdZWlD9ln/D9mqrQ=;
        b=OUyjzw5I0rUH0S2VPCBq6grZM1emY31SN4nbyvL0/wRRHJWYM3X1LAhxpE82XeAjMa
         E+hmFVgoAZfMxrpOmIi/EtoYyTC5Efgfgy9vuLc+FFEzqbQ/3U56HLUl2B21JpvBR0a0
         8onlmrzLhBKoZ6jZfW+QDiahyhIsLo46UIlD8syykkeI90ixxqc2C7BaVPNzLhgrwl3B
         QaiO36uU+82xJdJMgUS1p11pbU2HlPpCshwlnzMohBGONaX9/4dQcUxlxRo8yFYYi+5r
         0DxpTkQnnTrNOb/K/QucuYCGI6G/wKcDnuth4bXfMGB7AI2aYex4coexCi8CUx1eicJc
         +nrw==
X-Gm-Message-State: AOAM530a/rPAAvS+aMRcwDQywF7LdhPl9HBa06gN0kZwQJE4Zb1Ybu8p
        IW4T90J+TsYGCUSnlMt6J10QEg==
X-Google-Smtp-Source: ABdhPJx4k/wum3uSEYpvkt7c9tWl67rTeqCQ4BapICaxaEK2FFu+ShCicViWb6AetcJAyz/n/0CZDQ==
X-Received: by 2002:a05:600c:3c9c:: with SMTP id bg28mr4470721wmb.190.1642612688352;
        Wed, 19 Jan 2022 09:18:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n15sm570212wrf.79.2022.01.19.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:18:07 -0800 (PST)
Date:   Wed, 19 Jan 2022 18:18:06 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/4] dma-buf: warn about dma_fence_array container rules
Message-ID: <YehHzs8FDn4PfD+l@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <20220119134339.3102-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 19, 2022 at 02:43:37PM +0100, Christian König wrote:
> It's not allowed to nest another dma_fence container into a dma_fence_array
> or otherwise we can run into recursion.
> 
> Warn about that when we create a dma_fence_array.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 3e07f961e2f3..4bfbcb885bbc 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>  
>  	array->base.error = PENDING_ERROR;
>  
> +	/* dma_fence_array objects should never contain any other fence
> +	 * containers or otherwise we run into recursion and potential kernel
> +	 * stack overflow on operations on the dma_fence_array.
> +	 *
> +	 * The correct way of handling this is to flatten out the array by the
> +	 * caller instead.
> +	 *
> +	 * Enforce this here by checking that we don't create a dma_fence_array
> +	 * with any container inside.
> +	 */
> +	while (seqno--)
> +		WARN_ON(dma_fence_is_container(fences[seqno]));

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	return array;
>  }
>  EXPORT_SYMBOL(dma_fence_array_create);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
